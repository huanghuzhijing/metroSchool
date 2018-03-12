<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="org.apache.commons.fileupload.*"%>
<%@ page language="java" import="org.apache.commons.fileupload.disk.*"%>
<%@ page language="java" import="org.apache.commons.fileupload.servlet.*"%>
<%!
	/******************************************
	说明:此文件是用来处理控件提交的文件上传块的。
	使用了FileUpload组件进行文件上传的处理。
	*******************************************/
	//这儿需要修改成您的数据库连接信息
	
public String userName="root";	//数据库用户名	
	public String userPasswd="123"; //密码			
	public String dbName="test";	//数据库名	
	
	public String fileInfoTableName = "filesinfo";

	public String DBDriver = "com.mysql.jdbc.Driver"; 
	public String ConnStr = "jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd;
	
	//以下是要保存到的父目录
	public String filePathRootDir = "d:\\test\\";
	
	//以下是FileUploader组件的临时目录
	public String tempUploadDir = "d:\\test\\aaaa";
	
	//设定为true,则在system.out打印更多调试数据
	public boolean isShowMoreOnSystemOut = true;
%>
<%
	Connection conn = null; 	
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	
	
	String strSql = ""; //SQL语句
	
	//NTKO大文件上传控件文件块上传信息保留域
	String NTKOLF_FileMd5ID = "";
	String NTKOLF_FileOriginalName = "";
	long NTKOLF_FileSize = 0;
	long NTKOLF_FileBlockSeqNo = 0;
	long NTKOLF_FileBlockSize = 0;	
	
	long NTKOLF_BLOCKSIZE = 131072; //块大小，注意这个是保留大小，不能修改！
	
	//临时变量用于中间存储
	String NTKOLF_TempExt = ".~tmp!";
	String NTKOLF_FileSavedName = ""; //实际保存的文件名。原始名+Md5ID+"临时文件部分"
	String NTKOLF_FileSavedFullPath = ""; //实际保存的文件全路径
	
	String NTKOLF_UploadInfoFileExt = ".uif!";
	String NTKOLF_UploadInfoFileName = "";
	String NTKOLF_UploadInfoFileNameFullPath = "";
	
	String errorMessage = ""; //错误信息
	boolean isWriteFileOk = false; //是否成功保存了文件
	
	//其他用户表单数据
	String Qita = "";
	DiskFileItemFactory factory = new DiskFileItemFactory();

	// Set factory constraints
	factory.setSizeThreshold(4096);
	
	factory.setRepository(new File(tempUploadDir));
	// Create a new file upload handler
	ServletFileUpload upload = new ServletFileUpload(factory);

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if(!isMultipart)
	{
		out.println("Bad Request!");
		response.sendError(400,"Bad Request!");
		return;
	}
	
	try 
	{ 
		//加载数据库驱动程序 
		Class.forName(DBDriver);
	} 
	catch(java.lang.ClassNotFoundException e)
	{ 
		errorMessage = e.getMessage();
		System.out.println("DBconn (): " + errorMessage); 
		response.sendError(500,"Error:" + errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		return;
	}
		
	// Set overall request size constraint
	upload.setSizeMax(200000); //最大允许200k的上传字节数
		
	if(isShowMoreOnSystemOut)System.out.println("=========savefileblocks.jsp=====================");
	if(isShowMoreOnSystemOut)System.out.println("开始处理..........");
	// Parse the request
	List fileItems = upload.parseRequest(request);
	
	Iterator iter = fileItems.iterator();

	//先检测是否有保留域NTKOLF_FileMd5ID
	while (iter.hasNext()) 
	{
		FileItem item = (FileItem) iter.next();
		if (item.isFormField()) 
		{
			String fieldname = item.getFieldName();
			String fieldvalue = item.getString("UTF-8");
	
			if(fieldname.equalsIgnoreCase("NTKOLF_FileMd5ID")) 
			{
				NTKOLF_FileMd5ID = item.getString();
				if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileMd5ID =" + NTKOLF_FileMd5ID); 
			}
			else if(fieldname.equalsIgnoreCase("NTKOLF_FileOriginalName"))
			{
				NTKOLF_FileOriginalName = fieldvalue;
				if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileOriginalName =" + NTKOLF_FileOriginalName); 
			}
			else if(fieldname.equalsIgnoreCase("NTKOLF_FileSize"))
			{
				NTKOLF_FileSize = new Long(fieldvalue);
				if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileSize =" + NTKOLF_FileSize); 
			}
			else if(fieldname.equalsIgnoreCase("NTKOLF_FileBlockSeqNo"))
			{
				NTKOLF_FileBlockSeqNo = new Long(fieldvalue);
				if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileBlockSeqNo =" + NTKOLF_FileBlockSeqNo); 
			}
			else if(fieldname.equalsIgnoreCase("NTKOLF_FileBlockSize"))
			{
				NTKOLF_FileBlockSize = new Long(fieldvalue);
				if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileBlockSize =" + NTKOLF_FileBlockSize); 
			}
			else if(fieldname.equalsIgnoreCase("Qita"))
			{
				Qita = fieldvalue;
				if(isShowMoreOnSystemOut)System.out.println("Qita =" + Qita); 
			}		
		}
	}
	
	if((NTKOLF_FileMd5ID == null)||(NTKOLF_FileMd5ID.length() == 0)
		||(null == NTKOLF_FileOriginalName)||(NTKOLF_FileOriginalName.length() == 0)) //错误的请求
	{
		out.println("Bad Request!");
		response.sendError(400,"Bad Request!");
		return;
	}
	
	//重新获取之前保存的原始文件名
	int retryCount = 0; //已经重试的次数
	boolean isCompleted = false; //是否已正确完成
	boolean isNoRetryError = false; //是否有不能重试的错误发生

	while( (!isCompleted) && (!isNoRetryError) && (retryCount < 2))
	{
		try
		{
			if(isShowMoreOnSystemOut)System.out.println("尝试第" + retryCount + "次操作.");	
			//与DBMS建立连接 
			conn = DriverManager.getConnection(ConnStr);
			
			stmt = conn.createStatement();
			String query = "SELECT * FROM " + fileInfoTableName + 
				" where (FileMd5ID='" + NTKOLF_FileMd5ID + "')";
			if(isShowMoreOnSystemOut)System.out.println("query=" + query);
			rs = stmt.executeQuery(query);
			if(rs.next()) 
			{
				NTKOLF_FileSavedName =  rs.getString("FileName");
				if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileSavedName=" + NTKOLF_FileSavedName);
				NTKOLF_UploadInfoFileName = rs.getString("UploadInfoFileName");
				if(isShowMoreOnSystemOut)System.out.println("NTKOLF_UploadInfoFileName=" + NTKOLF_UploadInfoFileName);
				isCompleted = true;
			}			
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
		}
		catch(SQLException sqlEx)
		{
			// The two SQL states that are 'retry-able' are 08S01
			// for a communications error, and 40001 for deadlock.
			//
			// Only retry if the error was due to a stale connection,
			// communications
			
			errorMessage = sqlEx.getMessage();
			String sqlState = sqlEx.getSQLState();
			if(isShowMoreOnSystemOut)System.out.println("sqlState=" + sqlState);	
			if ("08S01".equals(sqlState) || "40001".equals(sqlState)) 
			{
				retryCount++;
			} 
			else 
			{
				isNoRetryError = true; //其他错误不需要再次尝试
			}			
		}
		finally
		{
			if (rs != null) 
			{
				try	{rs.close();rs = null;} catch (SQLException sqlEx) 	{};
			}
			if (stmt != null) 
			{
				try	{stmt.close();stmt = null;} catch (SQLException sqlEx) 	{};
			}
			if (ps != null) 
			{
				try	{ps.close();ps = null;} catch (SQLException sqlEx) 	{};
			}
			if (conn != null) 
			{
				try	{conn.close();conn = null;} catch (SQLException sqlEx) 	{};
			}
		}		
	}
	
	if(!isCompleted)
	{
		System.out.println("Error:" + errorMessage);	
		response.sendError(500,"Error:" + errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		return;		
	}	

	//根据NTKOLF_FileSavedName创建文件。
	//NTKOLF_FileSavedName标识的文件的所有文件块都将保存在 filePathRootDir目录下。
	NTKOLF_FileSavedFullPath = filePathRootDir+NTKOLF_FileSavedName;	
	if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileSavedFullPath=" + NTKOLF_FileSavedFullPath);
	
	File tSavedFile = new File(NTKOLF_FileSavedFullPath);
	
	if(!tSavedFile.exists())
	{
		errorMessage = "服务器数据不一致,文件不存在:" +NTKOLF_FileSavedFullPath+",错误:"+ errorMessage;
		System.out.println(errorMessage);	
		response.sendError(500,errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("服务器数据不一致,文件不存在，处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		return;	
	}	
	
	//根据NTKOLF_UploadInfoFileName创建文件。
	NTKOLF_UploadInfoFileNameFullPath = filePathRootDir + NTKOLF_UploadInfoFileName;
	if(isShowMoreOnSystemOut)System.out.println("NTKOLF_UploadInfoFileNameFullPath=" + NTKOLF_UploadInfoFileNameFullPath);
	
	tSavedFile = new File(NTKOLF_UploadInfoFileNameFullPath);
	
	if(!tSavedFile.exists())
	{
		errorMessage = "服务器数据不一致,文件不存在:" +NTKOLF_UploadInfoFileNameFullPath+",错误:"+ errorMessage;
		System.out.println(errorMessage);	
		response.sendError(500,errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("服务器数据不一致,文件不存在，处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		return;	
	}	
	
	iter = fileItems.iterator();	
	
	//依次处理每个上传的文件
	while (iter.hasNext()) 
	{	
		FileItem item = (FileItem) iter.next();
		if (!item.isFormField()) 
		{
			String fileName = item.getName();			
			String fieldName = item.getFieldName();
			
			if(isShowMoreOnSystemOut)System.out.println("item.getSize() =" + item.getSize()); 
			
			if( (0 == item.getSize()) || (0 == fileName.length()))
			{
				out.println("没有上传的文件.");
			}
			else
			{
				boolean isBlockFile = fieldName.equalsIgnoreCase("NTKO_LF_BLOCK");
				if(isBlockFile)
				{		
					RandomAccessFile tSavedFileRandom = new RandomAccessFile(NTKOLF_FileSavedFullPath,"rw");
					//写入上传文件块到实际保存文件
					try
					{
						java.io.InputStream inStream = item.getInputStream();
						int ifilebytesNum = new Long(item.getSize()).intValue();
						byte[] filebytes = new byte[ifilebytesNum];
						inStream.read(filebytes);
						inStream.close();
						//开始写入文件						
						java.nio.channels.FileChannel fc = tSavedFileRandom.getChannel();
						java.nio.ByteBuffer bf = java.nio.ByteBuffer.wrap(filebytes);
						//计算写入位置
						long writePosition = NTKOLF_FileBlockSeqNo*NTKOLF_BLOCKSIZE;
						fc.write(bf,writePosition);
						fc.force(false);
						isWriteFileOk = true;
						tSavedFileRandom.close();
						tSavedFileRandom = null;
						item.delete() ; //删除临时文件
					}
					catch(Exception e)
					{
						isWriteFileOk = false;
						errorMessage = e.toString();
					}	
					finally
					{
						if(tSavedFileRandom != null){tSavedFileRandom.close();tSavedFileRandom = null;};
					}		
					if(isWriteFileOk)
					{
						tSavedFileRandom = new RandomAccessFile(NTKOLF_UploadInfoFileNameFullPath,"rw");
						//写入上传文件块到实际保存文件
						try
						{
							byte[] filebytes = new byte[4];
							//开始写入文件						
							java.nio.channels.FileChannel fc = tSavedFileRandom.getChannel();
							java.nio.ByteBuffer bf = java.nio.ByteBuffer.wrap(filebytes);
							bf.putInt(0,new Long(NTKOLF_FileBlockSize).intValue());
							//计算写入位置
							long writePosition = NTKOLF_FileBlockSeqNo*4;
							fc.write(bf,writePosition);
							fc.force(false);
							isWriteFileOk = true;
							tSavedFileRandom.close();
							tSavedFileRandom = null;
						}
						catch(Exception e)
						{
							isWriteFileOk = false;
							errorMessage = e.toString();
						}	
						finally
						{
							if(tSavedFileRandom != null){tSavedFileRandom.close();tSavedFileRandom = null;};
						}	
					}			
				}
			}
		}	
	}
	
	if(!isWriteFileOk) //如果写入文件不成功，则报错
	{
		errorMessage = "未能成功保存文件:" +NTKOLF_FileSavedFullPath+",错误:"+ errorMessage;
		System.out.println(errorMessage);	
		response.sendError(500,errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("未能成功保存文件，处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		return;	
	}
	else
	{
		if(isShowMoreOnSystemOut)System.out.println("处理成功结束!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		out.println("处理成功结束!");
	}
	//*/
%>


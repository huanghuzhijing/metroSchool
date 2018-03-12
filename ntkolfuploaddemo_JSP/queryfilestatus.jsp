<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<%!
	/******************************************
	说明:此文件是用来查询文件状态的。如果文件不存在，
	还应该创建文件记录
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
	
	//设定为true,则在system.out打印更多调试数据
	public boolean isShowMoreOnSystemOut = true;
%>
<%
	//禁用缓存
	response.setHeader("Pragma","No-Cache"); 
	response.setHeader("Cache-Control","No-Cache"); 
	response.setDateHeader("Expires", 0);
	
	Connection conn = null; 	
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	
	
	String strSql = ""; //SQL语句
	
	String NTKOLF_FileMd5ID = "";
	String NTKOLF_FileOriginalName = "";
	String NTKOLF_TempExt = ".~tmp!";
	String NTKOLF_FileSavedName = ""; //实际保存的文件名。原始名+Md5ID+"临时文件部分"
	long NTKOLF_FileSize = 0;
	
	String NTKOLF_UploadInfoFileExt = ".uif!";
	String NTKOLF_UploadInfoFileName = "";
	String NTKOLF_UploadInfoFileNameFullPath = "";
	
	String NTKOLF_FileSavedFullPath = ""; //实际保存的文件全路径
	
	String errorMessage = ""; //错误信息
	
	String reSultMessage = ""; //如果成功的返回信息
			
	if(isShowMoreOnSystemOut)System.out.println("===========queryfilestatus.jsp===================");
	if(isShowMoreOnSystemOut)System.out.println("开始处理..........");
	
	//查询参数
	
	NTKOLF_FileMd5ID = request.getParameter("NTKOLF_FileMd5ID");
	NTKOLF_FileOriginalName = request.getParameter("NTKOLF_FileOriginalName");
	String NTKOLF_FileSizeString = request.getParameter("NTKOLF_FileSize");
	
	if( (null == NTKOLF_FileMd5ID) || (null == NTKOLF_FileOriginalName) || (null == NTKOLF_FileSizeString) )
	{
		errorMessage = "错误的参数。";
		System.out.println(errorMessage);	
		response.sendError(500,errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		return;	
	}
	
	NTKOLF_FileOriginalName = new String(NTKOLF_FileOriginalName.getBytes("ISO-8859-1"),"UTF-8");

	int fileExtNameIndex = NTKOLF_FileOriginalName.lastIndexOf(".");
	String fileExtName = "";
	String fileNameWithoutExt = "";
	
	
	if( -1 != fileExtNameIndex)
	{
		fileExtName = NTKOLF_FileOriginalName.substring(fileExtNameIndex);
		fileNameWithoutExt = NTKOLF_FileOriginalName.substring(0,fileExtNameIndex);
	}
	else
	{
		fileNameWithoutExt = NTKOLF_FileOriginalName;
	}
	 //构造保存的文件名。文件名去掉扩展名+MD5ID+扩展名+"临时文件部分"
	NTKOLF_FileSavedName = fileNameWithoutExt + NTKOLF_FileMd5ID + fileExtName+NTKOLF_TempExt;
	if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileSavedName=" + NTKOLF_FileSavedName);
	
	//构造上传信息文件名。文件名去掉扩展名+MD5ID+扩展名+"临时文件部分"
	NTKOLF_UploadInfoFileName = fileNameWithoutExt + NTKOLF_FileMd5ID + fileExtName+NTKOLF_UploadInfoFileExt;
	if(isShowMoreOnSystemOut)System.out.println("NTKOLF_UploadInfoFileName=" + NTKOLF_UploadInfoFileName);	
	
	NTKOLF_FileSize = new Long(NTKOLF_FileSizeString);
	
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
	
	//以下将文件信息写入数据库
	
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
			boolean isNewRecord = true;
			if(!rs.next()) //记录不存在
			{
				isNewRecord = true;				
			}
			else
			{
				isNewRecord = false;
			}			
			if(isShowMoreOnSystemOut)System.out.println("isNewRecord=" + isNewRecord);
			if(isNewRecord)
			{				
				rs.close();
				rs = null;
				stmt.close();
				stmt = null;				
				reSultMessage = "NTKOLF_FileExist=false";
				//插入记录先
				strSql="insert into " + fileInfoTableName + 
					" (FileMd5ID,FileOriginalName,FileSize,IsFinished,CreateTime,FileName,UploadInfoFileName)" +
					" values(?,?,?,?,?,?,?)";
				if(isShowMoreOnSystemOut)System.out.println("strSql=" + strSql);
				ps = conn.prepareStatement(strSql);
				ps.setString(1, NTKOLF_FileMd5ID);
				ps.setString(2, NTKOLF_FileOriginalName);  
				ps.setLong(3, NTKOLF_FileSize);          		
				ps.setBoolean(4,false);				
				long TimeInMillis = Calendar.getInstance().getTimeInMillis();
				Timestamp now = new Timestamp(TimeInMillis);
				ps.setTimestamp(5,now);
				ps.setString(6, NTKOLF_FileSavedName); 
				ps.setString(7, NTKOLF_UploadInfoFileName); 
				ps.executeUpdate();
				ps.close();  
			    ps = null;
			    
			    //根据NTKOLF_FileSavedName创建文件。
				//NTKOLF_FileSavedName标识的文件的所有文件块都将保存在 filePathRootDir目录下。
				NTKOLF_FileSavedFullPath = filePathRootDir+NTKOLF_FileSavedName;
				
				//根据NTKOLF_UploadInfoFileName创建文件。
				NTKOLF_UploadInfoFileNameFullPath = filePathRootDir + NTKOLF_UploadInfoFileName;
				
				File tSavedFile = new File(NTKOLF_FileSavedFullPath);
				File tUploadInfoFile = new File(NTKOLF_UploadInfoFileNameFullPath);
				boolean isFileCreateOk = false;	
				try
				{
					isFileCreateOk = tSavedFile.createNewFile();
					if(!isFileCreateOk)
					{
						isFileCreateOk = tSavedFile.exists();
					}
					
					if(isFileCreateOk)
					{
						isFileCreateOk = tUploadInfoFile.createNewFile();	
						if(!isFileCreateOk)
						{
							isFileCreateOk = tUploadInfoFile.exists();
						}				
					}
					//取消以下注释则预先创建所需大小的文件。注释掉则按需扩展文件大小
					/* -------------------------------------------
					if(isFileCreateOk)
					{
						RandomAccessFile tSavedFileRandom = new RandomAccessFile(tSavedFile,"rw");
						tSavedFileRandom.setLength(NTKOLF_FileSize);
						tSavedFileRandom.close();
					}
					//-----------------------------------------*/					
				}
				catch(Exception e)
				{
					isFileCreateOk = false;
					errorMessage = e.toString();
				}
				if(!isFileCreateOk)
				{
					errorMessage = "未能成功创建保存文件:" +NTKOLF_FileSavedFullPath+
						",或者未能成功创建信息文件"+ NTKOLF_UploadInfoFileNameFullPath +",错误:"+ errorMessage;
					System.out.println(errorMessage);	
					response.sendError(500,errorMessage);
					if(isShowMoreOnSystemOut)System.out.println("未能成功创建保存文件,或者未能成功创建信息文件,处理结束有错误!");
					if(isShowMoreOnSystemOut)System.out.println("==============================");
					return;	
				}	
			}
			else //已存在的记录
			{
				reSultMessage = "NTKOLF_FileExist=true";
				boolean isFinished = rs.getBoolean("IsFinished");
				NTKOLF_UploadInfoFileName = rs.getString("UploadInfoFileName");
				rs.close();
				rs = null;
				stmt.close();
				stmt = null;
				reSultMessage += "&NTKOLF_FileFinished=" + new Boolean(isFinished).toString();
				if(!isFinished) //还需要查询已有的文件块
				{
					reSultMessage += "&NTKOLF_ExistFileParts=";
					try
					{				
						//读取上传信息文件			
						//根据NTKOLF_UploadInfoFileName创建文件。					
						NTKOLF_UploadInfoFileNameFullPath = filePathRootDir + NTKOLF_UploadInfoFileName;			
						RandomAccessFile tUploadInfoFilRandom = new RandomAccessFile(NTKOLF_UploadInfoFileNameFullPath,"r");						
						int iSizeToRead = new Long(tUploadInfoFilRandom.length()).intValue();
						byte[] tempBuf = new byte[iSizeToRead];	
						java.nio.ByteBuffer bf = java.nio.ByteBuffer.wrap(tempBuf);
						java.nio.channels.FileChannel fc = tUploadInfoFilRandom.getChannel();	
						int bytesRead = 0;
						bytesRead = fc.read(bf);						
						int curSize = 0;
						boolean isFirst = true;
						for(int i=0;i< bytesRead/4;i++)
						{
							curSize = bf.getInt(i*4);		
							if(0 != curSize)
							{
								Integer SeqNoObj = new Integer(i);
								if(isFirst)
								{
									reSultMessage += SeqNoObj.toString();
									isFirst = false;
								}
								else
								{
									reSultMessage += "," + SeqNoObj.toString();
								}
							}						
						}
						tUploadInfoFilRandom.close();
						tUploadInfoFilRandom = null;	
					}
					catch(Exception ex)
					{ 
						errorMessage = "读取文件完成信息错误." + ex.getMessage();
						System.out.println(errorMessage);	
						response.sendError(500,errorMessage);
						if(isShowMoreOnSystemOut)System.out.println("==============================");
						return;	
					}
				}
			}
		    conn.close();	
			conn = null;
			if(isShowMoreOnSystemOut)System.out.println("reSultMessage=" + reSultMessage);
			isCompleted = true;
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
	else
	{
		if(isShowMoreOnSystemOut)System.out.println("处理成功结束!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		out.println(reSultMessage);
	}
%>
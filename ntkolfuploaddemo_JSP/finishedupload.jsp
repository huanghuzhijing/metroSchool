<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<%!
	/******************************************
	说明:此文件是用来查询文件状态的。如果文件不存在，还应该创建文件
	*******************************************/
	//这儿需要修改成您的数据库连接信息
	
	public String userName="xcland";	//数据库用户名	
	public String userPasswd="xcland"; //密码			
	public String dbName="lcsoft";	//数据库名	
	
	public String fileInfoTableName = "filesinfo";

	public String DBDriver = "oracle.jdbc.driver.OracleDriver"; 
	public String ConnStr = "jdbc:oracle:thin:@192.168.1.100:1521:LCSOFT?user="+userName+"&password="+userPasswd+"";
	
	//以下是要保存到的父目录
	public String filePathRootDir = "d:\\test\\";
	
	//设定为true,则在system.out打印更多调试数据
	public boolean isShowMoreOnSystemOut = true;
%>
<%
	Connection conn = null; 	
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	
	
	String strSql = ""; //SQL语句
	
	//NTKO大文件上传控件保留域
	String NTKOLF_FileMd5ID = "";
	String NTKOLF_FileOriginalName = "";
	long NTKOLF_FileSize = 0;
	String NTKOLF_TempExt = ".~tmp!";
	String NTKOLF_FileSavedNameFinished = ""; //实际保存的文件名。原始名+Md5ID
	
	String NTKOLF_FileSavedName = ""; //实际保存的文件名。原始名+Md5ID+"临时文件部分"
	
	String NTKOLF_UploadInfoFileName = "";
	
	String errorMessage = ""; //错误信息
	
	String reSultMessage = ""; //如果成功的返回信息
			
	if(isShowMoreOnSystemOut)System.out.println("===========finishedupload.jsp===================");
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
	if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileOriginalName=" + NTKOLF_FileOriginalName);
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
	 //构造保存的文件名。文件名去掉扩展名+MD5ID+扩展名,此处去掉"临时文件部分"
	NTKOLF_FileSavedNameFinished = fileNameWithoutExt + NTKOLF_FileMd5ID + fileExtName;
	
	if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileSavedNameFinished=" + NTKOLF_FileSavedNameFinished);
		
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
	
	//以下将成功信息写入数据库,需要更新文件名。
	
	int retryCount = 0; //已经重试的次数
	boolean isCompleted = false; //是否已正确完成
	boolean isNoRetryError = false; //是否有不能重试的错误发生
	
	while( (!isCompleted) && (!isNoRetryError) && (retryCount < 2))
	{
		try
		{
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
				NTKOLF_UploadInfoFileName = rs.getString("UploadInfoFileName");
			}			
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			
			boolean isFileRenamedOk = false;
			//重命名文件
			File tSavedFileTmp = new File(filePathRootDir+NTKOLF_FileSavedName);
			File tSavedFileFinished = new File(filePathRootDir+NTKOLF_FileSavedNameFinished);
			try
			{
				if(tSavedFileTmp.exists())
				{
					isFileRenamedOk = tSavedFileTmp.renameTo(tSavedFileFinished);
					if(!isFileRenamedOk)
					{
						errorMessage = "服务器数据不一致,重命名文件错误:" +filePathRootDir+NTKOLF_FileSavedNameFinished+NTKOLF_TempExt;
						isFileRenamedOk = false;
					}
				}
				else //判断是否之前命名成功过
				{
					if(tSavedFileFinished.exists())
					{
						isFileRenamedOk = true;
					}
					else
					{
						errorMessage = "服务器数据不一致,文件不存在:" +filePathRootDir+NTKOLF_FileSavedNameFinished+NTKOLF_TempExt;
						isFileRenamedOk = false;
					}
				}
			}
			catch(Exception e)
			{
				isFileRenamedOk = false;
				errorMessage = e.toString();
			}
			if(!isFileRenamedOk)
			{
				isCompleted = false;
				isNoRetryError = true; //不继续执行循环，如果不设定这个是死循环了
			}
			else //重命名成功，继续更新数据库状态
			{
				if(isShowMoreOnSystemOut)System.out.println("尝试第" + retryCount + "次操作.");		
				//直接更新状态			
				strSql="update " + fileInfoTableName + " set FileOriginalName=?,IsFinished=?,FileName=? where (FileMd5ID='" + 
						NTKOLF_FileMd5ID + "')";
				if(isShowMoreOnSystemOut)System.out.println("strSql=" + strSql);
				ps = conn.prepareStatement(strSql);
				ps.setString(1, NTKOLF_FileOriginalName);     		
				ps.setBoolean(2,true);
				ps.setString(3, NTKOLF_FileSavedNameFinished);
				ps.executeUpdate();
				ps.close();  
			    ps = null;			
			    conn.close();	
				conn = null;		
				
				try
				{
					File tFileToDelete = new File(filePathRootDir+NTKOLF_UploadInfoFileName);
					if(tFileToDelete.exists())
					{
						tFileToDelete.delete();
					}
				}
				catch(Exception e)
				{
				}
					
				isCompleted = true;	
			}
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
		out.println("处理成功结束!");
	}
%>
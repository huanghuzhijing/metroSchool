<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.io.*,java.sql.*" %>
<%!
	/******************************************
	说明:此文件是用来删除文件的。
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
	public boolean isShowMoreOnSystemOut = false;
%>
<%
	//禁用缓存,否则xmlhttp会缓存
	response.setHeader("Pragma","No-Cache"); 
	response.setHeader("Cache-Control","No-Cache"); 
	response.setDateHeader("Expires", 0);
	
	Connection conn = null; 
	Statement stmt = null; 
	ResultSet rs = null; 

	String NTKOLF_FileMd5ID = "";
	String NTKOLF_FileOriginalName = "";
	
	
	//临时变量用于中间存储
	String NTKOLF_FileSavedNameOrFinishedName = ""; //实际保存的文件名。可能是临时文件或者最终文件
	String NTKOLF_UploadInfoFileName = "";
	
	String errorMessage = ""; //错误信息
	
	if(isShowMoreOnSystemOut)System.out.println("===========deletefile.jsp===================");
	if(isShowMoreOnSystemOut)System.out.println("开始处理..........");
	
	NTKOLF_FileMd5ID = request.getParameter("FileMd5ID");
	if( (null == NTKOLF_FileMd5ID)  )
	{
		errorMessage = "错误的参数。";
		System.out.println(errorMessage);	
		out.println(errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
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
		out.println("Error:" + errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		return;
	}
	
	//与DBMS建立连接 
	try
	{ 
		conn = DriverManager.getConnection(ConnStr); 
		stmt = conn.createStatement();
		
		String query = "SELECT FileOriginalName,FileName,UploadInfoFileName FROM " + fileInfoTableName + " where (FileMd5ID='" + NTKOLF_FileMd5ID + "')";
		if(isShowMoreOnSystemOut)System.out.println("query=" + query);
		rs = stmt.executeQuery(query);
		if(rs.next()) 
		{
			NTKOLF_FileOriginalName = rs.getString("FileOriginalName");
			NTKOLF_FileSavedNameOrFinishedName = rs.getString("FileName");
			NTKOLF_UploadInfoFileName = rs.getString("UploadInfoFileName");
		}
		else //记录不存在
		{
			errorMessage = "错误的参数。";
			System.out.println(errorMessage);	
			out.println(errorMessage);
			if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
			if(isShowMoreOnSystemOut)System.out.println("==============================");
			return;	
		}
		rs.close();
		rs = null;
				
		//先删除文件或者临时文件，如果成功再删除主文件表
		File tFileToDelete = new File(filePathRootDir+NTKOLF_FileSavedNameOrFinishedName);
		if(isShowMoreOnSystemOut)System.out.println("删除文件"+filePathRootDir+NTKOLF_FileSavedNameOrFinishedName);
		boolean isDeleteOk = false;	
		try
		{
			if(tFileToDelete.exists())
			{								
			    isDeleteOk = tFileToDelete.delete();
			    if(!isDeleteOk)
			    {					    	
			    	errorMessage = "删除文件"+NTKOLF_FileOriginalName+"发生错误.";
			    	if(isShowMoreOnSystemOut)System.out.println(errorMessage);
			    }									
			}
			else
			{
				isDeleteOk = true;
			}		
		}
		catch(Exception e)
		{
			isDeleteOk = false;
			errorMessage = "删除文件"+NTKOLF_FileOriginalName+ "异常信息:" + e.toString();
			if(isShowMoreOnSystemOut)System.out.println(errorMessage);
		}
		
		try
		{
			tFileToDelete = new File(filePathRootDir+NTKOLF_UploadInfoFileName);
			if(isShowMoreOnSystemOut)System.out.println("删除文件"+filePathRootDir+NTKOLF_UploadInfoFileName);
			if(tFileToDelete.exists())
			{
				tFileToDelete.delete();
			}
		}
		catch(Exception e)
		{
		}
		
		if(!isDeleteOk)
		{
			System.out.println("错误:"+ errorMessage);	
			out.println("错误:"+ errorMessage);
			if(isShowMoreOnSystemOut)System.out.println("未能删除文件块或者目录，处理结束有错误!");
			if(isShowMoreOnSystemOut)System.out.println("==============================");
			return;	
		}	
	
		query = "delete FROM " + fileInfoTableName + " where (FileMd5ID='" + NTKOLF_FileMd5ID + "')"; //删除文件表记录
		if(isShowMoreOnSystemOut)System.out.println("query=" + query);
		stmt.executeUpdate(query);
		stmt.close();
		stmt = null;
		conn.close();
		conn = null;
	}
	catch(SQLException ex)
	{ 
		errorMessage = "删除文件"+NTKOLF_FileOriginalName+"发生错误:"+ex.getMessage(); 
		System.out.println(errorMessage);	
		out.println(errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		return;
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
		if (conn != null) 
		{
			try	{conn.close();conn = null;} catch (SQLException sqlEx) 	{};
		}
	}
	if(isShowMoreOnSystemOut)System.out.println("处理成功结束");		
	out.println("删除文件"+NTKOLF_FileOriginalName+"成功!");
%>
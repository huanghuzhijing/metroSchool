<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.io.*,java.sql.*" %>
<%!
	/******************************************
	说明:此文件是用来下载文件的。支持断点续传软件下载
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
	public boolean isShowMoreOnSystemOut = false;
%>
<%
	//禁用缓存
	response.setHeader("Pragma","No-Cache"); 
	response.setHeader("Cache-Control","No-Cache"); 
	response.setDateHeader("Expires", 0);
	
	Connection conn = null; 
	Statement stmt = null; 
	ResultSet rs = null; 

	String NTKOLF_FileMd5ID = "";
	String NTKOLF_FileOriginalName = "";
	long NTKOLF_FileSize = 0;
	boolean NTKOLF_IsFinished = false;
	
	long NTKOLF_BLOCKSIZE = 131072; //块大小，注意这个是保留大小，不能修改！
		
	boolean isPartialContent  = false; //客户端是否请求部分内容
	long lRangeStart  = 0; //客户端请求部分内容的开始位置
	long lRangeEnd  = -1; //客户端请求部分内容的结束位置
	
	//临时变量用于中间存储
	String NTKOLF_FileSavedNameFinished = ""; //实际保存的文件名。
	String NTKOLF_FileSavedFullPath = ""; //实际保存的文件全路径
	
	String errorMessage = ""; //错误信息
	
	if(isShowMoreOnSystemOut)System.out.println("===========readfile.jsp===================");
	if(isShowMoreOnSystemOut)System.out.println("开始处理..........");
	
	NTKOLF_FileMd5ID = request.getParameter("FileMd5ID");
	if( (null == NTKOLF_FileMd5ID)  )
	{
		errorMessage = "错误的参数。";
		System.out.println(errorMessage);	
		response.sendError(500,errorMessage);
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
		response.sendError(500,"Error:" + errorMessage);
		if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
		if(isShowMoreOnSystemOut)System.out.println("==============================");
		return;
	}

	String RangeStr = request.getHeader("Range");
	//判断是否是需要提供部分内容
	if ( RangeStr != null) //客户端请求的下载的文件块的开始字节
	{
		if(isShowMoreOnSystemOut)System.out.println("RangeStr="+RangeStr);
		isPartialContent  = true;
		String rangeSpecStr = RangeStr.replaceAll("bytes=",""); //Range: bytes=100-200 或者 bytes=100- 不支持多Range。
		int commaIndex = rangeSpecStr.indexOf(",");
		if( - 1 != commaIndex ) //可能是多range,只取第一个
		{
			rangeSpecStr = rangeSpecStr.substring(0,commaIndex);
		}
		String[] ranges = rangeSpecStr.split("-");
		if(ranges.length == 1)
		{
			lRangeStart = Long.parseLong(ranges[0]); 
		}
		else if(ranges.length == 2)
		{
			lRangeStart = Long.parseLong(ranges[0]); 
			lRangeEnd = Long.parseLong(ranges[1]); 
		}		
		if(isShowMoreOnSystemOut)System.out.println("Range:"+lRangeStart+" - "+lRangeEnd);
	}

	//与DBMS建立连接 
	try
	{ 
		conn = DriverManager.getConnection(ConnStr); 
		stmt = conn.createStatement();
		
		//首先通过文件表查询文件原始文件名及大小
		
		String query = "SELECT FileOriginalName,FileSize,IsFinished,FileName FROM " + fileInfoTableName + 
				" where (FileMd5ID='" + NTKOLF_FileMd5ID + "')";
		if(isShowMoreOnSystemOut)System.out.println("query=" + query);
		rs = stmt.executeQuery(query);
		if(!rs.next()) //记录不存在
		{
			errorMessage = "错误的参数。";
			System.out.println(errorMessage);	
			response.sendError(500,errorMessage);
			if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
			if(isShowMoreOnSystemOut)System.out.println("==============================");
			return;	
		}
		else
		{
			NTKOLF_FileOriginalName = rs.getString("FileOriginalName");
			NTKOLF_FileSize = rs.getLong("FileSize");		
			NTKOLF_IsFinished = rs.getBoolean("IsFinished");
			NTKOLF_FileSavedNameFinished  = rs.getString("FileName");
		}

		if(!NTKOLF_IsFinished)
		{
			errorMessage = "文件不完整,不允许下载.";
			System.out.println(errorMessage);	
			response.sendError(500,errorMessage);
			if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
			if(isShowMoreOnSystemOut)System.out.println("==============================");
			return;	
		}
		rs.close();
		rs = null;
		
		//判断文件是否存在先
		NTKOLF_FileSavedFullPath = filePathRootDir+NTKOLF_FileSavedNameFinished;
		File tSavedFile = new File(NTKOLF_FileSavedFullPath);
		if(!tSavedFile.exists())
		{
			errorMessage = "服务器数据不一致,文件不存在:" +NTKOLF_FileSavedFullPath;
			System.out.println(errorMessage);	
			response.sendError(500,errorMessage);
			if(isShowMoreOnSystemOut)System.out.println("服务器数据不一致,文件不存在，处理结束有错误!");
			if(isShowMoreOnSystemOut)System.out.println("==============================");
			return;	
		}	
		
		if(lRangeEnd<0) //如果客户端没有指定Range结束，则结束位置是NTKOLF_FileSize-1
		{
			lRangeEnd = NTKOLF_FileSize-1;
		}
		if(isShowMoreOnSystemOut)System.out.println("Range:"+lRangeStart+" - "+lRangeEnd);
		
		//开始输出文件
		response.reset();
		response.setHeader("Accept-Ranges", "bytes"); //我们支持断点续传		
		response.setContentType("application/octet-stream");
		if(isShowMoreOnSystemOut)System.out.println("NTKOLF_FileOriginalName=" + NTKOLF_FileOriginalName);
		//这里gb2312应该是跟系统字符编码有关
		String FileNameShowInIe = new String(NTKOLF_FileOriginalName.getBytes("gb2312"),"ISO-8859-1");	
		response.setHeader("Content-Disposition", "attachment; filename="+ FileNameShowInIe);
		response.setHeader("Content-Length", new Long(lRangeEnd - lRangeStart + 1).toString()); 
		if(isPartialContent)
		{
			//设定是部分内容			
			response.setStatus(javax.servlet.http.HttpServletResponse.SC_PARTIAL_CONTENT);//206
			//Content-Range: bytes 191621-2019103/2019104
			String contentRangeStr = "bytes " + new Long(lRangeStart).toString() + "-"
			 + new Long(lRangeEnd).toString() + "/" + new Long(NTKOLF_FileSize).toString();
			response.setHeader("Content-Range",contentRangeStr);   
			if(isShowMoreOnSystemOut)System.out.println("contentRangeStr=" + contentRangeStr);
		}
		try
		{
			long lStartByte = lRangeStart;
			long lEndByte = lRangeEnd;
			
			int iSizeToRead = new Long(NTKOLF_BLOCKSIZE).intValue();; //默认每次读取128KB				
			byte[] tempBuf = new byte[iSizeToRead];
			int bytesRead = 0;
			if(isShowMoreOnSystemOut)System.out.println("从文件:"+NTKOLF_FileSavedFullPath+"读取数据");
			RandomAccessFile tFile = new RandomAccessFile(NTKOLF_FileSavedFullPath,"r");
			try
			{
				java.nio.channels.FileChannel fc = tFile.getChannel();				
				while(lStartByte < lEndByte)
				{					
					java.nio.ByteBuffer bf = java.nio.ByteBuffer.wrap(tempBuf);
					bytesRead = fc.read(bf,lStartByte);					
					if(bytesRead<=0)
					{
						if(isShowMoreOnSystemOut)System.out.println("所有数据读取结束!");
						break;
					}					
					if(isShowMoreOnSystemOut)System.out.println("从"+lStartByte+"字节开始读取"+bytesRead +"字节结束");
					OutputStream outStream = response.getOutputStream();
					outStream.write(tempBuf, 0, bytesRead);	
					lStartByte += bytesRead;
				}
				tFile.close();
				tFile = null;				
			}
			catch(Exception e)
			{
				throw(e);
			}
			finally
			{
				if(tFile != null){tFile.close();tFile = null;};
			}	
			response.flushBuffer();
		}
		catch(Exception e)
		{
			errorMessage = e.toString();
			System.out.println("Error:" + errorMessage);	
			response.sendError(500,errorMessage);
			if(isShowMoreOnSystemOut)System.out.println("处理结束有错误!");
			if(isShowMoreOnSystemOut)System.out.println("==============================");
			return;	
		}
		//*/
	} 
	catch(SQLException ex)
	{ 
		errorMessage = ex.getMessage(); 
		System.out.println("Error:" + errorMessage);	
		response.sendError(500,"Error:" + errorMessage);
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
	//*/
%>
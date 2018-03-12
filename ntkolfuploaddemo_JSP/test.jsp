<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<%!
	//这儿需要修改成您的数据库连接信息
	
	public String userName="root";	//数据库用户名	
	public String userPasswd="root"; //密码			
	public String dbName="ntko";	//数据库名	
	
	public String fileInfoTableName = "filesinfo";

	public String DBDriver = "com.mysql.jdbc.Driver"; 
	public String ConnStr = "jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=utf-8";
%>
<%
	Connection conn = null; 	
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	String strSql = ""; //SQL语句

	
			
			try{
			Class.forName(DBDriver);
			conn = DriverManager.getConnection(ConnStr);
			stmt = conn.createStatement();
			String query = "SELECT * FROM " + fileInfoTableName;
			rs = stmt.executeQuery(query);
			if(rs.next()) 
			{
				String NTKOLF_FileSavedName =  rs.getString("FileName");
				String tmp = new String(NTKOLF_FileSavedName.getBytes("utf-8"),"gbk");
				out.println("NTKOLF_FileSavedName=" + NTKOLF_FileSavedName+"<br>");
				String NTKOLF_UploadInfoFileName = rs.getString("UploadInfoFileName");
				out.println("NTKOLF_UploadInfoFileName=" + NTKOLF_UploadInfoFileName);
			}		
			}catch(Exception e){	
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			}
%>

<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<%!
	//�����Ҫ�޸ĳ��������ݿ�������Ϣ
	
	public String userName="root";	//���ݿ��û���	
	public String userPasswd="root"; //����			
	public String dbName="ntko";	//���ݿ���	
	
	public String fileInfoTableName = "filesinfo";

	public String DBDriver = "com.mysql.jdbc.Driver"; 
	public String ConnStr = "jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+userPasswd+"&useUnicode=true&characterEncoding=utf-8";
%>
<%
	Connection conn = null; 	
	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	String strSql = ""; //SQL���

	
			
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

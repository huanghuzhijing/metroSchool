<%!
	/******************************************
	说明:此文件是用来显示文件列表的
	*******************************************/
	//这儿需要修改成您的数据库连接信息
	
	public String userName="xcland";//数据库用户名
	public String userPasswd="xcland"; //密码
	public String dbName="lcsoft";	   //数据库名
	
	public String officeFileInfoTableName = "DSPROJECT.NTKOOFFICEFILE";
	public String htmlFileInfoTableName = "DSPROJECT.NTKOHTMLFILE"; //表名	
	public String pdfFileInfoTableName = "DSPROJECT.NTKOPDFFILE" ;

	public String DBDriver = "oracle.jdbc.driver.OracleDriver"; 
	public String ConnStr = "jdbc:oracle:thin:@192.168.1.100:1521:LCSOFT";
%>
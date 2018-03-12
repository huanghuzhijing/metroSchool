<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="java.io.*,java.text.*,java.sql.*" %>
<%@ page language="java" import="java.util.*"%>
<%!
	/******************************************
	说明:此文件是用来显示文件列表的
	*******************************************/
	//这儿需要修改成您的数据库连接信息
	
	public String userName="root";	//数据库用户名	
	public String userPasswd="123"; //密码			
	public String dbName="test";	//数据库名	
	
	public String fileInfoTableName = "filesinfo";

	public String DBDriver = "com.mysql.jdbc.Driver"; 
	public String ConnStr = "jdbc:mysql://localhost:3306/"+dbName+"?user="+userName+"&password="+userPasswd;
	
	//以下是要保存到的父目录
	public String filePathRootDir = "D:\\test\\";
	
	//设定为true,则在system.out打印更多调试数据
	public boolean isShowMoreOnSystemOut = false;
	
	public String FormatSize(long size,boolean isShowKbOnly)
	{
	/**
	*DecimalFormat 是 NumberFormat 的一个具体子类，用于格式化十进制数字。该类设计有各种功能，
	使其能够分析和格式化任意语言环境中的数，包括对西方语言、阿拉伯语和印度语数字的支持。它还支持不同类型的数，包括整数 (123)、定点数 (123.4)、科学记数法表示的数 (1.23E4)、百分数 (12%) 和金额 ($123)。所有这些内容都可以本地化。
	*/
		DecimalFormat formatter = new DecimalFormat(); 
		formatter.setGroupingSize(3); //设置分组大小
		formatter.setGroupingUsed(true);  //设置此格式中是否使用组。
		String resultStr = "";
		
		if (size < 1024)
		{
			formatter.applyPattern("#"); // 将给定的模式应用于此 Format 对象。
			resultStr = formatter.format(size)+" 字节";
		}
		else
		{
			formatter.applyPattern("#.00");
			if(isShowKbOnly)
			{
				double dValue = (new Long(size)).doubleValue()/1024.0;
				resultStr = formatter.format(dValue) + " KB";
			}
			else
			{
				if (size < 1048576)
				{
					double dValue = (new Long(size)).doubleValue()/1024.0;
					resultStr = formatter.format(dValue) + " KB";
				}
				else
				{
					double dValue = (new Long(size)).doubleValue()/1048576.0;
					resultStr = formatter.format(dValue) + " MB";
				}
			}
		}
		return resultStr;
	}	
%>
<HTML>
<HEAD>
<meta http-equiv="content-type" content="text/html;charset=gb2312">
<TITLE>NTKO大文件上传控件演示</TITLE>
<link href="indexSheet.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
 
function showDelDialogAndRefresh(URL,FileName,tWidth,tHeight)
{
	if(!window.confirm("您确认要删除文件:" + FileName +"吗?"))
	{
		return;
	}
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	window.showModalDialog(URL,"",dlgFeatures);
	window.location.reload();
}
function showUploadDialogAndRefresh(URL,tWidth,tHeight)
{
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	window.open(URL,"",dlgFeatures);
	window.location.reload();
}
//-->
</script>
</HEAD>
<BODY>
<center>
			<table cellpadding="0" cellspacing="0" class="maintable">
                <tr>
                    <td id="banner1">
                   <div id="weburldiv"><a href="http://www.ntko.com" title="软航科技官方网站" target="_blank">主网站</a>&nbsp;&nbsp;&nbsp;
                   <a href="http://dev.ntko.com/admin/support.nsf/fmBSQuestion?openform" title="欢迎向我们反馈各种问题!" target="_blank">反馈问题</a>&nbsp;&nbsp;&nbsp;
                   <a href="http://www.ntko.com/admin/homepagenew.nsf/vwDocsByAIDSumary/7D869CB7F47563E648257619006102A1" title="软航科技联系方式" target="_blank">联系我们</a>&nbsp;&nbsp;&nbsp;
                   <p class="demotitle">大文件上传组件V4.0演示</p>
                   </div></td>
                </tr>
                <tr>
                    <td id="banner2">
                        <img src="images/upload1.gif" onmouseover="this.src='images/upload2.gif'" onmouseout="this.src='images/upload1.gif'" onclick="javascript:showUploadDialogAndRefresh('/ntkolfuploaddemo_JSP/uploaderfile.html',900,700);" style="width: 76px; height: 65px; cursor:pointer" alt="进入文件上传页面" />
                        <img src="images/compartline.png" style="width: 4px; height: 65px" alt="" />
                        <img src="images/reload1.png" onmouseover="this.src='images/reload2.png'" onmouseout="this.src='images/reload1.png'" onclick="document.location.reload();" style="width: 76px; height: 65px;cursor:pointer" alt="刷新当前窗口" />
                        <img src="images/compartline.png" style="width: 4px; height: 65px" alt="" />
                        <img src="images/close1.png" onmouseover="this.src='images/close2.png'" onmouseout="this.src='images/close1.png'" onclick="window.close();" style="width: 76px; height: 65px;cursor:pointer" alt="关闭当前窗口" /></td>
                </tr>
                <tr>
                    <td>
                    	<table cellpadding="0" cellspacing="0" id="documentlist">
					        <tr class="indextabletitle">
						        <td width="20%">提&nbsp;交&nbsp;时&nbsp;间</td>
						        <td width="30%">文&nbsp;件&nbsp;名</td>
						        <td width="10%">文件大小</td>
						        <td width="10%">处理状态</td>
						        <td width="10%">操&nbsp;作</td>
					        </tr>
<!--读取数据库中的文件-->
<%
	//禁用缓存
	response.setHeader("Pragma","No-Cache"); 
	response.setHeader("Cache-Control","No-Cache"); 
	response.setDateHeader("Expires", 0);
  
	
	//读取数据库中的文件列表
	Connection conn = null; 
	Statement stmt = null; 
	ResultSet rs = null; 

	String NTKOLF_FileMd5ID = "";
	String NTKOLF_FileOriginalName = "";
	long NTKOLF_FileSize = 0;
	boolean NTKOLF_IsFinished = false;
	String NTKOLF_UploadInfoFileName = "";
	String NTKOLF_UploadInfoFileNameFullPath = "";
	Timestamp NTKO_LT_CreatedTime;
	String errorMessage = ""; //错误信息
	
	boolean dbDriverOk = true;
	try 
	{ 
		//加载数据库驱动程序 
		Class.forName(DBDriver); 
	} 
	catch(java.lang.ClassNotFoundException e)
	{ 
		errorMessage = e.getMessage();
		System.out.println("DBconn (): " + errorMessage); 
		out.println(errorMessage);
		dbDriverOk = false;
	}
	
	if(dbDriverOk)
	{
		try
		{ 
			conn = DriverManager.getConnection(ConnStr); 
			stmt = conn.createStatement();		
			rs = stmt.executeQuery("select * from " + fileInfoTableName + " ORDER BY CreateTime DESC"); 
			while(rs.next())
			{			
				NTKO_LT_CreatedTime = rs.getTimestamp("CreateTime");
				NTKOLF_FileMd5ID = rs.getString("FileMd5ID");
				NTKOLF_FileOriginalName = rs.getString("FileOriginalName");
				NTKOLF_FileSize = rs.getLong("FileSize");
				NTKOLF_UploadInfoFileName = rs.getString("UploadInfoFileName");
				NTKOLF_UploadInfoFileNameFullPath = filePathRootDir+NTKOLF_UploadInfoFileName;
							
				String NTKOLF_FileSizeStr = FormatSize(NTKOLF_FileSize,false);			
				NTKOLF_IsFinished = rs.getBoolean("IsFinished");
				
				Calendar ctCalendar = Calendar.getInstance();
				ctCalendar.setTime(NTKO_LT_CreatedTime);
				
				DecimalFormat formatter = new DecimalFormat(); 
				formatter.applyPattern("00");
	
				String NTKO_LT_CreatedTimeStr = ctCalendar.get(Calendar.YEAR) + "年" + 
					formatter.format(ctCalendar.get(Calendar.MONTH)+1) + "月"+
					formatter.format(ctCalendar.get(Calendar.DAY_OF_MONTH))+"日"+
					formatter.format(ctCalendar.get(Calendar.HOUR_OF_DAY))+	":"+
					formatter.format(ctCalendar.get(Calendar.MINUTE))+":"+
					formatter.format(ctCalendar.get(Calendar.SECOND));
								
				String opString = "<a href=javascript:showDelDialogAndRefresh('deletefileui.jsp?FileMd5ID=" 
					+ NTKOLF_FileMd5ID + "','" + NTKOLF_FileOriginalName.replaceAll(" ","+") + "',350,150);>删除</a>&nbsp;";
				//System.out.println(opString+"00000000000000000000");	
				//以下用于新窗口打开调试
				//String opString = "<a href=\"deletefile.jsp?FileMd5ID=" + NTKOLF_FileMd5ID + "\" target=_blank>删除</a>&nbsp;";

				if(NTKOLF_IsFinished)
				{
					opString += "<a href=\"readfile.jsp?FileMd5ID=" + NTKOLF_FileMd5ID + "\" target=_blank>下载</a>";
				}
				
				String persentStr = "100%";
				
				if(!NTKOLF_IsFinished) //查询已完成的数量
				{
					persentStr = "0%";
					try
					{
						//读取上传信息文件
						RandomAccessFile tUploadInfoFilRandom = new RandomAccessFile(NTKOLF_UploadInfoFileNameFullPath,"r");						
						int iSizeToRead = new Long(tUploadInfoFilRandom.length()).intValue();
						byte[] tempBuf = new byte[iSizeToRead];	
						java.nio.ByteBuffer bf = java.nio.ByteBuffer.wrap(tempBuf);
						java.nio.channels.FileChannel fc = tUploadInfoFilRandom.getChannel();	
						int bytesRead = 0;
						bytesRead = fc.read(bf);						
						long totalSize = 0;
												
						for(int i=0;i< bytesRead/4;i++)
						{							
							totalSize += bf.getInt(i*4);													
						}
						persentStr = totalSize*100/NTKOLF_FileSize + "%";
						tUploadInfoFilRandom.close();
						tUploadInfoFilRandom = null;						
					}
					catch(Exception ex)
					{ 
						System.err.println("读取文件完成百分比信息错误." + ex.getMessage()); 
					}
				}
				
				String outStr = "<tr><td>" + NTKO_LT_CreatedTimeStr + "</td><!-- td>" +
					NTKOLF_FileMd5ID + "</td--><td>" + 
					NTKOLF_FileOriginalName + "</td><td>" 
					+ NTKOLF_FileSizeStr + "</td><td>" + persentStr + 
					"</td><td>" + opString + "</td><tr>";
				out.println(outStr);

			}
			rs.close();
			rs = null;
			stmt.close();	
			stmt = null;
			conn.close();
			conn = null;
		} 
		catch(SQLException sqlEx)
		{ 
			errorMessage = sqlEx.getMessage();
			System.out.println("读取数据列表错误." + errorMessage); 
			out.println(errorMessage);
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
	}	
%>
			        </table>
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" id="indexfoot">
                <tr><td align="left"><p>技术支持详见公司网站www.ntko.com “联系我们”</p></td><td align="right">重庆软航科技有限公司版权所有</td></tr>
             </table>
		</center>
		
</BODY>
</html>
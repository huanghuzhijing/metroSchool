<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.io.*,java.sql.*" %>
<%
	/******************************************
	说明:本文件用ajax调用deletefile.jsp
	*******************************************/
	
	//禁用缓存
	response.setHeader("Pragma","No-Cache"); 
	response.setHeader("Cache-Control","No-Cache"); 
	response.setDateHeader("Expires", 0);
	
	String NTKOLF_FileMd5ID = "";
	String errorMessage = ""; //错误信息
	NTKOLF_FileMd5ID = request.getParameter("FileMd5ID");
	if( (null == NTKOLF_FileMd5ID)  )
	{
		errorMessage = "错误的参数。";
		System.out.println(errorMessage);	
		response.sendError(500,errorMessage);
		return;	
	}
	String deleteFileURL = "deletefile.jsp?FileMd5ID=" + NTKOLF_FileMd5ID;
%>	
<html>
<head>
<script type="text/javascript">
var xmlhttp;
function loadXMLDoc(url)
{
	xmlhttp=null;
	if (window.XMLHttpRequest) // code for Firefox, Opera, IE7, etc.
	{
		xmlhttp=new XMLHttpRequest();
	}
	else if (window.ActiveXObject)// code for IE6, IE5
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlhttp!=null)
	{
		document.getElementById('T1').innerHTML = "正在删除文件,请稍候...";
		xmlhttp.onreadystatechange = state_Change;			
		xmlhttp.open("GET",url,true);		
		xmlhttp.setRequestHeader("Cache-Control","no-cache");	
		xmlhttp.send(null);
	}
	else
	{
		document.getElementById('T1').innerHTML = "您的浏览器不支持XMLHTTP!";
		window.location.href = url;
	}
}

function state_Change()
{
	if (xmlhttp.readyState==4) // 4 = "loaded"
	{	
		if (xmlhttp.status==200) // 200 = "OK"
		{
			document.getElementById('T1').innerHTML = xmlhttp.responseText;
		}
		else
		{
			document.getElementById('T1').innerHTML ="错误:" + xmlhttp.statusText;
		}
	}
}
</script>
</head>

<body onload="loadXMLDoc('<%= deleteFileURL %>')">
<br><br>
<center><div id="T1" style="border:1px solid black;height:40;width:300;padding:5"></div></center><br />
<center><button onclick="window.close();">关闭</button></center>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<html>
	<head>	     
	    <title>系统管理</title>
		<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
		<META name="copyright" content=" All Rights Reserved">
		<META name="author" content="mxmu">
		<meta http-equiv="Pragma" content="no-cache"/>
		<META NAME="keywords" CONTENT="">
		<META name="description" contect="">
	<!--  	<LINK rel=stylesheet href="biz/css/sys.css"  type="text/css">-->
		<Script Language="JavaScript">
			var topwin = window;
			topwin.flag = false;
			function modifiyPws()
			{
				topwin.flag = true;
				this.location.href = "biz/sysManage/sys/modifypassword.jsp";
			}
		</Script>
		
		<!-- 系统退出处理 -->
		<SCRIPT FOR="window" EVENT="onbeforeunload">
			//alert(topwin.flag);
			
			if(!topwin.flag)
			{				
				event.returnValue = "";				
				top.location.href = "logout.jsp?logout=true";
			}
		</SCRIPT>
	</head>

	<noframes>
		<body>您的浏览器不支持框架，请打开后再使用。</body>
	</noframes>

</html>
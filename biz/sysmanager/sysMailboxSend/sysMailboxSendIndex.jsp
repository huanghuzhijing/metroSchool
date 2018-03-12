<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
  <FRAMESET  cols = "200,*"  frameborder=no  bordercolor=silver>
     <FRAME SRC="sysMailboxSendAction.do?method=menu"  NAME="Links" SCROLLING="no" frameborder="0" noresize="noresize">
     <FRAME SRC="sysMailboxReceiveAction.do?method=list&flag=4" NAME="main" SCROLLING="auto" frameborder="0" noresize="noresize">
  </FRAMESET>
<NOFRAMES>
<BODY> 
</BODY>

</NOFRAMES>
</html>
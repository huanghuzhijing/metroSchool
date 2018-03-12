<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
  <FRAMESET  cols = "200,*"  frameborder=no  bordercolor=silver>
     <FRAME SRC="personMailboxSendAction.do?method=menu"  NAME="Links" SCROLLING="no" frameborder="0" noresize="noresize">
     <FRAME SRC="personMailboxSendAction.do?method=receive&flag=1" NAME="main" SCROLLING="auto" frameborder="0" noresize="noresize">
  </FRAMESET>
<NOFRAMES>
<BODY> 
</BODY>

</NOFRAMES>
</html>
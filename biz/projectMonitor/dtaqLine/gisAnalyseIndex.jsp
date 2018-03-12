<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
<script>
</script>
	<frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/projectMonitor/dtaqLine/titletop.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="205,*" border="0" scrolling="no" noresize="noresize" />
		<frame src="dtaqLineAction.do?method=gisAnalyseTree" id="Links" name="Links" border="0" scrolling="yes" noresize="noresize" />
		<frame src="dtaqLineAction.do?method=gisAnalyse"  name="main" border="0" scrolling="yes" noresize="noresize" />
	</frameset>
  </frameset>
<NOFRAMES>
<BODY>
</BODY>

</NOFRAMES>
</html>
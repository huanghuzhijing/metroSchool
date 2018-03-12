<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>

	<frameset rows="38px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/sysmanager/sysconfigmanager/projectPeriods/titletop.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="200,*" border="0" scrolling="no" noresize="noresize"/>
		<frame src="projectPeriodsAction.do?method=listLeft" name="Links" border="0" scrolling="no" noresize="noresize" />
		<frame src="projectPeriodsAction.do?method=listExtend&pageIndex=${pageIndex}" name="main" border="0" scrolling="no" noresize="noresize" />
	</frameset>
  </frameset>
 
<NOFRAMES>
<BODY>
</BODY>

</NOFRAMES>
</html>
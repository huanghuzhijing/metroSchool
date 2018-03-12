<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
	<frameset rows="38px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/sysmanager/organstaffmanager/employee/titletop.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="230,*" border="0" scrolling="no" noresize="noresize"/>
		<frame src="employeeAction.do?method=left" name="Links" border="0" scrolling="no" noresize="noresize" />
		<frame src="employeeAction.do?method=list&fIsdelete=${fIsdelete}&name=${name}&static_orgid=${static_orgid}" name="main" border="0" scrolling="auto" noresize="noresize" />
	</frameset>
  </frameset>
<NOFRAMES>
<BODY>
</BODY>

</NOFRAMES>
</html>
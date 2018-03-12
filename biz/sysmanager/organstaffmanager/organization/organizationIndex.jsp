<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
  <frameset rows="38px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/sysmanager/organstaffmanager/organization/titletop.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="200,*" border="0" scrolling="no" noresize="noresize"/>
		<frame src="organizationAction.do?method=listLeft" name="Links" border="0" scrolling="no" noresize="noresize" />
		<frame src="organizationAction.do?method=list&static_parent_id=${static_parent_id}&fIsdelete=${fIsdelete}&name=${name}" name="main" border="0" scrolling="no" noresize="noresize" />
	</frameset>
  </frameset>
 
<NOFRAMES>
<BODY>
</BODY>

</NOFRAMES>
</html>
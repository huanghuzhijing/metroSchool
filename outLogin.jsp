<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<head>
</head>
<body >
	<form action="${ctx}/loginsystem.do?method=login" id="loginSystemForm" method="post" >
			<input type="hidden" name="fsname" value="${userinfo.username }"/>
			<input type="hidden" name="fspassw" value="${userinfo.password }"/>
	</form>
	<script type="text/javascript">
		var url="${ctx}/loginsystem.do?method=login";
		document.getElementById("loginSystemForm").action=url;
		document.getElementById("loginSystemForm").submit();
	</script>
</body>
</html>

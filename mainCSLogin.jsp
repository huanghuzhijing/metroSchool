<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<head>
</head>
<body >
	<form action="${ctx}/loginsystem.do?method=loginCS" id="loginSystemForm" method="post" >
			<input type="hidden" name="fsname" value="${fsname }"/>
			<input type="hidden" name="fspassw" value="${fspassw }"/>
			<input type="hidden" name="furl" value="${furl }"/>
	</form>
	<script type="text/javascript">
		var url="${ctx}/loginsystem.do?method=loginCS";
		document.getElementById("loginSystemForm").action=url;
		document.getElementById("loginSystemForm").submit();
	</script>
</body>
</html>

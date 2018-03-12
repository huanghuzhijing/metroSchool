<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			var deleteFlag='${param.deleteFlag}';
			if(deleteFlag==1){
				location.href='sysPostAction.do?method=deleteJoin&joinId=${param.joinId}';
			}else{
				document.forms[0].submit();
			}
		});
	</script>
</head>
<body>
	<html:form enctype="multipart/form-data" action="sysPostAction.do?method=saveEmp" method="POST">
		<input id="empIds" name="empIds" value="${param.empIds }"  type="hidden">
		<input name="staticPostId" value="${param.staticPostId }" type="hidden">
	</html:form>
</body>
</html:html>

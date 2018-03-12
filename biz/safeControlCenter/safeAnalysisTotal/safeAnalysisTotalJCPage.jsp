<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<head>
<script src="<c:url value="/scripts/jquery-1.2.6.js"/>" type="text/javascript"></script>
<script src='${ctx}/scripts/public.js' type="text/javascript"></script>
<link href="${ctx}/biz/css/main.css" type="text/css" rel="stylesheet">
<link href="${ctx}/styles/default.css" type="text/css" rel="stylesheet" />
</head>
	<body style="width:100%;height: 100%" >
		<c:out value='${text}' escapeXml="false"></c:out>
		<script type="text/javascript">
		function viewPointDatas(point_id,info_id,type_kind){
			parent.viewPointDatas(point_id,info_id,type_kind);
		}
		</script>
	</body>
</html>
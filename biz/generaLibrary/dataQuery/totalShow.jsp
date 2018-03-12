<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<title><fmt:message key="dtaq.dataTotal.title" /></title>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<style type="text/css">
	.totalTable td{margin-left:20px;height:25px;line-height:25px;padding-left:20px;}
</style>

</head>
<body>

		<fieldset>
			<legend>监测数据统计</legend>
			
			<table style="width:100%" class="totalTable">
			<tr>
				<td>截止到${endDate}起，总计<font style="color:#ff0000">${totle}</font>条监测数据</td>
			</tr>
			<c:forEach items="${dataTotal}" var="data">
				<tr>
					<td>${data.line}共<font style="color:#ff0000">${data.total}</font>条</td>
				</tr>
			</c:forEach>
			</table>
		</fieldset>
	
</body>
</html:html>

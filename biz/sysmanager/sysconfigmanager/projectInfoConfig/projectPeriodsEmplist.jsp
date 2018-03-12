<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			//
		});
	</script>
</head>
<body >
	<table class="listTable" >
		<thead>
			<tr >
				<th width="5%" >序号</th>
					<th >项目周期</th>
					<th  >对应模块</th>
					<th >参与人员</th>
					<th >参与部门</th>
			</tr>
			</thead>
			<c:forEach items="${voPrjPeriodsEmps}" varStatus="index" var="voPrjPeriodsEmp">
				<c:set var="perCount" value="${voPrjPeriodsEmp.perCount }"></c:set>
				<c:forEach items="${voPrjPeriodsEmp.sysProjectOrganconfigs}" varStatus="index" var="sysProjectOrganconfig">
				<tr id="${sysCodeRuleitem.id}">
					<td>${index.count}</td>
					<c:if test="${perCount!=0}">
						<td rowspan="${voPrjPeriodsEmp.perCount }">${sysProjectOrganconfig.periodsname}&nbsp;</td>
					</c:if>
					<c:set var="perCount" value="0"></c:set>
					<td>${sysProjectOrganconfig.modulename}&nbsp;</td>
					<td>${sysProjectOrganconfig.empname}&nbsp;</td>
					<td>${sysProjectOrganconfig.orgname}&nbsp;</td>
				</tr>
				</c:forEach>
			</c:forEach>
	</table>
</body>
</html:html>

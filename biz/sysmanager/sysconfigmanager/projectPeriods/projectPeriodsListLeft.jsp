<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<title>业务系统</title>

		<%@ include file="/commons/meta.jsp"%>
		<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
		<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top">
					<div style="overflow: auto; min-width: 180px">
						<script language='javascript'>
							//显示树
							var projectPeriodsTree = new dTree('projectPeriodsTree');
							projectPeriodsTree.setIconPath("${ctx}/scripts/dtree/");
							projectPeriodsTree.add('-1',-99,'项目周期树','${ctx}/projectPeriodsAction.do?method=list&static_parent_id=-1','','main','','','');
							<c:forEach items="${projectPeriodsstree}" var="projectPeriods">
									projectPeriodsTree.add('${projectPeriods.id}','${projectPeriods.parentid}','${projectPeriods.periodsname}','${ctx}/projectPeriodsAction.do?method=list&tmpnodecode=${projectPeriods.nodecode}&static_parent_id=${projectPeriods.id}','','main','','','');
							</c:forEach>
							<c:if test="${param.static_parent_id!=''}">
								projectPeriodsTree.openTo("${static_parent_id}",true);
							</c:if>
							document.write(projectPeriodsTree);
							projectPeriodsTree.openAll();
						</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>

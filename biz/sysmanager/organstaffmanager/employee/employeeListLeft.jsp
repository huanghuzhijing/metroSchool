<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<%@ include file="/commons/meta.jsp"%>
<title>业务系统</title>
		<%@ include file="/commons/meta.jsp"%>
		<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
		<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" width="180px">
					<div style="overflow: auto; width: 230px;">
						<script language='javascript'>
							//显示树
							var organizationTree = new dTree('organizationTree');
							organizationTree.setIconPath("${ctx}/scripts/dtree/");
							organizationTree.add('-1',-99,'组织结构树','${ctx}/employeeAction.do?method=list&static_orgid=-1','','main','','','');
							<c:forEach items="${employeestree}" var="organization">
									<c:if test = "${organization.parent_id == '-1'}">
										organizationTree.add('${organization.f_id}','${organization.parent_id}','${organization.f_name}','${ctx}/employeeAction.do?method=list&static_fno=${organization.f_no}&static_orgid=${organization.f_id}&name=${organization.f_name}','','main','','');
									</c:if>
									<c:if test="${organization.parent_id != '-1'}" >
										organizationTree.add('${organization.f_id}','${organization.parent_id}','${organization.f_name}(${organization.employeecount})','${ctx}/employeeAction.do?method=list&static_fno=${organization.f_no}&static_orgid=${organization.f_id}&name=${organization.f_name}','','main','','');
									</c:if>
							</c:forEach>
							document.write(organizationTree);
							organizationTree.openAll();
						</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>

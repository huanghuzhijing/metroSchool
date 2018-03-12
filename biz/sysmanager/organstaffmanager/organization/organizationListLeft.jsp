<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<title>业务系统</title>
<%@ include file="/commons/meta.jsp"%>
		<%@ include file="/commons/meta.jsp"%>
		<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
        <link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
		
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" width="200px">
					<div style="overflow: auto; width: 200px; ">
						<script  type="text/javascript">
							//显示树
							var organizationTree = new dTree('organizationTree');
							organizationTree.setIconPath("${ctx}/scripts/dtree/");
							organizationTree.add('-1',-99,'组织树','${ctx}/organizationAction.do?method=list&static_parent_id=-1','','main','','','');
							<c:forEach items="${organizationstree}" var="organization">
									organizationTree.add('${organization.f_id}','${organization.parent_id}','${organization.f_name}','${ctx}/organizationAction.do?method=list&static_parent_id=${organization.f_id}&fIsdelete=0&qf_no=${organization.f_no}&name=${organization.f_name}','','main','','','');
							</c:forEach>
							organizationTree.add('0','-1','被移除组织','${ctx}/organizationAction.do?method=list&fisdelete=1&static_parent_id=0','','main','','','');
							<c:forEach items="${organizationsremovetree}" var="orgaizeation">							
								organizationTree.add('${orgaizeation.f_id}','0','${orgaizeation.f_name}','${ctx}/organizationAction.do?method=list&static_parent_id=${orgaizeation.f_id}&fIsdelete=1&qf_no=${organization.f_no}&name=${organization.f_name}','','main','','','');
							</c:forEach>
							<c:if test="${param.static_parent_id!=''}">
								organizationTree.openTo("${static_parent_id}",true);
							</c:if>
							
							document.write(organizationTree);
							organizationTree.openAll();
						</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>

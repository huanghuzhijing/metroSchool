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
				<td valign="top" width="180px">
					<div style="overflow: auto; width: 180px; height: 450px">
						<script language='javascript'>
							//显示树
							var corpTypeTree = new dTree('corpTypeTree');
							corpTypeTree.setIconPath("${ctx}/scripts/dtree/");
							corpTypeTree.add('-1',-99,'参建单位类型树','${ctx}/corpTypeAction.do?method=list&static_parent_id=-1','','main','','','');
							<c:forEach items="${corpTypestree}" var="corpType">
									corpTypeTree.add('${corpType.id}','${corpType.parentid}','${corpType.typename}','${ctx}/corpTypeAction.do?method=list&tmpnodecode=${corpType.nodecode}&static_parent_id=${corpType.id}','','main','','','');
							</c:forEach>
							<c:if test="${param.static_parent_id!=''}">
								corpTypeTree.openTo("${static_parent_id}",true);
							</c:if>
							document.write(corpTypeTree);
							corpTypeTree.openAll();
						</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>

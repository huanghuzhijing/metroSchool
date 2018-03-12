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
							var corpTree = new dTree('corpTree');
							corpTree.setIconPath("${ctx}/scripts/dtree/");
							corpTree.add('-1',-99,'参建单位类型','${ctx}/corpAction.do?method=list','','main','','','');
							<c:forEach items="${corpstree}" var="corpType">
									corpTree.add('${corpType.id}','${corpType.parentid}','${corpType.typename}(${corpType.corpcount})','${ctx}/corpAction.do?method=list&static_enodecode=${corpType.nodecode}&static_corptype=${corpType.corptype}','','main','','');	
							</c:forEach>
							document.write(corpTree);
							corpTree.openAll();
						</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>

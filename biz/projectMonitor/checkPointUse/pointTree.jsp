<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<title>线路/标段/站点树</title>
		<%@ include file="/commons/meta.jsp"%>
		<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
        <link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
		
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" width="250px">
					<div style="overflow: auto; width: 300px; ">
						<script  type="text/javascript">
							//显示树
							var ecomponentTree = new dTree('ecomponentTree');
							ecomponentTree.setIconPath("${ctx}/scripts/dtree/");
							ecomponentTree.add('-1',-99,'地铁工程项目(启用数/停用数/应启用数)','','','main','','','');
							
							<c:forEach items="${stations}" var="station">
							ecomponentTree.add('${station.station_id}','+${station.segment_id.segment_id}','${station.station_name}${station.typeProportion}','dtaqCheckpointUseAction.do?method=list&station_id=${station.station_id}&station_state=${station.station_state}&segment_id=${station.segment_id.segment_id}','','main','','','');
							</c:forEach>
							<c:forEach items="${segments}" var="seg">
							ecomponentTree.add('+${seg.segment_id}','=${seg.line_id.line_id}','${seg.segment_name}','','','main','','','');
							</c:forEach>
							<c:forEach items="${lines}" var="line">
							ecomponentTree.add('=${line.line_id}','-1','${line.line_name}','','','main','','','');
							</c:forEach>
							document.write(ecomponentTree);
							//ecomponentTree.openAll();
							ecomponentTree.openTo();
						</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
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
				<td valign="top" width="180px">
					<div style="overflow: auto; width: 240px; ">
						<script  type="text/javascript">
							//显示树
							var ecomponentTree = new dTree('ecomponentTree');
							ecomponentTree.setIconPath("${ctx}/scripts/dtree/");
							ecomponentTree.add('-1',-99,'地铁线路树','','','main','','','');
							
							<c:forEach items="${stations}" var="station">
							ecomponentTree.add('${station.station_id}','+${station.segment_id.segment_id}','${station.station_name}','hcSolutionAction.do?method=list&qstationId=${station.station_id}&qsegmentId=${station.segment_id.segment_id}&qstationState=${station.station_state}','','main','','','');
							</c:forEach>
							<c:forEach items="${segs}" var="seg">
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
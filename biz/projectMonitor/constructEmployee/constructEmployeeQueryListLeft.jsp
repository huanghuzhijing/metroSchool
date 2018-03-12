<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<title>线路/标段/施工单位树</title>
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
							ecomponentTree.add('-1',-99,'地铁线路施工树','','','main','','','');
							
						//	<c:forEach items="${organs}" var="organ">
						//	ecomponentTree.add('${organs.f_id}','+${organ.segment_id.segment_id}','${organ.f_name}','constructorAction.do?method=list&lineId=${station.segment_id.line_id.line_id}&segmentId=${station.segment_id.segment_id}&organId=${organs.f_id}','','main','','','');
						//	</c:forEach>
							<c:forEach items="${segs}" var="seg">
							ecomponentTree.add('+${seg.segment_id}','=${seg.line_id.line_id}','${seg.segment_name}','','','main','','','');
							ecomponentTree.add('${seg.e_org.f_id}','+${seg.segment_id}','${seg.e_org.f_name}','constructorAction.do?method=queryList&flag=query&lineId=${seg.line_id.line_id}&segmentId=${seg.segment_id}&organId=${seg.e_org.f_id}','','main','','','');
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
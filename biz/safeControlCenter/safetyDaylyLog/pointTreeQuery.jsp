<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
		<%@ include file="/commons/meta.jsp"%>
		<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
        <link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
		
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" width="180px">
					<div style="overflow: auto; width: 240px; ">
						<script language="javascript">
var checkPointTree = new dTree('checkPointTree');
checkPointTree.setIconPath('${ctx}/scripts/dtree/');
checkPointTree.add('0',-99,"地铁工程项目",null);
<c:forEach items="${lines}" var="line">
  checkPointTree.add('SL_${line.line_id}','0','${line.line_name}',null,null,null,'${ctx}/image/dtaq/line.png','${ctx}/image/dtaq/line.png');
</c:forEach> // lines
  <c:forEach items="${segments}" var="segment">
    checkPointTree.add('SS_${segment.segment_id}','SL_${segment.line_id.line_id}','${segment.segment_name}',null,null,null,'${ctx}/image/dtaq/segment.png','${ctx}/image/dtaq/segment.png');
    <c:forEach items="${segment.stations}" var="station">
        checkPointTree.add('ST_${station.station_id}','SS_${segment.segment_id}','${station.station_name}','safetyDaylyLogAction.do?method=listQuery&station_id=${station.station_id}&segment_id=${segment.segment_id}&station_state=${station.station_state}','','main','${ctx}/image/dtaq/station.png','${ctx}/image/dtaq/station.png');
    </c:forEach> // stations
  </c:forEach> // segments

document.write(checkPointTree.toString());
checkPointTree.toString().openTo();
</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
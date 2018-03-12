<%@ page contentType="text/html;charset=UTF-8" %>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script language="javascript">
var checkPointTree = new dTree('checkPointTree');
checkPointTree.setIconPath('${ctx}/scripts/dtree/');
checkPointTree.add('0',-99,"地铁工程项目",null);
<c:forEach items="${lines}" var="line">
  checkPointTree.add('SL_${line.line_id}','0','${line.line_name}',null,null,null,'${ctx}/image/dtaq/line.png','${ctx}/image/dtaq/line.png');
 </c:forEach>
  <c:forEach items="${segments}" var="segment">
    checkPointTree.add('SS_${segment.segment_id}','SL_${segment.line_id.line_id}','${segment.segment_name}',null,null,null,'${ctx}/image/dtaq/segment.png','${ctx}/image/dtaq/segment.png');
    
    <c:forEach items="${segment.stations}" var="station">
    	<c:choose>
    		<c:when test="${station.station_type eq 'P'}">
	        	checkPointTree.add('ST_${station.station_id}','SS_${segment.segment_id}','${station.station_name}','dtaqScheduleAction.do?method=list&stationId=${station.station_id}&segment_id=${segment.segment_id}&station_state=${station.station_state}',null,null,'${ctx}/image/dtaq/station.png','${ctx}/image/dtaq/station.png');
    		</c:when>
    		<c:otherwise>
	        	checkPointTree.add('ST_${station.station_id}','SS_${segment.segment_id}','${station.station_name}','dtaqScheduleExcavateAction.do?method=list&station_id=${station.station_id}&segment_id=${segment.segment_id}&station_state=${station.station_state}',null,null,'${ctx}/image/dtaq/station.png','${ctx}/image/dtaq/station.png');
    		</c:otherwise>
    	</c:choose>
    </c:forEach>
 </c:forEach> 
   
 
document.write(checkPointTree.toString());
</script>
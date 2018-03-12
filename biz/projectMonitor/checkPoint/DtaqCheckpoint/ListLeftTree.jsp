<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />

<script language="javascript">
var checkPointTree = new dTree('checkPointTree');
checkPointTree.setIconPath('${ctx}/scripts/dtree/');
checkPointTree.add('SE_${segment.segment_id}',-99,'${segment.segment_name}',null,null,null,'${ctx}/image/dtaq/segment.png','${ctx}/image/dtaq/segment.png');
<c:forEach items="${segment.stations}" var="station">
	checkPointTree.add('ST_${station.station_id}','SE_${segment.segment_id}','${station.station_name}',null,null,null,'${ctx}/image/dtaq/station.png','${ctx}/image/dtaq/station.png');
   	<c:forEach items="${mainTypes}" var="mainType">
     		checkPointTree.add('MT_${station.station_id}_${mainType.id}','ST_${station.station_id}','${mainType.name}',null,null,null,'${ctx}/image/dtaq/kind.png','${ctx}/image/dtaq/kind.png');
<%--     		<c:forEach items="${checkpointTypes}" var="type">--%>
     			<c:forEach items="${mathPointList}" var="math">
     				<c:if test="${math.stationid==station.station_id and math.typekind == mainType.id}">
        				checkPointTree.add('ST_${station.station_id}_${math.pointtypeid}','MT_${station.station_id}_${mainType.id}','${math.typename}','${ctx}/dtaqPartAction.do?method=list&organ_type=${organ_type}&qlineId=${qlineId}&qsectionId=${segment.segment_id}&qstation_id=${station.station_id}&station_state=${station.station_state}&type_id=${math.pointtypeid}',null,null,'${ctx}/image/dtaq/type.png','${ctx}/image/dtaq/type.png');
    			      
    			       <c:forEach items="${station.parts}" var="part">
	          				<c:if test="${math.pointtypeid==part.type_id and part.organ_type==organ_type}"> 
	          				
	          				<c:choose>  
			          			    <c:when test="${organ_type=='A'}">
			          			  		checkPointTree.add('SP_${part.part_id}','ST_${station.station_id}_${math.pointtypeid}','${part.part_name}','${ctx}/dtaqAutoCheckpointAction.do?method=index&organ_type=${organ_type}&qlineId=${qlineId}&qsectionId=${segment.segment_id}&station_id=${station.station_id}&station_state=${station.station_state}&type_id=${math.pointtypeid}&part_id=${part.part_id}',null,null,'${ctx}/image/dtaq/part.png','${ctx}/image/dtaq/part.png');
			          	      	</c:when>  
			          			   	<c:otherwise>
			          			  		checkPointTree.add('SP_${part.part_id}','ST_${station.station_id}_${math.pointtypeid}','${part.part_name}','${ctx}/dtaqCheckpointAction.do?method=index&organ_type=${organ_type}&qlineId=${qlineId}&qsectionId=${segment.segment_id}&station_id=${station.station_id}&station_state=${station.station_state}&type_id=${math.pointtypeid}&part_id=${part.part_id}',null,null,'${ctx}/image/dtaq/part.png','${ctx}/image/dtaq/part.png');
			          	     	</c:otherwise>  
		          				</c:choose>  
	          				
	          				
	          				
	          				  	</c:if>
			          		
	        			</c:forEach>
	        		
      				</c:if>
       			</c:forEach>
<%--      	</c:forEach>--%>
   	</c:forEach>
</c:forEach>
document.write(checkPointTree.toString());
</script>
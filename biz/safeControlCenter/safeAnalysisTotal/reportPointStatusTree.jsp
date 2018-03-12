<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script language="javascript">
var checkPointTree = new dTree('checkPointTree');
checkPointTree.setIconPath('${ctx}/scripts/dtree/');
	checkPointTree.add('ST_${station.station_id}',-99,'${station.station_name}',null,null,null,'${ctx}/image/dtaq/station.png','${ctx}/image/dtaq/station.png');
   	<c:forEach items="${mainTypes}" var="mainType">
     		checkPointTree.add('MT_${station.station_id}_${mainType.id}','ST_${station.station_id}','${mainType.name}',null,null,null,'${ctx}/image/dtaq/kind.png','${ctx}/image/dtaq/kind.png');
<%--     		<c:forEach items="${checkpointTypes}" var="type">--%>
     			<c:forEach items="${mathPointList}" var="math">
     				<c:if test="${math.stationid==station.station_id and math.typekind == mainType.id}">
        				checkPointTree.add('ST_${station.station_id}_${math.pointtypeid}','MT_${station.station_id}_${mainType.id}','${math.typename}','dtaqCheckpointAction.do?method=viewDataReport&station_id=${station.station_id}&organ_type=${organ_type}&type_id=${math.pointtypeid}',null,null,'${ctx}/image/dtaq/type.png','${ctx}/image/dtaq/type.png');
	        			<c:forEach items="${station.parts}" var="part">
	          				<c:if test="${math.pointtypeid==part.type_id and part.organ_type==organ_type}">
	          						checkPointTree.add('SP_${part.part_id}','ST_${station.station_id}_${math.pointtypeid}','${part.part_name}','dtaqCheckpointAction.do?method=viewDataReport&station_id=${station.station_id}&organ_type=${organ_type}&type_id=${math.pointtypeid}&part_id=${part.part_id}',null,null,'${ctx}/image/dtaq/part.png','${ctx}/image/dtaq/part.png');
	          				</c:if>
	        			</c:forEach>
      				</c:if>
       		</c:forEach>
<%--      	</c:forEach>--%>
   	</c:forEach>
document.write(checkPointTree.toString());
</script>
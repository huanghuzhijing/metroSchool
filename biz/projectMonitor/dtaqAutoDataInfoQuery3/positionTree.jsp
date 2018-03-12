
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script language="javascript">

function queryView(info_id,part_id){
	var param = "&qlineId="+${param.qlineId}+"&qsegmentId="+${param.qsegmentId}+"&qstationId="+${param.qstationId}+"&qtypeId="+${param.qtypeId}+"&qstartDate="+${param.qstartDate}+"&qendDate="+${param.qendDate}+"&qorganType="+${param.qorganType};
	var href="${ctx}/dtaqAutoDataInfoQuery3Action.do?method=view&info_id="+info_id+"&queryPart="+part_id+"&query2Part=${query2Part}"+param;
	return href ;
}

var positionTree = new dTree('positionTree');
positionTree.setIconPath('${ctx}/scripts/dtree/');
positionTree.add('-1',-99,'${dtaqAutoDataInfo.type_id.type_name}',null);
<c:forEach items="${dtaqparts}" var="datapart">
  positionTree.add('SL_${datapart.part_id}','-1','${datapart.part_name}',queryView('${dtaqAutoDataInfo.info_id}','${datapart.part_id}'),null,null,'${ctx}/images/dtaq/line.png','${ctx}/images/dtaq/line.png'); 
</c:forEach>
document.write(positionTree.toString());
</script>
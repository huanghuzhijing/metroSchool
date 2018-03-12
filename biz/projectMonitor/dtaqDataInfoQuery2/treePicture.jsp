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
  <c:forEach items="${segments}" var="segment">
  <c:if test="${segment.line_id.line_id==line.line_id}">
    checkPointTree.add('SS_${segment.segment_id}','SL_${line.line_id}','${segment.segment_name}',null,null,null,'${ctx}/image/dtaq/segment.png','${ctx}/image/dtaq/segment.png');
   <c:forEach items="${segment.stations}" var="station">
	        checkPointTree.add('ST_${station.station_id}','SS_${segment.segment_id}','${station.station_name}',null,null,null,'${ctx}/image/dtaq/station.png','${ctx}/image/dtaq/station.png');
	        checkPointTree.add('SE_${station.station_id}','ST_${station.station_id}','施工方','dtaqDataInfoQuery2Action.do?method=listPicture&station_id=${station.station_id}&segment_id=${segment.segment_id}&organ_type=O','','main','${ctx}/image/dtaq/part.png','${ctx}/image/dtaq/part.png');
	        checkPointTree.add('SG_${station.station_id}','ST_${station.station_id}','第三方','dtaqDataInfoQuery2Action.do?method=listPicture&station_id=${station.station_id}&segment_id=${segment.segment_id}&organ_type=T','','main','${ctx}/image/dtaq/part.png','${ctx}/image/dtaq/part.png');
       </c:forEach>
  </c:if>
  </c:forEach> // segments
</c:forEach> // lines
document.write(checkPointTree.toString());
checkPointTree.toString().openTo();
</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
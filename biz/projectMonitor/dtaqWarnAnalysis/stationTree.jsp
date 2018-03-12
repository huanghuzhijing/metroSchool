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
  checkPointTree.add('SL_${line.line_id}','0','${line.line_name}',null,null,null,'','');
 </c:forEach> // lines
  <c:forEach items="${segments}" var="segment">
    checkPointTree.add('SS_${segment.segment_id}','SL_${segment.line_id.line_id}','${segment.segment_name}',null,null,null,'','');
   </c:forEach> // segments
   <c:forEach items="${stations}" var="station">
   <c:if test="${station.station_state == '1'}">
	        checkPointTree.add('ST_${station.station_id}','SS_${station.segment_id.segment_id}','${station.station_name}',null,null,null,'','');
	        checkPointTree.add('SE_${station.station_id}','ST_${station.station_id}','施工方','dtaqWarnAnalysisAction.do?method=list&station_id=${station.station_id}&segment_id=${segment.segment_id}&organ_type=O','','main','','');
	        checkPointTree.add('SG_${station.station_id}','ST_${station.station_id}','第三方','dtaqWarnAnalysisAction.do?method=list&station_id=${station.station_id}&segment_id=${segment.segment_id}&organ_type=T','','main','','');
	        </c:if>
	        </c:forEach>
 

document.write(checkPointTree.toString());
checkPointTree.toString().openTo();
</script>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
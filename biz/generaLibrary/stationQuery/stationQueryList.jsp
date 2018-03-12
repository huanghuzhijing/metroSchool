<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<content tag="heading">监测数据统计分析</content>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/restrictLines.js"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
	$("[value='${param.qstation_type}']").attr("selected","selected");
	jQuery(".commonTable :button").hide() ;
    getLines('${param.qlineId}','${param.qsegmentId}');
	getSections('${param.qlineId}','${param.qsegmentId}');
	var ec_id='${param.ec_id}';
	if(ec_id==null||ec_id==""){
		ec_id='${ec_id}';
	}
	var ec_auditStatus='${param.ec_auditStatus}';
	if(ec_auditStatus==null||ec_auditStatus==""){
		ec_auditStatus='${ec_auditStatus}';
	}
	pullValue(ec_id,ec_auditStatus);
})



function showStationSection(){
	var station_id = jQuery("[name='select_id']:checked").val() ;
	var url = "dtaqSectionAction.do?method=list&station_id="+station_id+"&segment_id=${segment_id}&mode=view" ;
	art.dialog({id:'sectionInfo',title:'分段信息', iframe:url, width:'700', height:'380',top:'20'});
}
function showStationLayer(){
	var station_id = jQuery("[name='select_id']:checked").val() ;
	var url = "${ctx}/dtaqLayerAction.do?method=list&station_id="+station_id+"&segment_id=${segment_id}&mode=view" ;
	art.dialog({id:'layerInfo',title:'分层信息', iframe:url, width:'700', height:'380',top:'20'});
}

function showStationCondition(){
	var station_id = jQuery("[name='select_id']:checked").val() ;
	var url = "dtaqStationQueryAction.do?method=viewStationCondition&station_id="+station_id+"&segment_id=${segment_id}&mode=view" ;
	art.dialog({id:'layerInfo',title:'工况属性', iframe:url, width:'900', height:'500',top:'20'});
}

function exportStationCondition(){
	var station_id = jQuery("[name='select_id']:checked").val() ;
	var url = "dtaqStationQueryAction.do?method=exportStationCondition&station_id="+station_id ;
	location.href = url ;
}


function selectChange(station_id,station_type){
	if(station_type == "P"){
		jQuery("#secBtn").hide() ;
		jQuery("#layBtn").hide() ;
	}else{
		jQuery("#secBtn").show().unbind().bind("click",function(){showStationSection(station_id) ;}) ;
		jQuery("#layBtn").show().unbind().bind("click",function(){showStationLayer(station_id) ;}) ;
	}
	jQuery("#conBtn").show().unbind().bind("click",function(){showStationCondition(station_id) ;}) ;
	jQuery("#exportBtn").show().unbind().bind("click",function(){exportStationCondition(station_id) ;}) ;
}
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			var operObj = $("input[type=radio][name='select_id'][checked]");
			if(operObj.attr("station_type")=="P"){
			$("#layBtn").hide();
			$("#secBtn").hide();
			}else{
			$("#layBtn").show();
			$("#secBtn").show();
			}
		}
	</script>
</head>

<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dtaqStationQueryAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<input type="hidden" name="qstationId" value="${param.qstationId }"/>
					<input type="hidden" name="qorganType" value="${param.qorganType}"/>
					<input type="hidden" name="checkFlag" value="${param.checkFlag}"/>
					<table align="left">
						<tr>
								<td>线路：</td>
							    <td >
							    	<select style="width: 240px" id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
							    </td>
							    <td>标段：</td>
							    <td>
							     	<select id="qsectionId" name="qsegmentId" onchange="getWokPoints(this.value,'')"></select>
							    </td>
					 	</tr>
					 	<tr>
							    <td>车站/区间：</td>
							    <td>
							    	<select name="qstation_type"  value="${param.qstation_type }">
							    	<option value="">请选择</option>
							    	<option value="S" >车站</option>
							    	<option value="P">区间</option>
							    	</select>
							    </td>
						        <td>站点名称：</td>
							    <td>
							    	<input name="qstation_name" value="${param.qstation_name }"/>
							    </td>
								<td align="right">
									<input type="submit" value="查询" icon="icon_query" />
								</td>
								</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<div class="listButtonDiv">
			<input type="button" id="secBtn" class="button1" value="分段信息" onclick="showStationSection('${station.station_id}')">
			<input type="button" id="layBtn" class="button1" value="分层信息" onclick="showStationLayer('${station.station_id}')">
			<input type="button" id="conBtn" class="button1" value="工况属性" onclick="showStationCondition('${station.station_id}')">
			<input type="button" id="exportBtn" class="button1" value="导出Excel" onclick="exportStationCondition('${station.station_id}')">
			
	</div>
<ec:table items="dtaqStations" var="station" action="dtaqStationQueryAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" ondblclick="showView('${station.station_id}');"
					onclick="pullValue('${station.station_id}');">
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
		<ec:column property="null" sortable="false" title="选择" width="6%">
				<input type="radio" name="select_id" value="${station.station_id}" station_type="${station.station_type}">
		</ec:column>
		<ec:column property="station_name" title="车站/区间名称"></ec:column>
		<ec:column property="station_type" title="车站/区间">
			 &nbsp;
			 <c:if test="${station.station_type eq 'S'}">车站</c:if>
	         <c:if test="${station.station_type eq 'P'}">区间</c:if>
		</ec:column>
		<ec:column property="projectTime" title="工期">
			${station.projectTime}
		</ec:column>
		<ec:column property="projectAddress" title="监测图">
			<c:if test="${station.station_id ne null && station.build_plane_address ne null}">
		      	<a href="${ctx}/dtaqStationAction.do?method=download&station_id=${station.station_id}&download_type=build_plane">施工方</a>
		 </c:if>
			  <c:if test="${station.station_id ne null && station.third_plane_address ne null}">
		      	<a href="${ctx}/dtaqStationAction.do?method=download&station_id=${station.station_id}&download_type=third_plane">第三方</a>
		      </c:if>
		</ec:column>
	</ec:row>
</ec:table>
</body>

</html:html>
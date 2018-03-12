<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">监测超限警情查询</content>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
   getLines('${param.qlineId}','${param.qsegmentId}');
		    getSections('${param.qlineId}','${param.qsegmentId}');
		    getWokPoints('${param.qsegmentId}','${param.qstationId}');
})
function initCont() {
	jQuery.each(jQuery(".reason"),function(index,item){
		var obj = jQuery(item);
		obj.attr("title",obj.html());
		if(obj.html().lengthCheck()>30){
			obj.html(substr(obj.html(),30)+'...');
		}
	});
}


function lineChanged() {
	var url = "${ctx}/dtaq/dataLinkage.do?method=querySegment";
   	var myajax = new Ajax.Request(url, {method:"post", parameters:"line_id="+jQuery("[name='line_id']").val(), onComplete:responseList});
}

//得到联动项目信息并构建options
function responseList(selRequest){
   	var segment_id = eval("document.all.segment_id");
	var resulttext = selRequest.responseText;
  	if(resulttext==null || resulttext==""){
  		segment_id.options.length=0;
		segment_id.add(document.createElement("OPTION"));
		segment_id.options[0].text = "${texts['dtaq.common.select.option']}";
		segment_id.options[0].value = '';
		
		var station_id = eval("document.all.station_id");
		station_id.options.length=0;
		station_id.add(document.createElement("OPTION"));
		station_id.options[0].text = "${texts['dtaq.common.select.option']}";
		station_id.options[0].value = '';
		
		return false;
	}
	else{
	    segment_id.options.length=0;
		segment_id.add(document.createElement("OPTION"));
	    segment_id.options[0].text = "${texts['dtaq.common.select.option']}";
	    segment_id.options[0].value = '';
		var selarr = resulttext.split(",");
		var subarr;
		var seg_id = '${segment_id}';
		var index = 0;
		for(i = 0;i<selarr.length;i++){
			subarr = selarr[i].split(";");
		   	segment_id.add(document.createElement("OPTION"));
			segment_id.options[i+1].value = subarr[0];
			segment_id.options[i+1].text = subarr[1];
			if(segment_id.options[i+1].value==seg_id){
				index = i+1;
			}
		}
		segment_id.options[index].selected=true;
	}
}

function segmentChanged() {
	  var url = "${ctx}/dtaq/dataLinkage.do?method=queryStation";
	  var myajax = new Ajax.Request(url, {method:"post", parameters:"segment_id="+jQuery("[name='segment_id']").val(), onComplete:responseStationList});
}

function segmentInitChanged() {
	  var segment_id = '${segment_id}';
	  var url = "${ctx}/dtaq/dataLinkage.do?method=queryStation";
	  var myajax = new Ajax.Request(url, {method:"post", parameters:"segment_id="+segment_id, onComplete:responseStationList});
}

//得到联动项目信息并构建options
function responseStationList(selRequest){
   	var station_id = eval("document.all.station_id");
	var resulttext = selRequest.responseText;
  	if(resulttext==null || resulttext==""){
  		station_id.options.length=0;
		station_id.add(document.createElement("OPTION"));
		station_id.options[0].text = "${texts['dtaq.common.select.option']}";
		station_id.options[0].value = '';
		
		return false;
	}
	else{
	    station_id.options.length=0;
		station_id.add(document.createElement("OPTION"));
	    station_id.options[0].text = "${texts['dtaq.common.select.option']}";
	    station_id.options[0].value = '';
		var selarr = resulttext.split(",");
		var subarr;
		var seg_id = '${station_id}';
		var index = 0;
		for(i = 0;i<selarr.length;i++){
			subarr = selarr[i].split(";");
		   	station_id.add(document.createElement("OPTION"));
			station_id.options[i+1].value = subarr[0];
			station_id.options[i+1].text = subarr[1];
			if(station_id.options[i+1].value==seg_id){
				index = i+1;
			}
		}
		station_id.options[index].selected=true;
	}
}


function sign(analysis_id){
	var url='warnAnalysisSignAction.do?method=querySign&analysis_id='+analysis_id+'&qlineId='+$("[name='qlineId']").val()+'&qsegmentId='+$("[name='qsegmentId']").val()+'&qstationId='+
			$("[name='qstationId']").val()+'&startDate=${qstartDate}&endDate=${qendDate}&qstartDate='+$("[name='qstartDate']").val()+'&qendDate='+
			$("[name='qendDate']").val()+'&queryFlag=t&qorganType='+$("[name='qorganType']").val();
	location.href=url;
}
function deleteSign(analysis_id){
	var url='warnAnalysisSignAction.do?method=delete&analysis_id='+analysis_id+'&qlineId='+$("[name='qlineId']").val()+'&qsegmentId='+$("[name='qsegmentId']").val()+'&qstationId='+
			$("[name='qstationId']").val()+'&startDate=${qstartDate}&endDate=${qendDate}&qstartDate='+$("[name='qstartDate']").val()+'&qendDate='+
			$("[name='qendDate']").val()+'&queryFlag=t&qorganType='+$("[name='qorganType']").val();
	commonUrl(url);
}

function backToList() {
  location.href="warnAnalysisSignAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&thingName=${thingName}&lineId=${lineId}&stationId=${stationId}&segmentId=${segmentId}&startDate=${startDate}&endDate=${endDate}&thingState=${thingState}";
}
</script>
</head>
<body>
<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="warnAnalysisSignAction.do?method=queryList&queryFlag=t&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table align="left">
					<html:hidden property="queryFlag" value="t"/>
						<tr>
								<td>线路:</td>
							    <td >
							    	<select style="width: 240px" id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
							    </td>
							    <td>标段:</td>
							    <td>
							     	<select id="qsectionId" name="qsegmentId" onchange="getWokPoints(this.value,'')"></select>
							    </td>
							    <td>车站/区间:</td>
							    <td>
							    	<select id="qworkPointId" name="qstationId" onchange="restrictTypes(this.value,'')"></select>
							    </td>
						</tr>
						
						<tr>
						 		<td>发布日期:</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								<td align="right">第三方/施工方:</td>
								<td>
									<html:select property="qorganType">
										<html:option value="T">第三方</html:option>
										<html:option value="O">施工方</html:option>
									</html:select>
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
<fieldset>
  <legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr><td>
   <ec:table items="dtaqWarnAnalysiss" var="warnAnalysis" action="warnAnalysisSignAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" >
	  <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
	  <ec:column property="segmentId.segment_name" title="标段" width="160px" />
	  <ec:column property="stationId.station_name" title="车站/区间" width="160px" />
	  <ec:column property="organ_type" title="监测单位" width="160px" >
	  	<c:if test="${warnAnalysis.organ_type == 'T'}">第三方</c:if>
	  	<c:if test="${warnAnalysis.organ_type == 'O'}">施工</c:if>
	  </ec:column>
	  <ec:column property="ts" title="下发时间" width="160px" format="yyyy-MM-dd HH:mm:ss" cell="date" />
	 
	  <ec:column property="reason" title="原因" width="160px">
	  	 <div class="reason">${warnAnalysis.reason}</div>
	  </ec:column>
	  <ec:column property="null" title="操作" width="160px" sortable="false">
	  	<div align="center">
	    	<input type="button" value="查看" class="button1" onclick="sign('${warnAnalysis.analysis_id}')">
	    	<input type="button" value="删除" class="button1" onclick="deleteSign('${warnAnalysis.analysis_id}')">
	    </div>
	  </ec:column>
	</ec:row>
	</ec:table>
	</td></tr>
	</table>
  </td></tr>
  </table>
  </fieldset>
  </body>
</html:html>
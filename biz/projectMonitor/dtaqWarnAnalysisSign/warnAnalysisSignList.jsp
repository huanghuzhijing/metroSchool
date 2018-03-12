<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">监测超限警情管理</content>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
   getLines('${param.qlineId}','${param.qsegmentId}');
		    getSections('${param.qlineId}','${param.qsegmentId}');
		    getWokPoints('${param.qsegmentId}','${param.qstationId}');
		    if('${segment}'!=null){
		     getWokPoints('${segment.segment_id}','${param.qstationId}');
		    }
})


function sign(analysis_id){
    var url="warnAnalysisSignAction.do?method=sign&analysis_id="+analysis_id+"&line_id=${line_id}&segment_id=${segment_id}&station_id=${station_id}&organ_type=${organ_type}&startDate=${qstartDate}&endDate=${qendDate}&totalType=${totalType}&dtaqWarnAnalysisList_page=${dtaqWarnAnalysisList_page}";
	commonUrl(url);
}

function backToTotal(totalType){
	if(totalType == "total"){
		location.href="${ctx}/dtaq/safeAnalysisTotal.do";
	}else if(totalType == "gis"){
		location.href="${ctx}/projectInfoAction.do?method=decisionAnalyse";
	}else if(totalType == "analyse"){
		location.href="${ctx}/securityAnalyseAction.do";
	}
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
				<html:form action="warnAnalysisSignAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table align="left">
						<tr>
								<c:if test="${segment==null}">
								<td>线路：</td>
							    <td >
							    	<select style="width: 240px" id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
							    </td>
							    <td>标段：</td>
							    <td>
							     	<select id="qsectionId" name="qsegmentId" onchange="getWokPoints(this.value,'')"></select>
							    </td>
							    <td>车站/区间：</td>
							    <td>
							    	<select id="qworkPointId" name="qstationId" onchange="restrictTypes(this.value,'')"></select>
							    </td>
								</c:if>
								<c:if test="${segment!=null}">
								<td>线路：</td>
							    <td >
							    	<input type="text" style="width: 240px" id="qlineId" value="${segment.line_id.line_name }"/>
							    	<input type="hidden" style="width: 240px" id="qlineId" name="qlineId" value="${segment.line_id.line_id }"/>
							    </td>
							    <td>标段：</td>
							    <td>
							     	<input type="text" id="qsegmentName" name="qsegmentName" value="${segment.segment_name }"/>
							     	<input type="hidden" id="qsectionId" name="qsegmentId" value="${segment.segment_id }"/>
							    </td>
							    <td>车站/区间：</td>
							    <td>
							    	<select id="qworkPointId" name="qstationId" onchange="restrictTypes(this.value,'')"></select>
							    </td>
								</c:if>
						</tr>
						
						<tr>
						 		<td>下发时间：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								<td align="right">第三方/施工方：</td>
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
	 <ec:column property="signer" title="批阅状态" width="160px">
	  		<c:forEach items="${warnAnalysis.signs}" var="sign">
	  			<c:if test="${empId == sign.signer}">
	  				<c:set value="yes" var="signState" />
	  			</c:if>
	  		</c:forEach>
	  		<c:if test="${signState == 'yes'}">已批阅</c:if>
	  		<c:if test="${signState == null || signState == 'no'}">未批阅</c:if>
	  		<c:set value="no" var="signState" />
	  </ec:column>
	  <ec:column property="reason" title="原因" width="160px">
	  	 <div class="reason">${warnAnalysis.reason}</div>
	  </ec:column>
	  <ec:column property="null" title="操作" width="160px" sortable="false">
	  	<div align="center">
	    	<input type="button" value="批阅" class="button1" onclick="sign('${warnAnalysis.analysis_id}')">
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
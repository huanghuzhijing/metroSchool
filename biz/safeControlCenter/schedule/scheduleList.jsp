<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.safetyDaylyLog.title"/></title>
<content tag="heading">进度管理</content>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">

function createInfo(){
	var station_id = "${station_id}" ;
	if(station_id == ""){
		alert("请选择工点") ;	
	}else{
		var url = "dtaqScheduleAction.do?method=edit&stationId=${station_id}&startDate=${startDate}&endDate=${endDate}" ;
		alert(url);
		location.href = url ;
	}
}
function importExcel(){
	var url='${ctx}/dtaqScheduleAction.do?method=showExcelImport&stationId=${station.station_id}&segment_id=${segment.segment_id}'
	commonUrl(url) ;
}
function editInfo(schedule_id){
	var url = "${ctx}/dtaqScheduleAction.do?method=edit&schedule_id="+schedule_id+"&stationId=${station.station_id}&startDate=${startDate}&endDate=${endDate}" ;
	commonUrl(url) ;
}

function viewInfo(schedule_id){
	var url = "${ctx}/dtaqScheduleAction.do?method=view&schedule_id="+schedule_id+"&stationId=${station.station_id}&startDate=${startDate}&endDate=${endDate}" ;
	commonUrl(url) ;
}

function deleteInfo(schedule_id){
	if(confirm('删除后将不能恢复，您确认删除？'))
	{
		var url = "${ctx}/dtaqScheduleAction.do?method=delete&schedule_id="+schedule_id+"&stationId=${station.station_id}&segment_id=${segment.segment_id}&startDate=${startDate}&endDate=${endDate}"
		location.href = url ;
	}
}

function responseAddReprot(selRequest){
	var text = selRequest.responseText.split(",");
	if(text[0] == "no"){
		alert("${texts['dtaq.safetyDaylyLog.current_reported']}");
	}else{
		location.href="safetyDaylyLogAction.do?method=create&segment_id=${segment_id}&stationid=${station_id}&deptType=${deptType}&station_state=${station_state}&startDate=${startDate}&endDate=${endDate}&log_type=${log_type}&safetyDaylyLogList_page=${safetyDaylyLogList_page}";
	}
}


</script>
</head>
  <body>
    	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td class="treeTd"><%@include file="pointTree.jsp" %></td>
			<td valign="top">
				<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
			<html:form action="dtaqScheduleAction.do?method=list">
					  <html:hidden property="segment_id" value="${segment.segment_id}"/>
					  <html:hidden property="stationId" value="${station.station_id}"/>
					  <html:hidden property="station_state" value="${station_state}"/>
						  <table align="left">
							  <tr>
							  	 <td width="60px">填报日期：</td>
							    <td><input type="text"  name="qstartDate"  class="inputText" value="${startDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${endDate}" onfocus="WdatePicker()" /></td>
							     <td  align="right">
							    	
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
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<c:if test="${station!=null}">
							<tr>
								<td width="50%" align="center">
									<font color="#50A2E6" size="2"><strong>标段：${segment.segment_name}&nbsp;&nbsp;&nbsp;&nbsp;车站/区间：${station.station_name}</strong></font>
								</td>
								<td align="right" width="50%">
									</td>
							</tr>
							</c:if>
							
						</table>
						<div style="float: right"><div class="saveDiv"><input type="button" class="addButton" value="${texts['button.new']}" onclick="createInfo()">&nbsp;&nbsp;
									<input type="button" class="addButton" value="导出填报模板" onclick="location.href='${ctx}/dtaqScheduleAction.do?method=modelDownLoad'">&nbsp;&nbsp;
									<input type="button" class="addButton" value="数据导入" onclick="importExcel()">&nbsp;&nbsp;
								</div></div>
						<ec:table items="dtaqSchedules" var="dtaqSchedule" action="dtaqSumQueryAction.do"
							title="" width="100%"  sortable="false" rowsDisplayed="10"
							imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
							retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
					  		<ec:row highlightRow="true" onclick="pullValue('${thing.thing_id}');" ondblclick="showView('${thing.thing_id}');">
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>	
					    	<ec:column property="record_date" title="记录日期" width="150px" format="yyyy-MM-dd" cell="date" />
					    	<ec:column property="left_mildage" title="左线掌子面里程" width="220px"/>
					    	<ec:column property="right_mildage" title="又线掌子面里程" width="220px"/>
					    	<ec:column property="start_position" title="起始位置" width="220px"/>
							<ec:column property="schedule_direction" title="里程方向" width="120px">
							 	<ex:dicDisplay dictIdentify="ScheduleDirection" dictValue="${dtaqSchedule.schedule_direction}"/>
							</ec:column>
							<ec:column property="null" title="${texts['label.operate']}" sortable="false" width="150px">
								<div align="center">
									<input type="button" class="button1" onclick="editInfo('${dtaqSchedule.schedule_id}')" value="${texts['label.modify']}"/>		
								 	<input type="button" class="button1" onclick="viewInfo('${dtaqSchedule.schedule_id}')" value="${texts['label.view']}"/>		
								 	<input type="button"  class="button1" onclick="deleteInfo('${dtaqSchedule.schedule_id}')" value="${texts['label.delete']}"/>		
								</div>
							 </ec:column>
							 </ec:row>
							 </ec:table>
				</fieldset>
			 </td>
		</tr>
	</table>
  </body>
</html:html>

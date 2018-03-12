<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.safetyDaylyLog.title"/></title>
<content tag="heading">工点进度管理</content>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
 function backToList(){
 	var url = "${ctx}/dtaqScheduleAction.do?method=list&stationId=${station_id.station_id}&segment_id=${station.segment.segment_id}&station_state=1" ;
 	document.forms[0].action=url;
	document.forms[0].submit();
 }
 
 
</script>
 <body>
  
    <html:form  action="dtaqScheduleAction.do" method="POST" styleClass="form" onsubmit="return valitdate(this)">
	    <input type="hidden" name="method" value="save"/> 
	      <html:hidden property="station_id" value="${station.station_id}"/>
	      <html:hidden property="stationId"/>
	      <html:hidden property="qstartDate"/>
	      <html:hidden property="qendDate"/>
	      <html:hidden property="segment_id" value="${station.segment.segment_id}"/>
	      <html:hidden property="schedule_id"/>
	      <fieldset>
	      <legend>详细</legend>
	   <table class="formTable" >
    <COLGROUP>
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
	</COLGROUP>
		
		
		<tr>
			<td>线路：<span class="noRedSpan">*</span></td>
			<td colspan="3">${station_id.segment_id.line_id.line_name}</td>
		</tr>
		<tr>
			<td>标段：<span class="noRedSpan">*</span></td>
			<td>${station_id.segment_id.segment_name}</td>
			<td>车站/区间：<span class="noRedSpan">*</span></td>
			<td>${station_id.station_name}</td>
		</tr>
		<tr>
			<td>左线掌子面里程：<span class="noRedSpan">*</span></td>
			<td>${dtaqSchedule.left_mildage}</td>
			<td>右线掌子面里程：<span class="noRedSpan">*</span></td>
			<td>${dtaqSchedule.right_mildage}&nbsp;</td>
		</tr>
		<tr>
			<td>起始位置：<span class="noRedSpan">*</span></td>
			<td>${dtaqSchedule.start_position}&nbsp;</td>
			<td>里程方向：<span class="noRedSpan">*</span></td>
			<td>${dtaqSchedule.schedule_direction}&nbsp;</td>
		</tr>
		<tr>
			<td>记录日期：<span class="noRedSpan">*</span></td>
			<td colspan="3"><fmt:formatDate value="${dtaqSchedule.record_date}" pattern="yyyy-MM-dd"/></td>
		</tr>
	
    </table>
    	</fieldset>
    <div class="saveDiv">
		<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="saveButton">
    </div>
</html:form>
 </body>
</html:html>

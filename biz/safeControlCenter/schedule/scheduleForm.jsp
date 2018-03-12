<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.safetyDaylyLog.title"/></title>
<content tag="heading">工点进度管理</content>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
if('${recordDate}'!=null){
   $("[name='record_dater']").val('${recordDate}');
}
$("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["left_mildage","左线里程"];
			properties[1]=["right_mildage","右线里程"];
			properties[2]=["start_position","起始位置"];
			properties[3]=["schedule_direction","方向"];
			
			saveValidateRequired("#btn_save",properties,"dtaqScheduleForm");
		}); 

})
 function backToList(){
 	var url = "${ctx}/dtaqScheduleAction.do?method=list&stationId=${station_id.station_id}&segment_id=${station.segment.segment_id}&station_state=1" ;
 	document.forms[0].action=url;
	document.forms[0].submit();
 }
 
 

</script>
 <body>
  
    <fieldset>
    <legend>编辑</legend>
    <html:form  action="dtaqScheduleAction.do" method="POST" styleClass="form" >
	    <input type="hidden" name="method" value="save"/> 
	      <html:hidden property="stationId"/>
	      <html:hidden property="qstartDate"/>
	      <html:hidden property="qendDate"/>
	      <html:hidden property="segment_id" value="${station_id.segment_id.segment_id}"/>
	      <html:hidden property="schedule_id"/>
	    <table class="formTable">
    <COLGROUP>
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
	</COLGROUP>
		<tr>
			<td>线路：<span class="redSpan">*</span></td>
			<td colspan="3">${station_id.segment_id.line_id.line_name}</td>
		</tr>
		<tr>
			<td>标段：<span class="redSpan">*</span></td>
			<td>${station_id.segment_id.segment_name}</td>
			<td>车站/区间：<span class="redSpan">*</span></td>
			<td>${station_id.station_name}</td>
		</tr>
		<tr>
			<td>左线掌子面里程：<span class="redSpan">*</span></td>
			<td><html:text property="left_mildage" styleClass="text" value="${dtaqSchedule.left_mildage}" size="60" maxlength="100" />&nbsp;</td>
			<td>右线掌子面里程：<span class="redSpan">*</span></td>
			<td><html:text property="right_mildage"  styleClass="text" value="${dtaqSchedule.right_mildage}" size="60" maxlength="100"  />&nbsp;</td>
		</tr>
		<tr>
			<td>起始位置：<span class="redSpan">*</span></td>
			<td><html:text property="start_position"  styleClass="text" value="${dtaqSchedule.start_position}" size="60" maxlength="100" />&nbsp;</td>
			<td>里程方向：<span class="redSpan">*</span></td>
			<td><ex:dictSelect property="schedule_direction" type="ScheduleDirection" value="${dtaqSchedule.schedule_direction}"  />&nbsp;</td>
		</tr>
		<tr>
			<td>记录日期：<span class="redSpan">*</span></td>
			<td colspan="3"><input name="record_date" value="<fmt:formatDate value="${dtaqSchedule.record_date}" pattern="yyyy-MM-dd"/>"  onfocus="WdatePicker()"/></td>
		</tr>
    </table>
    <div class="saveDiv">
		<input type="button" id="btn_save" class="saveButton" value="<fmt:message key="button.save" />"/>
		<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="saveButton">
    </div>
</html:form>
    </fieldset>
 </body>
</html:html>

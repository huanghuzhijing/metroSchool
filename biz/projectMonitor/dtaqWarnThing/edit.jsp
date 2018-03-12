<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<content tag="heading">安全预警事件管理</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    getLines('${dtaqWarnThing.line_id}','${dtaqWarnThing.segmentId.segment_id}');
    getSections('${dtaqWarnThing.line_id}','${dtaqWarnThing.segmentId.segment_id}');
    getWokPoints('${dtaqWarnThing.segmentId.segment_id}','${dtaqWarnThing.stationId.station_id}');
    $("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["thing_name","事件名称"];
			
			
			saveValidateRequired("#btn_save",properties,"dtaqWarnThingForm");
		}); 
    })

function backToList() {
  var url="dtaqWarnThingAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&thingName=${thingName}&lineId=${lineId}&stationId=${stationId}&segmentId=${segmentId}&startDate=${startDate}&endDate=${endDate}&thingState=${thingState}";
  document.forms[0].action=url;
  document.forms[0].submit();
}

function validateThingName(){
	var oldthing_name = jQuery("[name='oldthing_name']").val();
	var thing_name = jQuery("[name='thing_name']").val();
	if(thing_name != "" && thing_name != oldthing_name){
		var url = "dtaqWarnThingAction.do?method=validateThingName";
		var myajax = new Ajax.Request(url, {method:"post", parameters:"thing_name="+thing_name, onComplete:responseThingName});
	}
}

function responseThingName(selRequest){
	var resulttext = selRequest.responseText;
	if(resulttext != null && resulttext != ""){
		if(resulttext == "no"){
			alert("${texts['dtaq.warn.thing.validate_name']}");
			$("thing_name").value = "";
			$("thing_name").focus();
		}
	}
}
</script>
</head>
<body>
<html:form action="dtaqWarnThingAction.do">
  <input type="hidden" name="method" value="save">
  <html:hidden property="thing_id" />
  <html:hidden property="startDate" value="${startDate}" />
  <html:hidden property="endDate" value="${endDate}" />
  <html:hidden property="thingState" value="${thingState}" />
  <html:hidden property="dtaqWarnThingList_page" value="${dtaqWarnThingList_page}"/>
  <html:hidden property="start_date"/>
  <html:hidden property="end_date"/>
  <html:hidden property="ec_id" value="${param.ec_id}"/>
  <html:hidden property="ec_p" value="${param.ec_p}"/>
  <html:hidden property="ec_crd" value="${param.ec_crd}"/>
  <html:hidden property="thing_state"/>
  <html:hidden property="qlineId" />
  <html:hidden property="qsegmentId" />
  <html:hidden property="qstationId" />
  <html:hidden property="qstartDate" />
  <html:hidden property="qthingName" />
  <html:hidden property="qendDate" />
  <html:hidden property="qthingState" />
  <html:hidden property="oldthing_name" value="${dtaqWarnThing.thing_name}"/>
   <fieldset>
   <legend>
   <c:if test="${param.thing_id!=null}">
   编辑
   </c:if>
   <c:if test="${param.thing_id==null}">
   新增
   </c:if>
   </legend>
   <table class="formTable"  width="100%"  align="center" cellpadding="3" cellspacing="0" >
    <COLGROUP>
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
	</COLGROUP>
    <tr>
      <td nowrap="nowrap">事件名称:<span class="redSpan">*</span></td>
      <td>
      	<html:text property="thing_name" styleClass="text" size="50" maxlength="100" onchange="validateThingName()"/>
      </td>
      <td>预警等级:<span class="noRedSpan">*</span></td>
      <td><ex:dictSelect type="WarnThingLeave" property="thing_leave" /></td>
    </tr>
    <tr>
      <td>线路:<span class="redSpan">*</span></td>
							    <td >
							    	<select style="width: 240px" id="qlineId" name="line_id" onchange="getSections(this.value,'')"></select>
							    </td>
							    <td>标段:<span class="redSpan">*</span></td>
							    <td>
							     	<select id="qsectionId" name="segment_id" onchange="getWokPoints(this.value,'')"></select>
							    </td>
							    </tr>
    <tr>
							    <td>车站/区间:<span class="redSpan">*</span></td>
							    <td>
							    	<select id="qworkPointId" name="station_id" onchange="restrictTypes(this.value,'')"></select>
							    </td>
      <td>发布人:<span class="noRedSpan">*</span></td>
      <td><ex:employeeName id="${userInfo.empId}" /><html:hidden property="thing_user" value="${userInfo.empId}" /></td>
    </tr>
    <tr>
      <td>事件摘要:<span class="noRedSpan">*</span></td>
      <td colspan="3">
      		<html:textarea property="thing_memo" cols="80" rows="8" onblur="checkTextarea('thing_memo',4000)" onkeydown="textCounter('thing_memo','spanSummary',4000)" onkeyup="textCounter('thing_memo','spanSummary',4000)"/>
	      <span id="spanSummary" class="req" style="display:inline">4000字符以内</span>
      </td>
    </tr>
    <tr>
    	<td colspan="4" align="left"><center><div style="font-weight: bold;font-size: 15">事件描述</div></center></td>
    </tr>
    <tr>
    	<td colspan="4" id="fckConTD">
    		<input type="hidden" name="thing_dispcrition" value="${dtaqWarnThing.thing_dispcrition}">
    		<iframe id="eWebEditor1" src="ewebeditor/ewebeditor.htm?id=thing_dispcrition&style=coolblue" frameborder="0" scrolling="no" width="100%" HEIGHT="400"></iframe>
<%--	      <FCK:editor id="thing_dispcrition" width="100%" height="500" toolbarSet = "text">${dtaqWarnThing.thing_dispcrition}</FCK:editor>--%>
		</td>
    </tr>
  </table>
   </fieldset>
  <div class="saveDiv">
    <input type="button" class="saveButton" id=btn_save" value="${texts['button.save']}" >&nbsp;&nbsp;
    <input type="button" class="backButton" value="${texts['button.back']}" onclick="backToList()">
  </div>
</html:form>
</body>
</html>
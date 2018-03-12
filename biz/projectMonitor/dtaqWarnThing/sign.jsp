<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<content tag="heading">安全预警事件处理</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="${ctx}/scripts/stone.FollowDiv.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
$("#btn_save").click(function(){
	       var properties=new Array(); 
			properties[0]=["opinion","批阅意见"];
			
			
			saveValidateRequired("#btn_save",properties,"dtaqWarnThingSignForm");
})
})
function initWork() {
	jQuery.each(jQuery(".opinion"),function(index,item){
		var obj = jQuery(item);
		obj.attr("title",obj.html());
		if(obj.html().lengthCheck()>50){
			obj.html(substr(obj.html(),50)+'...');
		}
	});
	
}



function backToList() {
  var url="dtaqWarnThingSignAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&lineId=${lineId}&stationId=${stationId}&segmentId=${segmentId}&startDate=${startDate}&endDate=${endDate}&thingState=${thingState}";
  document.forms[0].action=url;
  document.forms[0].submit();
}
</script>
</head>
<body>
<fieldset>
<html:form action="dtaqWarnThingAction.do">
  <input type="hidden" name="method" value="save">
  <html:hidden property="qlineId" value="${param.qlineId}"/>
  <html:hidden property="qsegmentId" value="${param.qsegmentId}"/>
  <html:hidden property="qstationId" value="${param.qstationId}"/>
  <html:hidden property="qstartDate" value="${param.qstartDate}"/>
  <html:hidden property="qthingName" value="${param.qthingName}"/>
  <html:hidden property="qendDate" />
  <html:hidden property="qmarkingState" value="${param.qmarkingState}"/>
  </html:form>
   <legend>批阅</legend>
   <table class="formTable"  width="100%"  align="center" cellpadding="3" cellspacing="0" >
    <COLGROUP>
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
	</COLGROUP>
    <tr>
      <td>事件名称：<span class="noRedSpan">*</span></td>
      <td>${dtaqWarnThing.thing_name}</td>
      <td>预警等级：<span class="noRedSpan">*</span></td>
      <td><ex:dicDisplay dictIdentify="WarnThingLeave" dictValue="${dtaqWarnThing.thing_leave}"/></td>
    </tr>
    <tr>
      <td>发布人：<span class="noRedSpan">*</span></td>
      <td colspan="3"><ex:employeeName id="${dtaqWarnThing.thing_user}" /></td>
    </tr>
    <tr>
      <td>事件摘要：<span class="noRedSpan">*</span></td>
      <td colspan="3">
      		<html:textarea property="thing_memo" value="${dtaqWarnThing.thing_memo}" cols="80" rows="8"  readonly="true"/>
      </td>
    </tr>
    <tr>
    	<td colspan="4" align="left"><center><div style="font-weight: bold;font-size: 15">事件描述</div></center></td>
    </tr>
    <tr>
    	<td colspan="4" id="fckConTD" align="left">
    		<div style="float: left"><c:out value='${dtaqWarnThing.thing_dispcrition}' escapeXml="false"></c:out></div>
		</td>
    </tr>
  </table>
</fieldset>
<fieldset>
	<legend><strong>批阅历史记录</strong></legend>
	<table width="100%">
		<tr>
		<td>
		<table  class="listTable" id="tableObj" width="100%" border="0" cellpadding="0" cellspacing="1" align="left">
		<thead>
			<tr align="center"  height="25" id="trSite">
				 <th width="10%">序号</th>
				 <th width="10%">批阅人</th>
				 <th width="20%">批阅部门</th>
				 <th width="20%">批阅时间</th>
				 <th width="40%">批阅意见</th>
			  </tr>
			  </thead>
			  <c:set var="idx" value="0"/>
			  	<c:forEach items="${signs}" var="sign">
			  		<tr align="center" height="20" bgcolor="#E5EAF5">
						<td>${idx+1}</td>
						<td><ex:employeeName id="${sign.signer}"/></td>
						<td><ex:organNameById id="${sign.deptid}" /></td>
						<td><fmt:formatDate value="${sign.sign_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="opinion">${sign.opinion}</td>
					</tr>
					<c:set var="idx" value="${idx+1}"/>
				</c:forEach>
		</table>
		</td>
		</tr>
		<tr><td>
		<html:form action="dtaqWarnThingSignAction.do">
		    <input type="hidden" name="method" value="saveSign"/> 
			<html:hidden property="sign_id"/>
			<html:hidden property="thing_id" value="${dtaqWarnThing.thing_id}"/>
			<html:hidden property="signer" value="${userInfo.empId}"/>
			<html:hidden property="deptid" value="${userInfo.deptId}"/>
			<html:hidden property="thingName" value="${thingName}" />
			<html:hidden property="org_type" value="${org_type}" />
			  <html:hidden property="startDate" value="${startDate}" />
			  <html:hidden property="endDate" value="${endDate}" />
			  <html:hidden property="thingState" value="${thingState}" />
			  <html:hidden property="thing_state" value="${dtaqWarnThing.thing_state}" />
			  <html:hidden property="sign_state" value="${sign_state}" />
			  <html:hidden property="queryType" value="${queryType}" />
			  <html:hidden property="totalType" value="${totalType}" />
			  <html:hidden property="dtaqWarnThingList_page" value="${dtaqWarnThingList_page}"/>
	
		    <table class="formTable"  width="100%"  align="center" cellpadding="3" cellspacing="0" >
    <COLGROUP>
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
	</COLGROUP>
				     <tr height="30px">
				    	<td>批阅人：<span class="noRedSpan">*</span></td>
				    	<td><ex:employeeName id="${userInfo.empId}"/></td>
				    	<td>批阅部门：<span class="noRedSpan">*</span></td>
				    	<td><ex:organNameById id="${userInfo.deptId}" /></td>
				    	
				    </tr>
				    <tr>
				    	<td>批阅时间：<span class="noRedSpan">*</span></td>
				    	<td colspan="3">
					    	 <input type="text" name="sign_date" value="${nowDate}" readonly="readonly" class="text">
				    	</td>
				    </tr>
				    <tr>
				    	<td>批阅意见：<span class="noRedSpan">*</span></td>
				    	<td colspan="3">
					    	<html:textarea property="opinion" cols="80" rows="6" onblur="checkTextarea('opinion',4000)" onkeydown="textCounter('opinion','spanSummary',4000)" onkeyup="textCounter('opinion','spanSummary',4000)"/>
					    	<span class="req" id="spanSummary">4000字符以内</span>
				    	</td>
				    </tr>
				    <tr>
			           <td align="center" colspan="4">
			           <div class="saveDiv">
			           		<input type="button" id="btn_save" value="${texts['button.save']}"  />
						   	<html:button property="back"  styleClass="backButton" value="${texts['button.back']}" onclick="backToList()" />
						</div>
			           </td>
	           		</tr>
				</table>

		</html:form>
		</td>
		</tr>
		</table>
</fieldset>
</body>
</html>
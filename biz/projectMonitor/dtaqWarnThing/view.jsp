<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<title><fmt:message key="dtaq.thing.title"/></title>
<content tag="heading">安全预警事件管理</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">
function backToList() {
  var url="dtaqWarnThingAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&lineId=${lineId}&stationId=${stationId}&segmentId=${segmentId}&startDate=${startDate}&endDate=${endDate}&thingState=${thingState}";
  document.forms[0].action=url;
  document.forms[0].submit();
}
</script>
</head>
<body>
<fieldset>
	<legend><strong>详细</strong></legend>
<html:form action="dtaqWarnThingAction.do">
  <input type="hidden" name="method" value="save">
  <html:hidden property="thing_id" />
  <html:hidden property="qlineId" />
  <html:hidden property="qsegmentId" />
  <html:hidden property="qstationId" />
  <html:hidden property="qstartDate" />
  <html:hidden property="qthingName" />
  <html:hidden property="qendDate" />
  <html:hidden property="qthingState" />
    <table class="formTable"  width="100%"  align="center" cellpadding="3" cellspacing="0" >
    <COLGROUP>
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
	</COLGROUP>
	
     <tr>
      <td nowrap="nowrap">事件名称：<span class="redSpan">*</span></td>
      <td>${dtaqWarnThing.thing_name}
      </td>
      <td>预警等级：<span class="redSpan">*</span></td>
      <td><ex:dicDisplay dictIdentify="WarnThingLeave" dictValue="${dtaqWarnThing.thing_leave}" /></td>
    </tr>
    <tr>
      <td>线路：<span class="noRedSpan">*</span></td>
							    <td >${dtaqWarnThing.segmentId.line_id.line_name}
							    </td>
							    <td>标段：<span class="noRedSpan">*</span></td>
							    <td>${dtaqWarnThing.segmentId.segment_name}
							    </td>
							    </tr>
    <tr>
							    <td>车站/区间：<span class="noRedSpan">*</span></td>
							    <td>${dtaqWarnThing.stationId.station_name}
							    </td>
      <td>发布人：<span class="redSpan">*</span></td>
      <td><ex:employeeName id="${dtaqWarnThing.thing_user}" /><html:hidden property="thing_user" value="${userInfo.empId}" /></td>
    </tr>
    <tr>
      <td>事件摘要：<span class="noRedSpan">*</span></td>
      <td colspan="3">${dtaqWarnThing.thing_memo}
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
</html:form>
</fieldset>
<fieldset>
	<legend><strong>批阅历史记录</strong></legend>
	<table class="listTable" id="tableObj" width="100%" border="0" cellpadding="0" cellspacing="1" align="left">
			<thead>
			<tr align="center"  height="25" id="trSite">
				 <th width="10%">序号</thd>
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
</fieldset>
 <div class="saveDiv">
  	<html:button property="back"  styleClass="button1" value="返 回" onclick="backToList()" />
</div>
</body>
</html>
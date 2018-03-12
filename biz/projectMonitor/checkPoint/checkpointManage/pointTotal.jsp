<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.pointTotal.title"/></title>
<content tag="heading"><fmt:message key="dtaq.pointTotal.title"/></content>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script  type="text/javascript" language=javascript>
//必须搭配prototype1.16版本
</script>
<script type="text/javascript">
function validateQuery(){
	var line_id = jQuery("[name='line_id']").val();
	var station_state = jQuery("[name='station_state']").val();
	if(line_id == ""){
		alert("请您先选择线路信息！")
		jQuery("[name='line_id']").focus();
		return false;
	}
	if(station_state == ""){
		alert("请您先选择工点状态！")
		jQuery("[name='station_state']").focus();
		return false;
	}
	return true;
}
</script>
</head>
  <body>
  <fieldset>
  <legend><strong><fmt:message key="dtaq.common.query.title"/></strong></legend>
  <html:form action="/dtaq/point.do?method=pointTotal">
	  <table class="searchTable" width="100%" cellpadding="0" cellspacing="4" border="0">
		  <tr>
			  <td width="60px"><fmt:message key="dtaq.common.line"/></td>
			  <td width="250px">
			  	<html:select property="line_id" name="pointForm">
		      		<html:option value=""><fmt:message key="dtaq.common.select.option"/></html:option>
		      		<html:optionsCollection name="lines" value="line_id" label="line_name"/>
		      	</html:select>
			  </td>
			  <td width="60px" ><fmt:message key="dtaq.pointTotal.station_state"/></td>
			  <td width="150px">
				  	<ex:dictSelect type="ProjectState" property="station_state"/>
			  </td>
			  <td align="left">
			 	 <input type="submit" value="${texts['button.query']}" class="button1" onclick="return validateQuery()"/>
			  </td>
		  </tr>
	  </table>
  </html:form>
</fieldset>
<fieldset>
  <legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
<table class="commonTable"width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="left">
			<fmt:message key="dtaq.pointTotal.should_monitoring" />
			<fmt:message key="dtaq.pointTotal.reality_monitoring" /><br/>
			<fmt:message key="dtaq.pointTotal.stop_monitoring" />
		</td>
	</tr>
  </table>
	   <table class="def_table" width="100%" align="center" border="0" cellpadding="0" cellspacing="1" >
		 <thead>
		 <tr align="center"  height="25">
		    <th rowspan='2' width='100'><fmt:message key="dtaq.common.segment"/></th>
			 <th rowspan='2' width='100'><fmt:message key="dtaq.common.station_work"/></th>
		    <th colspan='3' width='216'><fmt:message key="dtaq.point.total.third"/></th>
		    <th colspan='3' width='216'><fmt:message key="dtaq.point.total.work"/></th>
		    <th rowspan='2' width='100'><fmt:message key="dtaq.point.total.compare_point"/></th>
			 <th rowspan='2' width='100'><fmt:message key="label.operate"/></th>
		  </tr>
		 <tr align="center" height="25">
		    <th width='72'><fmt:message key="dtaq.point.total.should_point"/></th>
		    <th width='72'><fmt:message key="dtaq.point.total.actual_point"/></th>
		    <th width='72'><fmt:message key="dtaq.point.total.stop_point"/></th>
		    <th width='72'><fmt:message key="dtaq.point.total.should_point"/></th>
		    <th width='72'><fmt:message key="dtaq.point.total.actual_point"/></th>
		    <th width='72'><fmt:message key="dtaq.point.total.stop_point"/></th>
		  </tr>
		  </thead>
		  <c:forEach items="${checkpointTotals}" var="pointTotal">
		  	<tr class="tr07" align="center" height="20">
		  		<td>${pointTotal.segment_name}</td>
		  		<td>${pointTotal.station_name}</td>
		  		<td>${pointTotal.third_should_point}</td>
		  		<td>${pointTotal.third_actual_point}</td>
		  		<td>${pointTotal.third_stop_point}</td>
		  		<td>${pointTotal.work_should_point}</td>
		  		<td>${pointTotal.work_actual_point}</td>
		  		<td>${pointTotal.work_stop_point}</td>
		  		<td>${pointTotal.compare_point}</td>
		  		<td><input type="button" class="button1" value="${texts['label.view']}" onclick="showwait();location.href='${ctx}/dtaq/point.do?method=queryPointList&pointTotal=Y&isthird=N&line_id=${pointTotal.line_id}&segment_id=${pointTotal.segment_id}&station_id=${pointTotal.station_id}'"/></td>
		  	</tr>
		  </c:forEach>
		</table>
  </fieldset>
  </body>
</html:html>
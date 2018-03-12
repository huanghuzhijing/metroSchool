<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">测点统计分析</content>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script  type="text/javascript" language=javascript>
//必须搭配prototype1.16版本
</script>
<script type="text/javascript">
jQuery(document).ready(function(){
			   getLines('${param.line_id}','${param.qsegmentId}');
			   
			   })
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
function viewInfo(station_id,segment_id,line_id){
var url='checkpointManageAction.do?method=queryPointList&pointTotal=Y&isthird=N&organ_type=O&station_state=${param.station_state}&line_id='+line_id+'&segment_id='+segment_id+'&station_id='+station_id;
location.href=url;
}
</script>
</head>
  <body>
  <fieldset>
  <legend><strong>查询条件</strong></legend>
  <html:form action="checkpointManageAction.do?method=pointTotal">
	  <table class="searchTable" width="100%" cellpadding="0" cellspacing="4" border="0">
		  <tr>
			  <td width="60px">线路</td>
			  <td width="250px">
			  	<select id="qlineId" name="line_id" value="${param.line_id }"></select>
			  </td>
			  <td width="60px" >工点状态</td>
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
			<font color="#50A2E6" >应测测点数：监测状态为正在监测的所有测点数; 实测测点数：状态为正在监测的且存在监测数据的所有测点数;<br/>
                                 停测测点数：监测状态为停测的所有测点数 
                                 </font>
		</td>
	</tr>
  </table>
	   <table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1" >
		 <thead>
		 <tr align="center"  height="25">
		    <th rowspan='2' width='100'>标段</th>
			 <th rowspan='2' width='100'>工点</th>
		    <th colspan='3' width='216'>第三方</th>
		    <th colspan='3' width='216'>施工方</th>
		    <th rowspan='2' width='100'>对应测点数</th>
			 <th rowspan='2' width='100'><fmt:message key="label.operate"/></th>
		  </tr>
		 <tr align="center" height="25">
		    <th width='72'>应测测点数</th>
		    <th width='72'>实测测点数</th>
		    <th width='72'>停测测点数</th>
		    <th width='72'>应测测点数</th>
		    <th width='72'>实测测点数</th>
		    <th width='72'>停测测点数</th>
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
		  		<td><input type="button" class="button1" value="${texts['label.view']}" onclick="viewInfo(${pointTotal.stationId.station_id},${pointTotal.stationId.segment_id.segment_id},${pointTotal.stationId.segment_id.line_id.line_id})"/></td>
		  	</tr>
		  </c:forEach>
		</table>
  </fieldset>
  </body>
</html:html>
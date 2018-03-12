<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">安全预警事件处理</content>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
    getLines('${param.qlineId}','${param.qsegmentId}');
    getSections('${param.qlineId}','${param.qsegmentId}');
    getWokPoints('${param.qsegmentId}','${param.qstationId}');
    var ec_id='${param.ec_id}';
	if(ec_id==null||ec_id==""){
		ec_id='${ec_id}';
	}
	var ec_auditStatus='${param.ec_auditStatus}';
	if(ec_auditStatus==null||ec_auditStatus==""){
		ec_auditStatus='${ec_auditStatus}';
	}
	pullValue(ec_id,ec_auditStatus);
	
	$("#btn_check").click(function(){
	
	if($("[name='select_id']:checked").val()!=null){
		var url='dtaqWarnThingSignAction.do?method=edit&state=2&thing_id='+$("[name='select_id']:checked").val()+'&ec_id='+$("[name='select_id']:checked").val()+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_crd']").val();
	   commonUrl(url);
	}else{
	alert("请选中节点！");
	}
	}) 
	
})



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
				<html:form action="dtaqWarnThingSignAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
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
							     	<input type="text" id="qsectionId" name="qsegmentId" value="${segment.segment_name }"/>
							     	<input type="hidden" id="qsectionId" name="qsegmentId" value="${segment.segment_id }"/>
							    </td>
							    <td>车站/区间：</td>
							    <td>
							    	<select id="qworkPointId" name="qstationId" onchange="restrictTypes(this.value,'')"></select>
							    </td>
								</c:if>
						</tr>
						
						<tr>
						 		<td>发布时间：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								<td>事件名称：</td>
								<td>
									<html:text  property="qthingName"  styleClass="text" />
								</td>
								<td>批阅状态：</td>
								<td>
									<ex:dictSelect type="MarkingState" property="qmarkingState" showSelect="false"/>
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
	<div class="listButtonDiv">
				<input id="btn_check" value="批&nbsp;&nbsp;阅" type="button"
					class="button1" />
			</div>
<fieldset>
  <legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr><td>
   <ec:table items="dtaqWarnThings" var="thing" action="dtaqWarnThingAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" onclick="pullValue('${thing.thing_id}');" ondblclick="showView('${thing.thing_id}');">
	  <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
	  <ec:column property="null" sortable="false" title="选择" width="5%">
						<input name="select_id" value="${thing.thing_id}" type="radio" state="${thing.thing_state}" />
						</ec:column>
	 <ec:column property="thing_name" title="事件名称" width="160px"/>
	  <ec:column property="thing_user" title="发布人" width="130px" >
	  	<div align="center"><ex:employeeName id="${thing.thing_user}"/></div>
	  </ec:column>
	   <ec:column property="stationId.station_name" title="工点" width="130px"/>
	   		
	 
	  
	  <ec:column property="start_date" title="发布日期" width="160px" format="yyyy-MM-dd" cell="date"><div align="center">${thing.start_date}</div></ec:column>
	   <ec:column property="thing_leave" title="预警等级" width="100px">
	  		<center><div  class="state${thing.thing_leave}"></div></center>
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
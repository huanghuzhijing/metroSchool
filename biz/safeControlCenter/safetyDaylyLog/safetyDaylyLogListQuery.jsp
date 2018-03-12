<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">

jQuery(document).ready(function(){
	initCont();
	var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			var ec_auditStatus='${param.ec_auditStatus}';
			if(ec_auditStatus==null||ec_auditStatus==""){
				ec_auditStatus='${ec_auditStatus}';
			}
			pullValue(ec_id,ec_auditStatus);
	$("#btn_view").click(function(){
	view();
	})
})

function initCont() {
	jQuery(".f_riskplan,.f_safetywork").each(function(i){
		var obj = jQuery(this) ;
		if(obj.html().length > 1000 ){
		obj.html(substr(obj.html(),1000)+'...');
		}
		obj.attr("title",obj.html());
		if(obj.html().length > 20 ){
			obj.html(substr(obj.html(),20)+'...');
		}
	})
}


function view(){
		var id=$("[name='select_id']:checked").val();
		location.href='safetyDaylyLogAction.do?method=view&flag=t&id='+id+'&ec_id='+id+'&segment_Id=${segment_Id}&stationId=${stationId}&station_state=${station_state}&qstartDate=${startDate}&qendDate=${endDate}&log_type=${log_type}&safetyDaylyLogList_page=${safetyDaylyLogList_page}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_crd']").val();
		}

function validateQuery(){
	var stationId = jQuery("[name='station_id']").val();
	if(stationId == ""){
		alert("请您先选择树型结构下的车站/区间！");
		return false;
	}
	return true;
}
function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			var operObj = $("input[type=radio][name='select_id'][checked]");
			if(operObj.attr("state")==0){
			$("#btn_submit").show();
			$("#btn_edit").show();
			$("#btn_delete").show();
			
			}else if(operObj.attr("state")==1){
						
			$("#btn_submit").hide();
			$("#btn_edit").hide();
			$("#btn_delete").hide();
					
			}		
		}
		
</script>
</head>
  <body>
    	<table class="queryTable" width="100%" cellpadding="0" cellspacing="4" border="0">
		<tr>
			<td valign="top">
		  			<html:form action="safetyDaylyLogAction.do?method=listQuery">
					  <html:hidden property="segment_id" value="${segment_id}"/>
					  <html:hidden property="station_id" value="${station_id}"/>
					  <html:hidden property="station_state" value="${station_state}"/>
					  <html:hidden property="deptType" value="${deptType}"/>
						  <table align="left">
							  <tr>
							  	 <td width="60px">填报日期</td>
							    <td><input type="text" onfocus="WdatePicker()" name="qstartDate" value="${startDate}" />--<input type="text" onfocus="WdatePicker()" name="qendDate" value="${endDate}" /></td>
							    <c:if test="${deptType == ''}">
							     	<td width="60px" >日志类型</td>
							     	<td>
							     		<html:select property="log_type">
							     			<html:option value="">请选择</html:option>
							     			<html:option value="1">施工日志</html:option>
							     			<html:option value="3">监理日志</html:option>
							     		</html:select>
							     	</td>
							     </c:if>
							     <td  align="right">
							    	<input type="submit" value="${texts['button.query']}" class="button1" onclick="return validateQuery()"/>
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
							<tr>
								<c:if test="${station.station_name != null}">
									<td width="90%" align="center">
										<font color="#50A2E6" size="2"><strong>标段：${segment.segment_name}&nbsp;&nbsp;&nbsp;&nbsp;车站/区间：${station.station_name}</strong></font>
									</td>
								</c:if>
							</tr>
						</table>
						<div class="listButtonDiv">
						<input id="btn_view" value="${texts['button.detail']}" type="button" icon="icon_view" />
						</div>
						<ec:table items="safetyDaylyLogs" var="safetyDaylyLog"  action="safetyDaylyLogAction.do"
						title="" width="100%"  sortable="false" rowsDisplayed="10"
						imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
					  	<ec:row highlightRow="true" onclick="pullValue('${safetyDaylyLog.id}');" ondblclick="showView('${safetyDaylyLog.id}');">
							<ec:parameter name="segment_id" value="${segment_id}"/>
							<ec:parameter name="station_id" value="${station_id}"/>
							<ec:parameter name="station_state" value="${station_state}"/>
							<ec:parameter name="qstartDate" value="${startDate}"/>
							<ec:parameter name="qendDate" value="${endDate}"/>
							<ec:parameter name="deptType" value="${deptType}"/>
							<ec:parameter name="log_type" value="${log_type}"/>
							<ec:column property="rowcount" cell="rowCount" sortable="false"
								title="序号" width="5%" />
							<ec:column property="null" sortable="false" title="选择" width="5%">
								<input name="select_id" value="${safetyDaylyLog.id}" type="radio"
									state="${safetyDaylyLog.state}" />
							</ec:column> 
							 <ec:column property="f_reportdate" title="报告日期" format="yyyy-MM-dd" cell="date" width="10%"/>
							 <ec:column property="f_userid" title="填写人" width="10%">
							 	<ex:employeeName id="${safetyDaylyLog.f_userid}"/>
							 </ec:column>
							 <ec:column property="org_flag" title="日志类型" width="10%">
							 	<c:if test="${safetyDaylyLog.org_flag == '1'}">施工日志</c:if>
							 	<c:if test="${safetyDaylyLog.org_flag == '3'}">监理日志</c:if>
							 </ec:column>
					    	 <ec:column property="f_riskplan" title="今日工点安全风险情况" width="25%">
					    	 	<div class="f_riskplan">${safetyDaylyLog.f_riskplan}</div>
					    	 </ec:column>
					    	 <ec:column property="f_safetywork" title="今日安全工作" width="25%">
					    	 	<div class="f_safetywork">${safetyDaylyLog.f_safetywork}</div>
					    	 </ec:column>
					    	  <ec:column property="ts" title="填报时间" width="10%" format="yyyy-MM-dd" cell="date" />
						</ec:row>
						</ec:table>
				</fieldset>
			 </td>
		</tr>
	
  </body>
</html:html>

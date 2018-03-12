<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">


function validateQuery(){
	var stationId = jQuery("[name='station_id']").val();
	if(stationId == ""){
		alert("请您先选择树型结构下的车站/区间！");
		return false;
	}
	return true;
}
	function checkdel(riskid){
	$.ajax({
	  type:"post",
	  url:"riskLibAction.do?method=ajaxCheckDelete",
	  data:"risk_id="+riskid,
	  success:function(msg){
	 checkResponse(msg)
	  }
	})
	
}
function checkResponse(checkResponse){

	if(checkResponse != null && checkResponse!= ""){
		var resText = checkResponse.split(",");
		var check = resText[0];
		var risk_id = resText[1];
		if(check == '1'){
			alert("该危险源已被使用，不能删除！");
			return false;
		}else{
			if(confirm('${texts['warning.delconfirm']}')){
				location.href="${ctx}/riskLibAction.do?method=deleteInfo&riskId="+risk_id+"&line_id=${line_id}&segment_id=${segment_id}&station_id=${station.station_id}&risk_name=${risk_name}&risk_type=${risk_type}&riskLibList_page=${riskLibList_page}";
			}
		}
	}
}	
</script>
</head>
  <body>
    	<table class="queryTable" width="100%" cellpadding="0" cellspacing="4" border="0">
    	 <tr>
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
		<tr>
			<td valign="top">
		  			<html:form action="riskLibAction.do?method=list">
					  <html:hidden property="segment_id" value="${segment_id}"/>
					  <html:hidden property="station_id" value="${station.station_id}"/>
					  <html:hidden property="station_state" value="${station_state}"/>
					  <html:hidden property="deptType" value="${deptType}"/>
						  <table align="left">
							  <tr>
							  	 <td>危险源名称:</td>
							    <td><input type="text" name="qriskName" value="${param.qriskName }"/></td>
							   
							     	<td>危险源类型:</td>
							     	<td>
							     		<ex:dictSelect type="RiskLibType" property="qriskType" value="${param.qriskType}"/>
							     	</td>
							     
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
  <legend><strong>级别说明</strong></legend>
   <table  border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
   		<td align="center"><font color="#50A2E6" size="2"><strong>
   		AAAAA——极其危险，不可能继续作业；AAAA——高度危险，要立即整改<br/>
AAA——显著危险，需要整改；AA——一般危险，需要注意；A——稍有危险，可以接受
   		</strong></font>
   		</td>
	</tr>
</table>
</fieldset>
				<fieldset>
					<legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<c:if test="${station.station_name != null}">
									<td width="90%" align="center">
										<font color="#50A2E6" size="2"><strong>标段：${station.segment_id.segment_name}&nbsp;&nbsp;&nbsp;&nbsp;车站/区间：${station.station_name}</strong></font>
									</td>
								</c:if>
							</tr>
						</table>
						<c:if test="${station.station_state==1}">
						<div align="right">
						<input type="button" class="button1" onclick="location.href='riskLibAction.do?method=edit&station_id=${station.station_id}'" value="新&nbsp;&nbsp;增"/>
						</div>
						</c:if>
						<ec:table items="riskLibs" var="riskLib"  action="riskLibAction.do?method=list"
						title="" width="100%"  sortable="false" rowsDisplayed="10"
						imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
					  	<ec:row highlightRow="true" onclick="pullValue('${riskLib.riskId}');" ondblclick="showView('${riskLib.riskId}');">
							<ec:parameter name="segment_id" value="${segment_id}"/>
							<ec:parameter name="station_id" value="${station_id}"/>
							<ec:parameter name="station_state" value="${station_state}"/>
							<ec:parameter name="qstartDate" value="${startDate}"/>
							<ec:parameter name="qendDate" value="${endDate}"/>
							<ec:parameter name="deptType" value="${deptType}"/>
							<ec:parameter name="log_type" value="${log_type}"/>
							<ec:column property="rowcount" cell="rowCount" sortable="false"
								title="序号" width="5%" />
							<ec:column property="stationId.station_name" title="车站/区间" width="150px">
			
		</ec:column>
		<ec:column property="riskType" title="危险源类型" width="120px">
			<ex:dicDisplay dictIdentify="RiskLibType" dictValue="${riskLib.riskType}"/>
		</ec:column>
		<ec:column property="riskName" title="危险源名称" width="240px">
		</ec:column>
		<ec:column property="riskResult" title="可能导致的事故" width="200px">
		</ec:column>
		<ec:column property="levels" title="危险级别" width="120px"/>
<%--		<ec:column property="ts" title="${texts['riskLib.levels']}" width="100px" format="yyyy-MM-dd" cell="date"/>--%>
	 	<ec:column property="null" title="${texts['label.operate']}" width="250px" sortable="false">
	 		<div align="center">
			<input type="button" class="button1" onclick="location.href='riskLibAction.do?method=view&riskId=${riskLib.riskId}&line_id=${line_id}&segment_id=${segment_id}&station_id=${station_id}&risk_name=${risk_name}&risk_type=${risk_type}&riskLibList_page=${riskLibList_page}'" value="<fmt:message key="button.detail"/>"/>
			<c:if test="${riskLib.stationId.station_state == '1'}">
			<input type="button" class="button1" onclick="location.href='riskLibAction.do?method=edit&riskId=${riskLib.riskId}&line_id=${line_id}&segment_id=${segment_id}&station_id=${station.station_id}&risk_name=${risk_name}&risk_type=${risk_type}&riskLibList_page=${riskLibList_page}'" value="<fmt:message key="label.modify"/>"/>
			<input type="button" class="button1" onclick="checkdel('${riskLib.riskId}')" value="<fmt:message key="label.delete"/>"/>
			</c:if>
			</div>
		</ec:column>
						</ec:row>
						</ec:table>
				</fieldset>
			 </td>
		</tr>
	
  </body>
</html:html>

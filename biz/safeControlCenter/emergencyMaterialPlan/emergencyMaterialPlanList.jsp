<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">应急救援预案新版</content>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">

jQuery(document).ready(function(){
	if("${planName}"!=''){
	$("[name='qplanName']").val('${planName}');
	}
	var ec_id='${param.ec_id}';
	if(ec_id==null||ec_id==""){
		ec_id='${ec_id}';
	}
	var ec_auditStatus='${param.ec_auditStatus}';
	if(ec_auditStatus==null||ec_auditStatus==""){
		ec_auditStatus='${ec_auditStatus}';
	}
	pullValue(ec_id,ec_auditStatus);
	$("#btn_edit").click(function(){
	edit();
	})
	$("#btn_view").click(function(){
	view();
	})
	$("#btn_delete").click(function(){
	deleteFunc();
	})
})



		function deleteFunc(id){
				if(confirm('${texts['dtaq.common.delete.msg']}'))
				location.href='emergencyMaterialPlanAction.do?method=deleteFunc&fid='+id+'&segment_Id=${segment_Id}&stationId=${stationId}&station_state=${station_state}&qstartDate=${startDate}&qendDate=${endDate}&log_type=${log_type}&safetyDaylyLogList_page=${safetyDaylyLogList_page}'
				}
		
		function newPlan(){
			location.href = 'emergencyMaterialPlanAction.do?method=edit';
		}
		function edit(id){
		var url='emergencyMaterialPlanAction.do?method=edit&fid='+id+'&ec_id='+id+'&segment_Id=${segment_Id}&stationId=${stationId}&station_state=${station_state}&qstartDate=${startDate}&qendDate=${endDate}&log_type=${log_type}&emergencyMaterialPlanList_page=${emergencyMaterialPlanList_page}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_crd']").val();
		commonUrl(url);
		}
		function view(id){
		var url='emergencyMaterialPlanAction.do?method=view&fid='+id+'&ec_id='+id+'&segment_Id=${segment_Id}&stationId=${stationId}&station_state=${station_state}&qstartDate=${startDate}&qendDate=${endDate}&log_type=${log_type}&emergencyMaterialPlanList_page=${emergencyMaterialPlanList_page}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_crd']").val();
		commonUrl(url);
		}
							  	//设置list页面id
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
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
		<tr>
			<td valign="top">
				
		  			<html:form action="emergencyMaterialPlanAction.do?method=list">
					  <html:hidden property="deptType" value="${deptType}"/>
						 <table align="left">
						<tr>
  		<td width="60px">计划名称</td>
  		<td><html:text property="qplanName"/></td>
  		<td width="60px">计划年份</td>
  		<td>
  			<html:select property="qyearNum">
	     		<option value=""><fmt:message key="dicSelect.all"/></option>
	     		<c:forEach items="${yearList}" var="y">
					<option value="${y}" <c:if test="${y==param.qyearNum}">selected</c:if>>${y}</option>
				</c:forEach>
  			</html:select>
  		</td>
  		<td width="60px">计划月份</td>
  		<td >
  			<html:select property="qmonthNum">
	     		<html:option value=""><fmt:message key="dicSelect.all"/></html:option>
	     		<c:forEach items="${monthList}" var="m">
					<option value="${m}" <c:if test="${m==param.qmonthNum}">selected</c:if>>${m}</option>
				</c:forEach>
	  		</html:select>
  		</td>
  		<td align="right" colspan="2"><input type="submit" value="<fmt:message key="button.query"/>" class="button1" /></td>
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
						<div align="right">
				<input type="button" value="新增" onclick="newPlan()" class="btn_add" style="margin-right: 20px">
   		</div>
						<ec:table items="emergencyMaterialPlans" var="emergencyMaterialPlan"  action="emergencyMaterialPlanAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" onclick="pullValue('${emergencyMaterialPlan.fid}');" ondblclick="view('${emergencyMaterialPlan.fid}');">
							
							
				<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%" />
				<ec:column property="planName" title="计划名称" width="250px"/>
				<ec:column property="planYear" title="计划年份" width="150px"/>
				<ec:column property="planMonth" title="计划月份" width="150px"/>
				<ec:column property="null" title="操作" width="110px" sortable="false">
				<div align="center">
				<input type="button" class="button1" onclick="view('${emergencyMaterialPlan.fid}')" value="<fmt:message key="button.detail"/>"/>
				<c:if test="${fn:contains(userinfo.usercmd,'emergencyMaterialplan_update')==true}">
				<input type="button" class="button1" onclick="edit('${emergencyMaterialPlan.fid}')" value="<fmt:message key="label.modify"/>"/>
				</c:if>
				<c:if test="${fn:contains(userinfo.usercmd,'emergencyMaterialplan_delete')==true}">
				<input type="button" class="button1" onclick="deleteFunc('${emergencyMaterialPlan.fid}')" value="<fmt:message key="label.delete"/>"/>
				</c:if>
				<c:if test="${fn:contains(userinfo.usercmd,'emergencyMaterialplan_weave')==true}">
				<input type="button" class="button1" onclick="location.href='emergencyMaterialItemAction.do?method=list&fid=${emergencyMaterialPlan.fid}'" value="<fmt:message key="button.weave"/>"/>
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

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">应急组织机构</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">

jQuery(document).ready(function(){
		var ec_id='${param.ec_id}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
		}
		var ec_auditStatus='${param.ec_auditStatus}';
		if(ec_auditStatus==null||ec_auditStatus==""){
			ec_auditStatus='${ec_auditStatus}';
		}
		pullValue(ec_id,ec_auditStatus);
		$("#btn_add").click(function(){
		createInfo();
		})
		$("#btn_edit").click(function(){
		edit();
		})
		$("#btn_view").click(function(){
		view();
		})
		$("#btn_delete").click(function(){
		deleteFunc();
		})
		 getLines('${param.qlineId}','${param.qsectionId}');
		    getSections('${param.qlineId}','${param.qsectionId}');
		    getWokPoints('${param.qsectionId}','${param.qworkPointId}');
})






		function createInfo(){
			location.href="emergencyMemberAction.do?method=edit&segment_id=${segment_id}&station_id=${station_id}&deptType=${deptType}&station_state=${station_state}&qstartDate=${startDate}&qendDate=${endDate}&log_type=${log_type}&emergencyMemberList_page=${emergencyMemberList_page}";
			
		}
		function edit(){
		var id=$("[name='select_id']:checked").val();
		var url='emergencyMemberAction.do?method=edit&fid='+id+'&ec_id='+id+'&segment_Id=${segment_Id}&stationId=${stationId}&station_state=${station_state}&qstartDate=${startDate}&qendDate=${endDate}&log_type=${log_type}&emergencyMemberList_page=${emergencyMemberList_page}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_crd']").val();
		commonUrl(url);
		}
		function view(){
		var id=$("[name='select_id']:checked").val();
		var url='emergencyMemberAction.do?method=view&fid='+id+'&ec_id='+id+'&segment_Id=${segment_Id}&stationId=${stationId}&station_state=${station_state}&qstartDate=${startDate}&qendDate=${endDate}&log_type=${log_type}&emergencyMemberList_page=${emergencyMemberList_page}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_crd']").val();
		commonUrl(url);
		}
		function deleteFunc(){
		var id=$("[name='select_id']:checked").val();
		if(confirm('${texts['dtaq.common.delete.msg']}')){
			var url='emergencyMemberAction.do?method=delete&fid='+id+'&segment_Id=${segment_Id}&stationId=${stationId}&station_state=${station_state}&qstartDate=${startDate}&qendDate=${endDate}&log_type=${log_type}&emergencyMemberList_page=${emergencyMemberList_page}';
			location.href=url;
			}		
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
		function selectEmployee(){
			var url ="${ctx}/employeeAction.do?method=selectEmpNoteOGCOrgan&single=t";
		 	art.dialog({id:'commonDialog1',title:'选择人员', iframe:url, width:'800', height:'450',top:'10'});
}				
function clearMember(){
$("#plug_organ_empName").val("");
$("#plug_organ_empId").val("");
}	  	
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
				<html:form action="emergencyMemberAction.do?method=list">
					<table align="left">
						<tr>
						<td>预案人员:</td>
						      <td >
						      	<input type="text" name="peoplename" id="plug_organ_empName" value="${param.peoplename }" class="text" size="20" readonly="readonly" />
						      	<input type="hidden" name="qpersonId" id="plug_organ_empId" value="${param.qpersonId }" />
						      	<input type="hidden" name="plug_organ_organName" id="plug_organ_organName"/>
						      	  </td>
								<td>
								<div class="listButtonDiv">
								<input type="button" name="abc" value="选择" class="button1" onclick="selectEmployee()">
								<input type="button" name="def" value="清空" class="button1" onclick="clearMember()">
						    </div>
						    </td>
								<td>线路：</td>
							    <td >
							    	<select style="width: 240px" id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
							    </td>
							     <td>标段：</td>
							    <td><select id="qsectionId" name="qsectionId" onchange="getWokPoints(this.value,'')"></select>
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
				<input id="btn_add" value="${texts['button.new']}" type="button"
					icon="icon_add" />
				<input id="btn_view" value="${texts['button.detail']}" type="button"
					icon="icon_view" />
				<input id="btn_edit" value="${texts['button.edit']}" type="button"
					icon="icon_edit" />
				<input id="btn_delete" value="${texts['button.delete']}"
					type="button" icon="icon_delete" />
			</div>
						<ec:table items="emergencyMembers" var="emergencyMember"  action="emergencyMemberAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" onclick="pullValue('${emergencyMember.fid}');" ondblclick="showView('${emergencyMember.fid}');">
							
							
							<ec:column property="rowcount" cell="rowCount" sortable="false"
					title="序号" width="5%" />
						<ec:column property="null" sortable="false" title="选择" width="5%">
						<input name="select_id" value="${emergencyMember.fid}" type="radio" state="${emergencyMember.status}" />
						</ec:column>
						<ec:column property="personId.employee_name" title="预案人员" width="150px">
						
						</ec:column>
						<ec:column property="duty" title="职务" width="200px" />
						<ec:column property="mainWork" title="主要负责工作" width="200px" />
						<ec:column property="contactMode" title="联系方式" width="150px" />
						</ec:row>
						</ec:table>
				</fieldset>
			 </td>
		</tr>
	
  </body>
</html:html>

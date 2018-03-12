<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
	var oper_id="";
	 //
	 $(document).ready(function(){
 		//
 		$("#btn_edit").hide();
		$("#btn_delete").hide();
		$("#btn_view").hide();
		//控制按钮
		var ec_id='${param.ec_id}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
		}
		pullValue(ec_id);
 	   //增加
       $("#btn_add").click(function(){
       		location.href='employeeAction.do?method=create&static_orgid=${static_orgid}&name=${param.name}'+'&qempname='+$("input[name='qempname']").val()+'&qempcode='+$("input[name='qempcode']").val()+'&qsex='+$("[name='qsex']").val();
       });
       //详细
		$("#btn_view").click(function(){ 
			showView(oper_id);
		}); 	  
       //修改
		$("#btn_edit").click(function(){ 
			var url="employeeAction.do?method=edit&employee_id="+oper_id+"&static_orgid=${static_orgid}&name=${name}"+"&ec_p="+$("input[name='ec_p']").val()+'&qempname='+$("input[name='qempname']").val()+'&qempcode='+$("input[name='qempcode']").val()+'&qsex='+$("[name='qsex']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			commonUrl(url);
		});	            
       //删除
		//$("#btn_delete").click(function(){ 
		//	if(window.confirm("将删除该员工信息在用户管理、用户组员工管理、员工项目配置中的关联信息")){
		//		var url="employeeAction.do?method=delete&employee_id="+oper_id+"&static_orgid=${param.static_orgid}&name=${param.name}"+"&ec_p="+$("input[name='ec_p']").val();
		//		commonUrl(url);
		//	}
		//});
		//	 
		$("#btn_delete").click(function(){ 
			//if(window.confirm("将删除该员工信息在用户管理、用户组员工管理、员工项目配置中的关联信息")){
			if(window.confirm("是否确认删除？")){
			 $.ajax({
					   type: "POST",
					   url: "${ctx}/employeeExtendAction.do?method=validateDelete",
					   data: "employeeid="+oper_id,
					   success: function(msg){
					   	   if(msg=='yes'){
						   var url="employeeAction.do?method=delete&employee_id="+oper_id;
					       commonUrl(url);
						   }else{
						   alert("此人员与用户表有关联，删除失败");
						 }
					   }
					});
			    
			}
		});
	 });
	//
	function showView(id){
		var url ='employeeAction.do?method=view&name=${name}'+'&employee_id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&static_orgid=${static_orgid}'+'&viewFlag=true'+'&qempname='+$("input[name='qempname']").val()+'&qempcode='+$("input[name='qempcode']").val()+'&qsex='+$("[name='qsex']").val();
		commonUrl(url);
	} 
	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
</script>
</head>
 <content tag="heading">
组织员工信息管理
</content>  
<body > 
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
       <tr>
       	 <td valign="top" width="150px"> 
	          <div style="overflow: auto;width: 220px;">
					<script  type="text/javascript">
							//显示树
							var organizationTree = new dTree('organizationTree');
							organizationTree.setIconPath("${ctx}/scripts/dtree/");
							organizationTree.add('-1',-99,'组织结构树','${ctx}/employeeAction.do?method=list&static_orgid=-1');
							<c:forEach items="${employeestree}" var="organization">
									<c:if test = "${organization.parent_id == '-1'}">
										organizationTree.add('${organization.f_id}','${organization.parent_id}','${organization.f_name}','${ctx}/employeeAction.do?method=list&static_fno=${organization.f_no}&static_orgid=${organization.f_id}');
									</c:if>
									<c:if test="${organization.parent_id != '-1'}" >
										organizationTree.add('${organization.f_id}','${organization.parent_id}','${organization.f_name}(${organization.employeecount})','${ctx}/employeeAction.do?method=list&static_fno=${organization.f_no}&static_orgid=${organization.f_id}');
									</c:if>
							</c:forEach>
							document.write(organizationTree);
							organizationTree.openAll();
							
						
						</script>
				</div>
		 </td>
         <td valign="top">
	          <table class="queryTable" >
					<tr>
						<td class="queryTitle">
							<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td>
							<html:form action="employeeAction.do?method=list" method="POST">
								<input type="hidden" value="${param.static_orgid}" name="static_orgid">
								<input type="hidden" value="${param.static_fno}" name="static_fno">
								<input type="hidden" value="${name}" name="name">
								<table class="queryContentTable">
									<tr>
										<td>
											工号：&nbsp;&nbsp;
										</td>
										<td>
											<html:text property="qempcode" size="20" styleClass="inputText"/>
										</td>
										<td>
											姓名：&nbsp;&nbsp;
										</td>
										<td>
											<html:text property="qempname" size="20" styleClass="inputText"/>
										</td>
									
										<td>
											性别：&nbsp;&nbsp;
										</td>
										<td>
											<html:select property="qsex" >
												<html:option value="">请选择</html:option>
												<html:option value="0">女</html:option>
												<html:option value="1">男</html:option>
											</html:select>
										</td>
										<td><input type="submit" id="btn_query" icon="icon_query" value="查 询" /></td>
									</tr>
								</table>
							</html:form>
						</td>
					</tr>
				</table>
				<br/>
				<div class="promptDiv">
		          <span class="keyInfoSpan">当前节点:${name}</span>
		       </div>	
				<div class="promptDiv">
					<input type="button" id="btn_add"  icon="icon_add"  value="${texts['button.new']}"/>
					<input type="button"  icon="icon_view"  id="btn_view"  value="${texts['button.detail']}"/>
			        <input type="button"  icon="icon_edit"  id="btn_edit"  value="${texts['button.edit']}"/>
			        <input type="button"  icon="icon_delete" id="btn_delete" value="${texts['button.delete']}"/>
				</div>
				<ec:table items="employees" var="employee"
						action="employeeAction.do?method=list" title=""  locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
						<ec:row highlightRow="true" onclick="pullValue('${employee.employee_id}');"
							ondblclick="showView('${employee.employee_id}')"
						>
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
							<ec:column property="null" sortable="false" title="选择" width="6%">
								<input name="select_id" value="${employee.employee_id}" type="radio"/>
							</ec:column>
							
							<ec:column property="employee_name" title="姓名" />
							<ec:column property="employee_sex" title="性别" >
								<c:if test="${employee.employee_sex=='0'}">女</c:if>
								<c:if test="${employee.employee_sex=='1'}">男</c:if>
							</ec:column>
							<ec:column property="null" title="所属组织"   width="15%">
								${employee.e_org.f_name}
							</ec:column>	
							<ec:column property="employee_politicaltype" title="手机号码" />
							<ec:column property="emailaddress" title="邮件地址" />
						</ec:row>
					</ec:table>
					</td>
		</tr>
	</table>
			
  </body>
</html:html>

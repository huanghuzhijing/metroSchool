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
       		location.href='employeeExtendAction.do?method=create&qempname='+$("input[name='qempname']").val()+'&qempcode='+$("input[name='qempcode']").val()+'&qsex='+$("[name='qsex']").val()+'&qsex='+$("[name='qe_org']").val()+'&ec_crd='+$("[name='ec_rd']").val();
       });
       //详细
		$("#btn_view").click(function(){ 
			showView(oper_id);
		}); 	  
       //修改
		$("#btn_edit").click(function(){ 
			var url="employeeExtendAction.do?method=edit&employee_id="+oper_id+"&ec_p="+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qempname='+$("input[name='qempname']").val()+'&qempcode='+$("input[name='qempcode']").val()+'&qsex='+$("[name='qsex']").val()+'&qsex='+$("[name='qe_org']").val();
			commonUrl(url);
		});	            
       //删除
		$("#btn_delete").click(function(){ 
			//if(window.confirm("将删除该员工信息在用户管理、用户组员工管理、员工项目配置中的关联信息")){
			if(window.confirm("是否确认删除？")){
			 $.ajax({
					   type: "POST",
					   url: "${ctx}/employeeExtendAction.do?method=validateDelete",
					   data: "employeeid="+oper_id,
					   success: function(msg){
					   	   if(msg=='yes'){
						   var url="employeeExtendAction.do?method=delete&employee_id="+oper_id;
					       commonUrl(url);
						   }else{
						   alert("此人员与用户表有关联，删除失败");
						 }
					   }
					});
			    
			}
		});
		 $("#selectCorp").click(function(){ 
	        var url ="organizationOutAction.do?method=selectCorp";
			art.dialog({id:'commonDialog1',title:'单位选择', iframe:url, width:'800', height:'400',top:'30'});
		});
		//	 
	 });
	//
	function showView(id){
		var url ='employeeExtendAction.do?method=view'+'&employee_id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&viewFlag=true'+'&qempname='+$("input[name='qempname']").val()+'&qempcode='+$("input[name='qempcode']").val()+'&qsex='+$("[name='qsex']").val()+'&qsex='+$("[name='qe_org']").val();
		commonUrl(url);
	} 
	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
	function fileClear(){
			 $("[name='qe_org']").val("");
		}
</script>
</head>
<content tag="heading">
参建单位员工管理
</content>
<body > 
         <td valign="top">
	          <table class="queryTable" >
					<tr>
						<td class="queryTitle">
							<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td>
							<html:form action="employeeExtendAction.do?method=list" method="POST">
								<input type="hidden" value="${param.static_orgid}" name="static_orgid">
								<input type="hidden" value="${param.static_fno}" name="static_fno">
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
										<br/>
										<td>
											工作单位：&nbsp;&nbsp;
										</td>
										<td>
											<html:text property="qe_org" size="20" styleClass="inputText"/>
											<input type="button" id="selectCorp" icon="icon_query" value="选择" />
											<input type="button" id="clear" icon="icon_query" value="清空" onclick="fileClear()"/>
										</td>
										<td><input type="submit" id="btn_query" icon="icon_query" value="查 询" /></td>
									</tr>
								</table>
							</html:form>
						</td>
					</tr>
				</table>
			
				<div class="promptDiv">
					<input type="button" id="btn_add"  icon="icon_add"  value="${texts['button.new']}"/>
					<input type="button"  icon="icon_view"  id="btn_view"  value="${texts['button.detail']}"/>
			        <input type="button"  icon="icon_edit"  id="btn_edit"  value="${texts['button.edit']}"/>
			        <input type="button"  icon="icon_delete" id="btn_delete" value="${texts['button.delete']}"/>
				</div>
				<ec:table items="employees" var="employee"
						action="employeeExtendAction.do?method=list" title=""  locale="zh_CN"
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
							<ec:column property="null" title="所属组织" width="15%">
								${employee.e_org.f_name}
							</ec:column>	
							<ec:column property="e_org.f_name" title="工作岗位" />
							<ec:column property="employee_politicaltype" title="手机号码" />
							<ec:column property="emailaddress" title="邮件地址" />
						</ec:row>
					</ec:table>
			
  </body>
</html:html>

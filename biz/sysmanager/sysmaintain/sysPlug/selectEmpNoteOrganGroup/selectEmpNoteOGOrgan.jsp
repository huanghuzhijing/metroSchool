<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
	<script type="text/javascript">
	//加载
	$(document).ready(function(){
		  	//
			var plug_empIds=parent.$("#plug_organ_empIds").val(); 
			var plug_empNames=parent.$("#plug_organ_empNames").val();
			var plug_organNames=parent.$("#plug_organ_organNames").val();
			$.each($("#select1 option"), function(j, objTwo){
		  		if(plug_empIds.indexOf(","+$(this).val()+",")>-1){
	        		$(this).remove();
	        	}
		  	});
			$("#select2").html($("#plug_organSelect",parent.document).html());
			//
		  //移到右边
		   $('#add').click(function() {
		   		$.each( $("#select1 option:selected"), function(i, obj){
		        	if(plug_empIds==""){
						plug_empIds=","+$(this).val()+",";
					}else{
						plug_empIds=plug_empIds+$(this).val()+",";
					}
					if(plug_organNames==""){
						plug_organNames=","+$(this).attr("dept")+",";
					}else{
						plug_organNames=plug_organNames+$(this).attr("dept")+",";
					}
					if(plug_empNames==""){
						plug_empNames=","+$(this).attr("userName")+",";
					}else{
						plug_empNames=plug_empNames+$(this).attr("userName")+",";
					}
					parent.$("#plug_organ_empIds").val(plug_empIds.replaceAll(' ',''));
				    parent.$("#plug_organ_empNames").val(plug_empNames.replaceAll(' ',''));
				    parent.$("#plug_organ_organNames").val(plug_organNames.replaceAll(' ',''));
				    var id=$(this).val();
				    var name=$(this).attr("userName");
				    var dept=$(this).attr("dept");
				    parent.$("#plug_organSelect").append('<option value="'+id+'" userName="'+name+'" dept="'+dept+'">'+name+'</option>');
				});
				$("#select2").append($("#select1 option:selected"));
				$("#select1 option:selected").remove();
		   });
		   //移到左边
		   $('#remove').click(function() {
		   		$.each( $("#select2 option:selected"), function(i, obj){
				    plug_empIds=plug_empIds.replace(","+$(this).val()+",",",");
				    plug_empNames=plug_empNames.replace(","+$(this).attr("userName").replaceAll(' ','')+",",",");
					plug_organNames=plug_organNames.replace(","+$(this).attr("dept")+",",",");
					parent.$("#plug_organ_empIds").val(plug_empIds.replaceAll(' ',''));
				   	parent.$("#plug_organ_empNames").val(plug_empNames.replaceAll(' ',''));
				    parent.$("#plug_organ_organNames").val(plug_organNames.replaceAll(' ',''));
				    $.each($("#plug_organSelect option",parent.document), function(j, objTwo){
				  		if($(this).val()==obj.value){
				  			$(this).remove();
				  		}
				  	});
				  	$(this).remove();
				  	if(isAppendTo($(this).val())){
				  		$(this).appendTo('#select1');
				  	}
			  	});
		   });
		   //全部移到右边
		  $('#add_all').click(function() {
		  		 $.each( $("#select1 option"), function(i, obj){
		        	if(plug_empIds==""){
						plug_empIds=","+$(this).val()+",";
					}else{
						plug_empIds=plug_empIds+$(this).val()+",";
					}
					if(plug_organNames==""){
						plug_organNames=","+$(this).attr("dept")+",";
					}else{
						plug_organNames=plug_organNames+$(this).attr("dept")+",";
					}
					if(plug_empNames==""){
						plug_empNames=","+$(this).attr("userName")+",";
					}else{
						plug_empNames=plug_empNames+$(this).attr("userName")+",";
					}
					parent.$("#plug_organ_empIds").val(plug_empIds.replaceAll(' ',''));
				    parent.$("#plug_organ_empNames").val(plug_empNames.replaceAll(' ',''));
				    parent.$("#plug_organ_organNames").val(plug_organNames.replaceAll(' ',''));
				    var id=$(this).val();
				    var name=$(this).attr("userName");
				    var dept=$(this).attr("dept");
				    parent.$("#plug_organSelect").append('<option value="'+id+'" userName="'+name+'" dept="'+dept+'">'+name+'</option>');
				});
				$('#select1 option').remove().appendTo('#select2');
		   });
		   //全部移到左边
		  $('#remove_all').click(function() {
		  		$.each( $("#select2 option"), function(i, obj){
				    plug_empIds=plug_empIds.replace(","+$(this).val()+",",",");
				    plug_empNames=plug_empNames.replace(","+$(this).attr("userName")+",",",");
					plug_organNames=plug_organNames.replace(","+$(this).attr("dept")+",",",");
					parent.$("#plug_organ_empIds").val(plug_empIds.replaceAll(' ',''));
				    parent.$("#plug_organ_empNames").val(plug_empNames.replaceAll(' ',''));
				    parent.$("#plug_organ_organNames").val(plug_organNames.replaceAll(' ',''));
				    $.each($("#plug_organSelect option",parent.document), function(j, objTwo){
				  		if($(this).val()==obj.value){
				  			$(this).remove();
				  		}
				  	});
				  	$(this).remove();
				  	if(isAppendTo($(this).val())){
				  		$(this).appendTo('#select1');
				  	}
			  	});
		   });
	       //双击选项
		  $('#select1').dblclick(function(){ //绑定双击事件
		        $.each( $("option:selected",this), function(i, obj){
		        	if(plug_empIds==""){
						plug_empIds=","+$(this).val()+",";
					}else{
						plug_empIds=plug_empIds+$(this).val()+",";
					}
					if(plug_organNames==""){
						plug_organNames=","+$(this).attr("dept")+",";
					}else{
						plug_organNames=plug_organNames+$(this).attr("dept")+",";
					}
					if(plug_empNames==""){
						plug_empNames=","+$(this).attr("userName")+",";
					}else{
						plug_empNames=plug_empNames+$(this).attr("userName")+",";
					}
					parent.$("#plug_organ_empIds").val(plug_empIds.replaceAll(' ',''));
				    parent.$("#plug_organ_empNames").val(plug_empNames.replaceAll(' ',''));
				    parent.$("#plug_organ_organNames").val(plug_organNames.replaceAll(' ',''));
				    var id=$(this).val();
				    var name=$(this).attr("userName");
				    var dept=$(this).attr("dept");
				    parent.$("#plug_organSelect").append('<option value="'+id+'" userName="'+name+'" dept="'+dept+'">'+name+'</option>');
				});
				$("option:selected",this).remove().appendTo("#select2");
		   });
		   //双击选项
	      $('#select2').dblclick(function(){
	      	  $.each( $("#select2 option:selected"), function(i, obj){
				    plug_empIds=plug_empIds.replace(","+$(this).val()+",",",");
				    plug_empNames=plug_empNames.replace(","+$(this).attr("userName").replaceAll(' ','')+",",",");
					plug_organNames=plug_organNames.replace(","+$(this).attr("dept")+",",",");
					parent.$("#plug_organ_empIds").val(plug_empIds.replaceAll(' ',''));
				    parent.$("#plug_organ_empNames").val(plug_empNames.replaceAll(' ',''));
				    parent.$("#plug_organ_organNames").val(plug_organNames.replaceAll(' ',''));
				    $.each($("#plug_organSelect option",parent.document), function(j, objTwo){
				  		if($(this).val()==obj.value){
				  			$(this).remove();
				  		}
				  	});
				  	$(this).remove();
				  	if(isAppendTo($(this).val())){
				  		$(this).appendTo('#select1');
				  	}
			  });
		   });
		   //保存
		  $('#btn_save').click(function(){
			 	if(plug_empIds==""||plug_empIds==","){
			 		alert("请至少选择一条记录！");
			 	}else{
			 		$("#plug_empIds",parent.document).val(plug_empIds.replaceAll(' ',''));
		     		$("#plug_empNames",parent.document).val(plug_empNames.replaceAll(' ',''));
		     		$("#plug_organNames",parent.document).val(plug_organNames.replaceAll(' ',''));
		     		$("#plug_trueSelect",parent.document).html($("#plug_organSelect",parent.document).html());
		     		parent.art.dialog({id:'commonDialog1'}).close();
			 	}
		   });
		   //
		   $("#select_organ").click(function() {
		   		$("#select_organ").attr("checked","checked");
		   		$("#select_group").attr("checked","");
				$("#select_corp").attr("checked","");
				location.href="employeeAction.do?method=selectEmpNoteOGOrgan&deptFlag=${param.deptFlag}";	
		   });
		   //
		   $("#select_group").click(function() {
		   		$("#select_organ").attr("checked","");
		   		$("#select_group").attr("checked","checked");
				$("#select_corp").attr("checked","");
		     		parent.$("#plug_group_empIds").val(plug_empIds.replaceAll(' ',''));
					parent.$("#plug_group_empNames").val(plug_empNames.replaceAll(' ',''));
					parent.$("#plug_group_organNames").val(plug_organNames.replaceAll(' ',''));
					parent.$("#plug_groupSelect").html($("#plug_organSelect",parent.document).html());
				location.href="employeeAction.do?method=selectEmpNoteOGGroup&deptFlag=${param.deptFlag}";
		   });
		   //
		   $("#select_corp").click(function() {
		   		$("#select_organ").attr("checked","");
		   		$("#select_group").attr("checked","");
				$("#select_corp").attr("checked","checked");
				location.href="employeeAction.do?method=selectEmpNoteOGCCorp&deptFlag=${param.deptFlag}";
		   });
		   //
		   $("#btn_close").click(function(){
			   $("#plug_empIds",parent.document).val(plug_empIds.replaceAll(' ',''));
	     		$("#plug_empNames",parent.document).val(plug_empNames.replaceAll(' ',''));
	     		$("#plug_organNames",parent.document).val(plug_organNames.replaceAll(' ',''));
	     		$("#plug_trueSelect",parent.document).html($("#plug_organSelect",parent.document).html());
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
	});
	//跳转
	function forwardsave(){
	}
	//是否转移
	function isAppendTo(id){
		var isAppend=false;
		<c:forEach items="${employees}" var="employee">
	       var employeeId='${employee.id}';
	       if(employeeId==id)isAppend=true;
		</c:forEach>
		return isAppend;
	}
</script>
</head>
<body >
	<div class="listButtonDiv">
		<input id="select_organ" type="radio"  value="1" checked="checked" >按组织选择
		<input id="select_group" type="radio"  value="2" >按用户组选择	
	</div>
	<fieldset>
	<legend>人员选择</legend>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" width="160px">
					<div style="width: 160px;text-align:left">
							<script language='javascript'>
							//显示树
							var organizationTree = new dTree('organizationTree');
							organizationTree.setIconPath("${ctx}/scripts/dtree/");
							//orgaizeationTree.setIconPath("${ctx}/js/dtree/");
							organizationTree.add('-1',-99,'组织树','${ctx}/employeeAction.do?method=selectEmpNoteOGOrgan&deptFlag=${param.deptFlag}');
							<c:forEach items="${employeestree}" var="organization">
						       <c:if test="${organization.parentid==-1}">
						         organizationTree.add('${organization.id}','${organization.parentid}','${organization.organname}','${ctx}/employeeAction.do?method=selectEmpNoteOGOrgan&deptFlag=${param.deptFlag}','','','','');
						       </c:if>
						       <c:if test="${organization.parentid!=-1}">
								organizationTree.add('${organization.id}','${organization.parentid}','${organization.organname}(${organization.employeecount})','${ctx}/employeeAction.do?method=selectEmpNoteOGOrgan&static_enodecode=${organization.nodecode}&query=query&parentid=${organization.id}&deptFlag=${param.deptFlag}','','','','');
						       </c:if>
							</c:forEach>
							document.write(organizationTree);
					        organizationTree.openAll();
							</script>
					</div>
				</td>
				
				<td valign="top">
					<table style="margin-left: 5px;margin-right: 5px" width="100%"  border="0" cellspacing="0" cellpadding="0">
							<html:hidden property="selflag" value="${selflag}"/>
							<tr>
								<td>
									<fieldset>
										<legend>
											<strong>&nbsp;[查询条件]&nbsp;</strong>
										</legend>
										<div>
											<html:form
												action="employeeAction.do?method=selectEmpNoteOGOrgan&deptFlag=${param.deptFlag}">
						                           员工姓名：<html:text property="qempname" styleClass="inputText" size="10"/>&nbsp;&nbsp;
												<input type="submit" value="<fmt:message key="button.query"/>"
													 icon="icon_query" />
											</html:form>
										</div>
									</fieldset>
								</td>
							</tr>
							<tr>
							 <td colspan="2">
							     <table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="center">
												<font size=2 color="red">【人员信息】</font>
											</td>
											<td>
												&nbsp;
											</td>
											<td align="center">
												<font size=2 color="red">【办理人】</font>
											</td>
										</tr>
										<tr>
											
											<td width="45%" height="240px"  align="center" valign="top">
												<select name="employee" id="select1" size="15" style="width: 100px;height:240px" multiple>
													<c:forEach items="${employees}" var="employee">
															<option value="${employee.id}" userName="${employee.empname}" dept="<ex:orgDisplay id='${employee.organid}'/>">
																${employee.empname}
															</option>
													</c:forEach>
												</select>
											</td>
											<td width="10%" align="center" valign="top">
																<br>
														<br>
														<br>
														<input id="add" type="button" icon="icon_rightArrow" value="添加" />
														<br>
															<input id="remove" type="button" icon="icon_leftArrow" value="删除"/>
														<br>
														<br>
														<input type="button" id="add_all" icon="icon_doubleRightArrow" value="全选"  />
														<br>
														<input id="remove_all" type="button" icon="icon_doubleLeftArrow" value="全删" />
														<br>
														<br>
												</td>
												<td width="45%" height="240px"   align="center" valign="top">
												  <select multiple id="select2" style="width: 100px;height:240px"></select>
												</td>
										</tr>
							     </table>
							 </td>
							</tr>
						</table>
				</td>         
	         </tr>
		</table>
	</fieldset>
	<div class="saveDiv">
		<input id="btn_save" type="button"   value="确  定" icon="icon_save" />
		<input id="btn_close" type="button"  value="${texts['button.close']}" icon="icon_close" />
	</div>
</body>
</html>

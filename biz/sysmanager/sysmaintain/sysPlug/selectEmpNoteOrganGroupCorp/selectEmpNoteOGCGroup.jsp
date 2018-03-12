<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>

<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
	<script type="text/javascript">
	//加载
	$(document).ready(function(){
		  //
			var plug_empIds=parent.$("#plug_group_empIds").val(); 
			var plug_empNames=parent.$("#plug_group_empNames").val();
			var plug_organNames=parent.$("#plug_group_organNames").val();
			$.each($("#select1 option"), function(j, objTwo){
		  		if(plug_empIds.indexOf(","+$(this).val()+",")>-1){
	        		$(this).remove();
	        	}
		  	});
			$("#select2").html($("#plug_groupSelect",parent.document).html());
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
					parent.$("#plug_group_empIds").val(plug_empIds);
				    parent.$("#plug_group_empNames").val(plug_empNames);
				    parent.$("#plug_group_organNames").val(plug_organNames);
				    var id=$(this).val();
				    var name=$(this).attr("userName");
				    var dept=$(this).attr("dept");
				    parent.$("#plug_groupSelect").append('<option value="'+id+'" userName="'+name+'" dept="'+dept+'">'+name+'</option>');
				});
				$("#select2").append($("#select1 option:selected"));
				$("#select1 option:selected").remove();
		   });
		   //移到左边
		   $('#remove').click(function() {
		   		$.each( $("#select2 option:selected"), function(i, obj){
				    plug_empIds=plug_empIds.replace(","+$(this).val()+",",",");
				    plug_empNames=plug_empNames.replace(","+$(this).attr("userName")+",",",");
					plug_organNames=plug_organNames.replace(","+$(this).attr("dept")+",",",");
					parent.$("#plug_group_empIds").val(plug_empIds);
				   	parent.$("#plug_group_empNames").val(plug_empNames);
				    parent.$("#plug_group_organNames").val(plug_organNames);
				    $.each($("#plug_groupSelect option",parent.document), function(j, objTwo){
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
					parent.$("#plug_group_empIds").val(plug_empIds);
				    parent.$("#plug_group_empNames").val(plug_empNames);
				    parent.$("#plug_group_organNames").val(plug_organNames);
				    var id=$(this).val();
				    var name=$(this).attr("userName");
				    var dept=$(this).attr("dept");
				    parent.$("#plug_groupSelect").append('<option value="'+id+'" userName="'+name+'" dept="'+dept+'">'+name+'</option>');
				});
				$('#select1 option').remove().appendTo('#select2');
		   });
		   //全部移到左边
		  $('#remove_all').click(function() {
		  		$.each( $("#select2 option"), function(i, obj){
				    plug_empIds=plug_empIds.replace(","+$(this).val()+",",",");
				    plug_empNames=plug_empNames.replace(","+$(this).attr("userName")+",",",");
					plug_organNames=plug_organNames.replace(","+$(this).attr("dept")+",",",");
					parent.$("#plug_group_empIds").val(plug_empIds);
				    parent.$("#plug_group_empNames").val(plug_empNames);
				    parent.$("#plug_group_organNames").val(plug_organNames);
				    $.each($("#plug_groupSelect option",parent.document), function(j, objTwo){
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
					parent.$("#plug_group_empIds").val(plug_empIds);
				    parent.$("#plug_group_empNames").val(plug_empNames);
				    parent.$("#plug_group_organNames").val(plug_organNames);
				    var id=$(this).val();
				    var name=$(this).attr("userName");
				    var dept=$(this).attr("dept");
				    parent.$("#plug_groupSelect").append('<option value="'+id+'" userName="'+name+'" dept="'+dept+'">'+name+'</option>');
				});
				$("option:selected",this).remove().appendTo("#select2");
		   });
		   //双击选项
	      $('#select2').dblclick(function(){
	      	  $.each( $("#select2 option:selected"), function(i, obj){
				    plug_empIds=plug_empIds.replace(","+$(this).val()+",",",");
				    plug_empNames=plug_empNames.replace(","+$(this).attr("userName")+",",",");
					plug_organNames=plug_organNames.replace(","+$(this).attr("dept")+",",",");
					parent.$("#plug_group_empIds").val(plug_empIds);
				    parent.$("#plug_group_empNames").val(plug_empNames);
				    parent.$("#plug_group_organNames").val(plug_organNames);
				    $.each($("#plug_groupSelect option",parent.document), function(j, objTwo){
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
			 		$("#plug_empIds",parent.document).val(plug_empIds);
		     		$("#plug_empNames",parent.document).val(plug_empNames);
		     		$("#plug_organNames",parent.document).val(plug_organNames);
		     		$("#plug_trueSelect",parent.document).html($("#plug_groupSelect",parent.document).html());
		     		parent.art.dialog({id:'commonDialog1'}).close();
			 	}
		   });
		    //
		   $("#select_organ").click(function() {
		   		$("#select_organ").attr("checked","checked");
		   		$("#select_group").attr("checked","");
				$("#select_corp").attr("checked","");
				location.href="employeeAction.do?method=selectEmpNoteOGCOrgan";	
		   });
		   //
		   $("#select_group").click(function() {
		   		$("#select_organ").attr("checked","");
		   		$("#select_group").attr("checked","checked");
				$("#select_corp").attr("checked","");
				location.href="employeeAction.do?method=selectEmpNoteOGCGroup";
		   });
		   //
		   $("#select_corp").click(function() {
		   		$("#select_organ").attr("checked","");
		   		$("#select_group").attr("checked","");
				$("#select_corp").attr("checked","checked");
				location.href="employeeAction.do?method=selectEmpNoteOGCCorp";
		   });
		   //
		   $("#btn_close").click(function(){
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
		<input id="select_organ" type="radio"  value="1"  >按组织选择
		<input id="select_group" type="radio"  value="2" checked="checked" >按用户组选择	
		<input id="select_corp" type="radio"  value="3" >按参建单位选择	
	</div>
	<fieldset>
	<legend>人员选择</legend>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
				<div style="width: 160px;text-align:left">
					<script language='javascript'>
							//显示树
							var organizationTree = new dTree('organizationTree');
							organizationTree.setIconPath("${ctx}/scripts/dtree/");
							organizationTree.add('-1',-99,'用户组树','${ctx}/employeeAction.do?method=selectEmpNoteOGCGroup');
							<c:forEach items="${userGroupsTree}" var="userGroup">
								organizationTree.add('${userGroup.id}','-1','${userGroup.usergroupname}','employeeAction.do?method=selectEmpNoteOGCGroup&poidid=${userGroup.id}','','','','');
							</c:forEach>
							document.write(organizationTree);
							organizationTree.openAll();
						</script>
				</div>
			</td>
			<td valign="top">
				<table style="margin-left: 5px;margin-right: 5px" width="100%" border="0" cellspacing="0" cellpadding="0">
					<html:hidden property="selflag" value="${selflag}"/>
					<tr>
						<td>
							<fieldset>
								<legend>
									<strong>&nbsp;[查询条件]&nbsp;</strong>
								</legend>
								<div>
									<html:form
										action="employeeAction.do?method=selectEmpNoteOGCGroup">
				                           员工姓名：<html:text property="qempname"  styleClass="inputText" size="10"/>&nbsp;&nbsp;
										<input type="submit" value="<fmt:message key="button.query"/>"
											class="button1" icon="icon_query"/>
									</html:form>
								</div>
							</fieldset>
						</td>
					</tr>
					 <tr>
					 <td colspan="2">
					     <table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
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
									<td width="45%" height="250" align="center" valign="top">
										<select id="select1" name="employee"  size="15" style="width: 100px;height:240px" multiple>
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
									<td width="45%" height="150" align="center" valign="top">
										 <select  id="select2" style="width: 100px;height:240px" multiple></select>
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
</html:html>

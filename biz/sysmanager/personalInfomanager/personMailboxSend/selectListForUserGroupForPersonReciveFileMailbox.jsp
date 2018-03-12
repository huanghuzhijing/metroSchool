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
			var ids=parent.$("#tpIds").val(); 
			var names=parent.$("#tpTotransActor").val();
			var depts=parent.$("#tpTotransactDept").val();
			$.each($("#select1 option"), function(j, objTwo){
		  		if(ids.indexOf(","+$(this).val()+",")>-1){
	        		$(this).remove();
	        	}
		  	});
			$("#select2").html($("#parentNextSelect",parent.document).html());
			//
		  //移到右边
		   $('#add').click(function() {
		   		$.each( $("#select1 option:selected"), function(i, obj){
		        	if(ids==""){
						ids=","+$(this).val()+",";
					}else{
						ids=ids+$(this).val()+",";
					}
					if(depts==""){
						depts=","+$(this).attr("dept")+",";
					}else{
						depts=depts+$(this).attr("dept")+",";
					}
					if(names==""){
						names=","+$(this).attr("userName")+",";
					}else{
						names=names+$(this).attr("userName")+",";
					}
					parent.$("#tpIds").val(ids);
				    parent.$("#tpTotransActor").val(names);
				    parent.$("#tpTotransactDept").val(depts);
				    var id=$(this).val();
				    var name=$(this).attr("userName");
				    var dept=$(this).attr("dept");
				    parent.$("#parentNextSelect").append('<option value="'+id+'" userName="'+name+'" dept="'+dept+'">'+name+'</option>');
				});
				$("#select2").append($("#select1 option:selected"));
				$("#select1 option:selected").remove();
		   });
		   //移到左边
		   $('#remove').click(function() {
		   		$.each( $("#select2 option:selected"), function(i, obj){
				    ids=ids.replace(","+$(this).val()+",",",");
				    names=names.replace(","+$(this).attr("userName")+",",",");
					depts=depts.replace(","+$(this).attr("dept")+",",",");
					parent.$("#tpIds").val(ids);
				   	parent.$("#tpTotransActor").val(names);
				    parent.$("#tpTotransactDept").val(depts);
				    $.each($("#parentNextSelect option",parent.document), function(j, objTwo){
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
		        	if(ids==""){
						ids=","+$(this).val()+",";
					}else{
						ids=ids+$(this).val()+",";
					}
					if(depts==""){
						depts=","+$(this).attr("dept")+",";
					}else{
						depts=depts+$(this).attr("dept")+",";
					}
					if(names==""){
						names=","+$(this).attr("userName")+",";
					}else{
						names=names+$(this).attr("userName")+",";
					}
					parent.$("#tpIds").val(ids);
				    parent.$("#tpTotransActor").val(names);
				    parent.$("#tpTotransactDept").val(depts);
				    var id=$(this).val();
				    var name=$(this).attr("userName");
				    var dept=$(this).attr("dept");
				    parent.$("#parentNextSelect").append('<option value="'+id+'" userName="'+name+'" dept="'+dept+'">'+name+'</option>');
				});
				$('#select1 option').remove().appendTo('#select2');
		   });
		   //全部移到左边
		  $('#remove_all').click(function() {
		  		$.each( $("#select2 option"), function(i, obj){
				    ids=ids.replace(","+$(this).val()+",",",");
				    names=names.replace(","+$(this).attr("userName")+",",",");
					depts=depts.replace(","+$(this).attr("dept")+",",",");
					parent.$("#tpIds").val(ids);
				    parent.$("#tpTotransActor").val(names);
				    parent.$("#tpTotransactDept").val(depts);
				    $.each($("#parentNextSelect option",parent.document), function(j, objTwo){
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
		        	if(ids==""){
						ids=","+$(this).val()+",";
					}else{
						ids=ids+$(this).val()+",";
					}
					if(depts==""){
						depts=","+$(this).attr("dept")+",";
					}else{
						depts=depts+$(this).attr("dept")+",";
					}
					if(names==""){
						names=","+$(this).attr("userName")+",";
					}else{
						names=names+$(this).attr("userName")+",";
					}
					parent.$("#tpIds").val(ids);
				    parent.$("#tpTotransActor").val(names);
				    parent.$("#tpTotransactDept").val(depts);
				    var id=$(this).val();
				    var name=$(this).attr("userName");
				    var dept=$(this).attr("dept");
				    parent.$("#parentNextSelect").append('<option value="'+id+'" userName="'+name+'" dept="'+dept+'">'+name+'</option>');
				});
				$("option:selected",this).remove().appendTo("#select2");
		   });
		   //双击选项
	      $('#select2').dblclick(function(){
	      	  $.each( $("#select2 option:selected"), function(i, obj){
				    ids=ids.replace(","+$(this).val()+",",",");
				    names=names.replace(","+$(this).attr("userName")+",",",");
					depts=depts.replace(","+$(this).attr("dept")+",",",");
					parent.$("#tpIds").val(ids);
				    parent.$("#tpTotransActor").val(names);
				    parent.$("#tpTotransactDept").val(depts);
				    $.each($("#parentNextSelect option",parent.document), function(j, objTwo){
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
			 	if(ids==""||ids==","){
			 		alert("请至少选择一条记录！");
			 	}else{
			 		$("#ids",parent.document).val(ids);
		     		$("#totransActor",parent.document).val(names);
		     		$("#totransactDept",parent.document).val(depts);
		     		$("#parentTrueSelect",parent.document).html($("#parentNextSelect",parent.document).html());
		     		parent.art.dialog({id:'commonDialog1'}).close();
			 	}
		   });
		   //
		   $("#select_organ").click(function() {
		   		//$("#ids",parent.document).val("");
		     	//$("#totransActor",parent.document).val("");
		     	//$("#totransactDept",parent.document).val("");
		   		//$("#tempIds",parent.document).val("");
		   		//$("#tempTotransActor",parent.document).val("");
		   		//$("#tempTotransactDept",parent.document).val("");
		   		//$("#parentSelect",parent.document).html("");
		   		//$("#tpIds",parent.document).val("");
		   		//$("#tpTotransActor",parent.document).val("");
		   		//$("#tpTotransactDept",parent.document).val("");
		   		//$("#parentNextSelect",parent.document).html("");
		   		if(document.getElementById("select_group").checked){
				     document.getElementById("select_group").checked = false;
				}
			    document.getElementById("select_organ").checked = true;
				location.href="employeeAction.do?method=selectListForPersonReceiveFileSend";	
		   });
		   //
		   $("#select_group").click(function() {
		   		if(document.getElementById("select_organ").checked){
				   document.getElementById("select_organ").checked = false;
				}
				document.getElementById("select_group").checked = true;
				location.href="employeeAction.do?method=selectListForUserGroupForPersonReciveFileMailbox";
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
							organizationTree.add('-1',-99,'用户组树','${ctx}/employeeAction.do?method=selectListForUserGroupForPersonReciveFileMailbox');
							<c:forEach items="${userGroupsTree}" var="userGroup">
								organizationTree.add('${userGroup.id}','-1','${userGroup.usergroupname}','employeeAction.do?method=selectListForUserGroupForPersonReciveFileMailbox&poidid=${userGroup.id}','','','','');
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
										action="employeeAction.do?method=selectListForUserGroupForPersonReciveFileMailbox">
				                           员工姓名：<html:text property="qempname"  styleClass="inputText" size="10"/>&nbsp;&nbsp;
				                           职务：<html:text property="specialtecid"   styleClass="inputText" size="10"/>&nbsp;&nbsp;    
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
										<select id="select1" name="employee"  size="15" style="width: 100px" multiple>
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
														<input id="add" type="button" class="button1" value="添加>&nbsp;&nbsp;&nbsp;" />
														<br>
														<br>
															<input id="remove" type="button" class="button1"
																	value="删除<  "/>
														<br>
														<br>
														<br>
														<input type="button" id="add_all" class="button1" value="全选>>  "  />
														<br>
														<input id="remove_all" type="button" class="button1" value="全删<<  " />
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
		<input id="btn_save" type="button"   value="${texts['button.save']}" icon="icon_save" />
		<input id="btn_close" type="button"  value="${texts['button.close']}" icon="icon_close" />
	</div>
</body>
</html:html>

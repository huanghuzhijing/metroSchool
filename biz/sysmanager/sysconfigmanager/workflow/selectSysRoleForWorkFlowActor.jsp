<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
		    var index = '';
			var roleId = '';
			if(${param.flag=='os'}){
				roleId= parent.document.getElementById("roleorman_value").value;
			}else{
				index = $("#index").val();
				roleId=parent.$("#actRoleIds"+index).val();
			}
			if(roleId!=''){
				$("input[type=radio][name='select_id'][value='"+roleId+"']").attr("checked","checked") ;
			}  
			 $("#select_acror").click(function(){
			  var flag=false;
			   	 var operId= $("input[type=radio][name='select_id'][checked]").attr("value");
			   	 var roleName=$("input[type=radio][name='select_id'][checked]").attr("paramName");
			 if(${param.flag=='os'}){
			   	 parent.document.getElementById("roleorman_value").value=operId;
			 	 parent.document.getElementById("roleorman_name").value=roleName;
			 	   parent.art.dialog({id:'commonDialog1'}).close();
			 }else{
			    
			   	 var actRoles= parent.$("#actRoles"+index);
			   	 var actRoleIds= parent.$("#actRoleIds"+index);
			   	 var actors= parent.$("#actors"+index);
			   	 var actorIds= parent.$("#actorIds"+index);
			   	 $("input[type=radio][name='select_id'][checked]").each(function(){
			   		 flag=true;
			   	 })
			  	 if(flag){
			   		  $.ajax({
						   type: "POST",
						   url: "${ctx}/workFlowAction.do?method=actsByRoleId&role_id="+operId,		
						   success: function(msg){
						   // alert(msg);
							   if(msg!=''){
							     var values=msg.split("@@");
							     actRoles.val(roleName);
							     actRoleIds.val(operId);
							     actorIds.val(values[0]);
							     actors.val(values[1]);
							   }
						   }
					  });
					       parent.art.dialog({id:'commonDialog1'}).close();
	            }else{
	               alert("请选择信息！");
	             }
			}
			        
			   })
	     });
	</script>
</head>
<body >
		<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="workFlowAction.do?method=choseActor&index=${param.index}&choose=${param.choose}">
					<table class="queryContentTable">
						<tr>
							<td >角  色  名：</td>
							<td><html:text property="qrolename" maxlength="25" styleClass="inputText"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
			<div class="listButtonDiv">
				<input type="button" class="button1" value="确  定" id="select_acror" />
				<input type="hidden" id="choose" value="${choose}">
				<input type="hidden" id="index" value="${index}">
			</div>
	<ec:table items="sysRoles" var="sysRole"
		action="workFlowAction.do?method=choseActor&index=${param.index}&choose=${param.choose}" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true">
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="10%"/>
		    <ec:column property="null" sortable="false" title="选择" width="10%">
					<input type="radio" name="select_id" value="${sysRole.id}" paramName="${sysRole.rolename}"/>
			</ec:column>
			<ec:column property="id" title="角色ID" />
			<ec:column property="rolename" title="角色名" />
		</ec:row>
	</ec:table>
</body>
</html:html>

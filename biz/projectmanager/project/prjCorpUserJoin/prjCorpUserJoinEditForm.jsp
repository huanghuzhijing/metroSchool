<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			$("#btn_save").click(function(){ 
				document.forms[0].submit();
			}); 
			//
			$("#btn_back").click(function(){ 
				history.back(-1);
			}); 
			//
			$("#btn_selectEmployeein").click(function(){
				if($("input[name='corptype']:checked").val()==1){
					alert("暂时不提供此功能！");
				}else{
					var url = "employeeAction.do?method=selectEmpsForSysOperator";
					art.dialog({id:'commonDialog1',title:'员工信息', iframe:url, width:'600', height:'400',top:'30'}).close(function(){
					});
				} 
			}); 
			//
			$("#btn_selectSysRole").click(function(){ 
				$("#roleIds").val($("#tempRoleIds").val());
				$("#roleNames").val($("#tempRoleNames").val());
				var url = "sysRoleAction.do?method=selectForSysOperator";
				art.dialog({id:'commonDialog1',title:'角色信息', iframe:url, width:'600', height:'400',top:'30'}).close(function(){
					$("#tempRoleIds").val($("#roleIds").val());
					$("#tempRoleNames").val($("#roleNames").val());
				});
			}); 
			//
		});
	</script>
</head>
<content tag="heading">
	${texts['sysOperator.sysOperatorList.content']}
</content>
<body >
	<html:form enctype="multipart/form-data" action="sysOperatorAction.do" method="POST">
		<input type="hidden" name="method" value="save">
		<html:hidden property="id" />
		<!--查询定位 开始-->
		<html:hidden property="sysOperatorList_page"  value="${param.sysOperatorList_page }"/>
		<html:hidden property="qusername"  value="${param.qusername }"/>
		<!--查询定位 结束-->
		<table class="titleTable" width="99%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="left" class="titleShow">
					&nbsp;[${texts['sysOperator.sysOperatorList.content']}]&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<table class="formTable" align="center" cellpadding="3" cellspacing="0">
					    <COLGROUP>
							<COL class="tr03" align="right" width="25%">
							<COL class="tr02"  width="75%">
						</COLGROUP>
					  <tr>
					    <td >${texts['sysOperator.sysOperatorList.qcroptype']}：&nbsp;&nbsp;</td>
					    <td >
							<html:radio property="corptype" value="0" >${texts['sysOperator.sysOperatorForm.incrop']}</html:radio>
							&nbsp;&nbsp;
							<html:radio property="corptype" value="1">${texts['sysOperator.sysOperatorForm.outcrop']}</html:radio>
						</td>
					  </tr>
					  <tr>
					    <td >${texts['sysOperator.sysOperatorList.qempname']}：<span class="redspan">*</span></td>
					    <td >
					    	<input id="empId" name="empId" type="hidden" value="${empId }">
					    	<input id="empName" value="${empName}" type="text" class="lineinput" 
					    		   readonly="readonly" maxlength="100" size="48">
							<input id="btn_selectEmployeein" value="${texts['sysOperator.button.selectEmployee']}" 
							       type="button"  class="button1"/>
						</td>
					  </tr>
					  <tr>
					    <td >${texts['sysOperator.sysOperatorList.qrolename']}：<span class="redspan">*</span></td>
					    <td >
					    	<input id="tempRoleIds" type="hidden" value="${roleIds }">
					    	<input id="tempRoleNames" type="hidden" value="${roleNames }">
					    	<input id="roleIds" name="roleIds" value="${roleIds }" type="hidden" >
					    	<input id="roleNames" value="${roleNames }" type="text" class="lineinput" 
					    		   readonly="readonly" maxlength="100" size="48">
							<input id="btn_selectSysRole" value="${texts['sysOperator.button.selectSysRole']}" 
							       type="button"  class="button1"/>
						</td>
					  </tr>		
					  <tr>
					    <td >${texts['sysOperator.sysOperatorList.qusername']}：<span class="redspan">*</span></td>
					    <td >
							<html:text property="username" styleClass="lineinput" readonly="true" maxlength="100" size="48"/>
							${texts['sysOperator.messages.msg01']}
						</td>
					  </tr>
					  <tr>
					    <td >${texts['sysOperator.sysOperatorForm.password']}：<span class="redspan">*</span></td>
					    <td >
					    	<html:password property="password"  size="48" styleClass="lineinput" maxlength="100"/>
					    </td>
					  </tr>
					</table>
				</td>
			</tr>
		</table>
		<div align="center" class="inputInfoDiv">
			${texts['label.page.recorder']}：${userinfo.empName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			${texts['label.page.recorddate']}：${now_date}
		</div>
		<div align="center">
			<div align="center" class="sbDiv">
				<input id="btn_save" type="button"  class="button1" value="${texts['button.save']}" />
				<input id="btn_back" type="button"  class="button1" value="${texts['button.back']}" />
			</div>
		</div>
	</html:form>
</body>
</html:html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	$(document).ready(function(){
		//
		var organtype='${organtype}';
   		if(organtype==2){
   			$("#tr01").show();
   		}else{
   			$("#tr01").hide();
   		}
		//返回
       $("#btn_back").click(function(){
       		location.href='employeeAction.do?method=list&static_orgid=${param.static_orgid}&name=${param.name}&qempcode=${param.qempcode}&qempname=${param.qempcode}&qsex=${param.qsex}';
       });
       	//验证自动编码重复性
		$("#codeBlur").blur(function(){ 
			 $.ajax({
					   type: "POST",
					   url: "${ctx}/employeeAction.do?method=test",
					   data: "code="+$("input[name='employee_code']").val(),
					   success: function(msg){
					   	   if(msg=='yes'){
					   	   alert('该工号已存在，请从新填写');
								 jQuery("#codeBlur").val("");
						   }
					   }
					});
		}); 
		  $("#selectOrg").click(function(){ 
	        var url ="employeeAction.do?method=selectOrg&static_orgid=${param.static_orgid}"+"&ec_p="+$("input[name='ec_p']").val();
			art.dialog({id:'commonDialog1',title:'选择部门', iframe:url, width:'800', height:'400',top:'30'});
		});
		//
       $("#btn_save").click(function(){
        $("[name='kind']").val("save");
			var properties=new Array(); 
			properties[0]=["employee_code","工号"];
			properties[1]=["employee_name","姓名"];
			saveValidateRequired("#btn_save",properties,"employeeForm");
		}); 
		//nextsave
		$("#nextsave").click(function(){
		  $("[name='kind']").val("next");
			var properties=new Array(); 
			properties[0]=["employee_code","工号"];
			properties[1]=["employee_name","姓名"];
			saveValidateRequired("#nextsave",properties,"employeeForm");
		});
	 });
	 //
	function setParamValue(organIds,organCodes,organNames){
		if(organIds!=""){
			$("[name='organIds']").val(organIds);
			$("[name='organNames']").val(formatStringComma(organNames));
		}
	}
	</script>
</head>
 <content tag="heading">
组织员工信息管理
</content>  
<body>
	<html:form action="employeeAction.do"  method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="static_orgid" value="${param.static_orgid}"/>
		<html:hidden property="name" value="${param.name}"/>
		<html:hidden property="kind"/>
		<fieldset >
			<legend>组织员工信息-新增</legend>
			<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								工&nbsp;&nbsp;&nbsp;&nbsp;号：<span class="redSpan">*</span>
							</td>
							<td>
								<input type="text"  name="employee_code"  id="codeBlur"/>
							</td>
							<td>
								姓&nbsp;&nbsp;&nbsp;&nbsp;名：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<html:text maxlength="20" property="employee_name" styleClass="inputText" />
							</td>
						</tr>
						
						
						
						<tr>
							<td>
								性&nbsp;&nbsp;&nbsp;&nbsp;别：<span class="noRedSpan">*</span>
							</td>
							<td>
								<select name="employee_sex" >
												<option value="">请选择</option>
												<option value="0"   selected>女</option>
												<option value="1">男</option>
							   </select>
							</td>
							<td>
								出生年月：<span class="noRedSpan">*</span>
							</td>

							<td>
								<html:text property="employee_birthday"  styleClass="inputText" onfocus="WdatePicker()"/>
							</td>
						</tr>
						<tr>
							
							<td>
								手&nbsp;&nbsp;&nbsp;&nbsp;机：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="employee_politicaltype" styleClass="inputText" />
							</td>
								<td>
								邮件地址：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="emailaddress" styleClass="inputText" />
							</td>
						</tr>
						<tr>
							<td>
								办公地址：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<input type="text" id="employee_degree" name="employee_degree"  class="inputText" size="20"/>
							</td>
						</tr>	
						<tr>
								<td>
									备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3">
									<html:textarea property="employee_memo"  />4000字符以内!
								</td>
							</tr>
						<tr>
							<td>
								所属组织：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:hidden property="org_id"   value="${org_id}"/>
							<html:text property="parentName"   value="${parentName}"/>
								 <input type="button" id="selectOrg" value="选择部门"/>
							</td>
						</tr>	
						
						
					</table>
			</fieldset>
		
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" class="button1" icon="icon_save"/>
			<input id="nextsave" value="保存并添加下一个" type="button" class="button1" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" class="button1" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>

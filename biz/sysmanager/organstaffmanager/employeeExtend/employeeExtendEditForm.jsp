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
       location.href='employeeExtendAction.do?method=list&ec_crd=${param.ec_crd}&ec_p=${param.ec_p}&ec_id=${param.employee_id}&qempcode=${param.qempcode}&qempname=${param.qempcode}&qsex=${param.qsex}&qe_org=${param.qe_org}';
        });
       
		
		//
		 $("#selectCorp").click(function(){ 
	        var url ="organizationOutAction.do?method=selectCorp";
			art.dialog({id:'commonDialog1',title:'单位选择', iframe:url, width:'800', height:'400',top:'30'});
		});
       $("#btn_save").click(function(){
       
            $("[name='kind']").val("save");
			var properties=new Array(); 
			properties[0]=["employee_code","工号"];
			properties[1]=["employee_name","姓名"];
			properties[2]=["qe_org","工作单位"];
			saveValidateRequired("#btn_save",properties,"employeeExtendForm");
		}); 
		//nextsave
		     $("#nextsave").click(function(){
		     
            $("[name='kind']").val("next");
			var properties=new Array(); 
			properties[0]=["employee_code","工号"];
			properties[1]=["employee_name","姓名"];
			properties[2]=["qe_org","工作单位"];
			saveValidateRequired("#nextsave",properties,"employeeExtendForm");
            $("[name='employee_id']").val("");
		}); 
			//验证自动编码重复性
		$("#codeBlur").blur(function(){ 
			 $.ajax({
					   type: "POST",
					   url: "${ctx}/employeeAction.do?method=test",
					   data: "code="+$("input[name='employee_code']").val()+"&id=${param.employee_id}&extend=extend",
					   success: function(msg){
					   	   if(msg=='yes'){
					   	   alert('该工号已存在，请从新填写');
								 jQuery("#codeBlur").val("");
						   }
					   }
					});
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
参建单位员工管理
</content>
<body>
	<html:form action="employeeExtendAction.do"  method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="employee_id" value="${param.employee_id}"/>
		<html:hidden property="static_orgid" value="${static_orgid}"/>
		<html:hidden property="kind" value="1"/>
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${param.employee_id}" />
		<html:hidden property="qempcode" />
		<html:hidden property="qempname" />
		<html:hidden property="qsex" />
		<fieldset >
			<legend>参建单位员工-编辑</legend>
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
								<input type="text"  name="employee_code"  id="codeBlur" value="${object.employee_code}"/>
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
								工作单位：<span class="redSpan">*</span>
							</td>
							<td>
								<html:hidden property="qe_orgid"  value="${object.e_org.f_id}"/>
							     <html:text property="qe_orgName"  value="${orgName}"/>
								 <input type="button" id="selectCorp" value="选择"/>
							</td>
						
							
							<td>
								工作岗位：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text  property="specialtecid" styleClass="inputText" maxlength="100" />
							</td>
						</tr>
						<tr>
						
						<td>
								办公地址：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text  property="employee_degree" styleClass="inputText" maxlength="100" />
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

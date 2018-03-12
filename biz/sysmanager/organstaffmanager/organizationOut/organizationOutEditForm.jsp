<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	$(document).ready(function(){
			//验证自动编码重复性
	//	$("#codeBlur").blur(function(){ 
	//		 checkBlurRuleCode('${ctx}');	
	//	});  
		//返回
        $("#btn_back").click(function(){
       		var url='organizationOutAction.do?method=list&ec_crd=${param.ec_crd}&ec_p=${param.ec_p}&ec_id=${organization.f_id}&qf_economictype=${param.qf_economictype}';
            document.forms[0].action=url;
            document.forms[0].submit();
       });
       //
       $("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["f_no","组织编号"];
			properties[1]=["f_name","组织名称"];
			properties[2]=["f_economictype","单位类别"];
			saveValidateRequired("#btn_save",properties,"organizationOutForm");
		}); 
		//
				//验证自动编码重复性
		$("#codeBlur").blur(function(){ 
			 $.ajax({
					   type: "POST",
					   url: "${ctx}/organizationAction.do?method=test",
					   data: "code="+$("input[name='f_no']").val()+"&id=${param.f_id}&out=out",
					   success: function(msg){
					   	   if(msg=='yes'){
					   	   alert('该组织编号已存在，请从新填写');
								 jQuery("#codeBlur").val("");
						   }
					   }
					});
		}); 
	});
</script>
</head>
<content tag="heading">
参建单位信息管理
</content>
<body>

	
	<html:form action="organizationOutAction.do" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="f_id" value="${param.f_id}"/>
	    <html:hidden property="ec_crd" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${param.f_id}"/>
		<html:hidden property="qf_name" />
		<html:hidden property="qf_economictype"/>
		    <fieldset >
			<legend>参建单位信息-编辑</legend>
						   	<table class="formTable" >
							<COLGROUP>
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
							</COLGROUP>
							
							<tr>
								<td>
									组织编号：<span class="redSpan">*</span>
								</td>
								<td>
								<input type="text" name="f_no" id="codeBlur" value="${organization.f_no}"/>
								</td>
								<td>
									组织名称：<span class="redSpan">*</span>
								</td>
								<td>
									<html:text maxlength="20" property="f_name" styleClass="inputText" />
								</td>
							</tr>
							<tr>
								<td>
									法人：<span class="noRedSpan">*</span>
								</td>
								<td >
										<html:text maxlength="20" property="f_chargeperson" styleClass="inputText" />
								</td>
								<td>
									单位类别：<span class="redSpan">*</span>
								</td>
								<td>
									<ex:dictSelect property="f_economictype" type="OrgaizeationEconomictype" />
								</td>
							</tr>
							<tr>
								<td>
									组织地址：<span class="noRedSpan">*</span>
								</td>
								<td >
										<html:text maxlength="20" property="f_address" styleClass="inputText" />
								</td>
								<td>
									组织邮编：<span class="noRedSpan">*</span>
								</td>
								<td>
										<html:text maxlength="20" property="f_postcode" styleClass="inputText" />
								</td>
							</tr>
							<tr>
								<td>
									电话：<span class="noRedSpan">*</span>
								</td>
								<td >
										<html:text maxlength="20" property="f_tel" styleClass="inputText" />
								</td>
								<td>
									传真：<span class="noRedSpan">*</span>
								</td>
								<td>
										<html:text maxlength="20" property="f_fax" styleClass="inputText" />
								</td>
							</tr>
							<tr>
								<td>
									创建日期：<span class="noRedSpan">*</span>
								</td>
								<td >
								<html:text property="f_createdate" value="${now_date}" styleClass="inputText"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
								</td>
								<td>
									注销日期：<span class="noRedSpan">*</span>
								</td>
								<td>
							    <html:text property="f_repealdate"  styleClass="inputText"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
								</td>
							</tr>
							<tr>
								<td>
									属&nbsp;&nbsp;&nbsp;&nbsp;性：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3">
									<html:text maxlength="20" property="f_attribute" styleClass="inputText" value="${organization.f_attribute}"/>
								</td>
							</tr>
							
							<tr>
								<td>
									备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3">
									<html:textarea property="attr2"  />4000字符以内!
								</td>
							</tr>
			</table>
		</fieldset>
	
		<div class="saveDiv">
			<input id="btn_save" value="<fmt:message key="button.save"/>" type="button" icon="icon_save" />
			<input id="btn_back" value="<fmt:message key="button.back"/>" type="button" icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>

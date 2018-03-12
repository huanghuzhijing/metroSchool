<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	$(document).ready(function(){
   		//组织管理选择项目管理周期
		
		
			//验证自动编码重复性
//		$("#codeBlur").blur(function(){ 
	//		 checkBlurRuleCode('${ctx}');	
	//	});  
		//返回
       $("#btn_back").click(function(){
       		location.href="organizationAction.do?method=list&ec_id=${organization.f_id}&qf_no=${param.qf_no}&static_parent_id=${param.static_parent_id}&fIsdelete=${param.fIsdelete}&ec_p=${param.ec_p}&name=${param.name}";
       });
       //
       $("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["f_no","组织编号"];
			properties[1]=["f_name","组织名称"];
			saveValidateRequired("#btn_save",properties,"organizationForm");
		}); 
		//
				//验证自动编码重复性
		$("#codeBlur").blur(function(){ 
			 $.ajax({
					   type: "POST",
					   url: "${ctx}/organizationAction.do?method=test",
					   data: "code="+$("input[name='f_no']").val()+"&id=${param.f_id}",
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
内部组织信息管理
</content>  
<body>
<fieldset >
		<legend>组织信息维护</legend>
	<table class="titleTable" >
	                     <COLGROUP >
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
		<tr>
	
						<c:if test="${organization eq null}">
							<td >上级组织名称：&nbsp;&nbsp;</td>
							<td>组织树 &nbsp;&nbsp;</td>
							<td >组织编号：&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
						</c:if>

						<c:if test="${organization ne null}">
							<td >
								上级组织名称：<span class="noRedSpan">*</span>
							</td>
							<td>
								<input type="text" value="${parent.f_name}" class="showText" size="40">
							</td>
							<td >
								组织编号：<span class="noRedSpan">*</span>
							</td>
							<td>
								<input  type="text" value="${parent.f_no}" value="" class="showText">
							</td>
						</c:if>
		</tr>
	</table>
	</fieldset>
	
	<html:form action="organizationAction.do" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="static_parent_id" value="${param.static_parent_id}" />
		<html:hidden property="fIsdelete" value="${param.fIsdelete}"/>
		<html:hidden property="f_id" value="${organization.f_id}"/>
		<html:hidden property="name" value="${param.name}"/>
		<html:hidden property="ec_id" value="${organization.f_id}"/>
		    <fieldset >
			<legend>基本信息</legend>
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
									<html:text maxlength="20" property="f_name" styleClass="inputText"  value="${organization.f_name}"/>
								</td>
							</tr>
							<tr>
								<td>
									组织地址：<span class="noRedSpan">*</span>
								</td>
								<td >
										<html:text maxlength="20" property="f_address" styleClass="inputText"  value="${organization.f_address}"/>
								</td>
								<td>
									组织邮编：<span class="noRedSpan">*</span>
								</td>
								<td>
										<html:text maxlength="20" property="f_postcode" styleClass="inputText"  value="${organization.f_postcode}"/>
								</td>
							</tr>
							<tr>
								<td>
									电话：<span class="noRedSpan">*</span>
								</td>
								<td >
										<html:text maxlength="20" property="f_tel" styleClass="inputText"  value="${organization.f_tel}"/>
								</td>
								<td>
									传真：<span class="noRedSpan">*</span>
								</td>
								<td>
										<html:text maxlength="20" property="f_fax" styleClass="inputText"  value="${organization.f_fax}"/>
								</td>
							</tr>
							<tr>
								<td>
									创建日期：<span class="noRedSpan">*</span>
								</td>
								<td >
								<c:set var="f_createdate"><fmt:formatDate value="${organization.f_createdate}" pattern="yyyy-MM-dd"/></c:set>
							    <html:text property="f_createdate" value="${f_createdate}" styleClass="inputText"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
								
								</td>
								<td>
									注销日期：<span class="noRedSpan">*</span>
								</td>
								<td>
								<c:set var="f_repealdate"><fmt:formatDate value="${organization.f_repealdate}" pattern="yyyy-MM-dd"/></c:set>
							    <html:text property="f_repealdate" value="${organization.f_repealdate}" styleClass="inputText"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
								</td>
							</tr>
							
							
							<tr>
								<td>
									备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3">
									<html:textarea property="attr2"   value="${organization.attr2}"/>4000字符以内!
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

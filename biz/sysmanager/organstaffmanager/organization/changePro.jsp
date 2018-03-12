<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	$(document).ready(function(){
   		//组织管理选择项目管理周期
		
		//清空项目周期
		$("#btnClear").click(function(){ 
			document.getElementById("projectcycle").value='';
			document.getElementById("projectcycle_names").value='';			
		});
			//验证自动编码重复性
		$("#codeBlur").blur(function(){ 
			 checkBlurRuleCode('${ctx}');	
		});  
		//返回
       $("#btn_back").click(function(){
       		location.href="organizationAction.do?method=list&name=${param.name}&ec_id=${organization.f_id}&qf_no=${param.qf_no}&static_parent_id=${param.static_parent_id}&fIsdelete=${param.fIsdelete}&ec_p=${param.ec_p}";
       });
       //
       $("#selectProjectPeriods").click(function(){ 
	        var url ="organizationAction.do?method=selectProjectPeriods&f_id=${organization.f_id}&qf_no=${param.qf_no}&static_parent_id=${param.static_parent_id}"+"&ec_p="+$("input[name='ec_p']").val();
			art.dialog({id:'commonDialog1',title:'站点选择', iframe:url, width:'800', height:'400',top:'30'});
		});
       $("#btn_save").click(function(){
			var properties=new Array(); 
			
			saveValidateRequired("#btn_save",properties,"organizationForm");
		}); 
		//
	});
	function fileClear(){
			 $("[name='parent_id']").val("");
			 $("[name='parentName']").val("");
		}
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
								<input type="text" value="${parent.f_name}" class="showText">
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
		<html:hidden property="f_no" value="${param.qf_no}" />
		<html:hidden property="static_parent_id" value="${param.static_parent_id}" />
		<html:hidden property="fIsdelete" value="${param.fIsdelete}"/>
		<html:hidden property="f_id" value="${organization.f_id}"/>
		<html:hidden property="name" value="${param.name}"/>
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
		             <td>组织名称：&nbsp;&nbsp;</td>
		             <td>${organization.f_name}&nbsp;</td>
		             <td>组织编号：&nbsp;&nbsp;</td>
		             <td>${organization.f_no}&nbsp;</td>
		           </tr>
		           
		           <tr>
								<td>
									组织地址：<span class="noRedSpan">*</span>
								</td>
								<td >
										${organization.f_address}
								</td>
								<td>
									组织邮编：<span class="noRedSpan">*</span>
								</td>
								<td>
										${organization.f_postcode}
								</td>
							</tr>
							<tr>
								<td>
									电话：<span class="noRedSpan">*</span>
								</td>
								<td >
										${organization.f_tel}
								</td>
								<td>
									传真：<span class="noRedSpan">*</span>
								</td>
								<td>
									${organization.f_fax}
								</td>
							</tr>
							<tr>
								<td>
									创建日期：<span class="noRedSpan">*</span>
								</td>
								<td><fmt:formatDate value="${organization.f_createdate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
								
								<td>
									注销日期：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3"><fmt:formatDate value="${organization.f_repealdate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
							</tr>
							
							
							<tr>
								<td>
									备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3">
									<html:textarea property="attr2"   value="${organization.attr2}"/>4000字符以内!
								</td>
							</tr>
							<tr>
							<td>新上级部门：</td><span class="noRedSpan">*</span>
							<td>
							<html:hidden property="parent_id"   value="${organization.parent_id}"/>
							<html:text property="parentName"   value="${organization.f_name}"/>
								 <input type="button" id="selectProjectPeriods" value="选择部门"/>
								<input type="button" id="clear" value="清空" onclick="fileClear()"/>
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
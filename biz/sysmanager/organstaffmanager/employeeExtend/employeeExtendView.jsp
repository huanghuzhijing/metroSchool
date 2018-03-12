<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	$(document).ready(function(){
   		
		//返回
        $("#btn_back").click(function(){
       location.href='employeeExtendAction.do?method=list&ec_crd=${param.ec_crd}&ec_p=${param.ec_p}&ec_id=${param.employee_id}&qempcode=${param.qempcode}&qempname=${param.qempcode}&qsex=${param.qsex}&qe_org=${param.qe_org}';
       });
	 });
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
		<fieldset >
			<legend>参建单位员工-详细</legend>
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
								${object.employee_code}
							</td>
							<td>
								姓&nbsp;&nbsp;&nbsp;&nbsp;名：<span class="redSpan">*</span>
							</td>
							<td >
								${object.employee_name}
							</td>
						</tr>
						
						<tr>
							<td>
								性&nbsp;&nbsp;&nbsp;&nbsp;别：<span class="noRedSpan">*</span>
							</td>
							<td>
								${object.employee_sex}
							</td>
							<td>
								出生年月：<span class="noRedSpan">*</span>
							</td>

							<td>
								${object.employee_birthday}
							</td>
						</tr>
						<tr>
							
							<td>
								手&nbsp;&nbsp;&nbsp;&nbsp;机：<span class="noRedSpan">*</span>
							</td>
							<td>
								${object.employee_politicaltype}
							</td>
								<td>
								邮件地址：<span class="noRedSpan">*</span>
							</td>
							<td>
								${object.emailaddress}
							</td>
						</tr>
						<tr>
							<td>
								工作单位：<span class="redSpan">*</span>
							</td>
							<td>
							     ${orgName}
							</td>
						
							
							<td>
								工作岗位：<span class="noRedSpan">*</span>
							</td>
							<td>
									${object.specialtecid}
							</td>
						</tr>
						<tr>
						
						<td>
								办公地址：<span class="noRedSpan">*</span>
							</td>
							<td>
									${object.employee_degree}
							</td>
						</tr>
						
						<tr>
								<td>
									备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3">
										${object.employee_memo}
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

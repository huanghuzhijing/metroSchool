<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	$(document).ready(function(){
		//
		
       $("#btn_back").click(function(){
       		location.href='employeeAction.do?method=list&ec_id=${param.employee_id}&static_orgid=${param.static_orgid}&name=${param.name}&fIsdelete=${param.fIsdelete}&qempcode=${param.qempcode}&qempname=${param.qempcode}&qsex=${param.qsex}&ec_p=${param.ec_p}';
       });
      
		
	 });
	
	</script>
</head>
 <content tag="heading">
组织员工信息管理
</content>  
<body>
	<html:form action="employeeAction.do"  method="POST">
		
		<fieldset >
			<legend>组织员工信息-详细</legend>
			<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								工&nbsp;&nbsp;&nbsp;&nbsp;号：<span class="noRedSpan">*</span>
							</td>
							<td>
							
								${object.employee_code}
							</td>
							<td>
								姓&nbsp;&nbsp;&nbsp;&nbsp;名：<span class="noRedSpan">*</span>
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
							<fmt:formatDate value="${object.employee_birthday}" pattern="yyyy-MM-dd"/>
									
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
								办公地址：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
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
						<tr>
							<td>
								所属组织：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								${parentName}
							</td>
						</tr>	
						
						
					</table>
			</fieldset>
		
		<div class="saveDiv">
			<input id="btn_back" value="${texts['button.back']}" type="button" class="button1" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
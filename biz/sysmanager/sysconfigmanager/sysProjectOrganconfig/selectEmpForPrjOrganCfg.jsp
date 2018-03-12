<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			var empIds=parent.$("#tempEmpIds").val(); 
			var empNames=parent.$("#tempEmpNames").val();
			$.each( $(".cbox_select"), function(i, obj){
				if(empIds.indexOf(","+$(this).val()+",")>-1){
					obj.checked=true;
				}
			});
			//
			$("#btn_save").click(function(){
				if(empIds==""||empIds==","){
					alert("请至少选中一个角色");
				}else{
					parent.$("#empIds").val(empIds); 
					parent.$("#empNames").val(empNames);
					parent.art.dialog({id:'commonDialog1'}).close();
				}
			});
			//
			$(".cbox_select").click(function(){
				if($(this).attr("checked")==true){
					if(empIds==""){
						empIds=","+$(this).val()+",";
					}else{
						empIds=empIds+$(this).val()+",";
					}
					if(empNames==""){
						empNames=","+$(this).attr("paramName")+",";
					}else{
						empNames=empNames+$(this).attr("paramName")+",";
					}
					parent.$("#tempEmpIds").val(empIds);
					parent.$("#tempEmpNames").val(empNames);
				}else{
					empIds=empIds.replace($(this).val()+",","");
					empNames=empNames.replace($(this).attr("paramName")+",","");
					parent.$("#tempEmpIds").val(empIds);
					parent.$("#tempEmpNames").val(empNames);
				} 
			}); 
			//
			$("#btn_close").click(function(){
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
		});
	</script>
</head>
<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="sysProjectOrganconfigAction.do?method=selectEmpForPrjOrganCfg">
					<table class="queryContentTable">
						<tr>
							<td>部门信息：</td>
							<td><ex:orgDisplay id="${userinfo.organId}"/></td>
							<td>&nbsp;&nbsp;员工姓名：</td>
							<td><html:text property="qempname" maxlength="25" styleClass="inputText"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="employees" var="employee"
		action="sysProjectOrganconfigAction.do?method=selectEmpForPrjOrganCfg" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="null" title="选择" >
				<input value="${employee.id}" type="checkbox" class="cbox_select" 
					   paramName="${employee.empname}"
				/>
			</ec:column>
			<ec:column property="organid" title="员工部门">
				<ex:orgDisplay id="${employee.organid}"/>
			</ec:column>
			<ec:column property="empcode" title="员工编号" />
			<ec:column property="empname" title="员工姓名" />
			<ec:column property="sex" title="员工性别" >
				<ex:dicDisplay dictIdentify="Sex" dictValue="${employee.sex}"/>
			</ec:column>
		</ec:row>
	</ec:table>
		<div class="saveDiv">
			<input id="btn_save" type="button"  icon="icon_save" value="${texts['button.save']}"  />
			<input id="btn_close" type="button"  icon="icon_close" value="${texts['button.close']}"  />
		</div>
</body>
</html:html>

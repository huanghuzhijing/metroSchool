<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
	<script type="text/javascript">
		//加载
		$(document).ready(function(){
			//
			$(".selectButton").click(function(){ 
				parent.$("#plug_empId").val($(this).attr("paramId"));
				parent.$("#plug_empName").val($(this).attr("paramName"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
		});
	</script>
</head>
<body>
	<table style="width:100%">
		<tr>
			<td valign="top">
				<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top">
					<div style="min-width:150px;">
						<script language='javascript'>
							//显示树
							var organizationTree = new dTree('organizationTree');
							organizationTree.setIconPath("${ctx}/scripts/dtree/");
							organizationTree.add('-1',-99,'组织结构树','${ctx}/employeeAction.do?method=list&static_orgid=-1','','main','','','');
							<c:forEach items="${employeestree}" var="organization">
									<c:if test = "${organization.parentid == '-1'}">
										organizationTree.add('${organization.id}','${organization.parentid}','${organization.organname}','${ctx}/contentSelectAction.do?method=selectEmp&qorganidentify=0&organid=${organization.id}&queryEmpType=${param.queryEmpType }','','_self','','');
									</c:if>
									<c:if test="${organization.parentid != '-1'}" >
										organizationTree.add('${organization.id}','${organization.parentid}','${organization.organname}(${organization.employeecount})','${ctx}/contentSelectAction.do?method=selectEmp&qorganidentify=0&organid=${organization.id}&queryEmpType=${param.queryEmpType }','','_self','','');
									</c:if>
							</c:forEach>
							document.write(organizationTree);
							organizationTree.openAll();
						</script>
					</div>
				</td>
			</tr>
		</table>
			</td>
			<td>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
			<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="contentSelectAction.do?method=selectEmp&qorganidentify=${param.qorganidentify}&organid=${organid}&queryEmpType=${param.queryEmpType }">
					<table align="left">
						<tr>
							<td nowrap="nowrap">
								员工姓名：<html:text property="empname" maxlength="25" styleClass="inputText" ></html:text>
							</td>
							<td nowrap="nowrap">
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="employees" var="employee"
		action="contentSelectAction.do?method=selectEmp&qorganidentify=${param.qorganidentify}&organid=${organid}&queryEmpType=${param.queryEmpType }" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="empcode" title="员工编号" />
			<ec:column property="empname" title="员工姓名" />
			<ec:column property="sex" title="员工性别">
				<ex:dicDisplay dictIdentify="Sex" dictValue="${employee.sex}"/>
			</ec:column>
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${employee.id}" paramName="${employee.empname }"/>
			</ec:column>
		</ec:row>
	</ec:table>
			</td>
		</tr>
	</table>
	
	
</body>
</html:html>

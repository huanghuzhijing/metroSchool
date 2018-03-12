<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
	<script type="text/javascript">
		$(document).ready(function(){
			var selectEmployees=parent.$("#selectEmployees").val();
			var tmpEmployees=parent.$("#tmpEmployees").val();
			$.each( $(".cbox_select"), function(i, obj){
				if(selectEmployees.indexOf(","+$(this).val()+",")>-1){
					$(this).attr("disabled","disabled");
				}
				if(tmpEmployees.indexOf(","+$(this).val()+",")>-1){
					obj.checked=true;
				}
			});
			//
			$("#btn_save").click(function(){
				if(tmpEmployees==selectEmployees){
					alert("请选择员工!");
				}else{
					$("#empIds").val(tmpEmployees);
					document.forms[0].submit();
				}
			});
			//
			$(".cbox_select").click(function(){
				if($(this).attr("checked")==true){
					if(tmpEmployees==""){
						tmpEmployees=","+$(this).val()+",";
					}else{
						tmpEmployees=tmpEmployees+$(this).val()+",";
					}
					parent.$("#tmpEmployees").val(tmpEmployees);
				}else{
					tmpEmployees=tmpEmployees.replace($(this).val()+",","");
					parent.$("#tmpEmployees").val(tmpEmployees);
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
	<html:form enctype="multipart/form-data" action="sysUsergroupEmpAction.do" method="POST">
	<input name="method" value="save" type="hidden">
	<input id="staticGroupId" name="staticGroupId" value="${param.staticGroupId }" type="hidden">
	<input id="empIds" name="empIds" type="hidden">
	</html:form>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top" >
				<script language='javascript'>
					//显示树
					var organizationTree = new dTree('organizationTree');
					var target="_self";
					organizationTree.setIconPath("${ctx}/scripts/dtree/");
					organizationTree.add('-1',-99,'组织结构树','','',target,'','','');
					<c:forEach items="${organizations}" var="organization">
							var url='${ctx}/sysUsergroupEmpAction.do?method=create&staticOrganid=${organization.id}&staticGroupId=${param.staticGroupId}';
							<c:if test = "${organization.parentid == '-1'}">
								organizationTree.add('${organization.id}','${organization.parentid}','${organization.organname}',url,'',target,'','');
							</c:if>
							<c:if test="${organization.parentid != '-1'}" >
								organizationTree.add('${organization.id}','${organization.parentid}','${organization.organname}(${organization.employeecount})',url,'',target,'','');
							</c:if>
					</c:forEach>
					document.write(organizationTree);
					organizationTree.openAll();
				</script>
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
						<html:form action="sysUsergroupEmpAction.do?method=create" method="POST">
							<table class="queryContentTable">
								<tr>
									<td>姓名：</td>
									<td><html:text property="empname" size="25" styleClass="inputText"/></td>
									<td>&nbsp;&nbsp;<input type="submit" id="btn_query" icon="icon_query" value="查 询" /></td>
								</tr>
							</table>
						</html:form>
					</td>
				</tr>
				</table>
				
				<ec:table items="employees" var="employee"
					action="sysUsergroupEmpAction.do?method=create" title=""  locale="zh_CN"
					sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
					retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
				>
					<ec:row highlightRow="true" >
						<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
						<ec:column property="null" title="选择" >
							<input value="${employee.id}" type="checkbox" class="cbox_select">
						</ec:column>
						<ec:column property="empcode" title="工号" />
						<ec:column property="empname" title="姓名" />
					</ec:row>
				</ec:table>
				
			</td>
		</tr>
	</table>
		<div  class="saveDiv">
			<input id="btn_save" type="button"  icon="icon_save" value="${texts['button.save']}"  />
			<input id="btn_close" type="button"  icon="icon_close" value="${texts['button.close']}"  />
		</div>
	
</body>
</html:html>

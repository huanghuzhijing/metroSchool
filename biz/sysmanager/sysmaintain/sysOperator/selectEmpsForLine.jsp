<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
	var oper_id="";
	 $(document).ready(function(){
 		//
 		$("#btn_edit").hide();
		$("#btn_delete").hide();
		$("#btn_view").hide();
		//控制按钮
		var ec_id='${param.ec_id}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
		}
		pullValue(ec_id);
		$(".choose").click(function(){
		        parent.$("#empId").val($(this).attr("paramId"));
				parent.$("#empName").val($(this).attr("paramName"));
				parent.art.dialog({id:'commonDialog1'}).close();
		})
 	 
	 });

	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
</script>
</head>

<body > 
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
       <tr>
         <td valign="top">
	          <table class="queryTable" >
					<tr>
						<td class="queryTitle">
							<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td>
							<html:form action="employeeAction.do?method=selectEmpsForLine" method="POST">
								<input type="hidden" value="${param.static_orgid}" name="static_orgid">
								<input type="hidden" value="${param.static_fno}" name="static_fno">
								<input type="hidden" value="${param.qorganidentify}" name="qorganidentify">
								<input type="hidden" value="${param.name}" name="name">
								<table class="queryContentTable">
									<tr>
										<td>
											工号：&nbsp;&nbsp;
										</td>
										<td>
											<html:text property="qempcode" size="20" styleClass="inputText"/>
										</td>
										<td>
											姓名：&nbsp;&nbsp;
										</td>
										<td>
											<html:text property="qempname" size="20" styleClass="inputText"/>
										</td>
									
										<td>
											性别：&nbsp;&nbsp;
										</td>
										<td>
											<html:select property="qsex" >
												<html:option value="">请选择</html:option>
												<html:option value="0">男</html:option>
												<html:option value="1">女</html:option>
											</html:select>
										</td>
										<td><input type="submit" id="btn_query" icon="icon_query" value="查 询" /></td>
									</tr>
								</table>
							</html:form>
						</td>
					</tr>
				</table>
				<br/>
				
				<ec:table items="employees" var="employee"
						action="employeeAction.do?method=selectEmpsForLine" title=""  locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
						<ec:row highlightRow="true" onclick="pullValue('${employee.employee_id}');"
							ondblclick="showView('${employee.employee_id}')"
						>
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
								<ec:column property="null" title="所属部门"   width="15%">
								${employee.e_org.f_name}
							</ec:column>	
							<ec:column property="employee_name" title="员工姓名" />
							<ec:column property="employee_code" title="员工工号" />
							<ec:column property="employee_sex" title="性别" >
								<c:if test="${employee.employee_sex=='0'}">女</c:if>
								<c:if test="${employee.employee_sex=='1'}">男</c:if>
							</ec:column>
							<ec:column property="null" title="操作" >
							  <input type="button"  icon="icon_edit" class="choose" value="选择" paramId="${employee.employee_id}" paramName="${employee.employee_name}"/>
							  </ec:column>
						</ec:row>
					</ec:table>
					</td>
		</tr>
	</table>
			
  </body>
</html:html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
		      $("#ec_table>tbody>tr").dblclick(function(){ 
				parent.$("input[name='organid']").val($("td",this).find(".btn_confirm").attr("paramId"));
				parent.$("input[name='orgname']").val($("td",this).find(".btn_confirm").attr("paramName"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
			$(".btn_confirm").click(function(){ 
				parent.$("input[name='organid']").val($(this).attr("paramId"));
				parent.$("input[name='orgname']").val($(this).attr("paramName"));
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
			<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="employeeAction.do?method=selectOrganForEmp">
					<table align="left">
						<tr>
							<td >组织名称：</td>
							<td><html:text styleClass="inputText" property="qorganname" maxlength="25" ></html:text>
							</td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="organizations" var="organization"
		action="employeeAction.do?method=selectOrganForEmp" title="" width="100%" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="organcode" title="组织编号" />
			<ec:column property="organname" title="组织名称" />
			<ec:column property="null" title="组织类型" >
				<ex:dicDisplay dictIdentify="OrganType" dictValue="${organization.organtype}"/>
			</ec:column>	
			<ec:column property="recorddate" title="创建日期" cell="date"/>
			<ec:column property="null" title="选择" >
				<input type="button"  class="btn_confirm" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${organization.id}" paramName="${organization.organname }"
				       paramCode="${organization.organcode }"
				 />
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>

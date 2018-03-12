<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			$(".selectButton").click(function(){ 
				parent.$("#prjid").val($(this).attr("paramId"));
				parent.$("#prjname").val($(this).attr("paramName"));
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
				<html:form action="sysProjectOrganconfigAction.do?method=selectPrjForPrjOrganCfg">
					<table class="queryContentTable">
						<tr>
							<td >项目名称：</td>
							<td><html:text property="qprjname" maxlength="25" styleClass="inputText"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="projectInfos" var="projectInfo"
		action="sysProjectOrganconfigAction.do?method=selectPrjForPrjOrganCfg" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="prjcode" title="项目编号" />
			<ec:column property="prjname" title="项目名称" />
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${projectInfo.id}" paramName="${projectInfo.prjname }"/>
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>

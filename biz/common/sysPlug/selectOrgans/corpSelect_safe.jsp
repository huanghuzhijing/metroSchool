<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".selectButton").click(function(){ 
				parent.$("#plug_corpIds_3").val($(this).attr("paramId")); 
				parent.$("#plug_corpNames_3").val($(this).attr("paramName"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
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
				<html:form action="contentSelectAction.do?method=corpSelects_1&corptype=2">
					<table class="queryContentTable">
						<tr>
							<td >
								 单位名称：
							</td>
							<td>
								<html:text property="qcorpname" styleClass="inputText" maxlength="100"></html:text>
							</td>
							<td >
								<input type="submit" value="${texts['button.query']}" icon="icon_query" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="organizations" var="organization"
				action="contentSelectAction.do?method=corpSelects_safe&corptype=5" title=""  locale="zh_CN"
				sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
				retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="8%"/>
			<ec:column property="f_no" title="单位编号" />
			<ec:column property="f_name" title="单位名称" />
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${organization.f_id}" paramName="${organization.f_name}"/>
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>

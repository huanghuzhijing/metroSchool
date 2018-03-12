<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		var tempParent = parent ;
	
		$(document).ready(function(){
			//
			$(".selectButton").click(function(){ 
				parent.$("#plug_docFile_id").val($(this).attr("paramId"));
				parent.$("#plug_docFile_name").val($(this).attr("paramName"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			  $("#btn_close").click(function(){ 
						parent.art.dialog({id:'commonDialog1'}).close();
			   });
		});
		function selectOnclick(docFile_id,docFile_name)
		{
		        parent.$("#plug_docFile_id").val(user_id);
				parent.$("#plug_docFile_name").val(user_name);
				parent.art.dialog({id:'commonDialog1'}).close();
		}
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
				<html:form action="contentSelectAction.do?method=selectDocFileManager&queryDocFileManager=${param.queryDocFileManager}">
					<table class="queryContentTable">
						<tr>
							<td>
								文档编号：
							</td>
							<td>
								<html:text property="qfileCode" maxlength="25" styleClass="inputText"></html:text>
							</td>
							<td>
								文档标题：
							</td>
							<td>
								<html:text property="qfileTitle" maxlength="25" styleClass="inputText"></html:text>
							</td>
						</tr>
						<tr>	
							<td>
								关&nbsp;&nbsp;键&nbsp;&nbsp;字：
							</td>
							<td>
								<html:text property="qkeyword" maxlength="25" styleClass="inputText"></html:text>
							</td>
							<td>
								摆放位置：
							</td>
							<td>
								<html:text property="qposition" maxlength="25" styleClass="inputText"></html:text>
							</td>
							<td>
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	
	<ec:table items="docFileManagers" var="docFileManager"
		action="contentSelectAction.do?method=selectDocFileManager&queryDocFileManager=${param.queryDocFileManager}" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" ondblclick="showView('${docFileManager.id}');"
				onclick="pullValue('${docFileManager.id}');"
		>
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="prjId" title="项目名称" >
				<ex:prjName id="${docFileManager.prjId}"/>
			</ec:column>
			<ec:column property="sortId.name" title="分类文件名称" />
			<ec:column property="fileCode" title="文档编号" />
			<ec:column property="fileTitle" title="文档标题" />
			<ec:column property="fileDate" title="文档创建日期" cell="date"/>
			<ec:column property="keyword" title="关键字" />
			<ec:column property="position" title="摆放位置" />
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${docFileManager.id}" paramName="${docFileManager.sortId.name }"  /> 
			</ec:column>
		</ec:row>
	</ec:table>
	
		<div class="saveDiv">
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>
</body>
</html:html>

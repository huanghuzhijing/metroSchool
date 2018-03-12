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
				parent.$("#plug_workFlow_id").val($(this).attr("paramId"));
				parent.$("#plug_workFlow_name").val($(this).attr("paramName"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			  $("#btn_close").click(function(){ 
						parent.art.dialog({id:'commonDialog1'}).close();
			   });
		});
		function selectOnclick(workFlow_id,workFlow_name)
		{
		        parent.$("#plug_workFlow_id").val(user_id);
				parent.$("#plug_workFlow_name").val(user_name);
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
				<html:form action="contentSelectAction.do?method=selectWorkFlow&queryWorkFlowType=${param.queryWorkFlowType}">
					<table class="queryContentTable">
						<tr>
							<td >工作流名称：
							<html:text property="qName" maxlength="25" styleClass="inputText"></html:text>
							<input type="submit"  class="button1" value="查  询" />
							</td > 
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="workFlows" var="workFlow"
		action="contentSelectAction.do?method=selectWorkFlow&queryWorkFlowType=${param.queryWorkFlowType}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
		<ec:column property="workFlowName" calcTitle="workFlowName" title="工作流名称"/>
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${workFlow.id}" paramName="${workFlow.workFlowName }"  /> 
			</ec:column>
			<ec:column property="remark" calcTitle="remark" title="备注"></ec:column>
		</ec:row>
	</ec:table>
		<div class="saveDiv">
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>
</body>
</html:html>

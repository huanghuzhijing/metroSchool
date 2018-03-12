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
				parent.$("#plug_CtrContractArchived_id").val($(this).attr("paramId"));
				parent.$("#plug_CtrContractArchived_name").val($(this).attr("paramName"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			  $("#btn_close").click(function(){ 
						parent.art.dialog({id:'commonDialog1'}).close();
			   });
		});
		function selectOnclick(CtrContractArchived_id,CtrContractArchived_name)
		{
		        parent.$("#plug_CtrContractArchived_id").val(user_id);
				parent.$("#plug_CtrContractArchived_name").val(user_name);
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
				<html:form action="contentSelectAction.do?method=selectCtrContractArchived&queryCtrContractArchived=${param.queryCtrContractArchived}">
					<table class="queryContentTable">
						<tr>	
							<td>
								编&nbsp;&nbsp;&nbsp;&nbsp;号：
							</td>
							<td>
								<html:text property="qarchivedCode" maxlength="25" styleClass="inputText"></html:text>
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
	
	<ec:table items="ctrContractArchiveds" var="ctrContractArchived"
		action="contentSelectAction.do?method=selectCtrContractArchived&queryCtrContractArchived=${param.queryCtrContractArchived}" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" 
		>
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="ctrId.ctrName" title="合同名称" >
			</ec:column>
			<ec:column property="archivedCode" title="编号" />
			<ec:column property="ctrSum" title="金额(元)" styleClass="tdRight" >
				<fmt:formatNumber value="${ctrContractArchived.ctrSum}" pattern="#,##0.00"/>
			</ec:column>
			<ec:column property="archivedDate" title="归档日期" cell="date"/>
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${ctrContractArchived.id}" paramName="${ctrContractArchived.ctrId.ctrName }"  /> 
			</ec:column>
		</ec:row>
	</ec:table>
	
		<div class="saveDiv">
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>
</body>
</html:html>

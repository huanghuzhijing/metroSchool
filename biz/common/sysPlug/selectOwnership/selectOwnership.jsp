<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
				parent.$("#plug_ownershipId").val($(this).attr("paramId"));
				parent.$("#plug_ownershipType").val($(this).attr("paramArray"));
				parent.$("#plug_ownershipName").val($(this).attr("paramName"));
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
				<html:form action="contentSelectAction.do?method=selectOwnership&queryOwnershipType=${queryOwnershipType}">
					<table class="queryContentTable">
						<tr>
							<td >权属单位名称：</td>
							<td>&nbsp;<html:text property="qownershipUnitName" maxlength="25" styleClass="inputText"></html:text></td>
							<td >权属单位类型：</td>
							<td>
								<ex:dictSelect property="qoldLandProperty" type="OldLandProperty_LandOwnership"/>
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
	<ec:table items="ownerships" var="ownership"
		action="contentSelectAction.do?method=selectOwnership&queryCorpType=${queryCorpType}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="oldLandProperty" title="权属单位类型" >
				<ex:dicDisplay dictIdentify="OldLandProperty_LandOwnership" dictValue="${ownership.oldLandProperty }"/>
			</ec:column>
			<ec:column property="ownershipUnitName" title="权属单位名称" />
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${ownership.id}" paramArray ="<ex:dicDisplay dictIdentify='OldLandProperty_LandOwnership' dictValue='${ownership.oldLandProperty }'/>" paramName="${ownership.ownershipUnitName }" /> 
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>

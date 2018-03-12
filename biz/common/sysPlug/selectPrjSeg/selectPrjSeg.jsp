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
				parent.$("#plug_segId").val($(this).attr("paramId"));
				parent.$("#plug_segName").val($(this).attr("paramName"));
				var values=$(this).attr("paramArray").split("@@");
				parent.$("#plug_prjId").val(values[0]);
				parent.$("#plug_prjName").val(values[1]);
				parent.$("#plug_prjCode").val(values[2]);
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			$("#btn_close").click(function(){
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
		});
		
		function selectOnclick(paramId,paramName,paramArray)
		{
		       parent.$("#plug_segId").val(paramId);
				parent.$("#plug_segName").val(paramName);
				var values=paramArray.split("@@");
				parent.$("#plug_prjId").val(values[0]);
				parent.$("#plug_prjName").val(values[1]);
				parent.$("#plug_prjCode").val(values[2]);
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
				<html:form action="contentSelectAction.do?method=selectPrjSegment&queryPrjSegType=${param.queryPrjSegType}&prj_id=${param.prj_id}">
					<table class="queryContentTable">
						<tr>
							<td >标段名称：</td>
							<td><html:text property="qprjSegName" maxlength="25" styleClass="inputText"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="prjSegmentInfos" var="prjSegmentInfo"
		action="contentSelectAction.do?method=selectPrjSegment&queryPrjSegType=${param.queryPrjSegType}&prj_id=${param.prj_id}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" ondblclick="selectOnclick('${prjSegmentInfo.id}','${prjSegmentInfo.segName }','${prjSegmentInfo.prjId.id}@@${prjSegmentInfo.prjId.prjName}@@${prjSegmentInfo.prjId.prjCode}')">
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="prjId.prjCode" title="项目编号" />
			<ec:column property="prjId.prjName" title="项目名称" />
			<ec:column property="segName" title="标段名称" />
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${prjSegmentInfo.id}" paramName="${prjSegmentInfo.segName }" paramArray="${prjSegmentInfo.prjId.id}@@${prjSegmentInfo.prjId.prjName}@@${prjSegmentInfo.prjId.prjCode}" /> 
			</ec:column>
		</ec:row>
	</ec:table>
			<div class="saveDiv">
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>
</body>
</html:html>

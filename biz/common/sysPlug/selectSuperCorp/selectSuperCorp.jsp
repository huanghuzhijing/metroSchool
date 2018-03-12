<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		//
		$(document).ready(function(){
			//
			$(".selectButton").click(function(){ 
				parent.$("#plug_superCorpId").val($(this).attr("paramId"));
				parent.$("#plug_superCorpType").val($(this).attr("paramName"));
				parent.$("#plug_superCorpName").val($(this).attr("paramArray"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
			$("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			// 
		});
		//
		function corpadd(){
			document.forms[0].action="corpAction.do?method=corpAdd&queryCorpType=${queryCorpType}";
			document.forms[0].submit();
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
				<html:form action="contentSelectAction.do?method=selectSuperCorp&queryCorpType=${queryCorpType}">
					<table class="queryContentTable">
						<tr>
							<td >单位名称：</td>
							<td>&nbsp;<html:text property="qcorpname" maxlength="25" styleClass="inputText"></html:text></td>
							<td >单位类型：</td>
							<td>
								<html:select property="qcorptype" >
								<html:option  value="">请选择</html:option>
								<c:forEach items="${corpTypes}" var="corpType">
							    	<html:option value="${corpType.corptype}">${corpType.typename}</html:option>
							    </c:forEach>
								</html:select>
							</td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
								<input id="btn_close" value="${texts['button.close']}" type="button" class="icon_close"/>
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="corps" var="corp"
		action="contentSelectAction.do?method=selectSuperCorp&queryCorpType=${queryCorpType}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="corptype" title="单位类型" >
				<ex:corpTypeDisplay corptype="${corp.corptype}"/>
			</ec:column>
			<ec:column property="corpname" title="单位名称" />
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${corp.id}" paramName="${corp.corptype }" paramArray="${corp.corpname }" /> 
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>

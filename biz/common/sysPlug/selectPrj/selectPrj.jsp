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
		   // alert("dd:"+$(this).attr("paramId"))
				parent.$("#plug_prjId").val($(this).attr("paramId"));
				parent.$("#plug_prjCode").val($(this).attr("paramArray"));
				parent.$("#plug_prjName").val($(this).attr("paramName"));
				
				
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			$("#submitbutton").click(function(){ 
			
			var prjName=$('#qPrjName').val();
			var url="contentSelectAction.do?method=selectPrj&qPrjName="+prjName;
			alert("url:"+url);
			document.forms[0].action=url;   
            document.forms[0].submit(); 
			});
			//
		});
		function selectOnclick(prjid,prjname,prjcode)
		{
		        parent.$("#plug_prjId").val(prjid);
				parent.$("#plug_prjCode").val(prjcode);
				parent.$("#plug_prjName").val(prjname);
				
				
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
				<html:form action="contentSelectAction.do?method=selectPrj">
					<table class="queryContentTable">
						<tr>
							<td >项目名称：</td>
							<td>&nbsp;<html:text property="qPrjName" maxlength="25" styleClass="inputText"></html:text></td>
							</td>
							<td >
								<input type="submit"  icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="projectInfos" var="projectInfo"
		action="contentSelectAction.do?method=selectPrj&qprjName=${qprjName}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" ondblclick="selectOnclick('${projectInfo.id}','${projectInfo.prjName }','${projectInfo.prjCode }')">
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="prjCode" title="项目编号" />
			<ec:column property="prjName" title="项目名称" />
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${projectInfo.id}" paramName="${projectInfo.prjName }" paramArray="${projectInfo.prjCode }" /> 
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>

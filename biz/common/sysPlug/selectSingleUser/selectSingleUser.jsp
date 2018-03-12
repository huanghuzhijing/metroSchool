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
				parent.$("#plug_user_id").val($(this).attr("paramId"));
				parent.$("#plug_user_name").val($(this).attr("paramName"));
				var values= $(this).attr("paramArray").split("@@");
				parent.$("#plug_organ_id").val(values[0]);
				parent.$("#plug_organ_name").val(values[1]);
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			  $("#btn_close").click(function(){ 
						parent.art.dialog({id:'commonDialog1'}).close();
			   });
		});
		function selectOnclick(user_id,organ_id,user_name,organ_name)
		{
		        parent.$("#plug_user_id").val(user_id);
				parent.$("#plug_user_name").val(user_name);
				parent.$("#plug_organ_id").val(organ_id);
				parent.$("#plug_organ_name").val(organ_name);
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
				<html:form action="contentSelectAction.do?method=singleUser&queryUserType=${param.queryUserType}">
					<table class="queryContentTable">
						<tr>
							<td >员工名称：
							<html:text property="quserName" maxlength="25" styleClass="inputText"></html:text>
							员工部门：
							
										 <html:select property="qorganid">
												<c:if test="${fn:length(lowDeclareInfos)!=1}">
													<html:option value="">请选择</html:option>
												</c:if>
												<c:forEach items="${lowDeclareInfos}" var="lowDeclareInfo">
													<html:option value="${lowDeclareInfo.id}">${lowDeclareInfo.nodeName}</html:option>
												</c:forEach>
											</html:select>
						
							<input type="submit"  class="button1" value="查  询" />
							</td > 
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="sysOperators" var="sysOperator"
		action="contentSelectAction.do?method=singleUser&queryUserType=${param.queryUserType}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
		<ec:column property="username" calcTitle="username" title="员工名称"/>
		<ec:column property="organid" calcTitle="organid" title="员工部门">
			<ex:orgDisplay id='${sysOperator.employeeid.organid }'/>
		</ec:column>
			<ec:column property="null" title="选择" >
			
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				       paramId="${sysOperator.id}" paramName="${sysOperator.username }" paramArray="${sysOperator.employeeid.organid }@@<ex:orgDisplay id='${sysOperator.employeeid.organid }'/>" /> 
			</ec:column>
		</ec:row>
	</ec:table>
		<div class="saveDiv">
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>
</body>
</html:html>

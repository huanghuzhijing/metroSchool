<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>

	<script type="text/javascript">
  jQuery(document).ready(function(){
	jQuery("#btn_back").click(function(){
	   document.forms[0].submit();
	}) 
}); 
	</script>
</head>
<content tag="heading">
	工作流
</content>
<body >
<html:form action="workFlowAction.do?method=list">
<html:hidden property="qworkFlowName"  value="${param.qworkFlowName }"/>
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${workFlow.id}"/>
		<html:hidden property="ec_auditStatus"  value="0"/>

</html:form>
	<fieldset >
		<legend>工作流-基础信息</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
					  <tr>
					    <td >流程定义名称：<span class="noRedSpan">*</span></td>
					    <td >
							${workFlow.workFlowName }&nbsp;
						</td>
					  </tr>
					  <tr>
					    <td >流程定义图形描述：<span class="noRedSpan">*</span></td>
					    <td>
							<img class="img_workFlowImage" src="workFlowAction.do?method=image&id=${workFlow.id }">&nbsp;
						</td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend>
			审核人信息
		</legend>
		<table class="listTable">
			<tr>
				<th>
					序号
				</th>
				<th>
					任务名称
				</th>
				<th>
					任务人
				</th>
				<th>
					任务角色
				</th>
				<th>
					部门过滤
				</th>
				<th>
					提交筛选
				</th>
			</tr>
			<%
				int count = 1;
			%>
			<c:forEach items="${workFlowTaskActors}" var="workFlowTaskActor"
				varStatus="_index">
				<tr class="dataTr">
					<td><%=count%></td>
					<%
						count++;
					%>
					<td>
						${workFlowTaskActor.taskName}&nbsp;
					</td>
					<td>
						${workFlowTaskActor.actors}&nbsp;
					</td>
					<td>
						${workFlowTaskActor.actRoles}&nbsp;
					</td>
					<td>
						 <c:if test="${workFlowTaskActor.isFilter==1}">是</c:if> <c:if test="${workFlowTaskActor.isFilter==0}">否</c:if>&nbsp;
					</td>
					<td>
						 <c:if test="${workFlowTaskActor.isFurnish==1}">是</c:if> <c:if test="${workFlowTaskActor.isFurnish==0}">否</c:if>&nbsp;
					</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
	<fieldset>
			<legend>
				绑定信息
			</legend>
			<table class="formTable">
				<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
				</COLGROUP>
				<tr>
					<td>
						实体类名称：<span class="noRedSpan">*</span>
					</td>
					<td>
						${workFlow.entityName}&nbsp;
					</td>
						<td>
						表名称：<span class="noRedSpan">*</span>
					</td>
					<td>
						${workFlow.tableName}&nbsp;
					</td>
				</tr>
			</table>
		</fieldset>
		<div  class="saveDiv">
			<input type="button" icon="icon_back"  id="btn_back" value="<fmt:message key="button.back"/>"  />
		</div>
</body>
</html:html>

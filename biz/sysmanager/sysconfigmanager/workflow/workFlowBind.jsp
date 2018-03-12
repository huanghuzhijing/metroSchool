<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
  	$(document).ready(function(){
		$("#btn_back").click(function(){
		   	document.forms[0].action='workFlowAction.do?method=list&ec_p=${param.ec_p}&ec_id=${workFlow.id}';   
	    	document.forms[0].submit();
		}) 
		$("#btn_save").click(function(){//保存
	       		var res = "";
				if($("#entityName").val()==null || $("#entityName").val()==""){
					res+="实体类名称 为必填项。\n";
				}
				if($("#tableName").val()==null || $("#tableName").val()==""){
					res+="表名称 为必填项。\n";
				}	
				if(res!=""){
					alert(res);
					return ;
				}else{
					$("#btn_save").addClass("z-btn-dsb");
                    $("#btn_save").attr("disabled","disabled")
					$("#workFlowForm").submit();
				}
		    });
}); 
	</script>
</head>
<content tag="heading">
	绑定管理
</content>
<body>
	<fieldset>
		<legend>
			工作流-基础信息
		</legend>
		<table class="formTable">
			<COLGROUP>
				<COL class="tdLeftOne" />
				<COL class="tdRightOne" />
			</COLGROUP>
			<tr>
				<td>
					流程定义名称：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${workFlow.workFlowName }&nbsp;
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
				</tr>
			</c:forEach>
		</table>
	</fieldset>
	<html:form action="workFlowAction.do" styleId="workFlowForm">
		<html:hidden property="id" value="${workFlow.id}" />
		<html:hidden property="method" value="bindSave" />
			<!--查询定位 开始-->
		<html:hidden property="qworkFlowName"  value="${param.qworkFlowName }"/>
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${workFlow.id}"/>
		<html:hidden property="ec_auditStatus"  value="0"/>
		<!--查询定位 结束-->
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
						实体类名称：<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" id="entityName" size="50" name="entityName" class="inputText"  value="${workFlow.entityName}"/>
					</td>
						<td>
						表名称：<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" id="tableName" size="50" name="tableName" class="inputText"  value="${workFlow.tableName}"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</html:form>
	<div class="inputInfoDiv">
		<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName}</span>
		<span class="inputShowRight"> 填报日期：${now_date}</span>
	</div>
	<div class="saveDiv">
		<input id="btn_save" value="${texts['button.save']}" type="button"
			icon="icon_save" />
		<input id="btn_back" value="${texts['button.back']}" type="button"
			icon="icon_back" />
	</div>

</body>
</html:html>

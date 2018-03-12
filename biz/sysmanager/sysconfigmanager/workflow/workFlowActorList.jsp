<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript">
	//加载
	$(document).ready(function(){
		//
	    $("#addbutton").click(function(){
	      sub();
	    })
	    //
		$("#backbutton").click(function(){
		    history.back(-1);
		})
		// 
	});
	//
	function sub(){
	   $("#workFlowTaskActorForm").submit();
	} 
    </script>
</head>
	<content tag="heading">工作流管理</content>
<body>
	<fieldset>
	<html:form  styleId ="workFlowTaskActorForm" action="workFlowAction.do" styleClass="form" method="POST">
	    <input type="hidden" name="method" value="saveWorkFlowTaskActor" />
        <table align="center" border="1">
           <tr>
           <th>流程ID</th> <th>任务ID</th><th>任务名称</th><th>任务执行者</th><th>变更执行者</th>
           </tr>
           <c:forEach items="${workFlowTaskActors}" var="workFlowTaskActor">
           <tr>
             <td><input name="processDefinitionId" value="${workFlowTaskActor.processDefinitionId}"></td>
              <td><input name="taskId" value="${workFlowTaskActor.taskId}"></td>
             <td><input name="taskName" value="${workFlowTaskActor.taskName}"></td>
             <td><input name="actors" value="${workFlowTaskActor.actors}"></td>
             <td><input type="button" class="button1" value="变更"></td>
            </tr>
           </c:forEach>
        </table>
        <div align="center" class="sbDiv">
			<input type="button" class="button1" id="addbutton" value="${texts['button.save']}" /> 
			<input type="button" class="button1" id="backbutton" value="<fmt:message key="button.back"/>"  />
		</div>
    </html:form>
	</fieldset>
</body>
</html:html>
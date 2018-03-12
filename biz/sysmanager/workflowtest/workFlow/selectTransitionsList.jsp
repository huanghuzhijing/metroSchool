<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	function sub(){
	   //jQuery("[name='workFlowForm']").eq(0).submit();
	   var flag=0;
	   var sel = $("[name='transitionName']").each(function(){
	      if($(this).attr("checked")){
	        flag=1;
	      }
	   })
	   if(flag==0){
	      alert("请选择一个步骤");
	      return false;
	   }
	   	   var value= $("[name='transitionName'][checked]").attr("value");
	   var actName='${actName}';
	   if(value!='结束'){
	     if(actName==''){
	     	 alert("没有审核人，无法提交！");
	     	 return false;
	     }
	   }
	   jQuery("#leaveForm").submit();
	}
  jQuery(document).ready(function(){
    jQuery("#btn_save").click(function(){
	      sub();
	    })
	jQuery("#btn_back").click(function(){
	    	if(${param.flagSubmit=='submit'}){
			  	  document.forms[0].action='leaveAction.do?method=list&designType=${param.designType}&ec_auditStatus=${param.auditStatus}';
			  	  document.forms[0].submit(); 
				}else{
	   			  history.back(-1);
	    	 }
	}) 
}); 
    </script>
</head>
<content tag="heading">
请假流程审核
</content>
<body>

	<html:form action="leaveAction.do?method=submitWorkFlow&flag=desgin&designType=${param.designType}" styleId="leaveForm" styleClass="form" method="POST">
		<input type="hidden" name="id" value="${id}" />
		<input type="hidden" name="forwardFlag" value="${forwardFlag}" />
		<input type="hidden" name="approveContent" value="${approveContent}" />
		<input type="hidden" name="fileAppName_" value="${fileAppName_}" />
		<input type="hidden" name="fileAppAddr_" value="${fileAppAddr_}" />
		<html:hidden property="qprjName" />
		<html:hidden property="qdesignName" />
		<html:hidden property="qauditstatus" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${id}"/>
	<fieldset>
				<legend>
					请选择下一步提交步骤
				</legend>
					<table class="listTable">
                         <th>下一步任务名称</th>
                          <th>下一步审核人</th>
                         <c:forEach items="${nextSteps}" var="step">
                           <tr>
                             	<td class="tdLeft"><input type="radio" checked="checked" name="transitionName" value="${step }">${step }</td>
                             	<td class="tdLeft">${actName}</td>
                           </tr>
                         </c:forEach>
					</table>
	</fieldset>
	</html:form>

		<div  class="inputInfoDiv">
			<span>填报人： ${userinfo.username} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<span>填报日期：${now_date}</span>
		</div>
		<div align="center" class="sbDiv">
			<input type="button" class="button1" id="btn_save" icon="icon_save" value="${texts['button.save']}" /> 
			&nbsp;&nbsp;
			<input type="button" class="button1" id="btn_back"  icon="icon_back"value="<fmt:message key="button.back"/>"  />
		</div>

</body>
</html:html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<script>
function backToList(){
    
    var url='${ctx}/riskPlanAction.do?method=list';
    if('${param.queryFlag}'=="t"){
    var url='${ctx}/riskPlanAction.do?method=queryList';
    }
	document.forms[0].action=url;
	document.forms[0].submit();
	
	
	}
</script>
<html:html>
<head>
<title><fmt:message key="safedoc.safedocRiskPlan.title"/></title>
<content tag="heading">危险源监控计划新版</content>
</head>
<body>
<html:form action="riskPlanAction.do" method="POST"  styleClass="form">
<input type="hidden" name="method" value="save"/>
<html:hidden property="planId"/>
<html:hidden property="unitId"/>
<html:hidden property="qlineId"/>
<html:hidden property="qsegmentId"/>
<html:hidden property="qplanName"/>
<html:hidden property="qplanYear"/>
<html:hidden property="qplanWeek"/>
<html:hidden property="qunitName"/>
<html:hidden property="qunitId"/>
<fieldset>
<legend>详细</legend>
<table class="formTable">
    <COLGROUP>
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
	</COLGROUP>
	<tr>
      <td>线路:&nbsp;<font color="red">*</font></td>
      <td>
      	${riskPlan.lineId.line_name }
      </td>
      <td>标段:&nbsp;<font color="red">*</font></td>
      <td>
      ${riskPlan.lineId.line_name }
      </td>
    </tr>
	<tr>
      <td>计划监控名称:&nbsp;<font color="red">*</font></td>
      <td colspan="3">${riskPlan.planName }</td>
    </tr>
    <tr>
      <td>计划年份:&nbsp;<font color="red">*</font></td>
      <td>${riskPlan.planYear }
      </td>
      <td>计划周次:&nbsp;<font color="red">*</font></td>
      <td>${riskPlan.planWeek }
      </td>
    </tr>
    <tr>
      <td>编制单位:&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">${riskPlan.unitId.f_name }</td>
    </tr>
    <tr>
      <td>备注:&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">${riskPlan.describe }
      </td>
    </tr>
    <tr>
      <td>编制人:&nbsp;&nbsp;&nbsp;</td>
      <td>${riskPlan.author }</td>
      <td>编制日期:&nbsp;&nbsp;&nbsp;</td>
      <td><fmt:formatDate value="${riskPlan.writeDate }"/></td>
    </tr>
     <tr>
	      <td>附件:&nbsp;&nbsp;&nbsp;</td>
	      <td colspan="3">
		      <c:if test="${riskPlan.annexaddress ne null}">
		      	<a href="${ctx}/riskPlanAction.do?method=download&id=${riskPlan.planId}">[${riskPlan.annexname}]</a>
		      </c:if>
	      </td>
	   </tr>
</table>
</fieldset>
<div align="center">
<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" />
</div>
</html:form>
</body>
</html:html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>

<html:html>
<head>
<title>应急资源计划编制</title>
<content tag="heading">应急资源计划编制</content>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
<script type="text/javascript">
function windowClose(){
	parent.sSuc("b1");
}
</script>
</head>
<body>
<html:form action="/emergencyMaterialItemAction.do" method="POST" onsubmit="return validateEmergencyMaterialItemForm(this)" styleClass="form">
<input type="hidden" name="method" value="save"/>
<ex:formProperty name="fid" var="fid"/>
<html:hidden property="itemId"/>
<html:hidden property="qfid" value="${param.qfid}"/>
<fieldset>
<legend>详细</legend>
<table class="formTable" >
		<COLGROUP>
				<COL class="tdLeftTwo" />
                <COL class="tdRightTwo" />
                <COL class="tdLeftTwo" />
                <COL class="tdRightTwo" />
		</COLGROUP>
	<tr>
      <td>物资名称：&nbsp;<font color="red">*</font></td>
      <td colspan="3">${emergencyMaterialItem.material }
     </td>
      
    </tr>
    <tr>
      <td>数量：&nbsp;&nbsp;&nbsp;</td>
      <td>${emergencyMaterialItem.amount }
      </td>
      <td>单位：&nbsp;&nbsp;&nbsp;</td>
      <td>${emergencyMaterialItem.unit }
      </td>
    </tr>
    <tr>
      <td>现在何处：&nbsp;<font color="red">*</font></td>
      <td colspan="3">${emergencyMaterialItem.address }
      </td>
    </tr>
    <tr>
      <td>用途：&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">${emergencyMaterialItem.purpose}
      </td>
    </tr>
    <tr>
      <td>备注：&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">${emergencyMaterialItem.description}
      </td>
    </tr>
</table>
</fieldset>
<div class="saveDiv">
<c:if test="${param.mianView == null}">
	<input type="button" value="<fmt:message key="button.back"/>" onclick="location.href='${ctx}/emergencyMaterialItemAction.do?method=list&fid=${param.qfid}'" class="backButton" />
</c:if>
<c:if test="${param.mianView != null}">
	<input type="button" value="<fmt:message key="button.back"/>" class="backButton" onclick="windowClose()" />
</c:if>
</div>
</html:form>
</body>
</html:html>
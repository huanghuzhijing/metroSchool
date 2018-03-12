<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>

<html:html>
<head>
<title>应急资源计划编制</title>
<content tag="heading">应急资源计划编制</content>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$("#btn_save").click(function(){
saveInfos();

})

})
function saveInfos() {
	var properties=[]; 
	properties.push(["material","物资名称"]);
	properties.push(["address","现在何处"]);
	saveValidateRequired("#btn_save",properties,"emergencyMaterialItemForm");
}
</script>
</head>
<body>
<html:form action="emergencyMaterialItemAction.do" method="POST"  styleClass="form">
<input type="hidden" name="method" value="save"/>
<html:hidden property="itemId"/>
<html:hidden property="qfid" value="${param.qfid}"/>
 <fieldset>
 <c:if test="${emergencyMaterialItem.itemId==null}"><legend>新增</legend></c:if>
<c:if test="${emergencyMaterialItem.itemId!=null}"><legend>编辑</legend></c:if>
 <table class="formTable" >
		<COLGROUP>
				<COL class="tdLeftTwo" />
                <COL class="tdRightTwo" />
                <COL class="tdLeftTwo" />
                <COL class="tdRightTwo" />
		</COLGROUP>
	
	<tr>
      <td>物资名称：&nbsp;<font color="red">*</font></td>
      <td colspan="3"><html:text property="material" styleClass="text" size="60" maxlength="50"/></td>
      
    </tr>
    <tr>
      <td>数量：&nbsp;&nbsp;&nbsp;</td>
      <td>
		<html:text property="amount" styleClass="text" size="20" maxlength="25"/>
      </td>
      <td>单位：&nbsp;&nbsp;&nbsp;</td>
      <td>
      	<html:text property="unit" styleClass="text" size="20" maxlength="50"/>
      </td>
    </tr>
    <tr>
      <td>现在何处：&nbsp;<font color="red">*</font></td>
      <td colspan="3">
      	<html:textarea property="address" rows="4" cols="70" onkeydown="textCounter('address','spanaddress',1000)" onkeyup="textCounter('address','spanaddress',1000)"/>
      	<span class="req" id="spanaddress" style="display:inline">（1000字符以内）</span>
      </td>
    </tr>
    <tr>
      <td>用途：&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">
      	<html:textarea property="purpose" rows="4" cols="70" onkeydown="textCounter('purpose','spanpurpose',500)" onkeyup="textCounter('purpose','spanpurpose',500)"/>
      	<span class="req" id="spanpurpose" style="display:inline">（500字符以内）</span>
      </td>
    </tr>
    <tr>
      <td>备注：&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">
      	<html:textarea property="description" rows="4" cols="70" onkeydown="textCounter('description','spanSummary',1000)" onkeyup="textCounter('description','spanSummary',1000)"/>
      	<span class="req" id="spanSummary" style="display:inline">（1000字符以内）</span>
      </td>
    </tr>
</table>
 </fieldset>
<div class="saveDiv">
<input type="button" id="btn_save" value="保存"/>&nbsp;<input type="button" value="<fmt:message key="button.back"/>" onclick="location.href='${ctx}/emergencyMaterialItemAction.do?method=list&fid=${param.qfid}'" class="backButton" />
</div>
</html:form>
<script type="text/javascript" src="${ctx}/scripts/validator.jsp"></script>
</body>
</html:html>
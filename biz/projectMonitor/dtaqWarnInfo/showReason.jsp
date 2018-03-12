<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<base target="_self">
<title>原因分析</title>
<script src="<c:url value="/scripts/public.js"/>" type="tect/javascript"></script>
<script language="javascript">
function save() {
	 if($("[name='reason']").val()==''){
	 alert("请填写原因分析！");
	 }else{
	      var properties=new Array(); 
		  saveValidateRequired("#btn_save",properties,"dtaqWarnInfoForm");
		  alert("保存成功!");
		  parent.location.href='dtaqWarnInfoAction.do?method=edit&info_id=${info_id}';
	 }
		  
	  
}
</script>
</head>
<body>
<html:form action="dtaqWarnInfoAction.do" method="post">
<input type="hidden" name="method" value="saveReason">
<input type="hidden" name="data_id" value="${data_id}">
<input type="hidden" name="part_id" value="${part_id}">
<input type="hidden" name="operate_mode" value="${operate_mode}">
<input type="hidden" name="info_id" value="${info_id}">
<fieldset>
<legend>原因分析</legend>
<table>
<tr>

<td>
<html:textarea property="reason" cols="60" rows="8" />
</td>
</tr>
<tr>

</tr>
</table>
</fieldset>
<div class="saveDiv">
<%--<c:if test="${operate_mode!='view'}">--%>
	<input type="button" id="btn_save" class="button1" value="保 存" onclick="save()">
<%--</c:if>--%>
</div>
</html:form>
</body>
</html:html>
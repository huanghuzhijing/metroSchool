<%@ page contentType="text/html;charset=UTF-8" %>
<div align="center">
	<c:if test="${(view ne 'view') && (param.id eq null && req_btn)}" >
		<input type="button" class="saveButton" value="<fmt:message key="button.save" />" onclick="logSave()"/>
	</c:if>
	<c:if test="${(view ne 'view') && (param.id ne null)}" >
		<input type="button" class="saveButton" value="<fmt:message key="button.save" />" onclick="logSave()"/>
	</c:if>
	<c:if test="${(!req_btn) && param.id eq null}">
  	<font color="red">当日报告已经填写!</font>  </c:if>
	<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton">
</div>

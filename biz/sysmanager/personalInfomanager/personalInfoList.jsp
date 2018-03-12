<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
</head>
<content tag="heading">
<c:if test="${param.flag == 1}">个人基本信息</c:if>
<c:if test="${param.flag == 2}">个人密码设置</c:if>
<c:if test="${param.flag == 3}">个性化设置</c:if>
</content>
<body>
		<c:if test="${param.flag == '1'}">
			<%@include file="personalInfoContent.jsp" %>
		</c:if>
    	<c:if test="${param.flag == '2'}">
			<%@include file="personalPwdContent.jsp" %>
		</c:if>
    	<c:if test="${param.flag == '3'}">
			<%@include file="personalizedSetContent.jsp" %>
		</c:if>
 </body>
</html:html>

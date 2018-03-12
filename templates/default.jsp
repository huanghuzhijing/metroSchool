<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head> 
		<%@ include file="/commons/meta.jsp"%>
		<title><decorator:title /></title>
		<decorator:head />
	</head>
	<body style="background-color: #fff;padding: 0px; margin: 0px;height:100%;"
		<decorator:getProperty property="body.id" writeEntireProperty="true"/>
		<decorator:getProperty property="body.class" writeEntireProperty="true"/>
		<decorator:getProperty property="body.onload" writeEntireProperty="true"/>>
		<jsp:include page="/commons/header.jsp" />
		<%@ include file="/commons/messages.jsp"%>
		<c:if test="${sitemeshFlag!=1 }">
		<div class="title_back">
           	<decorator:getProperty property="page.heading" />
		</div>
		</c:if>
        <div>
        <decorator:body />
        </div>
		<jsp:include page="/commons/footer.jsp" />
	</body>
</html>

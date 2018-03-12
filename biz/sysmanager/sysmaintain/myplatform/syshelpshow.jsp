<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<html:html>
<head>
	<content tag="heading">
	系统帮助
	</content>
</head>
<body>
    <%
        String address_ = request.getParameter("address");
        String address = basePath+address_;
     %>
	<div align="center" class="sbDiv">
		<input type="button" class="button1" onclick="history.back(-1);" icon="icon_back"
			value="<fmt:message key="button.back"/>" />
	</div>
     <iframe src="<%=address %>" width="100%" height="1000"></iframe>
</body> 
</html:html>

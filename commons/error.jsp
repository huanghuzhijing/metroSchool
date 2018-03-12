<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Error Page</title>
	<script language="javascript">
		function showDetail(){
			$('detail_error_msg').toggle();
		}
	</script>
</head>

<body>

<div id="content">
	<%
		//Exception from JSP didn't log yet ,should log it here.
		String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
		LogFactory.getLog(requestUri).error(exception.getMessage(), exception);
	%>

	<h3>系统内部运行错误: <br><%=exception.getMessage()%>
	</h3>
	<br>

	<button onclick="history.back();">返回</button>
	<br>

	<p><a href="#" onclick="showDetail();">详细错误信息.</a></p>

	<div id="detail_error_msg" style="display:none">
		<pre><%exception.printStackTrace(new java.io.PrintWriter(out));%></pre>
	</div>
</div>
</body>
</html>
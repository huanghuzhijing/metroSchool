<%
	if (session != null) session.invalidate();
	String Logout = request.getParameter("logout");
	if(Logout == null || "false".equals(Logout)){
		response.sendRedirect("index.jsp");
	}
%>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page isErrorPage="true" %>
系统已经成功退出，您可以安全关闭浏览器了！
<%
	if (session != null) session.invalidate();
	String Logout = request.getParameter("logout");
	if(Logout == null || "false".equals(Logout)){
		response.sendRedirect("index.jsp");
	}
%>
<%@ page contentType="text/html; charset=GBK" %>
<%@ page isErrorPage="true" %>
ϵͳ�Ѿ��ɹ��˳��������԰�ȫ�ر�������ˣ�
<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
<script>
</script>
	<frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/projectMonitor/dtaqLine/titletop.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="230,*" border="0" scrolling="no" noresize="noresize" />
		<frame src="dtaqLineAction.do?method=listLeft" id="Links" name="Links" border="0" scrolling="yes" noresize="noresize" />
		<c:if test="${param.flagPage == '1'}">
			<frame src="dtaqLineAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}"  name="main" border="0" scrolling="yes" noresize="noresize" />
		</c:if>
		<c:if test="${param.flagPage == '2'}">
			<frame src="dtaqSegmentAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&qlineId=${param.qlineId}"  name="main" border="0" scrolling="yes" noresize="noresize" />
		</c:if>
		<c:if test="${param.flagPage == '3'}">
			<frame src="dtaqStationAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&qsegmentId=${param.qsegmentId}"  name="main" border="0" scrolling="yes" noresize="noresize" />
		</c:if>
	</frameset>
  </frameset>
<NOFRAMES>
<BODY>
</BODY>

</NOFRAMES>
</html>
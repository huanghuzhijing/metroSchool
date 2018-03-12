<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
 <c:if test="${param.thirdList!='thirdList'}">
	<frame src="${ctx}/biz/projectMonitor/dtaqDataInfoQuery3/dtaqDataInfoQuery3Head.jsp" border="0" scrolling="no" noresize="noresize"/>
</c:if>
 <c:if test="${param.thirdList=='thirdList'}">
	<frame src="${ctx}/biz/projectMonitor/dtaqDataInfoQuery3/dtaqDataInfoQuery3HeadThird.jsp" border="0" scrolling="no" noresize="noresize"/>
</c:if>
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="dtaqDataInfoQuery3Action.do?method=listLeft&thirdList=${param.thirdList}" border="0" scrolling="auto" noresize="noresize"  />
		<frame name="main" src="dtaqDataInfoQuery3Action.do?method=list&thirdList=${param.thirdList}" border="0" scrolling="yes" noresize="noresize" />
	</frameset>
  </frameset>
</html>

<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/projectMonitor/constructEmployee/constructEmployeeQueryHead.jsp" border="0" scrolling="no" noresize="noresize"/>  
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="constructorAction.do?method=queryListLeft" border="0" scrolling="auto" noresize="noresize"  />
	
	
	<frame name="main" src="constructorAction.do?method=queryList&flag=query&lineId=${lineId}&segmentId=${segmentId}&organId=${organId}" border="0" scrolling="yes" noresize="noresize" />
	
	</frameset>
  </frameset>
</html>

<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/safeControlCenter/dtaqSituationMotionanal/dtaqSituationMotionanalHead.jsp" border="0" scrolling="no" noresize="noresize"/>  
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="dtaqSituationMotionanalAction.do?method=listLeft" border="0" scrolling="auto" noresize="noresize"  />
	<!--	<frame name="main" src="dataEmulationAction.do?method=list" border="0" scrolling="yes" noresize="noresize" />-->
	
	<frame name="main" src="dtaqSituationMotionanalAction.do?method=list&qlineId=${qlineId}&qsegmentId=${qsegmentId}&qstationId=${qstationId}" border="0" scrolling="yes" noresize="noresize" />
	
	</frameset>
  </frameset>
</html>

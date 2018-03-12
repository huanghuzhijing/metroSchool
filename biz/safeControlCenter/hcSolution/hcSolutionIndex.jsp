<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/safeControlCenter/hcSolution/hcSolutionHead.jsp" border="0" scrolling="no" noresize="noresize"/>  
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="hcSolutionAction.do?method=listLeft" border="0" scrolling="auto" noresize="noresize"  />
	<!--	<frame name="main" src="dataEmulationAction.do?method=list" border="0" scrolling="yes" noresize="noresize" />-->
	
	<frame name="main" src="hcSolutionAction.do?method=list&qstationId=${qstationId}&qsegmentId=${qsegmentId}&qstationState=${qstationState}" border="0" scrolling="yes" noresize="noresize" />
	
	</frameset>
  </frameset>
</html>

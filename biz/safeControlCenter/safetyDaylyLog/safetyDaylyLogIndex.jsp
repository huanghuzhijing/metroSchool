<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="28px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/safeControlCenter/safetyDaylyLog/head.jsp" border="0" scrolling="no" noresize="noresize"/>  
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="safetyDaylyLogAction.do?method=listLeft" border="0" scrolling="auto" noresize="noresize"  />
	<!--	<frame name="main" src="safetyDaylyLogAction.do?method=listPage" border="0" scrolling="yes" noresize="noresize" />-->
	
	<frame name="main" src="safetyDaylyLogAction.do?method=listPage&station_id=${station_id}" border="0" scrolling="yes" noresize="noresize" />
	
	</frameset>
  </frameset>
</html>

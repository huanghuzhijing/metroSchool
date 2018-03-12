<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="38px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/safeControlCenter/segmentSchedule/segmentScheduleHead.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="${ctx}/segmentScheduleAction.do?method=listLeft" border="0" scrolling="auto" noresize="noresize"  />
		<frame name="main" src="${ctx}/segmentScheduleAction.do?method=list&segment_id=${segment_id}&station_id=${station_id}&station_state=${station_state}&station_type=${station_type}" border="0" scrolling="yes" noresize="noresize" />
	</frameset>
  </frameset>
</html>

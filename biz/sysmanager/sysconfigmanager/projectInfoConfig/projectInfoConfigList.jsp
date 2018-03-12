<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
  <frameset rows="38px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/sysmanager/sysconfigmanager/projectInfoConfig/projectInfoConfigListHead.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="20%,*" border="0" scrolling="no" noresize="noresize"/>
		<frame src="projectInfoConfigAction.do?method=listLeft" border="0" scrolling="no" noresize="noresize" />
		<frame name="main" src="projectInfoConfigAction.do?method=listRight&flag=2" border="0"  noresize="noresize" />
	</frameset>
  </frameset>
</html>

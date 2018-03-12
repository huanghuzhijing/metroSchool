<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="38px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/projectMonitor/projectMaterials/projectMaterialsHead.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="${ctx}/projectMaterialsAction.do?method=left" border="0" scrolling="auto" noresize="noresize"  />
		<frame name="main" src="${ctx}/projectMaterialsAction.do?method=list&station_id=${station_id}&station_state=${station_state}&station_type=${station_type}" border="0" scrolling="yes" noresize="noresize" />
	</frameset>
  </frameset>
</html>
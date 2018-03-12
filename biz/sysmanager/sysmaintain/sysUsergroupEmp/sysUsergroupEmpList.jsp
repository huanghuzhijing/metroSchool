<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
  <frameset rows="38px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/sysmanager/sysmaintain/sysUsergroupEmp/sysUsergroupEmpListHead.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="20%,*" border="0" scrolling="no" noresize="noresize"/>
		<frame src="sysUsergroupEmpAction.do?method=listLeft" border="0" scrolling="no" noresize="noresize" />
		<frame name="main" src="sysUsergroupEmpAction.do?method=listRight" border="0" scrolling="no" noresize="noresize" />
	</frameset>
  </frameset>
</html>

<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
  <head> 
  </head> 
 <frameset rows="38px,*" border="0" scrolling="no" noresize="noresize">
	<frame src="${ctx}/biz/projectmanager/project/prjOwnerUserJoin/prjOwnerUserJoinListHead.jsp" border="0" scrolling="no" noresize="noresize"/>
	<frameset cols="20%,*" border="0" scrolling="auto"  noresize="noresize"/>
		<frame src="prjOwnerUserJoinAction.do?method=listLeft" border="0" scrolling="auto" noresize="noresize"  />
		<frame name="main" src="prjOwnerUserJoinAction.do?method=tab&staticPrjId=${staticPrjId}&flag=1" border="0" scrolling="yes" noresize="noresize" />
	</frameset>
  </frameset>
</html>

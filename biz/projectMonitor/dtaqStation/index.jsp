<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head></head>
<frameset cols="200,*" frameborder="no" border="0" framespacing="0">
	<frame src="${ctx}/dtaqStationAction.do?method=showEnvironment&station_id=${station.station_id}" name="leftFrame" id="leftFrame" title="leftFrame"  scrolling="no" />
	<c:choose>
		<c:when test="${station.station_type eq 'S'}">
			<frame src="${ctx}/localStructureAction.do?method=edit&station_id=${station.station_id}&structure_id=${localStructure.structure_id}" name="mainFrame" id="mainFrame" title="mainFrame" scrolling="yes" />		
		</c:when>
		<c:otherwise>
			<frame src="${ctx}/dtaqKimoliteAction.do?method=edit&station_id=${station.station_id}" name="mainFrame" id="mainFrame" title="mainFrame" scrolling="yes" />		
		</c:otherwise>
	</c:choose>
</frameset>
<NOFRAMES>
<BODY>
</BODY>
</NOFRAMES>
</html>
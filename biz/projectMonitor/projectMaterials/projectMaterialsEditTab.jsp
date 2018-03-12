<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp" %>

<ex:bundle />
<html:html>
<script type="text/javascript">
$(document).ready(function(){
});
</script>
<body>
<c:set var="tabDisabled" value="false"/>
<c:if test="${projectMaterials.materials_id==null}">
	<c:set var="tabDisabled" value="true"/>
</c:if>
<c:if test="${flagPage == 1}"><c:set value="true" var="tabstate1"></c:set></c:if>
<c:if test="${flagPage == 2}"><c:set value="true" var="tabstate2"></c:set></c:if>
<c:if test="${flagPage == 3}"><c:set value="true" var="tabstate3"></c:set></c:if>
<c:if test="${flagPage == 4}"><c:set value="true" var="tabstate4"></c:set></c:if>
<c:if test="${flagPage == 5}"><c:set value="true" var="tabstate5"></c:set></c:if>
<c:if test="${flagPage == 6}"><c:set value="true" var="tabstate6"></c:set></c:if>
    <ex:tab id="dockjTab" width="100%">
		<ex:tabItem name="lab1"  url="${ctx}/projectMaterialsAction.do?method=edit&flagPage=1&materials_id=${projectMaterials.materials_id}&materials_type=${projectMaterials.materials_type}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&station_state=${station_state}&station_type=${station_type}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&ec_id=${projectMaterials.materials_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}" selected="${tabstate1}" label="基本信息" >
			<c:if test="${flagPage == '1'}">
				<%@include file="projectMaterialsEdit.jsp" %>
			</c:if>
	    </ex:tabItem>
	    <c:if test="${station.station_type=='S'}">
	    <ex:tabItem name="lab2"  url="${ctx}/stationStructureAction.do?method=edit&flagPage=2&materials_id=${projectMaterials.materials_id}&materials_type=${projectMaterials.materials_type}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&station_state=${station_state}&station_type=${station_type}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}" label="车站结构设计参数" selected="${tabstate2}"disabled="${tabDisabled}" >
	    	<c:if test="${flagPage == '2'}">
	    	<%@include file="stationStructureEdit.jsp" %>
			</c:if>
	    </ex:tabItem>
	    </c:if>
	    <c:if test="${station.station_type=='P'}">
	    <ex:tabItem name="lab2"  url="${ctx}/blockStructureAction.do?method=edit&flagPage=2&materials_id=${projectMaterials.materials_id}&materials_type=${projectMaterials.materials_type}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&station_state=${station_state}&station_type=${station_type}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}" label="区间结构设计参数" selected="${tabstate2}"disabled="${tabDisabled}" >
	    	<c:if test="${flagPage == '2'}">
	    	<%@include file="blockStructureEdit.jsp" %>
			</c:if>
	    </ex:tabItem>
	    </c:if>
	     <ex:tabItem name="lab3"  url="${ctx}/projectGeologyAction.do?method=edit&flagPage=3&materials_id=${projectMaterials.materials_id}&materials_type=${projectMaterials.materials_type}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&station_state=${station_state}&station_type=${station_type}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}" label="工程地质基本参数" selected="${tabstate3}" disabled="${tabDisabled}">
	    	<c:if test="${flagPage == '3'}">
	    	<%@include file="projectGeologyEdit.jsp" %>
			</c:if>
	    </ex:tabItem>
	     <ex:tabItem name="lab4"  url="${ctx}/stratumRockAction.do?method=edit&flagPage=4&materials_id=${projectMaterials.materials_id}&materials_type=${projectMaterials.materials_type}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&station_state=${station_state}&station_type=${station_type}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}" label="底层岩性性能表" selected="${tabstate4}" disabled="${tabDisabled}">
	    	<c:if test="${flagPage == '4'}">
	    	<%@include file="stratumRockEdit.jsp" %>
			</c:if>
	    </ex:tabItem>
	     <ex:tabItem name="lab5"  url="${ctx}/undergroundPipelineAction.do?method=edit&flagPage=5&materials_id=${projectMaterials.materials_id}&materials_type=${projectMaterials.materials_type}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&station_state=${station_state}&station_type=${station_type}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}" label="周边地下管线信息" selected="${tabstate5}" disabled="${tabDisabled}">
	    	<c:if test="${flagPage == '5'}">
	    	<%@include file="undergroundPipelineEdit.jsp" %>
			</c:if>
	    </ex:tabItem>
	     <ex:tabItem name="lab6"  url="${ctx}/peripheralBuildingAction.do?method=edit&flagPage=6&materials_id=${projectMaterials.materials_id}&materials_type=${projectMaterials.materials_type}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&station_state=${station_state}&station_type=${station_type}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}" label="周边建筑资料信息" selected="${tabstate6}" disabled="${tabDisabled}">
	    	<c:if test="${flagPage == '6'}">
	    	<%@include file="peripheralBuildingEdit.jsp" %>
			</c:if>
	    </ex:tabItem>
    </ex:tab>
</body>
</html:html>

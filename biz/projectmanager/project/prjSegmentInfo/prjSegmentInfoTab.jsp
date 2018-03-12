<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<script type="text/javascript">

</script>
<body>
<c:if test="${flagName == 1}"><c:set value="true" var="tabstate1"></c:set></c:if>
<c:if test="${flagName == 2}"><c:set value="true" var="tabstate2"></c:set></c:if>
    <ex:tab id="dockjTab" width="100%">
		<ex:tabItem name="lab1"  url="${ctx}/prjSegmentInfoAction.do?method=listRight&flagName=1&staticPrjId=${staticPrjId}" selected="${tabstate1}" label="施工标段信息" >
			<c:if test="${flagName == '1'}">
				<%@include file="prjSegmentInfoListRight.jsp" %>
			</c:if>
	    </ex:tabItem>
	    <ex:tabItem name="lab2"  url="${ctx}/prjSegmentSupervisorAction.do?method=listRight&flagName=2&staticPrjId=${staticPrjId}" label="监理标段信息" selected="${tabstate2}" >
	    	<c:if test="${flagName == '2'}">
	    	<%@include file="prjSegsupervisor.jsp" %>
			</c:if>
	    </ex:tabItem>
    </ex:tab>
</body>
</html:html>

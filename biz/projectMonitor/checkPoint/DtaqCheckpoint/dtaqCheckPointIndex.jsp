<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<script type="text/javascript">
</script>
<content tag="heading">
	监测点信息维护
</content>
<body>
 
<c:if test="${param.organ_type == 'O'}"><c:set value="true" var="tabstate1"></c:set></c:if>
<c:if test="${param.organ_type == 'T'}"><c:set value="true" var="tabstate2"></c:set></c:if>
<c:if test="${param.organ_type == 'C'}"><c:set value="true" var="tabstate3"></c:set></c:if>
<c:if test="${param.organ_type == 'A'}"><c:set value="true" var="tabstate4"></c:set></c:if>
    <ex:tab id="dockjTab" width="100%">
		<ex:tabItem name="lab1"  url="${ctx}/dtaqPartAction.do?method=list&organ_type=O" selected="${tabstate1}" label="施工单位" >
			<c:if test="${param.organ_type == 'O'}">
				<%@include file="/biz/projectMonitor/checkPoint/DtaqPart/dtaqPartList.jsp" %>
			</c:if>
	    </ex:tabItem>
	      <ex:tabItem name="lab2"  url="${ctx}/dtaqPartAction.do?method=list&organ_type=T" label="第三方监测" selected="${tabstate2}" >
	    	<c:if test="${param.organ_type== 'T'}">
	    	<%@include file="/biz/projectMonitor/checkPoint/DtaqPart/dtaqPartList.jsp" %>
			</c:if>
	    </ex:tabItem>
	    <ex:tabItem name="lab3"  url="${ctx}/dtaqCheckpointAction.do?method=compare&organ_type=C" label="对应关系查询" selected="${tabstate3}" >
	    	<c:if test="${param.organ_type== 'C'}">
	    	<%@include file="/biz/projectMonitor/thirdMonitor/compare.jsp" %>
			</c:if>
	    </ex:tabItem>
	     <ex:tabItem name="lab4"  url="${ctx}/dtaqPartAction.do?method=list&organ_type=A" label="专项监测" selected="${tabstate4}" >
	    	<c:if test="${param.organ_type== 'A'}">
	    	<%@include file="/biz/projectMonitor/checkPoint/DtaqPart/dtaqPartList.jsp" %>
			</c:if>
	    </ex:tabItem>
    </ex:tab>
</body>
</html:html>
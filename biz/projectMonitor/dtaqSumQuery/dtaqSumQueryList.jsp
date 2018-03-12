<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<script type="text/javascript">
</script>
<content tag="heading">
	监测超限统计分析新版
</content>
<body>
 
<c:if test="${param.organ_type == 'T'}"><c:set value="true" var="tabstate1"></c:set></c:if>
<c:if test="${param.organ_type == 'O'}"><c:set value="true" var="tabstate2"></c:set></c:if>
    <ex:tab id="dockjTab" width="100%">
		<ex:tabItem name="lab1"  url="${ctx}/dtaqSumQueryAction.do?method=list&organ_type=T" selected="${tabstate1}" label="第三方监测" >
			<c:if test="${param.organ_type == 'T'}">
				<%@include file="/biz/projectMonitor/dtaqSumQuery/listContent.jsp" %>
			</c:if>
	    </ex:tabItem>
	      <ex:tabItem name="lab2"  url="${ctx}/dtaqSumQueryAction.do?method=list&organ_type=O" label="施工单位" selected="${tabstate2}" >
	    	<c:if test="${param.organ_type== 'O'}">
	    	<%@include file="/biz/projectMonitor/dtaqSumQuery/listContent.jsp" %>
			</c:if>
	    </ex:tabItem>
	   
    </ex:tab>
</body>
</html:html>
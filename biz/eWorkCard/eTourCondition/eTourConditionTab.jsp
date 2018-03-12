<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<ex:bundle />
<html:html>
<style type="text/css">
.TabItemText {
	margin-left: 5px;
	margin-right: 5px;
	font-family: arial;
	font-size: 20px;
	width:200px;
	color:#ffffff ;
	text-align:center;
	
}
.TabItemMiddle {
	height: 35px;
	width:200px;
	background-image: url(${ctx}/styles/img/tab1.jpg);
	background-repeat: repeat-x repeat-y;
	cursor:pointer;

	text-align:center;
}
.TabItemSelectedMiddle {
	height: 35px;
	width:200px;
	background-image: url(${ctx}/styles/img/tab_selected1.jpg);
	
	text-align:center;
}
.TabItemTextSelected {
	font-family: arial;
	font-size: 20px;
	width:200px;
	color: #33FF00;
	margin-left:5px ;
	margin-right:5px ;
	text-align:center;
	font-weight: bold;
}

.TabItemHoverMiddle {
	cursor: hand;
	height: 35px;
	width:200px;
	background-image: url(${ctx}/styles/img/tab_Hover1.jpg);
	background-repeat: repeat-x,repeat-y;
	cursor:pointer;
	text-align:center;
	
}
</style>
<script type="text/javascript">
$(document).ready(function(){
});
</script>
<body>

<c:if test="${flagPage == '1'}"><c:set value="true" var="tabstate1"></c:set></c:if>
<c:if test="${flagPage == '2'}"><c:set value="true" var="tabstate2"></c:set></c:if>
<c:if test="${flagPage == '3'}"><c:set value="true" var="tabstate3"></c:set></c:if>
<c:if test="${flagPage == '4'}"><c:set value="true" var="tabstate4"></c:set></c:if>

    <ex:tab id="dockjTab" width="100%">
		<ex:tabItem name="lab1"  url="${ctx}/eTourConditionAction.do?method=planList&flagPage=1" selected="${tabstate1}" label="今日现场巡视计划" >
			<c:if test="${flagPage == '1'}">
				<%@include file="eTourConditionPlanList.jsp" %>
			</c:if>
	    </ex:tabItem>
	    
	   
	    <ex:tabItem name="lab2"  url="${ctx}/eTourConditionAction.do?method=yesterdayList&flagPage=2" label="昨日巡视完成情况" selected="${tabstate2}"disabled="${tabDisabled}" >
	    	<c:if test="${flagPage == '2'}">
	    	<%@include file="eTourConditionYesterdayList.jsp" %>
			</c:if>
	    </ex:tabItem>
	   
	     <ex:tabItem name="lab3"  url="${ctx}/eTourConditionAction.do?method=workPointList&flagPage=3" label="工点巡视情况查询" selected="${tabstate3}" disabled="${tabDisabled}">
	    	<c:if test="${flagPage == '3'}">
	    	<%@include file="eTourConditionWorkPointList.jsp" %>
			</c:if>
	    </ex:tabItem>
	     <ex:tabItem name="lab4"  url="${ctx}/eVideoTourAction.do?method=tab&flagPage=4" label="视频巡视计划" selected="${tabstate4}" disabled="${tabDisabled}">
	    	<c:if test="${flagPage == '4'}">
	    	<%@include file="eVideoTourPreList.jsp" %>
			</c:if>
	    </ex:tabItem>
	    
	    
    </ex:tab>
</body>
</html:html>

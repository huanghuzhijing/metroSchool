<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf'%>
<ex:bundle/>
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<title><fmt:message key="dtaq.loadpointpic.title"/></title>

<%--<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>--%>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="${ctx}/scripts/flex_pub.js"></script>
<script src="${ctx}/scripts/newWatchpoint.js"></script>	
<script  type="text/javascript" language=javascript>
//必须搭配prototype1.16版本
</script>
<script language="javascript">
var jsReady = false ;
var swfReady = false ;
function init(){
	addshowhelp("0","jcaqztjh") ;
	//myresize() ;	
}
document.onreadystatechange = stateChange;
function stateChange() {
	if(document.readyState == 'complete') {
		jsReady = true ;
	}
}

function retJsReady(){
	return jsReady ;
}

var  intervalID=window.setInterval("check()",500);
function check(){
	
	if(swfReady){
		
		doAddAndShowData() ;
		window.clearInterval(intervalID);   
	}
}   
function setSwfReady(temp){
	swfReady = true ;
}

function displayWarnInfo(pointids){
	if(pointids !=null && pointids !=""){
		var url = "${ctx}/dtaq/dataInfoQuery2.do?method=forwardWarnCount&pointids="+pointids
	  	art.dialog({title:'数据明细', iframe:url, width:'550', height:'400',top:'100'});
	}
}
</script>
</head>
<body onload="init()">

<c:if test="${isthird == 'Y'}">

	<c:set var="graphUrl1" value="${third_img}"/>
</c:if>
<c:if test="${isthird != 'Y'}">

	<c:set var="graphUrl1" value="${work_img}"/>
</c:if>
<table align="left" width="100%">
	<tr>
<%--		<td align="left" style="vertical-align: top;margin-top:5px;"><%@include file="stationTree.jsp" %></td>--%>
		<td valign="top">
		
		
		<c:if test="${station_id != null}" >
		<table align="center" width="100%" >
	    	<tr align="center"><td> <%@ include file="point_extend.jsp"%></td></tr>
	  	</table>
		</c:if>
		</td>
	</tr>
</table>
</body>
</html>
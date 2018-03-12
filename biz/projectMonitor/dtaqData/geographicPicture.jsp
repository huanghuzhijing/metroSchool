<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle/>
<html:html>
<head>
<title>测点布置图</title>
<content tag="heading">测点布置图</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="${ctx}/scripts/flex_pub.js"></script>
<script src="${ctx}/scripts/newWatchpoint.js"></script>
<script  type="text/javascript" language=javascript>
//必须搭配prototype1.16版本
</script>
<script language="javascript">
function setComparePoint(point_id) {
  jQuery("#compare_point").value = point_id;
  if(point_id != ""){
	  jQuery("#ownerMap").attr("src","${ctx}/dtaqDataAction.do?method=viewMap&point_id="+point_id+"&__skip__");
  }
}


function init(){
		myresize() ;
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
//	if(swfReady){
		doAddAndShowData() ;
		window.clearInterval(intervalID);   
//	}
}   
function setSwfReady(temp){
	//swfReady = true ;
}	
</script>
</head>
<body onLoad="init()">
<html:form action="dtaqDataAction.do">
<c:if test="${organ_type == 'T'}">
	<c:set var="graphUrl1" value="${third_img}"/>
</c:if>
<c:if test="${organ_type == 'O'}">
	<c:set var="graphUrl1" value="${work_img}"/>
</c:if>
	<html:hidden property="pointx" />
	<html:hidden property="pointy" />
	<html:hidden property="map_name"/>
	<html:hidden property="map_filename"/>
	<html:hidden property="compare_point" styleId="compare_point"/>
</html:form>
<table>
    <tr>
    	<td><%@ include file="point_extend.jsp"%></td>
    </tr>
</table>
</body>
</html:html>
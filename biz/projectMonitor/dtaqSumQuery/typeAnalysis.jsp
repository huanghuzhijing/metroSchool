<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<title><fmt:message key="dtaq.dtaqSum.title"/></title>
<content tag="heading">监测超限统计分析新版</content>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script language="javascript" src="${ctx}/scripts/Charts/swf/FusionCharts.js"></script>	
<script language="javascript">
function segmentChanged() {
  location.href="dtaqSumQueryAction.do?method=typeAnalysis&startDate=${startDate}&endDate=${endDate}&segment_id="+jQuery("[name='segment_id']").val()+"&organ_type=${param.organ_type}&line_id=${line_id}";
}

function viewDetails(id) {
  var url ="dtaqSumQueryAction.do?method=segmentAnalysisDetails&startDate=${startDate}&endDate=${endDate}&segment_id=${segment_id}&organ_type=${param.organ_type}&line_id=${line_id}&type_id="+id;
  art.dialog({title:'分析明细', iframe:url, width:'800', height:'450',top:'100'});
}

function backList(){
	location.href="/dtaqSumQueryAction.do?method=list&startDate=${startDate}&endDate=${endDate}&type_id="+jQuery("[name='type_id']").val()+"&isthird=${isthird}&line_id=${line_id}";
}

jQuery(document).ready(function(){
	//
   showCharts_1();
   showCharts_2();
   showCharts_3();
   //
 });
 //
function showCharts_1(){
	//
	var myCharts_1 = new FusionCharts("${ctx}/scripts/Charts/swf/Pie3D.swf","${texts['dtaq.data.red_warn']}","450","350"); 
	var dataXml_1="<chart caption='红色预警' animation='1' showPercentValues='1'>";
	
	<c:forEach items="${datas}" var="data">
		dataXml_1+="<set label='${data.type_name}' value='${data.red_count}' isSliced='1'/>";
	</c:forEach>
	
	dataXml_1+="</chart>";
	myCharts_1.setDataXML(dataXml_1);
	myCharts_1.render("chartdiv_1");
}

function showCharts_2(){
	//
	var myCharts_1 = new FusionCharts("${ctx}/scripts/Charts/swf/Pie3D.swf","${texts['dtaq.data.yellow_warn']}","450","350"); 
	var dataXml_1="<chart caption='黄色预警' animation='1' showPercentValues='1' >";
	
	<c:forEach items="${datas}" var="data">
		dataXml_1+="<set label='${data.type_name}' value='${data.yellow_count}' isSliced='1'/>";
	</c:forEach>
	
	dataXml_1+="</chart>";
	myCharts_1.setDataXML(dataXml_1);
	myCharts_1.render("chartdiv_2");
}

function showCharts_3(){
	//
	var myCharts_1 = new FusionCharts("${ctx}/scripts/Charts/swf/Pie3D.swf","${texts['dtaq.data.normal']}","450","350"); 
	var dataXml_1="<chart caption='正常' animation='1' showPercentValues='1' >";
	
	<c:forEach items="${datas}" var="data">
		dataXml_1+="<set label='${data.type_name}' value='${data.blue_count}' isSliced='1'  />";
	</c:forEach>
	
	dataXml_1+="</chart>";
	myCharts_1.setDataXML(dataXml_1);
	myCharts_1.render("chartdiv_3");
}
</script>
</head>
<body>
<c:if test="${param.organ_type == 'T'}"><c:set value="true" var="tabstate1"></c:set></c:if>
<c:if test="${param.organ_type == 'O'}"><c:set value="true" var="tabstate2"></c:set></c:if>
    <ex:tab id="dockjTab" width="100%">
		<ex:tabItem name="lab1"  url="dtaqSumQueryAction.do?method=typeAnalysis&startDate=${startDate}&endDate=${endDate}&type_id=${type_id}&organ_type=T&line_id=${line_id}" selected="${tabstate1}" label="第三方监测" >
			<c:if test="${param.organ_type == 'T'}">
				<%@include file="typeAnalysisContent.jsp" %>
			</c:if>
	    </ex:tabItem>
	      <ex:tabItem name="lab2"  url="${ctx}/dtaqSumQueryAction.do?method=typeAnalysis&startDate=${startDate}&endDate=${endDate}&type_id=${type_id}&organ_type=O&line_id=${line_id}" label="施工单位" selected="${tabstate2}" >
	    	<c:if test="${param.organ_type== 'O'}">
	    	<%@include file="typeAnalysisContent.jsp" %>
			</c:if>
	    </ex:tabItem>
	   
    </ex:tab>
</body>
</html>
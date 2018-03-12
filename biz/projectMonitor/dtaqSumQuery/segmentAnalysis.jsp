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
function typeChanged() {
  location.href="dtaqSumQueryAction.do?method=segmentAnalysis&startDate=${startDate}&endDate=${endDate}&type_id="+jQuery("[name='type_id']").val()+"&organ_type=${param.organ_type}&line_id=${line_id}";
}

function viewDetails(id) {
  var url ="dtaqSumQueryAction.do?method=segmentAnalysisDetails&startDate=${startDate}&endDate=${endDate}&type_id=${type_id}&organ_type=${param.organ_type}&line_id=${line_id}&segment_id="+id;
  art.dialog({id:'viewDetail',title:'查看明细', iframe:url, width:'800', height:'450',top:'10'});
}

function backList(){
	location.href="dtaqSumQueryAction.do?method=list&startDate=${startDate}&endDate=${endDate}&type_id="+jQuery("[name='type_id']").val()+"&organ_type=${param.organ_type}&line_id=${line_id}";
}
jQuery(document).ready(function(){
	//
  	 showCharts_1();
   //
 });
function showCharts_1(){
	var myCharts = new FusionCharts("${ctx}/scripts/Charts/swf/MSColumn3D.swf"," ","540","300"); 
	var dataXml="<chart caption=' ' xAxisName='线路标段' yAxisName='预警次数' formatNumberScale='0' >";
	dataXml+="<categories>";
			<c:forEach items="${datas}" var="data">
					dataXml+="<category label='${data.segment_name}' />";
			</c:forEach>
	dataXml+="</categories>";
	
	dataXml+="<dataset seriesName='红色预警'  showValues='0' color='FE0000'>";
				<c:forEach items="${datas}" var="data">
					dataXml+="<set value='"+Number('${data.red_count}')+"'/>";
				</c:forEach>
	dataXml+="</dataset>";
	
	dataXml+="<dataset seriesName='橙色预警'  showValues='0'  color='FFA500'>";
			<c:forEach items="${datas}" var="data">
				dataXml+="<set value='"+Number('${data.organ_count}')+"'/>";
			</c:forEach>
	dataXml+="</dataset>";

	dataXml+="<dataset seriesName='黄色预警'  showValues='0' color='FEFE00'>";
	<c:forEach items="${datas}" var="data">
		dataXml+="<set value='"+Number('${data.yellow_count}')+"' />";
	</c:forEach>
	dataXml+="</dataset>";

	dataXml+="<dataset seriesName='正常'  showValues='0' color='00FF00'>";
	<c:forEach items="${datas}" var="data">
		dataXml+="<set value='"+Number('${data.green_count}')+"' />";
	</c:forEach>
	dataXml+="</dataset>";
	
	dataXml+="</chart>";
	myCharts.setDataXML(dataXml);
	myCharts.render("chartdiv_1");
}


</script>
</head>
<body>
<c:if test="${param.organ_type == 'T'}"><c:set value="true" var="tabstate1"></c:set></c:if>
<c:if test="${param.organ_type == 'O'}"><c:set value="true" var="tabstate2"></c:set></c:if>
    <ex:tab id="dockjTab" width="100%">
		<ex:tabItem name="lab1"  url="dtaqSumQueryAction.do?method=segmentAnalysis&startDate=${startDate}&endDate=${endDate}&type_id=${type_id}&organ_type=T&line_id=${line_id}" selected="${tabstate1}" label="第三方监测" >
			<c:if test="${param.organ_type == 'T'}">
				<%@include file="segmentAnalysisContent.jsp" %>
			</c:if>
	    </ex:tabItem>
	      <ex:tabItem name="lab2"  url="${ctx}/dtaqSumQueryAction.do?method=segmentAnalysis&startDate=${startDate}&endDate=${endDate}&type_id=${type_id}&organ_type=O&line_id=${line_id}" label="施工单位" selected="${tabstate2}" >
	    	<c:if test="${param.organ_type== 'O'}">
	    	<%@include file="segmentAnalysisContent.jsp" %>
			</c:if>
	    </ex:tabItem>
	   
    </ex:tab>
<div class="saveDiv">
	<html:button property="back" value="${texts['button.back']}" styleClass="backButton" onclick="backList()"></html:button>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.consTotal.title"/></title>
<content tag="heading">
<%--	<fmt:message key="dtaq.consTotal.title"/>--%>
	人员资质统计分析
</content>
<script language="javascript" src="${ctx}/scripts/Charts/swf/FusionCharts.js"></script>	
<script type="text/javascript">
function submitQuery(line_id){
	location.href="${ctx}/constructorTotalAction.do?method=list&line_id="+line_id;
}
//
jQuery(document).ready(function(){
	//
	//
   showCharts_1();
   showCharts_2();
   //
 });
function showCharts_1(){
	var myCharts = new FusionCharts("${ctx}/scripts/Charts/swf/MSColumn3D.swf","岗前培训柱状图","540","300"); 
	var dataXml="<chart caption='岗前培训柱状图' xAxisName='标段' yAxisName='个数' formatNumberScale='0' >";
	dataXml+="<categories>";
			<c:forEach items="${datas}" var="data">
					dataXml+="<category label='${data.segment_name}' />";
			</c:forEach>
	dataXml+="</categories>";
	
	dataXml+="<dataset seriesName='已岗前培训'  showValues='0' color='9999FF'>";
				<c:forEach items="${datas}" var="data">
					dataXml+="<set value='"+Number('${data.training_count}')+"' />";
				</c:forEach>
	dataXml+="</dataset>";
	
	dataXml+="<dataset seriesName='未岗前培训'  showValues='0'  color='993366'>";
			<c:forEach items="${datas}" var="data">
				dataXml+="<set value='"+Number('${data.notraining_count}')+"' />";
			</c:forEach>
	dataXml+="</dataset>";
	
	dataXml+="</chart>";
	myCharts.setDataXML(dataXml);
	myCharts.render("chartdiv_1");
}
function showCharts_2(){
	var myCharts = new FusionCharts("${ctx}/scripts/Charts/swf/MSColumn3D.swf","在岗状态柱状图","540","300"); 
	var dataXml="<chart caption='在岗状态柱状图' xAxisName='标段' yAxisName='个数' formatNumberScale='0' >";
	dataXml+="<categories>";
			<c:forEach items="${datas}" var="data">
					dataXml+="<category label='${data.segment_name}' />";
			</c:forEach>
	dataXml+="</categories>";
	
	dataXml+="<dataset seriesName='在岗'  showValues='0'  color='9999FF'>";
				<c:forEach items="${datas}" var="data">
					dataXml+="<set value='"+Number('${data.onjob_count}')+"' />";
				</c:forEach>
	dataXml+="</dataset>";
	
	dataXml+="<dataset seriesName='离岗'  showValues='0'  color='993366'>";
			<c:forEach items="${datas}" var="data">
				dataXml+="<set value='"+Number('${data.leavejob_count}')+"' />";
			</c:forEach>
	dataXml+="</dataset>";
	
	dataXml+="</chart>";
	myCharts.setDataXML(dataXml);
	myCharts.render("chartdiv_2");
}
</script>
</head>
 <body>
<table class="queryTable">
<tr>
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
 	<tr>
 	<td>
  <html:form action="constructorTotalAction.do">
	  <table align="left">
		  <tr>
	  		<td td width="100px" >线路:</td>
	  		<td>
				  <html:select property="line_id" onchange="submitQuery(this.value)" value="${line_id}">
				  	<html:optionsCollection name="lines" value="line_id" label="line_name"/>
				  </html:select>
	  		</td>
		  </tr>
	  </table>
  </html:form>
	</td>
		</tr>
 	</table>
	
	<fieldset>
  <legend><strong>统计信息列表</strong></legend>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr align="center">
	<td>
		<table class="listTable" id="fileTable" width="100%" border="0" cellpadding="0" cellspacing="1" align="center" >		
			<tr align="center"  height="25">
			  <th width="20%">线路标段</th>
			  <th width="30%">施工单位</th>
			  <th width="15%">已岗前培训</th>
			  <th width="15%">未岗前培训</th>
			  <th width="10%">在岗</th>
			  <th width="10%">离岗</th>
			</tr>
			
				<c:forEach items="${datas}" var="data">
				<tr align="center">
					<td>${data.segment_name}</td>
					<td>${data.organ_name}</td>
					<td>${data.training_count}</td>
					<td>${data.notraining_count}</td>
					<td>${data.onjob_count}</td>
					<td>${data.leavejob_count}</td>
					</tr>
					</c:forEach>
				
			
		</table>
	</td>
	</tr>
   <tr align="center">
   <td>
  		<div  id="chartdiv_1"></div>
	</td>
	</tr>
	<tr align="center">
   <td>
   		<div  id="chartdiv_2"></div>
	</td>
	</tr>
	</table>
  
  </fieldset>
  </body>
</html:html>
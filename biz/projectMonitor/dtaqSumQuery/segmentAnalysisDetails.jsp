<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>

<ex:bundle/>
<html>
<head>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>

<script language="javascript">
jQuery(document).ready(function(){
	initCont();
})

function initCont() {
	jQuery.each(jQuery(".memoShow"),function(index,item){
		var obj = jQuery(item);
		obj.attr("title",obj.html());
		if(obj.html().lengthCheck()>30){
			obj.html(substr(obj.html(),30)+'...');
		}
	});
}

function exportExcel() {
  location.href="${ctx}/dtaq/sumQuery.do?method=segmentAnalysisDetailsExport&isthird=${isthird}&line_id=${line_id}&segment_id=${segment_id}&type_id=${type_id}&startDate=${startDate}&endDate=${endDate}&__skip__";
}

function windowClose(){
	parent.art.dialog({id:'viewDetail'}).close();
}
</script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
</head>
<body>
<ec:table items="vos" var="vo" action="dtaqSumQueryAction.do?method=segmentAnalysisDetails"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
<ec:column property="warn_state" title="预警状态" sortable="false" >
<center><div class="state${vo.warn_state} stateDiv" ></div></center>
</ec:column>
<ec:column property="segment_name" title="标段"  sortable="false"/>
<ec:column property="station_name" title="车站/区间"  sortable="false" />
<ec:column property="org_sg" title="施工单位"  sortable="false" />
<ec:column property="type_name" title="监测类型"  sortable="false"/>
<ec:column property="part_name" title="监测部位"  sortable="false" />
<ec:column property="point_code" title="测点编码"  sortable="false" />
<ec:column property="write_date" title="监测日期" sortable="false" >
  <fmt:formatDate value="${vo.write_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
</ec:column>
<ec:column property="warn_memo" title="预警原因" sortable="false">
<div class="memoShow">${vo.warn_memo}</div>
</ec:column>
</ec:row>
</ec:table>
<div class="saveDiv">
  <input type="button" class="button1" value="${texts['button.close']}" onclick="windowClose();">
</div>
</body>
</html>
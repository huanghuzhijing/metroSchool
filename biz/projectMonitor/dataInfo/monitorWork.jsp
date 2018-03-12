<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<content tag="heading">
系统工作考核中心
</content>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
<script language="javascript">

function delayChange(index){
	var begin_date = jQuery("[name='startDate']").val();
	var end_date = jQuery("[name='endDate']").val();
	if(begin_date !="" && end_date != ""){
	    if(begin_date > end_date){
			if(index==0){
				$("startDate").value='';
	      	}else{
	      		$("endDate").value='';
	      	}
	     	alert("日期无效");
	     	$("[name='startDate']").val('${startDate}');
   	 		$("[name='endDate']").val('${endDate}');
	     	return false;
	    }else{
	    	var start = parseDate(begin_date);
	    	var end = parseDate(end_date);
	    	var day = DateDiff('d',start,end);
	    	if(day>31){
		    	if(index==0){
					$("startDate").value=formatDate(DateAdds(end,31,'-'));
		     	}else{
		      		$("endDate").value=formatDate(DateAdds(start,31,'+'));
		      	}
	    	 	alert("时间间隔不能超过31天！");
	    	 	$("[name='startDate']").val('${startDate}');
	    	 	$("[name='endDate']").val('${endDate}');
	    	 	return false;
	    	}
	    }
   	}
}

function displayDate(index){
    try{
    	window.setTimeout("delayChange("+index+")",1);
    }
    catch(e){
    	alert(e);
    }
}
function init(){
	var dayArray = '${dayArray}';
	var arr = dayArray.split(",");
	var obj=$('dayArray_tr');
	var size = arr.length;
	for(i=0;i<size;i++){
		var th=document.createElement('th');
		arr[i] = arr[i].trim();
		th.innerHTML=arr[i].substring(8,arr[i].length);
		th.title = arr[i];
		obj.appendChild(th);
	}
}
function exportExcel(){
	location.href = '${ctx}/dtaq/dataInfo.do?method=exportExcel';
<%--	document.forms[0].action = '${ctx}/dtaq/dataInfo.do?method=exportExcel';--%>
<%--	document.forms[0].submit();--%>
}
</script>

</head>
<body>
<fieldset>
<legend><fmt:message key="dtaq.common.query_field" /></legend>
  	<html:form action="dtaqDataInfoAction.do?method=monitorWork">
  	<table class="searchTable" width="100%" border="0" cellspacing="0" cellpadding="2">
  	<tr>
  		<td width="100px">工作考核类型:</td>
  		<td>
  		<ex:dictSelect type="ExaminationType" property="work_type" showSelect="false"/>
  		</td>
  		<td width="80px">监测时间段:</td>
  		<td><html:text property="startDate" value="${startDate}" onchange="displayDate(0)" onfocus="WdatePicker()"></html:text>--<html:text property="endDate" onchange="displayDate(1)" value="${endDate}" onfocus="WdatePicker()"></html:text></td>
  		<td width="100px" align="right"><input type="submit" value="<fmt:message key="button.query"/>" class="button1" /></td>
  	</tr>
  	</table>
   	
  	</html:form>
</fieldset>
<fieldset>
<legend><fmt:message key="dtaq.common.list_field"/></legend>
<table width="100%" class="listTable">
<tr>
	<td align="left">
		<div class="tableMemo_Div" align="left"><font class="def_font"><span style="float:left">备注:</span>&nbsp;<span style="background-color:yellow;display:block;width:40px;height:15px;float:left"></span><span style="float:left">工作考核类型代表未填报数据 &nbsp;&nbsp;</span>
		<span style="background-color:green;display:block;width:40px;height:15px;float:left"></span><span style="float:left">工作考核类型代表已填报数据 </span></font></div>
	</td>
	<td align="right">
		<input type="button" class="button1" value="导出excel" icon="icon-excel" onclick="location.href='dtaqDataInfoAction.do?method=exportMonitorWorkExcel&work_type=${work_type}&startDate=${startDate}&endDate=${endDate}'"/>
	</td>
</tr>
</table>

<table class="listTable" width=100% align="center" cellspacing="1" cellpadding="0"  border="0" id="PROJGROUP">
<thead align="center">
<tr id="dayArray_tr">
	<th>工点名称</th>
	<th>
		<ex:dicDisplay dictIdentify="WorkType" dictValue="${work_type}"/>
	</th>
	<c:forTokens items="${dayArray}" delims="," var="day">
		<th>${day}</th>
	</c:forTokens>
</tr>
</thead>
<tbody>
<c:forEach items="${datalist}" var="data">
<tr align="center">
	<td>${data.station_name}</td>
	<td>${data.organ_name}</td>
	<c:forEach items="${data.flag}" var="flag">
		<td align="center">
			<c:if test="${flag eq 0}"><span style="background-color:yellow;width:100%;height:15px;display:block;"></span></c:if>
			<c:if test="${flag eq 1}"><span style="background-color:green;width:100%;height:15px;display:block;"></span></c:if>
		</td>
	</c:forEach>
</tr>
</c:forEach>
</tbody>
</table>

</fieldset>
</body>
</html>
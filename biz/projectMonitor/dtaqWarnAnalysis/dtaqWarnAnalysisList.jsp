<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
	<script src="<c:url value="/scripts/public.js"/>"
		type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
	<script type="text/javascript">
function initWork() {
	jQuery.each(jQuery(".warn_memo"),function(index,item){
		var obj = jQuery(item);
		obj.attr("title",obj.html());
		if(obj.html().lengthCheck()>15){
			obj.html(substr(obj.html(),15)+'...');
		}
	});
	
}

function showComparePointTimes(point_id,type_kind,part_id) {
var url ="${ctx}/dtaqDataInfoQuery3Action.do?method=showComparePointTimes&point_id="+point_id+"&type_kind="+type_kind+"&startDate=${param.startDate}&endDate=${param.endDate}";
	
		 if(type_kind == "3"){
  	   url ="${ctx}/dtaqDataInfoQuery3Action.do?method=showPartTimes3&part_id="+part_id+"&type_kind="+type_kind+"&qstartedDate=${param.startDate}&qendedDate=${param.endDate}";
		 }
     art.dialog({id:'commonDialog1',title:'数据明细', iframe:url, width:'800', height:'440'});
	
}

function warnSend(){
	var dataIds = ""; 
	var checkBoxs = jQuery("[name='checkmep']");
	if(checkBoxs.length > 0){
		checkBoxs.each(function(){
			if(jQuery(this).attr("checked")){
				dataIds += "," + jQuery(this).val() ;
			}
		}) ;
		if(dataIds != ""){
			var ids = dataIds.substring(1);
			var url="dtaqWarnAnalysisAction.do?method=downSend&line_id=${param.line_id}&segment_id=${param.segment_id}&station_id=${param.station_id}&organ_type=${param.organ_type}&data_ids="+ids;
			location.href=url;
		}else{
			alert("请先选择超限预警信息再启动警情下发!");
		}
	}else{
		alert("没有超限预警信息,操作无效!");
	}
}

function selectCheck(type){
	var checkboxs = jQuery("[name='checkmep']");
	if(type == "all"){
		checkboxs.each(function(){
			jQuery(this).attr("checked","checked") ;
		}) ;
	}else if(type == "none"){
		checkboxs.each(function(){
			jQuery(this).attr("checked","") ;
		}) ;
	}
}
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			
			<td valign="top">
				<fieldset>
					<legend>
						<strong><fmt:message key="dtaq.common.list_field" /></strong>
					</legend>
					<table class="commonTable" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center">
								<font color="#50A2E6">说明：查询的数据为昨天中午12点到今天中午12点的预警超限信息 </font>
							</td>
							<td align="right">
								<input type="button" class="button1"
									value="全选"
									onclick="selectCheck('all')">
								<input type="button" class="button1"
									value="全不选"
									onclick="selectCheck('none')">
								<input type="button" class="button1"
									value="警情下发"
									onclick="warnSend()">
							</td>
						</tr>
					</table>
					<table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
						<thead align="center">
						<tr align="center" height="25" id="trSite">
							<th width="10%">测点编码</th>
							<th width="10%">监测类型</th>
							<th width="10%">监测部位</th>
							<th width="10%">监测日期</th>
							<th width="12%">累计变化量</th>
							<th width="10%">变化速率</th>
							<th width="10%">预警状态</th>
							<th width="10%">预警原因</th>
							<th width="8%">选择</th>
							<th width="10%">操作</th>
						</tr>
						</thead>
						<c:if test="${dtaqDatas != null}">
							<c:forEach items="${dtaqDatas}" var="data">
								<tr align="center" height="20">
									<td>
										${data.point_code}
									</td>
									<td>
										${data.info_id.type_id.type_name}
									</td>
									<td>
										${data.part_id.part_name}
									</td>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd" value="${data.write_date}" />
									</td>
									<td>
										${data.total_change}
									</td>
									<td>
										${data.change_rate}
									</td>
									<td>
										<center><div id="v_warn_state" class="state${data.warn_state}"></div></center>
									</td>
									<td class="warn_memo">
										${data.warn_memo}
									</td>
									<td>
										<input name="checkmep" value="${data.data_id}" type="checkbox">
									</td>
									<td align="center">
										<input type="button" value="时序曲线"
											class="button1"
											onclick="showComparePointTimes('${data.point_id.point_id}','${data.info_id.type_id.type_kind}','${data.point_id.partId.part_id}')">
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</fieldset>
			</td>
		</tr>

	</table>
</body>
</html:html>
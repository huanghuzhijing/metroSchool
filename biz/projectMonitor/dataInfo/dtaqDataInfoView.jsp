<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<style type="text/css">
.state1, .state2, .state3, .state4 {
    border: 1px solid #000000;
    display: inline-block;
    height: 15px;
    width: 80px;
}
span.state1 {
    background-color: #9eff8d;
}
span.state2 {
    background-color: #fffc6c;
}
span.state3 {
    background-color: #ffa40a;
}
span.state4 {
    background-color: #ff3f32;
}

.divagree0{background:#FAF7F7;}
.divagree1{background:#B4C0EC;}
.divagree2{background:#ECAB95;}
</style>
<script type="text/javascript">
function backToList(){
		location.href = '${ctx}/dtaqDataInfoAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qorganType=${param.qorganType}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}';
}

function showPartTimes(part_id) {
		var type_kind = '${dtaqDataInfo.type_id.type_kind}';
		var sheight = screen.height;
		var swidth = screen.width;
	  	var url ="${ctx}/dtaqDataInfoQuery3Action.do?andomCode=abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890&method=showPartTimes&part_id="+part_id+"&type_kind="+type_kind+"&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&from=data";
		window.open(url,'','height='+sheight+',width='+swidth+',top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no,titlebar=no')
		
	  	//var url ="${ctx}/dtaqDataInfoAction.do?method=showPartTimes&part_id="+part_id+"&type_kind="+type_kind+"&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&from=data";
	  	//art.dialog({id:'commonDialog1',title:'数据分析', iframe:url, width:'900', height:'600',top:'10'});
}

//一般曲线（非测斜）
function showComparePointTimes(point_id) {
		var type_kind = '${dtaqDataInfo.type_id.type_kind}';
		var sheight = screen.height;
		var swidth = screen.width;
		var url ="${ctx}/dtaqDataInfoQuery3Action.do?andomCode=abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890&method=showComparePointTimes&point_id="+point_id+"&type_kind="+type_kind+"&qstartDate=${beginMonDate}&qendDate=${endDatePic}&from=data";
		window.open(url,'','height='+sheight+',width='+swidth+',top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no,titlebar=no')
			
		//  var url ="${ctx}/dtaqDataInfoAction.do?method=showComparePointTimes&point_id="+point_id+"&type_kind="+type_kind+"&qstartDate=${beginMonDate}&qendDate=${endDatePic}&from=data";
		//  art.dialog({id:'commonDialog1',title:'数据分析', iframe:url, width:'900', height:'500',top:'10'});
	
}
//一般曲线（测斜）
function showComparePointTimes3(point_id) {
	var type_kind = '${dtaqDataInfo.type_id.type_kind}';
	var sheight = screen.height;
	var swidth = screen.width;
	var url ="${ctx}/dtaqDataInfoQuery3Action.do?andomCode=abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890&method=showComparePointTimes3&point_id="+point_id+"&type_kind="+type_kind+"&qstartDate=${beginWeekDate}&qendDate=${endDatePic}&from=data";
	window.open(url,'','height='+sheight+',width='+swidth+',top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no,titlebar=no')
	
	//var url ="${ctx}/dtaqDataInfoAction.do?method=showComparePointTimes3&point_id="+point_id+"&type_kind="+type_kind+"&qstartDate=${beginWeekDate}&qendDate=${endDatePic}&from=data";
	//art.dialog({id:'commonDialog1',title:'数据分析', iframe:url, width:'900', height:'600',top:'50'});
}

</script>
</head>
<content tag="heading">
<c:if test="${param.qorganType=='O'}">
施工方数据编制
</c:if>
<c:if test="${param.qorganType=='T'}">
第三方数据编制
</c:if>
</content>
<body>

<html:form enctype="multipart/form-data" action="dtaqDataInfoAction.do" method="POST" >
<fieldset style="margin: 10">
	<legend>工点基本信息</legend>
	<table class="titleTable">
     <COLGROUP>
        <COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
   	</COLGROUP>

		<tr>
			<td>线路：</td>
			<td>${dtaqDataInfo.line_id.line_name}</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>标段：</td>
			<td>${dtaqDataInfo.segment_id.segment_name}</td>
			<td>车站/区间：</td>
			<td>${dtaqDataInfo.station_id.station_name}</td>
		</tr>
		<tr>
			<td>施工单位：</td>
			<td><ex:orgDisplay id="${dtaqDataInfo.SG_Org}" /></td>
			<td>第三方监测单位：</td>
			<td><ex:orgDisplay id="${dtaqDataInfo.JC_Org}" /></td>
		</tr>
		</table>
</fieldset>
<fieldset>
<legend>填报基本信息</legend>
	<table class="titleTable">
     <COLGROUP>
        <COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
   	</COLGROUP>
		<tr>
			<td>监测类型：</td>
			<td>${dtaqDataInfo.type_id.type_name}</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>填报人：</td>
			<td><ex:employeeName id="${dtaqDataInfo.write_user}" /></td>
			<td>测量人：</td>
			<td>${dtaqDataInfo.measure_user}</td>
		</tr>
		<tr>
			<td>监测日期：</td>
			<td>${dtaqDataInfo.monitoring_date}</td>
			<td>填报日期：</td>
			<td><fmt:formatDate value='${dtaqDataInfo.write_date}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
		</tr>
		<tr>
			<td>备注：</td>
			<td colspan="3">
				<html:textarea property="remark" value="${dtaqDataInfo.remark}" readonly="true" cols="80" rows="6" />
			</td>
		</tr>
</table>
</fieldset>
</html:form>
		<fieldset style="margin: 10">
			<legend>
				<strong>数据填报详细 </strong>
			</legend>
			<table width="100%">
				<tr>
					<td valign='top' width="15%">
						<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
							<tr align="center">
								<td align="left">
								<script language="javascript">
									var positionTree = new dTree('positionTree');
										positionTree.setIconPath('${ctx}/scripts/dtree/');
										positionTree.add('-1',-99,'${dtaqDataInfo.type_id.type_name}',null);
										<c:forEach items="${dtaqparts}" var="datapart">
										  positionTree.add('${datapart.part_id}','-1','${datapart.part_name}','dtaqDataInfoAction.do?method=view&info_id=${dtaqDataInfo.info_id}&queryPart=${datapart.part_id}&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qorganType=${param.qorganType}',null,null,'',''); 
										</c:forEach>
										document.write(positionTree);
								</script>
								</td>
							</tr>
						</table>
					</td>
					<td valign='top' >
						<table class="listTable" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
							<c:if test="${part != null}">
								<tr>
									<td align="left" width="85%">
									<div align="left">
										<font class="span_color"><strong>所属部位：<font color="blue">${part.part_name}</font>
										<c:if test="${project_direction != null}"><font color="blue">(工程方向：${project_direction})</font></c:if>
										</strong></font>
									</div>
									</td>
									<td width="15%" align="right">
										<input type="button" value="时序曲线"
											class="button1" onclick="showPartTimes('${part.part_id}')" />
									</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="3">
									<c:if test="${dtaqDataInfo.type_id.type_kind==1}">
										<%@include file="viewtype1.jsp"%>
									</c:if>
									<c:if test="${dtaqDataInfo.type_id.type_kind==2}">
										<%@include file="viewtype2.jsp"%>
									</c:if>
									<c:if test="${dtaqDataInfo.type_id.type_kind==3}">
										<%@include file="viewtype3.jsp"%>
									</c:if>
									<c:if test="${dtaqDataInfo.type_id.type_kind==4}">
										<%@include file="viewtype4.jsp"%>
									</c:if>
									<c:if test="${dtaqDataInfo.type_id.type_kind==5}">
										<%@include file="viewtype5.jsp"%>
									</c:if>
									<c:if test="${dtaqDataInfo.type_id.type_kind==6}">
										<%@include file="viewtype6.jsp"%>
									</c:if>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</fieldset>





<div class="saveDiv">
	<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" icon="icon_back"/>
</div>

</body>
</html:html>
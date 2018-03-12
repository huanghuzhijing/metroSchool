<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle />
<html:html>
<head>
<style type="text/css">
.title {
 color:#024280;
}
.content{
 color:#4B4A4A ;
}
.subtitle {
	color: #065CB1;
	font-size: 11px;
}
.title_table{
	background-color:#EEF9FF ;
	border:0px ;
	margin-top:5px;
}
.state-box li{
	float:left;
	width:130px;
}
.state1 {
  border:1px solid #000;
  background-color:#9eff8d;
  zoom:1;
  display:inline-block ;
  height:15px;
  width:40px;
  position: relative;
  top: 1px;
  margin-right: 3px;
}

.state2 {
  border:1px solid #000;
  background-color:#fffc6c;
  zoom:1;
  display:inline-block ;
  height:15px;
  width:40px;
  position: relative;
  top: 1px;
  margin-right: 3px;
}

.state3 {
  border:1px solid #000;
  background-color:#ffa40a;
  zoom:1;
  display:inline-block ;
  height:15px;
  width:40px;
  position: relative;
  top: 1px;
  margin-right: 3px;
}
.state4 {
  border:1px solid #000;
  background-color:#ff3f32;
  zoom:1;
  display:inline-block ;
  height:15px;
  width:40px;
  position: relative;
  top: 1px;
  margin-right: 3px;
}

</style>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
		jQuery(document).ready(function(){
		$("#tianqi").animate({up:'20px'});
				//lineInitChanged();
				//segmentInitChanged();
				//stationInitChanaged();
		})
		function riskPatrolInfo(id){
			
			var url="dtaqRiskPatrolAction.do?method=riskInfo&station_id="+id;
			art.dialog({title:'现场视频', iframe:url, width:'800', height:'450'});
}

function viewProjectSchedule(sch_id){
	var url ="safeAnalysisTotalAction.do?method=viewProjectSchedule&sch_id="+sch_id+"&random="+Math.random();
	
	art.dialog({title:'形象进度', iframe:url, width:'800', height:'400'});
}

function viewAnalysisReport(analyse_id,displayType){
	var url ="safeAnalysisTotalAction.do?method=viewAnalysisReport&forwardType=viewAnalysisReport&analyse_id="+analyse_id+"&displayType="+displayType+"&random="+Math.random();
	art.dialog({title:'分析报告', iframe:url, width:'800', height:'450'});
}

function viewDataReport(station_id,organ_type){
	var url ="dtaqCheckpointAction.do?method=viewDataReport&station_id="+station_id+"&organ_type="+organ_type+"&random="+Math.random();
	art.dialog({title:'数据分析', iframe:url, width:'800', height:'450'});
}

function viewDataPointPicture(station_id,picname,organ_type){
	var url ="safeAnalysisTotalAction.do?method=viewDataPointPicture&picname="+picname+"&organ_type="+organ_type+"&station_id="+station_id+"&random="+Math.random();
	art.dialog({title:'监测状态', iframe:url, width:'800', height:'450'});
}

function show(){
    var event=event||window.event;
    document.getElementById("div2").style.display="";
    var leftPx = parseInt(event.clientX)-50;
    document.getElementById("div2").style.left=leftPx+"px";
    document.getElementById("div2").style.top=event.clientY+"px";
}
function hidden(){
    document.getElementById("div2").style.display="none";
}


function showResponse(selReponse){
	var text = selReponse.responseText; 
}
		function viewAnalyse(id){
		var url="safeAnalysisTotalAction.do?method=showAnalyseInfo&safeTotal=Y&station_id="+id;
		location.href=url;
		}
		function toGis(){
		var url="dtaqLineAction.do?method=gisAnalyseIndex";
		window.parent.location.href=url;
		}
	</script>
</head>
<body >
	<table class="title_table"  cellpadding="0" cellspacing="0" width="100%" height="45">
		<tr >
		<td>
		<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=1" width="330" height="65" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></td>
		<td width="50%" align="center"><font color="#4A77A3"><strong> 线路：${lineName }</strong></font></td>
		<td height="30" width="400px" align="right">&nbsp;&nbsp;<c:if test="${true}"><a href="${ctx}/dtaqRiskPatrolAction.do?method=projectReport"><img class="img" src="${ctx}/images/report_button.jpg" border="0"></img></a></c:if>&nbsp;&nbsp;</td>
		<td height="30" width="400px" align="left">&nbsp;&nbsp;<c:if test="${true}"><a href="javaScript:toGis()"><img  class="img1" src="${ctx}/images/gis_button.jpg" border="0"></img></a></c:if>&nbsp;&nbsp;</td>

		</tr>
	</table>
	 
	<table class="listTable"  cellpadding="0" cellspacing="0" width="100%" height="20">
		<tr>
			<td>
				<table align="center" style=" background-color:#EEF9FF" width="100%">
					<tr>
						<td align="left" width="25%">
							<font color="#4A77A3"><strong>[以下安全信息更新截止${currentDate}]</strong></font>
						</td>
						<td align="center" width="15%"> <div>
								
								<span style="float: left"><font color="#4A77A3"><strong> 安全风险状态说明：</strong></font></span>
								</div>
								</td>
								<td align="left">
									<ul class="state-box ">
										<li><span class="state1" ></span>一般风险 </li>
										<li><span class="state2" ></span>高风险</li>
										<li><span class="state3" ></span>显著风险</li>
										<li><span class="state4" ></span>严重风险</li>
									</ul>
								
							
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<table width="100%" class="listTable" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center" height="25">
			<tr>
			<th rowspan='2' width='10%'>工点名称</th>
			<th rowspan='2' width='10%'>工况信息</th>
			<th rowspan='2' width='10%'>现场视频</th>
			<th colspan='2' width='25%'>监测状态(红/橙/黄/绿点数)</th>
			<th rowspan='2' width='10%'>安全风险状态</th>
			<th rowspan='2' width='10%'>安全评估建议</th>
			<th colspan='2' width='25%'>监测情况</th>
			</tr>
			<tr>
			<th>施工方</th>
			<th>第三方</th>
			<th>施工方</th>
			<th>第三方</th>
			</tr>
		</thead>
		<c:forEach items="${analysisTotals}" var="analysisTotal">
			<tr align="center" height="20">
				<td>
					<a href="javascript:viewAnalyse('${analysisTotal.station_id}')"><c:out value="${analysisTotal.station_name}" /></a>
				</td>
				<td><a href="javascript:viewProjectSchedule('${analysisTotal.sch_id}')">
				<ex:dicDisplay dictIdentify="ProjectState" dictValue="${analysisTotal.projectStatus}"/>
						</a>
				</td>
				<td><a href="javascript:riskPatrolInfo('${analysisTotal.station_id}')" >
						点击进入</a>
				</td>
				
				<td align="center">
					<c:if test="${analysisTotal.ishaveWorkPic == '1'}">
						<a
							href="javascript:viewDataPointPicture('${analysisTotal.station_id}','${analysisTotal.work_picture}','O')">
							
							${analysisTotal.workWarnCount}</a>
					</c:if>
					<c:if test="${analysisTotal.ishaveWorkPic == '0'}"><font class="content">${analysisTotal.workWarnCount}</font></c:if>
				</td>
				<td align="center">
					<c:if test="${analysisTotal.ishaveThirdPic == '1'}">
						<a
							href="javascript:viewDataPointPicture('${analysisTotal.station_id}','${analysisTotal.station_picture}','T')">
							
							${analysisTotal.thirdWarnCount} </a>
					</c:if>
					<c:if test="${analysisTotal.ishaveThirdPic == '0'}">${analysisTotal.thirdWarnCount}</c:if>
				</td>
				<td align="center">
					<div class="state${analysisTotal.safe_state}"></div>
				</td>
				<td>
					<a href="javascript:viewAnalysisReport('${analysisTotal.analyse_id}','description')">详细</a>
				</td>
				<td align="left">
					<a href="javascript:viewDataReport('${analysisTotal.station_id}','O')">
						${analysisTotal.orgsg}
					</a>
				</td>
				<td align="left">
					<a href="javascript:viewDataReport('${analysisTotal.station_id}','T')">
						${analysisTotal.orgjc}
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
		
</body>

</html:html>
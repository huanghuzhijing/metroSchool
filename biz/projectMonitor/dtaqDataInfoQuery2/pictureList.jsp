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
</html:html><%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf'%>
<ex:bundle/>
<html>
<head>
<title><fmt:message key="dtaq.safeState.title"/></title>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/flex_pub.js"/>" type="text/javascript"></script>
<script src="${ctx}/scripts/newWatchpoint.js"></script>	
<script  type="text/javascript" language=javascript>
//必须搭配prototype1.16版本
</script>
<style >
body{background-color:#EEEEEE}
</style>
<script language="javascript">
$(document).ready(function(){
    init();

})

function viewInfo(id) {
	location.href="${ctx}/dtaq/dataInfoQuery3.do?method=view&info_id="+id+"&query2Part=${part_id}&isthird=${isthird}&dataInfoQuery=2";
<%--  var url ="${ctx}/dtaq/dataInfo.do?method=viewF&from=query&info_id="+id+"&__skip__";--%>
<%--  window.showModalDialog(url,'查看明细','status:no;resizable:yes;dialogHeight:560px;dialogWidth:750px;unadorne:yes');--%>
}

function exportExcel(id) {
  location.href="${ctx}/dtaq/dataInfo.do?method=exportToExcel&info_id="+id+"&__skip__";
}

function query() {
  location.href="${ctx}/dtaq/dataInfoQuery2.do?isthird=${isthird}&part_id=${part_id}&startDate="+jQuery("[name='startDate']").val()+"&endDate="+jQuery("[name='endDate']").val();
  //submitForm("dtaqDataInfoQuery2Form",null,false);
}

function setComparePoint(point_id) {
  $("compare_point").value = point_id;
  $("ownerMap").src="${ctx}/dtaq/checkpointMgmt.do?method=viewMap&point_id="+point_id+"&__skip__";
}

function backToList() {
  location.href="${ctx}/dtaq/checkpointMgmt.do?isthird=${isthird}&line_id=${line_id}&segment_id=${segment_id}&station_id=${station_id}&type_id=${type_id}&part_id=${part_id}";
}

function gragamPicture(){
	var pointids = jQuery("[name='pointids']").val();
	if(pointids != null && pointids != ""){
		var url = "${ctx}/dtaq/dataInfoQuery2.do?method=selectList" ;
		art.dialog({title:'监测信息', iframe:url, width:'800', height:'440',top:'100'});
	}else{
		alert("未在地理底图上选中测点,生成曲线图无效!");
	}
}

function changeFile() {
  $("thirdMap").src = jQuery("[name='file']").val();
}
/*鼠标定图*/
var graphUrl1="";
<c:if test="${isthird == 'Y'}">
graphUrl1="${third_img}";
</c:if>
<c:if test="${isthird != 'Y'}">
graphUrl1="${work_img}";
</c:if>
//graphUrl1="E:/tomcat/webapps/safemanager/upload/17_17_1_1226979822109_3345_2.png";
var wp=null,xyList="";
function init(){
	var station_id = 192;
	
	if(station_id != null && station_id !=""){
	alert(station_id);
	   //初始化	   
	   wp=new NewWatchPoint({
	   name:"wp",//实例名
	   target:$("wp_chartBody"),//显示区DIV ID
	   xName:"pointx",//X轴表单名
	   yName:"pointy",//Y轴表单名
	   wbsidName:"point_id",//绑定主键ID
	   ctx:"${ctx}",//基本路径
	   radius:5,//图层半径
	   allowNew:false,
	   allowSelected:0,
	   baseHeight:10,//调节与上边距
	   graphUrl:graphUrl1,//地理底图
	   targetElW:document.body.clientWidth-35,  
	   targetElH:document.body.clientHeight-15, 	   
	   offsetTop:0,	   
	   selectedHandle:displayWarnInfo,
	   vars:"dataCallWay=1&ifbar=0",//传入参数用于指定FLASH要显示哪个点
	   VIEWMODE:2//测点观察模式	   
	   });
	   //添加数据
	  xyList="${xyList}";
	   //输出图
	  wp.paint();//画出框架
	  wp.addAndShowData(xyList);//加载并显示数据
	}
}

function displayWarnInfo(pointids){
	if(pointids !=null && pointids !=""){
		var url = "dtaqDataInfoQuery2Action.do?method=forwardWarnCount&pointids="+pointids
	  	art.dialog({title:'监测信息', iframe:url, width:'550', height:'400',top:'100'});
	}
}
</script>
</head>
<body >
<c:if test="${station_id != null}" >
	<div id="wp_chartBody" class='wp_chartBodyDiv'></div>
</c:if>
</body>
</html>
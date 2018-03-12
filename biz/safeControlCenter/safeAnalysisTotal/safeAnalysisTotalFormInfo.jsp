<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle />
<html>
<head>
<title><fmt:message key="dtaq.safeAnalysisTotal.title" /></title>
<script src="${ctx}/scripts/prototype.js" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/artDialog2.1.1/artDialog.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/jquery-1.2.6.js"/>" type="text/javascript"></script>
<script language="javascript" src="${ctx}/scripts/jquery-1.4.2.min.js"></script>
<script src="${ctx}/scripts/installFlex.js" type="text/javascript"></script>
<script src="${ctx}/scripts/flex_pub.js" type="text/javascript"></script>
<link href="<c:url value="/scripts/artDialog2.1.1/skin/default.css"/>" type="text/css" rel="stylesheet" />
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<link rel="StyleSheet" href="${ctx}/styles/main.css" type="text/css" />
<link rel="StyleSheet" href="${ctx}/styles/def_table.css" type="text/css" />
<style type="text/css">
.button2 {
	border-right: #3333ff 1px solid;
	border-top: #3333ff 1px solid;
	font-size: 9pt;
	border-left: #3333ff 1px solid;
	color: #3333ff;
	border-bottom: mediumpurple 1px solid;
	font-family: "verdana", "arial", "����";
	background-color: transparent;
	event: expression(onmouseover =   function() { 
 this . style . background = '#D1D8DD', this . style . color = '#1679AA'
}

</style>
<script type="text/javascript">
jQuery.noConflict();

jQuery(document).ready(function(){

	//返回	
	 var t='${param.t}';
		if(t=='total'){
			$("#btn_back").click(function(){
				document.forms[0].action='dtaqLineAction.do?method=gisAnalyse&qlineId=${lineId }';
				document.forms[0].submit();
		});
			}else{
				$("#btn_back").click(function(){ 
					document.forms[0].action='safeAnalysisTotalAction.do?method=list&qlineId=${lineId }'; 
			    	document.forms[0].submit();
			    }); 
				}	
		
	jQuery('#tab-title span').click(function(){ 
		jQuery(this).addClass("selected").siblings().removeClass();//removeClass就是删除当前其他类；只有当前对象有addClass("selected")；siblings()意思就是当前对象的同级元素，removeClass就是删除； 
		jQuery("#tab-content > .s-content").hide().eq(jQuery('#tab-title span').index(this)).show(); 
	}); 
});

var x=0;
var y=0;
var d1 = new Date();
var t='${param.t}';
		
function doBack(){
	if(t=='total'){
		location.href='dtaqLineAction.do?method=gisAnalyse';
	}else{
		location.href='safeAnalysisTotalAction.do?method=list&qlineId=${lineId }'; 
	}	  
}
function fun(){
    d2 = new Date();
    diff = (d2.getTime() - d1.getTime())/1000;
    diff = Math.round(diff);
    second = diff % 60;
    minute = Math.round((diff-30)/60);
    second = (second<10)?"0"+second:second;
    minute = (minute<10)?"0"+minute:minute;
    jQuery("#show").html("您在本页面已停留:"+ minute + "分" + second+"秒") ;
}

setInterval("fun()",1000);

function moveIFrame(x,y,w,h) {
	jQuery("#myFrame").css("left",x).css("top",y) ;
	jQuery("#myIFrame").attr("width",w).attr("height",h) ;
}

function hideIFrame(){
    jQuery("#myFrame").css("visibility","hidden") ;
}
	
function showIFrame(){
    jQuery("#myFrame").css("visibility","visible") ;
}

function loadIFrame(url){
	
	var myIFrame = jQuery("#myIFrame") ;
	if(myIFrame.length > 0 ){
		myIFrame.attr("src",url);
		return ;
	}
	jQuery("#myFrame").html("<iframe id='myIFrame' src='" + url + "' frameborder='0'></iframe>") ;
}
function reloadIFrame(url){
	
	var iFrameRef = jQuery("#myIFrame") ;
	if(iFrameRef.length > 0 )
		iFrameRef.attr("src",url) ;
	else
		alert("容器不存在!");
}

var backUrl="${param.backUrl}";

function goBack(){
	location.href=backUrl;
}

var inf=null;

function goTo(url){
	window.top.art.dialog({title:'信息', iframe:url, width:'800', height:'480',top:'100',lock:true});
}   
function initOpinion() {
	var opinion = jQuery("[name='opinion']").val();
	if('${opinion}' != null && '${opinion}' != ""){
		jQuery("#opinion").val('${opinion}') ;
	var heit = document.body.scrollHeight;
		scroll(0,heit) ;
	
	}else if(opinion == null || opinion == ""){
		jQuery("#opinion").val('${defaultValue}') ;
	}
}

function setOpinion(){
	var opinion = jQuery("[name='opinion']").val();
	if(opinion == '${defaultValue}'){
		jQuery("#opinion").val("") ;
	}
}

function selectRadio(value){
	jQuery("#opinion").val(value) ;
}

var editSigner="";
var editSigndate="";
var editOpinion="";
var rowsIndex = null;
var deleteId = null;
var deleteState = null;
function saveHistory(){
	var extendid = jQuery("[name='extendid']").val();
	if(extendid == ""){
		alert("保存失败!");
	}else{
		var station_id = jQuery("[name='station_id']").val();
		var opinion = jQuery("[name='opinion']").val();
		var model = jQuery("[name='model']").val();
		if(deleteState != null){
			var url =  "${ctx}/safeAnalysisTotalAction.do?method=saveHistory";
		    var myajax = new Ajax.Request(url, {method:"post", parameters:"extedid="+extendid+"&model="+model+"&station_id="+station_id+"&deleteId="+deleteId, onComplete:responseHistoryInfo});//实现ajax请求
		}else{
			if(opinion !=""){
				$("opinion").value = "";
			    var rodias = document.getElementsByName("signRadio1");
			    for(var i=0; i<rodias.length;i++){
			    	rodias[i].checked = false;
			    }
				if(rowsIndex != null){
					var tableObj = document.getElementById("tableObj");
					tableObj.deleteRow(rowsIndex);
				}
				var url =  "${ctx}/safeAnalysisTotalAction.do?method=saveHistory";
			    var myajax = new Ajax.Request(url, {method:"post", parameters:"extedid="+extendid+"&model="+model+"&opinion="+opinion+"&station_id="+station_id+"&deleteId="+deleteId, onComplete:responseHistoryInfo});//实现ajax请求
			}else{
				alert("保存失败!");
			}
		}
	}
}

function setcheckUser(text){
	return text;											
}

function responseHistoryInfo(selRequest){
var station_id = jQuery("[name='station_id']").val();
var url="safeAnalysisTotalAction.do?method=showAnalyseInfo&safeTotal=Y&station_id="+station_id;
location.href=url;
	}

function responseHistoryTop3Info(selRequest){
	var text = selRequest.responseText;
	var tableObj = document.getElementById("historyTable");
	if(text != null && text != ""){
		if(tableObj.rows.length > 1){
			for(var j=tableObj.rows.length-1;j>=1;j--){
				tableObj.deleteRow(j); 
			}
		}
		text = text.split("&");
		for(var i=0; i<text.length; i++){
			var info = text[i].split("@");
			var currentRow = tableObj.insertRow();
		    currentRow.align = "center";
		    currentRow.style.backgroundColor="#F8F5F4";
		    currentRow.height=20;
		    currentRow.insertCell().innerText = info[0];
	    	 currentRow.insertCell().innerText = info[1];
	    	currentRow.cells(1).className = "opinion";
		}
	}else{
		if(tableObj.rows.length > 1){
			for(var j=tableObj.rows.length-1;j>=1;j--){
				tableObj.deleteRow(j); 
			}
		}
	}
}

 function removeMySiteRow(id,ob){
    var tableId = document.getElementById("tableObj");
	if(window.confirm("确定删除？")){
		if(id != null && id != ""){
			var tableObj = document.getElementById("tableObj");
			 o = findSiteTD(event.srcElement);
		    ($(ob).parent().parent()).remove();
		    var url='safeAnalysisTotalAction.do?method=saveSign&id='+id+'&station_id=${station_id}&delete=d';
		    location.href=url
		}
	}
}
 function setMySiteNos(obj){
	if(null != obj){
	   var rowsLength = obj.rows.length;
	   if(rowsLength > 0){
	       for(var i = 1;i < rowsLength;i++){
		      obj.rows(i).cells(0).innerText = i;
	       }
		}
	}
}

function findSiteTD(o){
	if (o.nodeName=="TR"||o.nodeName=="TABLE") return;
	if(o.nodeName=="TD")
	   return (o);
	else
	   return (o.parentElement);
}
function editMySiteRow(id,opinion,ob){

 var tableId = document.getElementById("tableObj");
	
		if(id != null && id != ""){
			var tableObj = document.getElementById("tableObj");
			 o = findSiteTD(event.srcElement);
		    ($(ob).parent().parent()).remove();
		    var url='safeAnalysisTotalAction.do?method=saveSign&id='+id+'&station_id=${station_id}&delete=d&opinion='+opinion;
		    location.href=url;
		}
	
}

function responseDeleteInfo(selResponse){
	var url =  "${ctx}/safeAnalysisTotalAction.do?method=findTop3History";
	var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id=${station_id}", onComplete:responseHistoryTop3Info});//实现ajax请求
}

function setMySiteNos(obj){
	if(null != obj){
	   var rowsLength = obj.rows.length;
	   if(rowsLength > 0){
	       for(var i = 1;i < rowsLength;i++){
		      obj.rows(i).cells(0).innerText = i;
	       }
		}
	}
}

function findSiteTD(o){
	if (o.nodeName=="TR"||o.nodeName=="TABLE") return;
	if(o.nodeName=="TD")
	   return (o);
	else
	   return (o.parentElement);
}

function toTop(){
	scroll(0,0) ;
	
}
function openJd(url){
	window.top.art.dialog({title:'工程形象进度', iframe:url, width:'950', height:'480',top:'200',lock:true});
}
function openJC(url,tit){
	window.top.art.dialog({title:tit+'测点安全状态', iframe:url, width:'950', height:'480',top:'200',lock:true});
}
function displayMailBox(info_id,empid,fid){
	 jQuery("#cengContent_"+info_id).hide();
	 var url ="${ctx}/safeAnalysisTotalAction.do?method=sendMailBySituation&empid="+empid+"&fid="+fid;
 	 art.dialog({id:'sendMail',title:'群发站内消息', iframe:url, width:'750', height:'380',top:'30'});
}

function displayEmpMailBox(info_id,empid,cengObj){
	 jQuery("#"+cengObj).hide();
	 var url ="${ctx}/safeAnalysisTotalAction.do?method=sendMailBySituation&empid="+empid;
 	 art.dialog({id:'sendMail',title:'发送站内消息', iframe:url, width:'750', height:'380',top:'30'});
 	 return false;
}

function comnSendMail(station_id){
	 var url ="${ctx}/safeAnalysisTotalAction.do?method=sendMailBySituation&employeeids=Y&station_id="+station_id;
 	 art.dialog({id:'sendMail',title:'群发站内消息', iframe:url, width:'750', height:'380',top:'30'});
}

function closeMailBox(state){
	if(state=="yes"){
		alert("站内消息发送成功！");
	}else{
		alert("站内消息发送失败！");
	}
}



function showPointState(url){
	window.top.art.dialog({title:'监测状态', iframe:url, width:'850', height:'480',top:'20',lock:true});
}

function findLocation(){
 	scroll(this.x,this.y-150);
}


function contentMouse(info_id){
	 jQuery("#cengContent_"+info_id).show();
	 document.getElementById("cengContent_"+info_id).style.display="block";
}

function contentMouseOut(info_id){
	 jQuery("#cengContent_"+info_id).hide();
	 document.getElementById("cengContent_"+info_id).style.display="none";
}

function contentsgMouse(info_id){
	 jQuery("#cengsg_"+info_id).show();
	 document.getElementById("cengsg_"+info_id).style.display="block";
}

function contentsgMouseOut(info_id){
	 jQuery("#cengsg_"+info_id).hide();
	 document.getElementById("cengsg_"+info_id).style.display="none";
}
function contentjlMouse(info_id){
	jQuery("#cengjl_"+info_id).show();
	 document.getElementById("cengjl_"+info_id).style.display="block";
}

function contentjlMouseOut(info_id){
	 jQuery("#cengjl_"+info_id).hide();
	 document.getElementById("cengjl_"+info_id).style.display="none";
}
function contentjcMouse(info_id){
	jQuery("#cengjc_"+info_id).show();
	 document.getElementById("cengjc_"+info_id).style.display="block";
}

function contentjcMouseOut(info_id){
	 jQuery("#cengjc_"+info_id).hide();
	 document.getElementById("cengjc_"+info_id).style.display="none";
}
function contentglMouse(info_id){
	jQuery("#cenggl_"+info_id).show();
	 document.getElementById("cenggl_"+info_id).style.display="block";
}

function contentglMouseOut(info_id){
	 jQuery("#cenggl_"+info_id).hide();
	 document.getElementById("cenggl_"+info_id).style.display="none";
}

function contentxzMouse(info_id){
	jQuery("#cengxz_"+info_id).show();
	 document.getElementById("cengxz_"+info_id).style.display="block";
}

function contentxzMouseOut(info_id){
	 jQuery("#cengxz_"+info_id).hide();
	 document.getElementById("cengxz_"+info_id).style.display="none";
}

function suggestView(fid){
	var url = "${ctx}/safeAnalysisTotalAction.do?method=suggestView&fid="+fid ;
	 art.dialog({id:'suggestView',title:'安全风险评估历史记录', iframe:url, width:'980', height:'450',top:'50'});
}

function suggesList(){
	window.parent.location.href = "${ctx}/dtaqSituationAnalyseAction.do?method=list&stationId=${station_id}&lineId=${segment.line_id.line_id}&segmentId=${segment.segment_id}";
}

function pop(id){ 
	jQuery("#"+id).toggle();
}
   
</script>
<style type="text/css">
* {margin: 0;padding: 0;}
html{background: #FFFFFF;}
body {background-color: #ffffff;background: url(${ctx}/images/main_bg.jpg); background-repeat: repeat-x;text-align: left;font: normal 12px/ 1.6em simsun, Verdana, Lucida, Arial, Helvetica,sans-serif;color: #353535;}
input.button {border-right: #2c59aa 1px solid; padding-right: 2px; border-top: #2c59aa 1px solid;padding-left: 2px; font-size: 12px;border-left: #2c59aa 1px solid;cursor: hand;color: black;padding-top: 2px;border-bottom: #2c59aa 1px solid;}
ol,ul {list-style: none;}
a {text-decoration: none;color: #353535;}
#contain {width: 970px;overflow: hidden;_zoom: 1;margin: 0 auto;display: inline;white-space: nowrap}
.mainBox { float: left; width: 100%; height: auto; overflow: hidden; _zoom: 1; }
.smallBox { position: relative; padding: 10px; width: 459px; background-color: #ffffff; float: left; border: 0px solid #B6CAE3; }
.smallBox .submenu { font-weight: bold; font-size: 13px; background: #E1F0F8; line-height: 23px; width: 100%; height: 23px; border: 1px solid #B6CAE3; border-top:none ; background: url(${ctx}/images/titlebg.gif); background-repeat: repeat; }
.smallBox .content { left: 0px; background: #ffffff; top: 0px; z-index: 1; border: 1px solid #B6CAE3; border-top: 0px solid #B6CAE3; }
.smallBox .submenu,.smallBox .content { width: 100%; }
.smallBox h4 { float: left; width: 152px; height: 26px; margin: -1px -1px 0; line-height: 26px; text-align: center; font-size: 12px; font-weight: normal; border: 1px solid #B6CAE3; border-right: 0; background: #F2F6FB; cursor: pointer; }
#contain .more { text-align: right; padding-right: 30px }
#mycontain {border: 1px solid #B6CAE3;height: auto;background-color: #fff;}
#mycontain .menu {font-size: 15px;font-weight: bold;text-align: center;background: #F1F5F8;border-bottom: 1px solid #B6CAE3;height: 30px}
#mycontain .footer {background: #F1F5F3;text-align: center;}
#nav_div {background: #BBB;border: 2px double #000000;position: fixed;right: 0px;bottom: 0px;height: 200px;width: 200px;}
.showcontent {color: #4A4949;}
.tmpRow {background-color: #F8F5F4;}
<%--以下为层的显示--%>
.divClass{clear:both;margin:5px 0 0 0;font-size:12px;line-height:22px;}
a.min{position:relative;background-color:#F8F5F4;float:left;width:60px;height:20px;margin:0 auto;text-align:center;text-decoration:none;color:#333333;}
a.min:hover{background:#F8F5F4; text-decoration:none;z-index:2;}
.spanClass{display:none;}
a.min:hover .spanClass{position:absolute;display:block;top:-1px;left:60px;width:90px;height:32px;border:1px solid #ccc;z-index:1;background-color:#DCF5FC;}
.employClass{clear:both;margin:1px 0 0 0;font-size:12px;line-height:22px;}
a.alt{ position:relative; background-color:#F8F5F4; float:left; width:65px;height:20; margin:0 auto; text-align:center; text-decoration:none; color:#333333; }
a.alt:hover{background:#F8F5F4;text-decoration:none;z-index:2;}
.spanEmpClass{display:none;}
a.alt:hover .spanEmpClass{ position:absolute; display:block; top:-1px;left:40px; width:90px;height:32px; border:1px solid #ccc; z-index:1; background-color:#DCF5FC; }
.contentTd{color:#4a4949;font-size:14px;}
.editor{color:#30495C;font-size:14px;font-weight:bold;text-align:right;}
.defShowTd{color:#30495C;font-size:12px;font-weight:bold;}
.defHref{text-decoration: underline;cursor:hand;color:#59B98C}
.operatorDiv{float:left;height:20px;width:65px;}
.sendDiv{display:none;position:absolute;width:90px;border:1px solid #ccc;background-color:#dcf5fc;margin-left:10px;}
.sendSpan{cursor:hand;width:80px; display:block;margin-top:2px;margin-left:5px;text-align:left;color:#4C78A6;background-color:#dcf5fc;}
.titleTd{background: url(${ctx}/images/titlebg.gif); background-repeat: repeat-x;height:25px;padding-left:20px;font-size:12px;}
.showcontent dt a{margin-left:10px;color:#4c78a6;font-size:12px;font-weight:bold;}

.smallBox #tableObj,.smallBox #historyTable{
	border:1px solid #B6CAE3;
	border-collapse:collapse;
		border-spacing:0;
		margin:0;padding:0
}
.smallBox #tableObj td,.smallBox #historyTable td{
	border:1px solid #B6CAE3;
}
#sidebar-tab{border:1px solid #ccf;margin-bottom:1.5em;overflow:hidden;} 
#tab-title{position:relative;overflow:hidden;height:26px;text-align:left;background:url(${ctx}/images/index_07.gif) repeat-x;}
#tab-title h3{font-size:13px;font-weight:bold;height:26px; overflow:hidden} 
#tab-title .selected{background:url(${ctx}/images/index_10.jpg) repeat-x;color:white; margin:1px 0 0 1px} /*标题被选中时的样式*/ 
#tab-content .hide{display:none;} /*默认让第一块内容显示，其余隐藏*/ 
#tab-title span{padding:5px 9px 5px 10px;border:1px solid #ccf;margin-left:-1px;cursor:pointer;} 
#tab-content .s-content{padding:5px 10px;overflow:hidden;} 
</style>
</head>
<body onload="initOpinion()" marginwidth="0" marginheight="0" oncontextmenu="return false" ondragstart="return false" onselectstart ="return false" onselect="document.selection.empty()" oncopy="document.selection.empty()" onbeforecopy="return false"  >
		<div style="height: 392px; width: 95%;padding: 10px;">
	
		<div id="sidebar-tab" style="height:380px; "> 
		<div id="tab-title"> 
		<h3><span class="selected">工程概述</span><span>工程形象进度</span><span>测点安全状态</span><span>监测数据情况</span></h3> 
		</div> 
		<div id="tab-content"> 
		<div class="s-content">
		<iframe frameborder=0 width="100%" height="362px" marginheight=0 marginwidth=0 scrolling=no src="${ctx}/safeAnalysisTotalAction.do?method=showjctable&station_id=${station_id}"></iframe>
		</div>
		<div class="s-content hide">
		<iframe frameborder=0 width="100%" height="362px" marginheight=0 marginwidth=0 scrolling=no src="${ctx}/safeAnalysisTotalAction.do?method=showScheduleImage&station_id=${station_id}"></iframe>
		</div>
		<div class="s-content hide">
		<iframe frameborder=0 width="100%" height="362px" marginheight=0 marginwidth=0 scrolling=no src="${ctx}/safeAnalysisTotalAction.do?method=showStationPointPic&station_id=${station_id}&station_picture=${station_picture}&work_picture=${work_picture}"></iframe>
		</div>
		<div class="s-content hide">
		<iframe frameborder=0 width="100%" height="362px" marginheight=0 marginwidth=0 scrolling=yes src="${ctx}/safeAnalysisTotalAction.do?method=showJcPage&fid=${fid}"></iframe>
		</div>
		</div> 
</div> 
		</div>
			</div>
			<div id="myFrame" style="position: absolute; background-color: transparent; border: none; visibility: hidden;"></div>
				
			<table width="95%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center">
					<div class="smallBox" style="width: 100%">
						<div class="submenu">
							<div style="float:left;">
								<span style="margin-left: 20px; color:#30495C;font-weight:bold;font-size:12px;">${station_name}安全分析评估及综合建议</span>
							</div>
							<div style="float:right;color:#30495c;font-size:12px;">
								[历史记录:
								<c:set var="index" value="1"></c:set>
								<c:forEach items="${analysisHistory}" var="analysis">
									<c:if test="${index ne '1'}">
										<span style="cursor:pointer" onclick="suggestView('${analysis.fid}')"><fmt:formatDate value='${analysis.record_date}' pattern='yyyy-MM-dd' /></span>
									</c:if>
									<c:set var="index" value="${index+1}"/>
								</c:forEach>
								<span style="cursor:pointer" onclick="suggesList()">更多...</span>]
							</div>
						</div>
						<div class="content" align="center">
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<c:if test="${situationSuggest.fileContent != null}">
									<tr>
										<td class="contentTd">
											<c:out value='${fileContent}' escapeXml="false"></c:out>
										</td>
									</tr>
								</c:if>
								<c:if
									test="${situationAnalyse.situation_discription != null}">
									<tr>
										<td  class="contentTd">${situationAnalyse.situation_discription}</td>
									</tr>
								</c:if>
								<c:if test="${situationAnalyse.suggestion != null}">
									<tr>
										<td  class="contentTd">${situationAnalyse.suggestion}</td>
									</tr>
								</c:if>
								<c:if test="${fn:contains(userinfo.usercmd,'checker_view')==true}">
									<tr>
										<td class="editor">【本期安全形势分析编写人：<ex:employeeName id="${situationAnalyse.weave_author}"/>&nbsp;&nbsp;<c:if test="${checknames != null}">审批人：${checknames}</c:if>】</td>
									</tr>
								</c:if>
							</table>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="smallBox" style="width: 100%; margin-bottom:20px;">
						
							<table id="tableObj" width="100%" border="1"  cellpadding="0" cellspacing="0" align="center">
								<tr>
									<td colspan="6" class="defShowTd titleTd">
										<div style="width:70%;float:left;line-height:25px;">安全形势分析批阅记录(<label id="show">您在本页面已停留:00分00秒</label>)&nbsp;今日访问本页面次数:${visitCount}，访问用户:</div>
										<div style="width:30%;float:left;line-height:25px;"><marquee direction="left" scrollamount=3 onMouseOver="this.stop()" onMouseOut="this.start()">${visitPerson}</marquee></div></td>
								</tr>
								<tr align="center" bgcolor="#E1F0F8" height="25" id="trSite" style="color: #0B333C">
									<td width="5%"> 序号</td>
									<td width="10%">批阅人</td>
									<td width="15%">批阅部门</td>
									<td width="15%">批阅时间</td>
									<td width="45%">批阅意见</td>
									<td width="10%">操作</td>
								</tr>
								<c:set var="idx" value="0" />
								<c:forEach items="${historylist}" var="historylist">
								<tr align="center" height="20" bgcolor="#F8F5F4">
									<td class="showcontent">${idx+1}</td>
									<td class="showcontent">
										<div  onmouseover="pop('hisMsgDiv${idx+1}')" onmouseout="pop('hisMsgDiv${idx+1}')" style="float:left; text-align:left;">
											<dl>
												<dt><a href="#"><ex:employeeName id="${historylist.signer}" /></a></dt>
										        <dd id="hisMsgDiv${idx+1}" class="sendDiv">
										            <span class="sendSpan"  onclick="displayMailBox('${idx+1}','${historylist.signer}','${fid}')">发送站内消息</span>
										            <c:if test="${historylist.phone != null}">
													</c:if>
										        </dd>
											</dl>
										</div>
									</td>
									<td class="showcontent"><ex:orgDisplay  id="${historylist.deptid}" /></td>
									<td class="showcontent"><fmt:formatDate value="${historylist.signdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td class="opinion showcontent">${historylist.opinion}</td>
									<td>
										<c:if test="${historyId != null && historyId == historylist.signer}">
											<input type="button" class="button2" value="${texts['label.delete']}" onclick="removeMySiteRow('${historylist.id}',this)" />
											<input type="button" class="button2" value="${texts['label.modify']}" onclick="editMySiteRow('${historylist.id}','${historylist.opinion}',this)" />
										</c:if>
										<c:if test="${historyId == null || historyId != historylist.signer}">&nbsp;</c:if>
									</td>
									<td style="display: none">${historylist.signer}</td>
									<td style="display: none">${historylist.id}</td>
									<td style="display: none">${historylist.opinion}</td>
								</tr>
								<c:set var="idx" value="${idx+1}" />
								</c:forEach>
							</table>
					</div>
					<div align="left" class="defShowTd">&nbsp;【操作说明】：鼠标移到安全形势记录批阅人或以下人员上面时，将浮出可操作的菜单层，可以对该人员发送短信或在线消息！</div>
					<div class="smallBox" style="width: 100%;">
						<table width="100%" border="0" align="center" cellpadding="1" bgcolor="#BED0E2" cellspacing="1" class="tableblue">
							<COLGROUP>
								<COL class="tr03" align="right" width="15%" />
								<COL class="tmpRow" width="85%"/>
							</COLGROUP>
							<tr height="23px">
								<td colspan="2" align="left" valign="middle" class="defShowTd titleTd" style="background: url(${ctx}/images/titlebg.gif); background-repeat: repeat-x;">
									${station_name}角色相关人员信息
									<a class="defHref" onclick="javascript:comnSendMail('${station_id}')">群发站内消息</a>&nbsp;&nbsp;
								</td>
							</tr>
							<c:if test="${workEmps != null}">
								<tr height="20">
									<td align="center" style="color: #0B333C">施工单位</td>
									<td class="showcontent" align="left">
										<c:set value="0" var="idx"/>
										<c:forEach items="${workEmps}" var="employeesg">
											<div  onmouseover="pop('empMsgDiv${idx+1}')" onmouseout="pop('empMsgDiv${idx+1}')" style="float:left; text-align:left;">
												<dl>
													<dt><a href="#">${employeesg.employee_name}</a></dt>
											        <dd id="empMsgDiv${idx+1}" class="sendDiv">
											            <span class="sendSpan"  onclick="displayEmpMailBox('${idx+1}','${employeesg.employee_id}','cengsg_${idx+1}')">发送站内消息</span>
											            <c:if test="${employeesg.employee_politicaltype != null}">
														</c:if>
											        </dd>
												</dl>
											</div>
											<c:set value="${idx+1}" var="idx"/>
										</c:forEach>
									</td>
								</tr>
							</c:if>
							<c:if test="${jlEmps != null}">
								<tr height="20">
									<td align="center" style="color: #0B333C">监理单位</td>
									<td class="showcontent" align="left">
										<c:set value="0" var="idx"/>
										<c:forEach items="${jlEmps}" var="employeesg">
											<div  onmouseover="pop('jlMsgDiv${idx+1}')" onmouseout="pop('jlMsgDiv${idx+1}')" style="float:left; text-align:left;">
												<dl>
													<dt><a href="#">${employeesg.employee_name}</a></dt>
											        <dd id="jlMsgDiv${idx+1}" class="sendDiv">
											            <span class="sendSpan"  onclick="displayEmpMailBox('${idx+1}','${employeesg.employee_id}','cengsg_${idx+1}')">发送站内消息</span>
											            <c:if test="${employeesg.employee_politicaltype != null}">
														</c:if>
											        </dd>
												</dl>
											</div>
											<c:set value="${idx+1}" var="idx"/>
										</c:forEach>
									</td>
								</tr>
							</c:if>
							<c:if test="${jcEmps != null}">
								<tr height="20">
									<td align="center" style="color: #0B333C">监测单位</td>
									<td class="showcontent" align="left">
										<c:set value="0" var="idx"/>
										<c:forEach items="${jcEmps}" var="employeesg">
											<div  onmouseover="pop('jcMsgDiv${idx+1}')" onmouseout="pop('jcMsgDiv${idx+1}')" style="float:left; text-align:left;">
												<dl>
													<dt><a href="#">${employeesg.employee_name}</a></dt>
											        <dd id="jcMsgDiv${idx+1}" class="sendDiv">
											            <span class="sendSpan"  onclick="displayEmpMailBox('${idx+1}','${employeesg.employee_id}','cengsg_${idx+1}')">发送站内消息</span>
											            <c:if test="${employeesg.employee_politicaltype != null}">
														</c:if>
											        </dd>
												</dl>
											</div>
											<c:set value="${idx+1}" var="idx"/>
										</c:forEach>
									</td>
								</tr>
							</c:if>
							<c:if test="${manageStationEmps != null}">
								<tr height="20">
									<td align="center" style="color: #0B333C">业主代表</td>
									<td class="showcontent" align="left">
										<c:set value="0" var="idx"/>
										<c:forEach items="${manageStationEmps}" var="employeesg">
											<div  onmouseover="pop('megMsgDiv${idx+1}')" onmouseout="pop('megMsgDiv${idx+1}')" style="float:left; text-align:left;">
												<dl>
													<dt><a href="#">${employeesg.employee_name}</a></dt>
											        <dd id="megMsgDiv${idx+1}" class="sendDiv">
											            <span class="sendSpan"  onclick="displayEmpMailBox('${idx+1}','${employeesg.employee_id}','cengsg_${idx+1}')">发送站内消息</span>
											            <c:if test="${employeesg.employee_politicaltype != null}">
														</c:if>
											        </dd>
												</dl>
											</div>
										<c:set value="${idx+1}" var="idx"/>
										</c:forEach>
									</td>
								</tr>
							</c:if>
							<c:if test="${teamEmps != null}">
								<tr height="20">
									<td align="center" style="color: #0B333C">华科预警单位</td>
									<td class="showcontent" align="left">
										<c:set value="0" var="idx"/>
										<c:forEach items="${teamEmps}" var="employeesg">
												<div  onmouseover="pop('temMsgDiv${idx+1}')" onmouseout="pop('temMsgDiv${idx+1}')" style="float:left; text-align:left;">
													<dl>
														<dt><a href="#">${employeesg.employee_name}</a></dt>
												        <dd id="temMsgDiv${idx+1}" class="sendDiv">
												            <span class="sendSpan"  onclick="displayEmpMailBox('${idx+1}','${employeesg.employee_id}','cengsg_${idx+1}')">发送站内消息</span>
												            <c:if test="${employeesg.employee_politicaltype != null}">
															</c:if>
												        </dd>
													</dl>
												</div>
										<c:set value="${idx+1}" var="idx"/>
										</c:forEach>
									</td>
								</tr>
							</c:if>
						</table>
					</div>
					<table width="100%">
						<tr align="right">
							<td height="26px">
								<img height="26px" width="30px" alt="${texts['dtaq.decisionAnalyse.back_top']}" src="${ctx}/images/toTop.gif" onclick="toTop()" />&nbsp;&nbsp;
							</td>
						</tr>
					</table>
					<div class="smallBox" style="width: 100%;">
						<div class="content" style="border: none; margin-top: 0px;">
							<table id="historyTable" width="100%" border="1" cellpadding="0" cellspacing="0">
								<tr>
									<td colspan="2" style="" class="defShowTd titleTd">您最近的前三条记录</td>
								</tr>
								<tr align="center" bgcolor="#E1F0F8" height="25" id="trSite"
									bordercolorlight="#DDDDE0" bordercolordark="#E1F0F8"
									style="color: #0B333C">
									<td width="30%">
										批阅时间
									</td>
									<td width="70%">
										批阅意见
									</td>
								</tr>
								<c:if test="${topHistory3List != null}">
									<c:forEach items="${topHistory3List}" var="history3list">
										<tr align="center" height="20" bgcolor="#F8F5F4">
											<td class="showcontent">
												<fmt:formatDate value="${history3list.signdate}"
													pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<td class="opinion showcontent">
												${history3list.opinion}
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						<div class="content" style="border: none; margin-top: 10px;">
							<html:form action="safeAnalysisTotalAction.do" method="POST"
								styleClass="form">
								<input type="hidden" name="method" value="saveHistory" />
								<html:hidden property="extendid"
									value="${situationAnalyse.fid}" />
								<html:hidden property="model" value="situationAnalyse" />
								<html:hidden property="state" value="0" />
								<html:hidden property="type" />
								<div>
									<table width="100%" border="0" cellpadding="1" bgcolor="#BED0E2" cellspacing="1" class="tableblue">
										<COLGROUP>
											<COL class="tr03" align="right" width="20%" />
											<COL class="tmpRow" width="30%" />
											<COL class="tr03" align="right" width="20%"/>
											<COL class="tmpRow" width="30%"/>
										</COLGROUP>
										<tr>
											<td colspan="4" class="defShowTd titleTd">批阅意见
											</td>
										</tr>
										<tr height="25px">
											<td align="center" style="color: #0B333C">
											批阅人
											</td>
											<td class="showcontent">
												&nbsp;&nbsp; <ex:employeeName id="${userInfo.empId}"/>
												<html:hidden property="signer"
													value="${userInfo.empId}" />
											</td>
											<td align="center" style="color: #0B333C">
												批阅时间
											</td>
											<td>
												&nbsp;&nbsp;
												<input type="text" name="signdate"
													value="<fmt:formatDate value='${currDate}' pattern='yyyy-MM-dd HH:mm:ss'/>"
													readonly="readonly" class="showcontent tmpRow"
													style="border: none" />
											</td>
										</tr>
										<tr>
											<td align="center" style="color: #0B333C">
												批阅意见
											</td>
											<td colspan="3" class="showcontent">
												&nbsp;&nbsp;
												<html:textarea styleClass="showcontent"
													property="opinion" cols="80" rows="6" styleId="opinion"
													onblur="checkTextarea('opinion',1000)" onfocus="setOpinion()"
													onkeydown="textCounter('opinion','spanSummary',1000)"
													onkeyup="textCounter('opinion','spanSummary',1000)" />
												<br />
												&nbsp;&nbsp;
												<span class="req" id="spanSummary">1000字以内 </span>
												<html:hidden property="fid" value="${fid}" />
												<html:hidden property="station_id" value="${station_id}" />
											</td>
										</tr>
									</table>
									<div align="center" class="sb_div">
										<input type="button" class="btn_save" value="批&nbsp;&nbsp;阅" onclick="saveHistory()" />
										&nbsp;&nbsp;
										
										<input type="button" value="${texts['button.back']}"  onclick="doBack()" />
										
									</div>
								</div>
							</html:form>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="situation.report.content"/></title>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/print.js"/>" type="text/javascript"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
displayWindow()
})
function centerLayer(obj) {   
    var ocw = obj.clientWidth;   
    var och = obj.clientHeight;   
    var bsl = document.body.scrollLeft || document.documentElement.scrollLeft;   
    var bst = document.body.scrollTop || document.documentElement.scrollTop;   
    var bcw = document.body.clientWidth || document.documentElement.clientWidth;   
    var bch = document.body.clientHeight || document.documentElement.clientHeight;   
    var osl = bsl + Math.floor( ( bcw - ocw ) / 2 );   
        osl = Math.max( bsl , osl );   
    var ost = bst + Math.floor( ( bch - och ) / 2 );   
        ost = Math.max( bst , ost );   
    obj.style.left  = osl + 'px';   
    obj.style.top   = ost + 'px';   
}   

function closeLayer(){   
    massage_box.style.visibility='hidden';    
    mask.style.visibility='hidden';//关闭子窗口   
}   
  
function openLayer(){   
    mask.style.visibility='visible';   
    massage_box.style.visibility='visible';   
    var obj = document.getElementById('massage_box');   
    centerLayer( obj );   
}

function loadMessage(message){
	openLayer();
	var oDiv = document.getElementById("messageDiv");
	oDiv.innerHTML=message;	
 	var time =".";
 	setInterval(function(){
 		try{
 			if(oDiv&&oDiv.innerHTML){
 				if(time.length<5){
 					time += "." ;
 				}else{
 					time="." ;
 				}
 				oDiv.innerHTML=message+time;
 			}
 		}
 		catch(er){
 		}	
 	},300); 
}

function printReport(){
	var appletDiv = $("printDiv");
	var appletVar = "";
	appletVar = loadAppletB("${ctx}");
<%--	if(window.attachEvent) {--%>
<%--		appletVar = loadAppletB("${ctx}");--%>
<%--	} else {--%>
<%--		appletVar = loadAppletA("${ctx}");--%>
<%--	}--%>
	appletDiv.innerHTML = appletVar;
}

function displayWindow(){
	var url ="dtaqSecurityAnalyseAction.do?method=displayQueryWindow";
 	art.dialog({id:'selectData',title:'打印查询', iframe:url, width:'700', height:'350'});
}

function forwardReport(station_id,recordDate,info_type){
    var url="dtaqSecurityAnalyseAction.do?method=reportStream&stationId="+station_id+"&recordDate="+recordDate+"&info_type="+info_type;
	location.href = url;
}

function exportFile(station_id,recordDate,info_type,export_type){
var url="dtaqSecurityAnalyseAction.do?method=exportFile&stationId="+station_id+"&info_type="+info_type+"&recordDate="+recordDate+"&export_type="+export_type;
	location.href= url;
<%--	var url = "${ctx}/securityAnalyseAction.do?method=exportFile";--%>
<%--    var myajax = new Ajax.Request(url, {method:"post", parameters:"stationId="+station_id+"&info_type="+info_type+"&recordDate="+recordDate+"&export_type="+export_type, onComplete:responseSafeInfo});//实现ajax请求--%>
}

function responseSafeInfo(){
}

function initButton(){
	var havaReport = '${havaReport}';
	parent.Links.setButtonView(havaReport);
}
</script>
</head>
<body>
<div id="massage_box"><div class="header" id="messageDiv"></div></div>  
<div id="mask"></div> 
</body>
</html:html>
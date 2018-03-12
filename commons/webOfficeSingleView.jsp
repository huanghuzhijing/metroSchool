<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<content tag="heading"> <font size="4">${fileName} </font> </content>
<head> 
	<script type="text/javascript" src="${ctx}/webOffice/js/template.js"></script>
	<script type="text/javascript" src="${ctx}/webOffice/js/main.js"></script>
	<script language=javascript>
		/****************************************************
		*
		* 					初始化控件
		*
		****************************************************/
		function WebOffice1_NotifyCtrlReady() {
			if(${param.id==null||param.id==''}) {	// 新建文档
					document.all.WebOffice1.LoadOriginalFile("", "${fileType}");
			} else {	// 打开文件 
					document.all.WebOffice1.LoadOriginalFile("<%=basePath%>/pubAnnexAction.do?method=downloadWebOfficeSingle&fileaddress=${fileaddress}", "${fileType}");
			}
		}
</script>

<SCRIPT LANGUAGE=javascript FOR=WebOffice1 EVENT=NotifyCtrlReady>
<!--
 WebOffice1_NotifyCtrlReady()			// 在装载完Weboffice(执行<object>...</object>)控件后执行 "WebOffice1_NotifyCtrlReady"方法
//-->
</SCRIPT>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_save").click(function(){
		});
		$("#btn_close").click(function(){
			window.close();
		}) ;
	});
</script>
</head>
<body onUnload="unloadFile()">
<div width="100%" height="100%">
								<!-- -----------------------------== 装载WebOffice控件 ==--------------------------------- -->
<object id=WebOffice1 height=768 width='100%' height='100%' style='LEFT: 0px; TOP: 0px'  classid='clsid:E77E049B-23FC-4DB8-B756-60529A35FAD5' codebase='${ctx}/webOffice/js/weboffice_v6.0.5.0.cab#Version=6,0,5,0'>
<param name='_ExtentX' value='6350'><param name='_ExtentY' value='6350'>
</object>
								<!-- --------------------------------== 结束装载控件 ==----------------------------------- -->
</div>
<div class="saveDiv">
	<input type="button" id="btn_close" icon="icon_close" value="关 闭"/>
</div>
</html>

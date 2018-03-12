<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="situation.report.title"/></title>
<content tag="heading">安全形势报表打印</content>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/print.js"/>" type="text/javascript"></script>
<script type="text/javascript">
var printType = "";
function printReport(){
	var appletDiv = $("appletDiv");
	var appletVar = "";
	//appletVar = print_viewB("${ctx}");
	appletVar = print_report("${ctx}");
<%--	if(window.attachEvent) {--%>
<%--		appletVar = loadAppletB("${ctx}");--%>
<%--	} else {--%>
<%--		appletVar = loadAppletA("${ctx}");--%>
<%--	}--%>
	appletDiv.innerHTML = appletVar;
}

function validateParams(print_type){
	this.printType = print_type;
		$.ajax({
		type:"post",
		url:"dtaqSecurityAnalyseAction.do?method=validateParams",
		success:function(msg){
		responseValidateInfo(msg)
		}
		
		})
		}

function responseValidateInfo(selResponse){
	var text = selResponse;
	if(text == "yes"){
		var appletVar = ""; 
		if(this.printType == "print"){
			appletVar = print_report("${ctx}");
		}else if(this.printType == "view"){
			appletVar = print_viewB("${ctx}");
		}
		$("#appletDiv").html(appletVar);
	}else{
	  	if(confirm("缺少工点、填报日期、监测方中的约束条件或报表查询信息为空,是否重新查询！")){
			 parent.main.displayWindow();
	  	}
	}
}

function setButtonView(havaReport){
	if(havaReport != ""){
		$("btnReport").disabled = "false";
		$("btnView").disabled = "false";
	}else{
		$("btnReport").disabled = "disabled";
		$("btnView").disabled = "disabled";
	}
}



</script>
</head>
<body>
	<div id="appletDiv" ></div>
	<div class="saveDiv">
		<input type="button" id="btnReport" class="addButton" value="打&nbsp;&nbsp;印" onclick="validateParams('print')">
		&nbsp;&nbsp;
		<input type="button" id="btnView" class="addButton" value="打印预览" onclick="validateParams('view')">
	</div>
</body>
</html:html>
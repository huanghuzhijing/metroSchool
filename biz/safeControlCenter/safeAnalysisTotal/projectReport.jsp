<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html:html>
<head>


	<title>管理系统！</title>
	<content tag="heading">
	工程报告中心
	</content>
	<script type="text/javascript">
	$(document).ready(function(){
	$(".contentBox1").animate({left:'20px'});
	})
function switchTab(identify,index,count) {
	for(i=0;i<count;i++) {
		var CurTabObj = document.getElementById("Tab_"+identify+"_"+i) ;
		var CurListObj = document.getElementById("List_"+identify+"_"+i) ;
		if (i != index) {
			fRemoveClass(CurTabObj , "upH3") ;
			fRemoveClass(CurListObj , "upBox1") ;
			//fRemoveClass(CurListObj , "current") ;
		}
	}
	fAddClass(document.getElementById("Tab_"+identify+"_"+index),"upH3") ;
	fAddClass(document.getElementById("List_"+identify+"_"+index),"upBox1") ;
}
function fAddClass(XEle, XClass)
{/* shawl.qiu code, void return */
  if(!XClass) throw new Error("XClass 不能为空!");
  if(XEle.className!="") 
  {
    var Re = new RegExp("\\b"+XClass+"\\b\\s*", "");
    XEle.className = XEle.className.replace(Re, "");
	var OldClassName = XEle.className.replace(/^\s+|\s+$/g,"") ;
	if (OldClassName == "" ) {
		 XEle.className = XClass;
	}
	else {
		XEle.className = OldClassName + " " + XClass;
	}
   
  }
  else XEle.className = XClass;
}/* end function fAddClass(XEle, XClass) */

function fRemoveClass(XEle, XClass)
{/* shawl.qiu code, void return */
  if(!XClass) throw new Error("XClass 不能为空!");
  var OldClassName = XEle.className.replace(/^\s+|\s+$/g,"") ;
  if(OldClassName!="") 
  {
	
    var Re = new RegExp("\\b"+XClass+"\\b\\s*", "");
    XEle.className = OldClassName.replace(Re, "");
  }
}/* function fRemoveClass(XEle, XClass) */



</script>
	<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

html {
	background: #FFFFFF;
}

body {
	text-align: left;
	font: normal 12px/ 1.6em simsun, Verdana, Lucida, Arial, Helvetica,
		sans-serif;
	color: #353535;
}

#contain1 {
	width: 100%;
	height: auto;
	overflow: hidden;
	_zoom: 1;
	margin: 0 auto;
}

.smallBox1 h3 {
	float: left;
	width: 152px;
	height: 26px;
	margin: -1px -1px 0;
	line-height: 26px;
	text-align: center;
	font-size: 12px;
	font-weight: normal;
	border: 0px solid #B6CAE3;
	border-right: 0px solid #B6CAE3;
	background: #DDF1FA;
	cursor: pointer;
}

.contentBox1 {
	display: none;
	border: 0px;
}

.smallBox1 .upH3 {
	z-index: 100;
	font-weight: bold;
	border-bottom: 1px solid #FFFFFF;
	border-right: 1px solid #B6CAE3;
	background: #B7E0F2;
}

.smallBox1 .upH3 {
	height: 27px;
	border-bottom: 0;
}

.smallBox1 .upBox1 {
	display: block;
	position: relative;
	top: 26px;
	left: 0px;
	margin-left: -30px;
	background: #fff;
}

.sType1 .newsList {
	width: 280px;
	height: 100px;
	margin: 12px 12px 0;
	border-bottom: 1px dashed yellow !important;
}

.sType11 {
	width: 100%;
	height: 285px;
}

.upBox1 {
	height: 285px;
}

.sType1 .longUL1 {
	width: 100%;
	height: auto;
	overflow: hidden;
	_zoom: 1;
	line-height: 15px;
	margin: 0 auto 10px;
	padding-top: 0px;
	margin-top: 0px;
	border-top: 1px solid #DDF1FA;
}

.sType1 .longUL1 li {
	width: 280px;
	height: 19px;
	overflow: hidden;
	padding-left: 0px;
	margin-left: 0px;
	padding-top: 5px;
}

#contain1 .more1 {
	text-align: right;
	padding-right: 30px;
}

#contain1 .index {
	height: 15px;
	background: url(${ctx}/images/beautify/projectbg.gif) no-repeat;
	padding-left: 15px
}

#contain1 .submenu1 {
	left: 0px;
	position: absolute;
	background: #FFFFFF;
	top: 0px;
	width: 100%;
	z-index: 1;
	height: 26px;
	border-bottom: 1px solid #DDF1FA;
}

#mycontain1 {
	border: 1px solid #B6CAE3;
	height: 300px;
	background: #fff !important;
	border-bottom: 1px solid DDF1FA
}

#mycontain1 .menu1 {
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	background: #F1F5F8;
	border-bottom: 1px solid #B6CAE3;
}

.longUL1 .range2 {
	background-position: 0 -22px !important
}

.longUL1 .range3 {
	background-position: 0 -47px !important
}

.longUL1 .range4 {
	background-position: 0 -72px !important
}

.longUL1 .range5 {
	background-position: 0 -95px !important
}

.longUL1 .range6 {
	background-position: 0 -120px !important
}

.longUL1 .range7 {
	background-position: 0 -144px !important
}

.longUL1 .range8 {
	background-position: 0 -169px !important
}

.longUL1 .range9 {
	background-position: 0 -193px !important
}

.longUL1 .range10 {
	background-position: 0 -217px !important
}
</style>
	<script>
function init(){
switchTab('tv',0,4);//先选中其中一个
}
</script>
</head>
<body onload="init()">

	<div id="mycontain1">


		<div id="contain1">

			<div class="smallBox1">
				<div class="submenu1">
					<h3 id="Tab_tv_0" onmouseover="switchTab('tv',0,4);">
						专项报告
					</h3>
					<h3 id="Tab_tv_1" onmouseover="switchTab('tv',1,4);">
						安全周报/月报
					</h3>
					<h3 id="Tab_tv_2" onmouseover="switchTab('tv',2,4);">
						安全巡查周报
					</h3>
					<h3 id="Tab_tv_3" onmouseover="switchTab('tv',3,4);">
						其它报告
					</h3>
				</div>

				<div id="List_tv_0" align="left" class="contentBox1 sType1 upBox1">
					<ul class="longUL1">
						<c:forEach items="${riskPatrols}" var="patrol" varStatus="status">
							<li>
								<div class='index range${status.count}'>
									<a
										href="${ctx}/dtaqRiskPatrolAction.do?method=download&id=${patrol.id}"
										title="${patrol.name}">${patrol.name}</a>
								</div>
							</li>
						</c:forEach>
						<li class="more1">
							<a href="${ctx}/dtaqRiskPatrolAction.do?method=showMore&qtype=1" title="更多">更多...</a>
						</li>
					</ul>
				</div>

				<div id="List_tv_1"  align="left" class="contentBox1 sType1 sType11">
					<ul class="longUL1">
						<c:forEach items="${riskPatrolWeeklys}" var="patrol"
							varStatus="status">
							<li>
								<div class='index range${status.count}'>
									<a
										href="${ctx}/dtaqRiskPatrolAction.do?method=download&id=${patrol.id}"
										title="${patrol.name}">${patrol.name}</a>
								</div>
							</li>
						</c:forEach>
						<li class="more1">
							<a href="${ctx}/dtaqRiskPatrolAction.do?method=showMore&qtype=3"
								title="更多">更多...</a>
						</li>
					</ul>
				</div>

				<div id="List_tv_2"  align="left" class="contentBox1 sType1 sType11">
					<ul class="longUL1">
						<c:forEach items="${riskPatrolChecks}" var="patrol"
							varStatus="status">
							<li>
								<div class='index range${status.count}'>
									<a
										href="${ctx}/dtaqRiskPatrolAction.do?method=download&id=${patrol.id}"
										title="${patrol.name}">${patrol.name}</a>
								</div>
							</li>
						</c:forEach>
						<li class="more1">
							<a href="${ctx}/dtaqRiskPatrolAction.do?method=showMore&qtype=4"
								title="更多">更多...</a>
						</li>
					</ul>
				</div>

				<div id="List_tv_3"  align="left" class="contentBox1 sType1 sType11">
					<ul class="longUL1">
						<c:forEach items="${riskPatrolOthers}" var="patrol"
							varStatus="status">
							<li>
								<div class='index range${status.count}'>
									<a
										href="${ctx}/dtaqRiskPatrolAction.do?method=download&id=${patrol.id}"
										title="${patrol.name}">${patrol.name}</a>
								</div>
							</li>
						</c:forEach>
						<li class="more1">
							<a href="${ctx}/dtaqRiskPatrolAction.do?method=showMore&qtype=2"
								title="更多">更多...</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<br />
	<div align="center">
		<input type="button" value="<fmt:message key="button.back"/>" onclick="location.href='safeAnalysisTotalAction.do?method=list'" class="backButton" />
	</div>
</body>
</html:html>

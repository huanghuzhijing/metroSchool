<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<style>
   #box{
	width: 900px;
	height: 400px;
	margin: 0 auto;
	border: 1px solid #333;
	overflow: auto;
}
#picWrap{
	position: relative;
}
#divCover{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 99;
}
#picWrap img{
	position: absolute;
	z-index: 98;
	left: 0;
	top: 0;
}
.point{
	display: none;
	width: 16px;
	height: 16px;
	cursor: pointer;
	position: absolute;
	z-index: 999;
	background: url(${ctx}/image/icon-point.gif) 0 0 no-repeat;
}
#selectPoint{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9999;
	border: 1px solid #0f0;
	background-color: rgba(0,255,0,.5);
}
#tablePoint{
	width: 96%;
	margin: 20px auto;
	border-collapse: collapse;
}
#tablePoint th, #tablePoint td{
	padding: 5px;
	border: 1px solid #ccc;
}
#tablePoint .code{
	text-align: center;
	width: 50px;
}
</style>

<head>
<style >
#box{
	width: 900px;
	height: 500px;
	margin: 0 auto;
	border: 1px solid #333;
	overflow: auto;
}
#picWrap{
	position: relative;
}
#divCover{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 99;
}
#picWrap img{
	position: absolute;
	z-index: 98;
	left: 0;
	top: 0;
}
.point{
	display: none;
	width: 16px;
	height: 16px;
	cursor: pointer;
	position: absolute;
	z-index: 999;
	background: url(${ctx}/image/icon-point.gif) 0 0 no-repeat;
}
#selectPoint{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9999;
	border: 1px solid #0f0;
	background-color: rgba(0,255,0,.5);
}
#tablePoint{
	width: 96%;
	margin: 20px auto;
	border-collapse: collapse;
}
#tablePoint th, #tablePoint td{
	padding: 5px;
	border: 1px solid #ccc;
}
#tablePoint .code{
	text-align: center;
	width: 50px;
}
</style>

<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/publicFunction.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery-easyui-1.0.2/jquery.easyui.min.js"></script>

<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="${ctx}/scripts/flex_pub.js"></script>
<script src="${ctx}/scripts/newWatchpoint.js"></script>

<script src="${ctx}/scripts/calendar_hour.js" type="text/javascript"></script>
<script  type="text/javascript" language=javascript>
//必须搭配prototype1.16版本
</script>
<script language="javascript">
function saveInfo() {
	var point_id = jQuery("[name='point_id']").val();
	var errors = "";
	var focus = "";
	var type_kind = "${pointType.type_kind}";
	var abs_warning_value = jQuery("[name='abs_warning_value']").val();
	var point_code = jQuery("[name='point_code']").val();
	var point_mechine = jQuery("[name='point_mechine']").val();
	var part_id = jQuery("[name='part_id']").val();
	var check_frequency = jQuery("[name='check_frequency']").val();
	var check_state = jQuery("[name='check_state']").val();
	var write_date = jQuery("[name='monitoring_date']").val();
	if(point_code == ""){
		errors += "测点编码 为必填项\n";
		focus += "point_code,";
	}
	if(part_id == ""){
		errors += "监测部位 为必填项\n";
		focus += "part_id,";
	}
	if(point_mechine == ""){
		errors += "测量仪器 为必填项\n";
		focus += "point_mechine,";
	}
	if(check_frequency == ""){
		errors += "监测频率 为必填项\n";
		focus += "check_frequency,";
	}
	
	if(type_kind  != '5'){
		var init_value = jQuery("[name='init_value']").val();
		var abs_critical_value = jQuery("[name='abs_critical_value']").val();
		var negative_abs_critical_value = jQuery("[name='negative_abs_critical_value']").val();
		var negative_abs_warning_value = jQuery("[name='negative_abs_warning_value']").val();
		var rel_critical_value = jQuery("[name='rel_critical_value']").val();
		var rel_warning_value = jQuery("[name='rel_warning_value']").val();
		var project_direction = jQuery("[name='project_direction']").val();
		if(init_value == ""){
			if(type_kind == "1"){
				errors += "初始高程 为必填项\n";
			}else if(type_kind == "2"){
				errors += "初始坐标/值 为必填项\n";
			}else if(type_kind == "3"){
				errors += "初始值 为必填项\n";
			}else if(type_kind == "4"){
				errors += "初始PN值 为必填项\n";
			}
			focus += "init_value,";
		}
		if(check_state == ""){
			errors += "是否正在监测 为必填项\n";
			focus += "check_state,"
		}
		if(abs_critical_value == ""){
			errors += "绝对临界值 为必填项\n";
			focus += "abs_critical_value,"
		}
		if(abs_warning_value == ""){
			errors += "绝对警戒值 为必填项\n";
			focus += "abs_warning_value,"
		}
		if(negative_abs_critical_value == ""){
			errors += "负绝对临界值 为必填项\n";
			focus += "negative_abs_critical_value,"
		}
		if(negative_abs_warning_value == ""){
			errors += "负绝对警戒值 为必填项\n";
			focus += "negative_abs_warning_value,"
		}
		if(rel_critical_value == ""){
			errors += "相对临界值 为必填项\n";
			focus += "rel_critical_value,"
		}
		if(rel_warning_value == ""){
			errors += "相对警戒值 为必填项\n";
			focus += "rel_warning_value,"
		}
		if(project_direction == ""){
			errors += "工程方向 为必填项\n";
			focus += "project_direction,"
		}
	}else{
		if(abs_warning_value == ""){
			errors += "最大振速峰值 为必填项\n";
			focus += "abs_warning_value,"
		}
		if(check_state == ""){
			errors += "是否正在监测 为必填项\n";
			focus += "check_state,"
		}
	}
	if(write_date == ""){
		errors += "监测日期 为必填项\n";
		focus += "monitoring_date,"
	}
	if(point_id != "" ){
		var update_reason = jQuery("[name='update_reason']").val();
		if(update_reason == ""){
			errors += "修改原因 为必填项\n";
			focus += "update_reason,"
		}
	}
	if(errors != ""){
		alert(errors);
		var focusStr = focus.split(",");
		jQuery("[name='"+focusStr[0]+"']").focus();
	}else{
 		submitForm("dtaqCheckpointForm",false,true);
	}
 
}

function backToList() {
 	 location.href="${ctx}/dtaq/checkpointMgmt.do?line_id=${line_id}&dtaqCheckpointList_page=${dtaqCheckpointList_page}&segment_id=${segment_id}&station_id=${station_id}&station_state=${station_state}&type_id=${type_id}&part_id=${part_id}&isthird=${isthird}";
}

function validatePointCode(field){
	var oldpoint_code = jQuery("[name='oldpoint_code']").val();
	var oldpart_id = jQuery("[name='oldpart_id']").val();
	var point_code = jQuery("[name='point_code']").val();
	var part_id = jQuery("[name='part_id']").val();
	if(point_code != "" && part_id != "" && (point_code != oldpoint_code || part_id != oldpart_id)){
		var url = "${ctx}/dtaq/checkpointMgmt.do?method=validatePointCode";
		var myajax = new Ajax.Request(url, {method:"post", parameters:"type_id=${type_id}&part_id="+part_id+"&point_code="+point_code+"&organ_type="+jQuery("[name='organ_type']").val()+"&field="+field, onComplete:responseList});
	}
}

function responseList(selRequest){
	var resulttext = selRequest.responseText;
	if(resulttext != null && resulttext != ""){
		var splitStr = resulttext.split(",");
		var resText = splitStr[0];
		var field = splitStr[1];
		if(resText == "no"){
			if(field == "part_id"){
				alert("${texts['dtaq.point.part_id.msg']}");
				jQuery("[name='part_id'] option:eq(0)").attr("selected","selected") ;
				jQuery("[name='part_id']").focus();
			}else if(field == "point_code"){
				alert("${texts['dtaq.point.point_code.msg']}");
				jQuery("[name='point_code']").val("") ;
				jQuery("[name='point_code']").focus();
			}
		}
	}
}

function checkDataValue(fieldType,field){
	if(fieldType == "abs"){
		var abs_critical_value = jQuery("[name='abs_critical_value']").val();
		var abs_warning_value = jQuery("[name='abs_warning_value']").val();
		var value = jQuery("[name='"+field+"]").val();
		if(value != "" && parseFloat(value) < 0){
			var field_name = "绝对警戒值";
			if(field == "abs_critical_value"){
				field_name = "绝对临界值";
			}
			alert(field_name + "必须大于0!");
			jQuery("[name='"+field+"']").val("");
			jQuery("[name='"+field+"']").focus();
			return false;
		}
		if(abs_critical_value !="" && abs_warning_value !=""){
			if(parseFloat(abs_critical_value) >= parseFloat(abs_warning_value)){
				alert("绝对警戒值必须大于绝对临界值!");
				jQuery("[name='"+field+"']").val("");
				jQuery("[name='"+field+"']").focus();
				return false;
			}
		}
	}
	else if(fieldType == "neg"){
		var negative_abs_critical_value = jQuery("[name='negative_abs_critical_value']").val();
		var negative_abs_warning_value = jQuery("[name='negative_abs_warning_value']").val();
		var value = jQuery("[name='"+field+"]").val() ;
		if(value != "" && parseFloat(value) > 0){
			var field_name = "负绝对警戒值";
			if(field == "negative_abs_critical_value"){
				field_name = "负绝对临界值";
			}
			alert(field_name + "必须小于0!");
			jQuery("[name='"+field+"']").val("");
			jQuery("[name='"+field+"']").focus();
			return false;
		}
		if(negative_abs_warning_value != "" && negative_abs_critical_value !=""){
			if(parseFloat(negative_abs_warning_value) >= parseFloat(negative_abs_critical_value)){
				alert("负绝对警戒值必须小于负绝对临界值!");
				jQuery("[name='"+field+"']").val("");
				jQuery("[name='"+field+"']").focus();
				return false;
			}
		}
	}
	else if(fieldType == "rel"){
		var rel_critical_value = jQuery("[name='rel_critical_value']").val();
		var rel_warning_value = jQuery("[name='rel_warning_value']").val();
		var value = jQuery("[name='"+field+"]").val()
		if(value != "" && parseFloat(value) < 0){
			var field_name = "相对警戒值";
			if(field == "rel_critical_value"){
				field_name = "相对临界值";
			}
			alert(field_name + "必须大于0!");
			jQuery("[name='"+field+"']").val("");
			jQuery("[name='"+field+"']").focus();
			return false;
		}
		if(rel_critical_value != "" && rel_warning_value !=""){
			if(parseFloat(rel_critical_value) >= parseFloat(rel_warning_value)){
				alert("相对警戒值必须大于相对临界值!");
				jQuery("[name='"+field+"']").val("");
				jQuery("[name='"+field+"']").focus();
				return false;
			}
		}
	}
}


function setComparePoint(point_id) {
	jQuery("[name='compare_point']").val(point_id) ;
}

/*鼠标定图*/

function init(){
		myresize() ;
}
document.onreadystatechange = stateChange;
function stateChange() {
	if(document.readyState == 'complete') {
		jsReady = true ;
	}
}

function retJsReady(){
	return jsReady ;
}

var  intervalID=window.setInterval("check()",500);
function check(){
	if(swfReady){
		doAddAndShowData() ;
		window.clearInterval(intervalID);   
	}
}   
function setSwfReady(temp){
	swfReady = true ;
}
	
</script>
</head>
<body onload="init()">
<html:form action="checkpointManageAction">
<c:if test="${isthird == 'Y'}">
	<c:set var="graphUrl1" value="${third_img}"/>
</c:if>
<c:if test="${isthird != 'Y'}">
	<c:set var="graphUrl1" value="${work_img}"/>
</c:if>
	<html:hidden property="point_id" value="${point.point_id}" />
  <html:hidden property="pointx" value="${point.pointx}" />
	<html:hidden property="pointy"  value="${point.pointy}" />
	<c:if test="${pointType.type_kind==1}">
		<%@include file="view1.jsp" %>
	</c:if>
	<c:if test="${pointType.type_kind==2}">
		<%@include file="view2.jsp" %>
	</c:if>
	<c:if test="${pointType.type_kind==3}">
		<%@include file="view3.jsp" %>
	</c:if>
	<c:if test="${pointType.type_kind==4}">
		<%@include file="view4.jsp" %>
	</c:if>
	<c:if test="${pointType.type_kind==5}">
		<%@include file="view5.jsp" %>
	</c:if>
</html:form>
<table style="width:100%;">
    <tr>
    	<td align="center"> <%@ include file="point_extend.jsp"%></td>
    </tr>
</table>
</body>
</html:html>
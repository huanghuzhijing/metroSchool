<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<!--css -->
<%--<link href="<c:url value="/styles/main.css"/>" type="text/css" rel="stylesheet">--%>
<link href="<c:url value="/styles/default.css"/>" type="text/css" rel="stylesheet">
<link href="<c:url value="/styles/def_table.css"/>" type="text/css" rel="stylesheet">
<link href="<c:url value="/styles/blue.css"/>" type="text/css" rel="stylesheet">
<link type="text/css" href="${ctx}/scripts/artDialog2.1.1/skin/default.css" rel="stylesheet"  />
<!--js -->
<script src="<c:url value="/scripts/jquery-1.2.6.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/artDialog2.1.1/artDialog.js"></script>
<script language="javascript" type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>	
<script type="text/javascript" src="${ctx}/scripts/checkform.js"></script>	
<style type="text/css">
	.titleDiv{ color:#50A2E6;font-size:13px;font-weight: bold ;padding-left:10px; }
	.defbtnTemp{ display:none ; }
	.editTd{ text-align:left ; padding-left:10px; }
	.defTd{ text-align:center ; }
	
	.buttonTemp {
	border-right: #3333ff 1px solid;
	border-top: #3333ff 1px solid;
	font-size: 9pt;
	border-left: #3333ff 1px solid;
	color: #000000;
	border-bottom: mediumpurple 1px solid;
	font-family: "verdana", "arial", "����";
	background-color: 	lightskyblue;
	event: expression(onmouseover =   function() { 
	 this . style . background = '#D1D8DD', this . style . color = '#1679AA'
	}
</style>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">

//修改
function edit(obj){
	changeTrState(obj) ;
	var selectTds = jQuery(obj).parent().parent().find("td") ;
	
	for(var i=0;i<5;i++){
		var tempTd = selectTds.eq(i) ;
		var tempVal = tempTd.html();
		tempTd.html("<input type='text' class='text' value='"+tempVal+"' size='8' />") ;
		tempTd.addClass("editTd") ;
	}
}

//保存
function save(obj){
	var selectTds = jQuery(obj).parent().parent().find("td") ;
	var tempTr = jQuery(obj).parent().parent() ;
	var sindex = selectTds.eq(0).find("input").val() ;
	var sname = selectTds.eq(1).find("input").val() ;
	var sposition = selectTds.eq(2).find("input").val() ;
	var eposition = selectTds.eq(3).find("input").val() ;
	var swidth = selectTds.eq(4).find("input").val() ;
	var sid = selectTds.eq(5).find(":hidden").val() ;
	
	if(sposition == "" || isNaN(sposition)){
		alert("开始位置必须为数字类型！") ;
	}else if(eposition == "" || isNaN(eposition)){
		alert("截止位置必须为数字类型! ") ;
	}else if(sname == null || sname == ""){
		alert("断面名称不能为空! ") ;
	}else{
		//var url = "${ctx}/dtaqSectionAction.do?method=ajaxSave" ;
		//var myajax = new Ajax.Request(url, {method:"post", parameters:"section_id="+sid+"&section_name="+sname+"&section_width="+swidth+"&start_position="+sposition+"&end_position="+eposition+"&station_id=${station.station_id}&section_index="+sindex+"&index="+jQuery(".def_table tbody tr").index(tempTr), onComplete:sectionSaveResponse});
	
		$.ajax({
				type: "POST",
				url: "${ctx}/dtaqSectionAction.do?method=ajaxSave",
				data: "section_id="+sid+"&section_name="+sname+"&section_width="+swidth+"&start_position="+sposition+"&end_position="+eposition+"&station_id=${station.station_id}&section_index="+sindex+"&index="+jQuery(".def_table tbody tr").index(tempTr),
				success: function(msg){
					sectionSaveResponse(msg);
				}
		});
	
	}
	
}


function sectionSaveResponse(selResponse){
	var text = selResponse;
	var tds = jQuery(".def_table tbody tr:eq("+text.split(",")[0]+")").find("td") ;
	if(text.split(",")[1] == "yes"){
		for(var i=0;i<tds.size()-1;i++){
			var tempTd = tds.eq(i) ;
			tempTd.html(tempTd.find(":text").val()) ;
			tempTd.removeClass() ;
			tempTd.addClass("defTd") ;
		}
		changeTrState(jQuery(".def_table tbody tr").eq(text.split(",")[0]).find("td:last-child")) ;
	}
	else{
		alert("保存失败！ ") ;
	}
}

//添加
function add(){
	var tempTable = jQuery(".def_table") ;
	var tempTr = jQuery("<tr></tr>") ;
	tempTr.append("<td><input type='text' class='text' value='' size='8'/></td>") ;
	tempTr.append("<td><input type='text' class='text' value='' size='8'/></td>") ;
	tempTr.append("<td><input type='text' class='text' value='' size='8'/></td>") ;
	tempTr.append("<td><input type='text' class='text' value='' size='8'/></td>") ;
	tempTr.append("<td><input type='text' class='text' value='' size='8'/></td>") ;
	tempTr.find("td").addClass("editTd") ;
	tempTr.append("<td align='center'><input type='hidden' value=''/><input type='button' class='buttonTemp' value='修改' onclick='edit(this)'/><input type='button' class='buttonTemp defbtnTemp' value='保存' onclick='save(this)'/><input type='button' class='buttonTemp' value='删除' onclick='del(this)'/></td>") ;
	tempTable.append(tempTr) ;
	changeTrState(tempTr.find("td:last-child")) ;
}

//删除
function del(obj){
	var tempTr = jQuery(obj).parent().parent() ;
	var section_id = tempTr.find(":hidden").val() ;
	if(section_id == ""){
		tempTr.remove() ;
	}else{
		if(confirm("${texts['warning.delconfirm']}")){
			//var url = "${ctx}/dtaqSectionAction.do?method=ajaxDelete"  ;
			//var myajax = new Ajax.Request(url, {method:"post", parameters:"section_id="+section_id+"&index="+jQuery(".def_table tr").index(tempTr), onComplete:sectionResponse});
			$.ajax({
				   type: "POST",
				   url: "${ctx}/dtaqSectionAction.do?method=ajaxDelete",
				   data: "section_id="+section_id+"&index="+jQuery(".def_table tr").index(tempTr),
				   success: function(msg){
						sectionResponse(msg);
				   }
			});
		
		
		
		}
	}
}

function sectionResponse(selResponse){
	var text = selResponse;
	if(text.split(",")[1] == "no"){
		alert("删除失败！")  ;
	}else{
		jQuery(".def_table tr").eq(text.split(",")[0]).remove() ;
	}
}

//更改当前单元格状态
function changeTrState(obj){
	var editBtn = jQuery(obj).parent().find(":button").eq(0) ;
	var saveBtn = jQuery(obj).parent().find(":button").eq(1) ;
	editBtn.toggle();
	saveBtn.toggle();
}

</script>
</head>
<body>
	<fieldset>
		<legend>
<!--			<strong>断面<fmt:message key="dtaq.common.list_field" />-->
<!--			</strong>-->
		</legend>
		<table class="commonTable" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td>
				<div class="promptDiv">
					工点信息：<span class="keyInfoSpan">${station.segment_id.line_id.line_name} - ${station.segment_id.segment_name } - ${station.station_name}</span>
<!--					<div class="titleDiv">${station.segment_id.segment_name } &nbsp; ${station.station_name}</div>-->
				</div>
				</td>
				<c:if test="${param.mode ne 'view'}">
				<td align="right">
					<c:if test="${mode == null}">
					<input id="btnAdd" type="button" class="buttonTemp" value="${texts['button.new']}" onclick="add('${station.station_id }')">
					</c:if>
					<input id="btnBack" type="button" class="buttonTemp" value="${texts['button.close']}" onclick="parent.art.dialog({id:'commonDialog1'}).close();"/>
				</td>
				</c:if>
			</tr>
		</table>
		
		<table class="def_table" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
<!--		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">-->
		<thead align="center">
				<tr>
					<th width='16%'>序号</th>
					<th width='16%'>断面名称</th>
					<th width='16%'>开始里程</th>
					<th width='16%'>截止里程</th>
					<th width='16%'>段长(m)</th>
					<th width='20%'>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dtaqSections}" var="dtaqSection">
					<tr align="center">
						<td>${dtaqSection.section_index}</td>
						<td>${dtaqSection.section_name}</td>
						<td>${dtaqSection.start_position}</td>
						<td>${dtaqSection.end_position}</td>
						<td>${dtaqSection.section_width}</td>
						<td>
							<input type="hidden" value="${dtaqSection.section_id}"/><input type="button" class="buttonTemp" value="修改" onclick="edit(this)"/><input type="button" class="buttonTemp defbtnTemp" value="保存" onclick="save(this)"/><input type="button" class="buttonTemp" value="删除" onclick="del(this)"/>	
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</body>
</html:html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.projectMaterials.title"/></title>
<content tag="heading">${station.station_name}管线信息</content>  
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<style type="text/css">
.buttonTemp {
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
function saveInfo(){
	submitForm("dtaqPipeForm",null,true);
}

//新增行
function insertTr(){
	var tableObj = jQuery("#tableObj") ;
	var newRow = jQuery("<tr></tr>") ;
	newRow.attr("align","center") ;
	newRow.append("<td><input type='text' name='pipe_type' class='text' size='10'/></td>") ;
	newRow.append("<td><input type='text' name='start_mileage' class='text' size='14'   onblur='validateNum(this)'/></td>") ;
	newRow.append("<td><input type='text' name='start_distance' class='text' size='1'  onblur='validateNum(this)'/></td>") ;
	newRow.append("<td><input type='text' name='end_mileage' class='text' size='15'   onblur='validateNum(this)'/></td>") ;
	newRow.append("<td><input type='text' name='end_distance' class='text' size='1'  onblur='validateNum(this)'/></td>") ;
	newRow.append("<td><input type='text' name='limited_years' class='text' size='7'  onblur='validateNum(this)'/></td>") ;
	newRow.append("<td><input type='text' name='material' class='text' size='7'/></td>") ;
	newRow.append("<td><input type='text' name='depth' class='text' size='1'  onblur='validateNum(this)'/></td>") ;
	newRow.append("<td><input type='text' name='join_type' class='text' size='1'/></td>") ;
	newRow.append("<td><input type='text' name='section_ram' class='text' size='1'/></td>") ;
	newRow.append("<td><input type='text' name='thickness' class='text' size='1'  onblur='validateNum(this)'/></td>") ;
	newRow.append("<td><input type='text' name='pressure' class='text' size='1' onblur='validateNum(this)'/></td>") ;
	newRow.append("<td><input type='hidden' name='pipe_id'/><input type='button' class='buttonTemp' onclick='removeRow(this)' value='删 除' /></td>") ;
	tableObj.append(newRow) ;
}

//删除
var delRow ;// 要删除的行
function removeRow(target,pipe_id){
	delRow = jQuery(target).parent().parent() ;
	if(window.confirm("是否确认删除该条信息？")){  
		if(typeof(pipe_id) != "undefined"){
			//var url = "${ctx}/dtaqPipeAction.do?method=deleteInfo";
   			//var myajax = new Ajax.Request(url, {method:"post", parameters:"pipe_id="+pipe_id, onComplete:responsedeleteInfo});
			
			$.ajax({
					type: "POST",
					url : "${ctx}/dtaqPipeAction.do?method=deleteInfo",
					data: "pipe_id="+pipe_id,
					success: function(msg){
						if(msg  == "no"){
							alert("删除错误");
						}else{
							delRow.remove() ;
						}
						//responsedeleteInfo(msg);
					}
			});
		}else{
			delRow.remove();
		}
	}
}

//function responsedeleteInfo(selResponse){
//	var text = selResponse.responseText;
//	if(text == "no"){
//		alert("${texts['dtaq.stratumRock.delete_error']}");
//	}else{
//		delRow.remove() ;
//	}
//}

function validateNum(obj){
	var val = jQuery(obj).val() ;
	if(val != "" && isNaN(val)){
		alert("输入值为非法数值！")
		jQuery(obj).val("") ;
		jQuery(obj).focus();
	}
}

</script>
<body>
		<table width="100%">
			<tr>
			<td align="right">
			<div class="listButtonDiv">
				<html:button property="addTr" onclick="insertTr()" styleClass="button1" value="新增行" />
				<input type="button" class="button1" value="导出填报模板" onclick="location.href='${ctx}/dtaqPipeAction.do?method=modelDownLoad'" >
				<input type="button" class="button1" value="数据导入" onclick="location.href='${ctx}/dtaqPipeAction.do?method=showExcelImport&station_id=${station_id}&importType=pipe&segment_id=${segment_id}'">&nbsp;
			</div>
			</td>
			</tr>
		</table>
    <html:form action="dtaqPipeAction.do" method="POST" styleClass="form">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="station_id" value="${station_id}"/>
		<html:hidden property="segment_id" value="${segment_id}"/>
  		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='10%'>类型</th>
				<th width='7%'>起始点里程</th>
				<th width='3%'>Y方向</th>
				<th width='7%'>结束点里程</th>
				<th width='3%'>Y方向</th>
				<th width='5%'>使用年限</th>
				<th width='5%'>材质</th>
				<th width='3%'>埋深</th>
				<th width='3%'>接头类型</th>
				<th width='3%'>横断面直径</th>
				<th width='3%'>管壁厚度</th>
				<th width='3%'>压力大小</th>
				<th width='3%'>操作</th> 
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${pipes}" var="pipe">
		<tr align="center">
			<td><html:text property="pipe_type" value="${pipe.pipe_type}" styleClass="text" size="10" /></td>
			<td><html:text property="start_mileage" value="${pipe.start_mileage}" onblur="validateNum(this)" styleClass="text" size="14" /></td>
			<td><html:text property="start_distance" value="${pipe.start_distance}" styleClass="text" size="1" onblur="validateNum(this)"/></td>
			<td><html:text property="end_mileage" value="${pipe.end_mileage}" styleClass="text" size="15" onblur="validateNum(this)"/></td>
			<td><html:text property="end_distance" value="${pipe.end_distance}" styleClass="text" size="1" onblur="validateNum(this)"/></td>
			<td><html:text property="limited_years" value="${pipe.limited_years}" styleClass="text" size="7"  onblur="validateNum(this)" /></td>
			<td><html:text property="material" value="${pipe.material}" styleClass="text" size="7" /></td>
			<td><html:text property="depth" value="${pipe.depth}" styleClass="text" size="1"  onblur="validateNum(this)"/></td>
			<td><html:text property="join_type" value="${pipe.join_type}" styleClass="text" size="1" /></td>
			<td><html:text property="section_ram" value="${pipe.section_ram}" styleClass="text" size="1" /></td>
			<td><html:text property="thickness" value="${pipe.thickness}" styleClass="text" size="2"  onblur="validateNum(this)"/></td>
			<td><html:text property="pressure" value="${pipe.pressure}" styleClass="text" size="1"  onblur="validateNum(this)"/></td>
			<td>
				<html:hidden property="pipe_id" value="${pipe.pipe_id}"/>
				<input type="button" class="buttonTemp" value="${texts['button.delete']}" onclick="removeRow(this,'${pipe.pipe_id}')"/>
			</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
		<div class="saveDiv">
			<input type="submit" class="saveButton" value="${texts['button.save']}"/>&nbsp;&nbsp;
		</div> 
	</html:form>
 </body>
</html:html>

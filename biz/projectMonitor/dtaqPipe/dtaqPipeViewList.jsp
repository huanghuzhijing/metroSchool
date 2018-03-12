<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.projectMaterials.title"/></title>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
function saveInfo(){
	submitForm("pipeForm",null,true);
}

//新增行
function insertTr(){
	var tableObj = jQuery("#tableObj tbody") ;
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
	newRow.append("<td><input type='hidden' name='pipe_id'/><input type='button' class='button1' onclick='removeRow(this)' value='删 除' /></td>") ;
	tableObj.append(newRow) ;
}

//删除
var delRow ;// 要删除的行
function removeRow(target,pipe_id){
	delRow = jQuery(target).parent().parent() ;
	if(window.confirm("${texts['dtaq.stratumRock.delete_suggest']}")){  
		if(typeof(pipe_id) != "undefined"){
			var url = "${ctx}/dtaqPipeAction.do?method=deleteInfo";
   			var myajax = new Ajax.Request(url, {method:"post", parameters:"pipe_id="+pipe_id, onComplete:responsedeleteInfo});
		}else{
			delRow.remove();
		}
	}
}

function responsedeleteInfo(selResponse){
	var text = selResponse.responseText;
	if(text == "no"){
		alert("${texts['dtaq.stratumRock.delete_error']}");
	}else{
		delRow.remove() ;
	}
}

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
    <html:form action="dtaqPipeAction.do" method="POST" styleClass="form">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="station_id" value="${station_id}"/>
		<html:hidden property="segment_id" value="${segment_id}"/>
  		<fieldset>
  		<legend>${station.station_name}管线信息</legend>
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
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${pipes}" var="pipe">
		<tr align="center">
			<td>${pipe.pipe_type}</td>
			<td>${pipe.start_mileage}</td>
			<td>${pipe.start_distance}</td>
			<td>${pipe.end_mileage}</td>
			<td>${pipe.end_distance}</td>
			<td>${pipe.limited_years}</td>
			<td>${pipe.material}</td>
			<td>${pipe.depth}</td>
			<td>${pipe.join_type}</td>
			<td>${pipe.section_ram}</td>
			<td>${pipe.thickness}</td>
			<td>${pipe.pressure}</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
  		</fieldset>
	</html:form>
 </body>
</html:html>

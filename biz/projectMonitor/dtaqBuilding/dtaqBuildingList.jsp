<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.projectMaterials.title"/></title>
<content tag="heading">${station.station_name}建筑物信息</content>  
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
	submitForm("dtaqBuildingForm",null,true);
}

//新增行
function insertTr(){
	var tableObj = jQuery("#tableObj") ;
	var newRow = jQuery("<tr></tr>") ;
	newRow.attr("align","center") ;
	newRow.append("<td><input type='text' name='name' class='text' size='12'/></td>") ;
	newRow.append("<td><input type='text' name='in_mileage' class='text' size='12'/></td>") ;
	if("${station.station_type}" == "P"){
		newRow.append("<td><input type='text' name='recently_line' class='text' size='5'/></td>") ;
	}
	newRow.append("<td><input type='text' name='center_distance' class='text' size='7' onblur='validate(this)'/></td>") ;
	newRow.append("<td><input type='text' name='base_form' class='text' size='10'/></td>") ;
	newRow.append("<td><input type='text' name='base_depth' class='text' size='10'  onblur='validate(this)'/></td>") ;
	newRow.append("<td><input type='text' name='structure_form' class='text' size='10'/></td>") ;
	newRow.append("<td><input type='text' name='limited_years' class='text' size='10'  onblur='validate(this)'/></td>") ;
	newRow.append("<td><input type='text' name='protection_leve' class='text' size='10'/></td>") ;
	newRow.append("<td><input type='hidden' name='buliding_id'/><input type='button' class='buttonTemp' onclick='removeRow(this)' value='删 除' /></td>") ;
	tableObj.append(newRow) ;
}

//删除
var delRow ;// 要删除的行
function removeRow(target,buliding_id){
	delRow = jQuery(target).parent().parent() ;
	if(window.confirm("是否确认删除该条信息？")){  
		if(typeof(buliding_id) != "undefined"){
			//var url = "${ctx}/dtaqBuildingAction.do?method=deleteInfo";
   			//var myajax = new Ajax.Request(url, {method:"post", parameters:"buliding_id="+buliding_id, onComplete:responsedeleteInfo});
			$.ajax({
					type: "POST",
					url : "${ctx}/dtaqBuildingAction.do?method=deleteInfo",
					data: "buliding_id="+buliding_id,
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
	//var text = selResponse.responseText;
	//if(text == "no"){
	//	alert("${texts['dtaq.stratumRock.delete_error']}");
	//}else{
	//	delRow.remove() ;
	//}
//}

function validate(obj){
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
			<div class="listButtonDiv">
				<html:button property="addTr" onclick="insertTr()" styleClass="button1" value="新增行" />
				<input type="button" class="button1" value="导出填报模板" onclick="location.href='${ctx}/dtaqBuildingAction.do?method=modelDownLoad'" >
				<input type="button" class="button1" value="数据导入" onclick="location.href='${ctx}/dtaqBuildingAction.do?method=showExcelImport&station_id=${station_id}&importType=building&segment_id=${segment_id}'">&nbsp;
			</div>
			</tr>
		</table>
    <html:form action="dtaqBuildingAction.do" method="POST" styleClass="form">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="station_id" value="${station_id}"/>
		<html:hidden property="segment_id" value="${segment_id}"/>
		<html:hidden property="station_type" value="${station.station_type}"/>
	
  		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='6%'>名称</th>
				<th width='4%'>所处里程</th>
				<c:if test="${station.station_type eq 'P'}">
					<th width='3%'>最近隧道左右</th>
				</c:if>
				<c:choose>
					<c:when test="${station.station_type eq 'P'}">
						<th width='5%'>中心线水平距离</th>
					</c:when>
					<c:otherwise>
						<th width='3%'>Y方向</th>
					</c:otherwise>
				</c:choose>
				<th width='4%'>基础形式</th>
				<th width='4%'>基础埋深</th>
				<th width='4%'>结构形式</th>
				<th width='4%'>使用年限</th>
				<th width='4%'>高度</th>
				<th width='3%'>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${buildings}" var="building">
		<tr align="center">
			<td><html:text property="name" value="${building.name}" styleClass="text" size="12" /></td>
			<td><html:text property="in_mileage" value="${building.in_mileage}" styleClass="text" size="12" /></td>
			<c:if test="${station.station_type eq 'P'}">
				<td><html:text property="recently_line" value="${building.recently_line}" styleClass="text" size="5"/></td>
			</c:if>
			<td><html:text property="center_distance" value="${building.center_distance}" styleClass="text" size="7" onblur="validate(this)"/></td>
			<td><html:text property="base_form" value="${building.base_form}" styleClass="text" size="10"/></td>
			<td><html:text property="base_depth" value="${building.base_depth}" styleClass="text" size="10"  onblur="validate(this)"/></td>
			<td><html:text property="structure_form" value="${building.structure_form}" styleClass="text" size="10" /></td>
			<td><html:text property="limited_years" value="${building.limited_years}" styleClass="text" size="10"  onblur="validate(this)"/></td>
			<td><html:text property="protection_leve" value="${building.protection_leve}" styleClass="text" size="10" /></td>
			<td>
				<html:hidden property="buliding_id" value="${building.buliding_id}"/>
				<input type="button" class="buttonTemp" value="${texts['button.delete']}" onclick="removeRow(this,'${building.buliding_id}')"/>
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

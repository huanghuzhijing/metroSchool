<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title>辅助工法信息</title>
<content tag="heading">${station.station_name}辅助工法信息</content>  
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
var t = 0 ;
function saveInfo(){
	submitForm("dtaqConstructionMethodForm",null,true);
}

//新增行
function insertTr(){

	var tableObj = jQuery("#tableObj") ;
	var newRow = jQuery("<tr></tr>") ;
	newRow.attr("align","center") ;
	if("${station.station_type}" == "P"){
		newRow.append("<td><input type='text' name='line' class='text' size='13'/></td>") ;
	}
	newRow.append("<td><input type='text' name='start_mileage' class='text' size='13'/></td>") ;
	if("${station.station_type}" == "S"){
		newRow.append("<td><input type='text' name='ypointone' class='text' size='13'/></td>") ;
	}
	newRow.append("<td><input type='text' name='end_mileage' class='text' size='14'/></td>") ;
	if("${station.station_type}" == "S"){
		newRow.append("<td><input type='text' name='ypointtwo' class='text' size='13'/></td>") ;
	}
	newRow.append("<td><input type='text' name='method_type' class='text' size='14'/></td>") ;
	newRow.append("<td align='left'><input type='text' name='description' class='text' size='30'/></td>") ;
	newRow.append("<td><input type='hidden' name='construction_id'/><input type='button' title='hehe' class='buttonTemp' onclick='removeRow(this)' value='删 除' /></td>") ;
	tableObj.append(newRow) ;
}

//删除
var delRow ;// 要删除的行
function removeRow(target,construction_id){
	delRow = jQuery(target).parent().parent() ;
	if(window.confirm("是否确认删除该条信息？")){  
		if(typeof(construction_id) != "undefined"){
			//var url = "${ctx}/dtaqConstructionMethodAction.do?method=deleteInfo";
   			//var myajax = new Ajax.Request(url, {method:"post", parameters:"construction_id="+construction_id, onComplete:responsedeleteInfo});
			$.ajax({
					type: "POST",
					url : "${ctx}/dtaqConstructionMethodAction.do?method=deleteInfo",
					data: "construction_id="+construction_id,
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
//	if(text == "no"){
	//	alert("${texts['dtaq.stratumRock.delete_error']}");
	//}else{
	//	delRow.remove() ;
//	}
//}

</script>
<body>
		<table width="100%">
			<tr>
				<div class="listButtonDiv">
					<html:button property="addTr" onclick="insertTr()" styleClass="button1" value="新增行" />
					<input type="button" class="button1" value="导出填报模板" onclick="location.href='${ctx}/dtaqConstructionMethodAction.do?method=modelDownLoad'" >
					<input type="button" class="button1" value="数据导入" onclick="location.href='${ctx}/dtaqConstructionMethodAction.do?method=showExcelImport&station_id=${station_id}&importType=constructionMethod&segment_id=${segment_id}'">&nbsp;
				</div>
			</tr>
		</table>
    <html:form action="dtaqConstructionMethodAction.do" method="POST" styleClass="form">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="station_id" value="${station_id}"/>
		<html:hidden property="segment_id" value="${segment_id}"/>
		<html:hidden property="station_type" value="${station.station_type}"/>
		
  		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<c:if test="${station.station_type eq 'P'}">
					<th width='5%'>线路</th>
				</c:if>
				<th width='5%'>起始里程</th>
				<c:if test="${station.station_type eq 'S'}">
					<th width='5%'>Y方向</th>
				</c:if>
				<th width='5%'>截止里程</th>
					
				<c:if test="${station.station_type eq 'S'}">
					<th width='5%'>Y方向</th>
				</c:if>
				<th width='5%'>辅助功法类型</th>
				<th width='30%'>描述</th>
				<th width='3%'>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${constructionMethods}" var="constructionMethod">
		<tr align="center">
			<c:if test="${station.station_type eq 'P'}">
				<td><html:text property="line" value="${constructionMethod.line}" styleClass="text" size="4"/></td>
			</c:if>
			<td><html:text property="start_mileage" value="${constructionMethod.start_mileage}" styleClass="text" size="13"/></td>
			<c:if test="${station.station_type eq 'S'}">
				<td><html:text property="ypointone" value="${constructionMethod.ypointone}" styleClass="text" size="13"/></td>	
			</c:if>
			
			<td><html:text property="end_mileage" value="${constructionMethod.end_mileage}" styleClass="text" size="14" /></td>
			<c:if test="${station.station_type eq 'S'}">
				<td><html:text property="ypointtwo" value="${constructionMethod.ypointtwo}" styleClass="text" size="13"/></td>	
			</c:if>
			
			<td><html:text property="method_type" value="${constructionMethod.method_type}" styleClass="text" size="14" /></td>
			<td align="left"><html:text property="description" value="${constructionMethod.description}" styleClass="text" size="55" /></td>
			<td>
				<html:hidden property="construction_id" value="${constructionMethod.construction_id}"/>
				<input type="button" class="buttonTemp" value="${texts['button.delete']}" onclick="removeRow(this,'${constructionMethod.construction_id}')"/>
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

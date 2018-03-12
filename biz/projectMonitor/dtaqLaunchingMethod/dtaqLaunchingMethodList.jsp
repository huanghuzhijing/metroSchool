<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title>工法信息</title>
<content tag="heading">${station.station_name}工程资料信息管理</content>  
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
	submitForm("dtaqLaunchingMethodForm",null,true);
}

//新增行
function insertTr(){
	var tableObj = jQuery("#tableObj") ;
	var newRow = jQuery("<tr></tr>") ;
	newRow.attr("align","center") ;
	if("${station.station_type}" == "P"){
		newRow.append("<td><input type='text' name='line' class='text' size='4'/></td>") ;
	}
	newRow.append("<td><input type='text' name='start_mileage' class='text' size='10' /></td>") ;
	newRow.append("<td><input type='text' name='end_mileage' class='text' size='10'/></td>") ;
	newRow.append("<td><input type='text' name='method_name' class='text' size='15' /></td>") ;
	
	if("${station.station_type}" == "S"){
		newRow.append("<td><input type='text' name='memo' class='text' size='10'/></td>") ;
	}
	
	if("${station.station_type}" == "P"){
		newRow.append("<td><input type='text' name='steel_space' class='text' size='5'  onblur='validateNum(this)'/></td>") ;
		newRow.append("<td><input type='text' name='shoring_depth' class='text' size='3' onblur='validateNum(this)'/></td>") ;
		newRow.append("<td><input type='text' name='beton_code' class='text' size='14'/></td>") ;
		newRow.append("<td><input type='text' name='level_size' class='text' size='3' onblur='validateNum(this)'/></td>") ;
		newRow.append("<td><input type='text' name='apeak_size' class='text' size='1' onblur='validateNum(this)'/></td>") ;
		newRow.append("<td><input type='text' name='tube_clarity' class='text' size='3' onblur='validateNum(this)'/></td>") ;
	}
	newRow.append("<td><input type='hidden' name='method_id'/><input type='button' title='hehe' class='buttonTemp' onclick='removeRow(this)' value='删 除' /></td>") ;
	tableObj.append(newRow) ;
}

//删除
var delRow ;// 要删除的行
function removeRow(target,method_id){
	delRow = jQuery(target).parent().parent() ;
	if(window.confirm("是否确认删除该条信息？")){  
		if(typeof(method_id) != "undefined"){
			//var url = "${ctx}/dtaqLaunchingMethodAction.do?method=deleteInfo";
   			//var myajax = new Ajax.Request(url, {method:"post", parameters:"method_id="+method_id, onComplete:responsedeleteInfo});
			
			$.ajax({
					type: "POST",
					url : "${ctx}/dtaqLaunchingMethodAction.do?method=deleteInfo",
					data: "method_id="+method_id,
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
//	var text = selResponse;
	//if(text == "no"){
	//	alert("删除错误");
	//}else{
	//	delRow.remove() ;
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
				<input type="button" class="button1" value="导出填报模板" onclick="location.href='${ctx}/dtaqLaunchingMethodAction.do?method=modelDownLoad'" >
				<input type="button" class="button1" value="数据导入" onclick="location.href='${ctx}/dtaqLaunchingMethodAction.do?method=showExcelImport&station_id=${station_id}&importType=launchingMethod&segment_id=${segment_id}'">&nbsp;
			</div>
			</td>
			</tr>
		</table>
    <html:form action="dtaqLaunchingMethodAction.do" method="POST" styleClass="form">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="station_id" value="${station_id}"/>
		<html:hidden property="segment_id" value="${segment_id}"/>
		<html:hidden property="station_type" value="${station.station_type}"/>
  		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<c:if test="${station.station_type eq 'P'}">
					<th width='3%'>左右线</th>
				</c:if>
				<th width='4%'>起始里程</th>
				<th width='4%'>结束里程</th>
				<th width='5%'>名称</th>
				<c:if test="${station.station_type eq 'S'}">
					<th width='5%'>描述</th>
				</c:if>
				
				<c:if test="${station.station_type eq 'P'}">
				<th width='3%'>格栅钢架间距</th>
				<th width='3%'>初支厚度</th>
				<th width='5%'>混凝土编号</th>
				<th width='3%'>水平尺寸</th>
				<th width='3%'>垂直尺寸</th>
				<th width='3%'>隧道净距</th>
				</c:if>
				<th width='3%'>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${launchingMethods}" var="launchingMethod">
		<tr align="center">
			<c:if test="${station.station_type eq 'P'}">
				<td><html:text property="line" value="${launchingMethod.line}" styleClass="text" size="4"/></td>
			</c:if>
			<td><html:text property="start_mileage" value="${launchingMethod.start_mileage}" styleClass="text" size="10" /></td>
			<td><html:text property="end_mileage" value="${launchingMethod.end_mileage}" styleClass="text" size="10" /></td>
			<td><html:text property="method_name" value="${launchingMethod.method_name}" styleClass="text" size="15"/></td>
			
			<c:if test="${station.station_type eq 'S'}">
				<td><html:text property="memo" value="${launchingMethod.memo}" styleClass="text" size="8"/></td>
			</c:if>
			<c:if test="${station.station_type eq 'P'}">
				<td><html:text property="steel_space" value="${launchingMethod.steel_space}" styleClass="text" size="5"  onblur="validateNum(this)"/></td>
				<td><html:text property="shoring_depth" value="${launchingMethod.shoring_depth}" styleClass="text" size="3" onblur="validateNum(this)" /></td>
				<td><html:text property="beton_code" value="${launchingMethod.beton_code}" styleClass="text" size="14" /></td>
				<td><html:text property="level_size" value="${launchingMethod.level_size}" styleClass="text" size="3" onblur="validateNum(this)"/></td>
				<td><html:text property="apeak_size" value="${launchingMethod.apeak_size}" styleClass="text" size="1" onblur="validateNum(this)"/></td>
				<td><html:text property="tube_clarity" value="${launchingMethod.tube_clarity}" styleClass="text" size="3" onblur="validateNum(this)"/></td>
			</c:if>
			<td>
				<html:hidden property="method_id" value="${launchingMethod.method_id}"/>
				<input type="button" class="buttonTemp" value="${texts['button.delete']}" onclick="removeRow(this,'${launchingMethod.method_id}')"/>
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

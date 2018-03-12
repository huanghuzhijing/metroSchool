<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle/>
<html:html>
<head>
<title>工法信息</title>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">

function saveInfo(){
	submitForm("launchingMethodForm",null,true);
}

//新增行
function insertTr(){
	var tableObj = jQuery("#tableObj tbody") ;
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
	newRow.append("<td><input type='hidden' name='method_id'/><input type='button' title='hehe' class='button1' onclick='removeRow(this)' value='删 除' /></td>") ;
	tableObj.append(newRow) ;
}

//删除
var delRow ;// 要删除的行
function removeRow(target,method_id){
	delRow = jQuery(target).parent().parent() ;
	if(window.confirm("${texts['dtaq.stratumRock.delete_suggest']}")){  
		if(typeof(method_id) != "undefined"){
			var url = "${ctx}/dtaqLaunchingMethodAction.do?method=deleteInfo";
   			var myajax = new Ajax.Request(url, {method:"post", parameters:"method_id="+method_id, onComplete:responsedeleteInfo});
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

    <html:form action="dtaqLaunchingMethodAction.do" method="POST" styleClass="form">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="station_id" value="${station_id}"/>
		<html:hidden property="segment_id" value="${segment_id}"/>
		<html:hidden property="station_type" value="${station.station_type}"/>
  		<fieldset>
  		<legend>${station.station_name}工程资料信息管理</legend>
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
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${launchingMethods}" var="launchingMethod">
		<tr align="center">
			<c:if test="${station.station_type eq 'P'}">
				<td>${launchingMethod.line}</td>
			</c:if>
			<td>${launchingMethod.start_mileage}</td>
			<td>${launchingMethod.end_mileage}</td>
			<td>${launchingMethod.method_name}</td>
			
			<c:if test="${station.station_type eq 'S'}">
				<td>${launchingMethod.memo}</td>
			</c:if>
			<c:if test="${station.station_type eq 'P'}">
				<td>${launchingMethod.steel_space}</td>
				<td>${launchingMethod.shoring_depth}</td>
				<td>${launchingMethod.beton_code}</td>
				<td>${launchingMethod.level_size}</td>
				<td>${launchingMethod.apeak_size}</td>
				<td>${launchingMethod.tube_clarity}</td>
			</c:if>
		</tr>
		</c:forEach>
		</tbody>
		</table>
  		</fieldset>
	</html:form>
 </body>
</html:html>

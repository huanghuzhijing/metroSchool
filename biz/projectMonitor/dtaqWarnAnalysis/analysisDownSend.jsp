<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
$("#btn_save").click(function(){
		if($("[name='ids']").val()==","){
		alert("请先选择下发人员！");
		}else{
			var properties=new Array(); 
			properties[0]=["reason","警情下发原因"];
			saveValidateRequired("#btn_save",properties,"dtaqWarnAnalysisForm");
		}	
		}); 
})
	var employeeIds = ",";
	function addEmployee(){
		var emp_ids = $("[name='ids']").val();
		var ids = "";
		employeeIds=",";
		var fileTableTr = jQuery("#fileTable tr");
		if(fileTable.length > 1){
			fileTableTr.each(function(i){
				if( i > 0 ){
					ids += jQuery(this).find("td:eq(6)").html()+"," ;
				}
			});
			ids = "," + ids;
		}
		var url ="dtaqWarnAnalysisAction.do?method=selectSignEmployee&data_ids="+ids+"&ids="+emp_ids+"&segment_id=${param.segment_id}";
  			art.dialog({id:'selectEmp',title:'预警分析', iframe:url, width:'800', height:'440'});
	}
	
	function queryEmployeeInfo(employee_id){
		var url = "dtaqWarnAnalysisAction.do?method=queryEmployeeInfo&employee_id="+employee_id;
		$.ajax({
		type:"post",
		url:url,
		success:function(msg){
		resEmployeeInfoList(msg);
		}
		})
	}
	
	function resEmployeeInfoList(selRequest){
		var text = selRequest;
		if(text != null && text != ""){
			var tableObj = document.getElementById("fileTable");
			var currentRow = tableObj.insertRow();
			currentRow.align = "center";
			currentRow.className = "tr07";
			var pointInfo = text.split("@");
			
		    currentRow.insertCell().innerText = tableObj.rows.length-1;
		    currentRow.insertCell().innerText = pointInfo[0];
		    currentRow.insertCell().innerText = pointInfo[1];
		    currentRow.insertCell().innerText = pointInfo[2];
		    var sex = "男";
		    if(pointInfo[3] == "0"){
		    	sex = "女";
		    }
		    currentRow.insertCell().innerText = sex;
		    currentRow.insertCell().innerHTML = '<input type="button" id="delete" class="button1" onclick="removeRow('+pointInfo[4]+')" value="删除" />';
    		currentRow.insertCell().style.display = "none";
 //   		currentRow.insertCell().innerText = pointInfo[4];
  		$("[name='ids']").val($("[name='ids']").val()+pointInfo[4]+",");
		}
	}
	
	//删除附件的按钮
	function removeRow(emp_id){
		$("[name='ids']").val($("[name='ids']").val().replace(","+emp_id+",",","));
		obj = findTD(event.srcElement);
		var fileTable = document.getElementById("fileTable");
		fileTable.deleteRow(obj.parentElement.rowIndex*1);
		for(var i = 1;i < fileTable.rows.length;i++){
 			fileTable.rows(i).cells(0).innerText = i;
 		}
	}
	
	//返回当前点击按钮的父节点
	function findTD(obj){
		if (obj.nodeName=="TR"||obj.nodeName=="TABLE") return;
		if(obj.nodeName=="TD")
		return (obj);
		else
		return (obj.parentElement);
	}
	
	function deleteAllPoints(){
		$("[name='ids']").val(",");
		var fileTable = document.getElementById("fileTable");
		var rowsLength = fileTable.rows.length;
		if(rowsLength > 1){
			for(var i = 1;i < rowsLength;i++){
				fileTable.deleteRow(1);
			}
		}
		employeeIds=",";
	}
	
	function selectemp(){
		var tableObj = document.getElementById("fileTable");
		var reason = jQuery("[name='reason']").val();
		var ids = "";
		if(tableObj.rows.length == 1){
			alert("${texts['dtaq.warnAnalysis.select_person']}");
			return false;
		}
		if(reason == ""){
			alert("${texts['dtaq.warnAnalysis.input_reason']}");
			return false;
		}
		if(tableObj.rows.length > 1){
			for(var i=1; i<tableObj.rows.length; i++){
				ids += tableObj.rows(i).cells(6).innerText+",";
			}
			$("ids").value = "," + ids;
			return true;
		}
		return false;
	}

	
	function backToList(){
		var flag='${param.flag}';
		if(flag=='1'){
			location.href="dtaqWarnInfoAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qorganType=${param.qorganType}&info_id=${param.info_id}";
			}else{
				var param = "line_id="+jQuery("[name='line_id']").val()+"&segment_id="+jQuery("[name='segment_id']").val()+"&station_id="+jQuery("[name='station_id']").val()
				+"&organ_type="+jQuery("[name='organ_type']").val();
				if('${param.info_id}'!=''){
				
				}
				location.href="dtaqWarnAnalysisAction.do?method=list&"+param;
				}
		
	}
</script>
</head>

<body>
<fieldset>
  <legend><strong>被下发人员列表</strong></legend>
 <table class="commonTable" width="100%" border="0" cellspacing="0" cellpadding="0">
 	<tr>
 		<td>
		   <div align="right">
		   	 <input type="button" class="button1" value="添加" onclick="addEmployee()">
		  	 <input type="button" class="button1" value="${texts['button.delete']}" onclick="deleteAllPoints()">
		  	</div>
	   </td>
	  </tr>
 </table>
<table id="fileTable" class="listTable" width="100%" border="0" cellpadding="0" cellspacing="1" align="center" >
	<thead>
		<tr align="center" height="25" id="trSite">
			  <th width="10%">序号</th>
			  <th width="35%">所属单位/部门</th>
			  <th width="20%">员工姓名</th>
			  <th width="15%">员工工号</th>
			  <th width="10%">员工性别</th>
			  <th width="10%">操作</th>
			</tr>
		</thead>
	</table>
<html:form action="dtaqWarnAnalysisAction.do">
	<html:hidden property="method" value="saveAnalysis"/>
	<html:hidden property="data_ids" value="${data_ids}"/>
	<input type="hidden" name="info_id" value="${param.info_id}">
	<html:hidden property="line_id" value="${line_id}"/>
	<html:hidden property="segment_id" value="${segment_id}"/>
	<html:hidden property="station_id" value="${station_id}"/>
	<html:hidden property="organ_type" value="${organ_type}"/>
	<html:hidden property="qlineId" value="${param.qlineId}"/>
	<html:hidden property="qsegmentId" value="${param.qsegmentId}"/>
	<html:hidden property="qstationId" value="${param.qstationId}"/>
	<html:hidden property="qorganType" value="${param.qorganType}"/>
	<html:hidden property="qtypeId" value="${param.qtypeId}"/>
	<html:hidden property="qstartDate" value="${param.qstartDate}"/>
	<html:hidden property="qendDate" value="${param.qendDate}"/>
	
  	<html:hidden property="ids" value=","/>
	<table class="formTable"  >
	    <COLGROUP>
			<COL class="tdLeftTwo">
			<COL class="tdRightTwo">
			<COL class="tdLeftTwo" >
			<COL class="tdRightTwo">
		</COLGROUP>
		<tr>
			<td><strong>警情下发原因:<font color="red">*</font></strong></td>
			<td colspan="3">
				 <html:textarea property="reason" cols="80" rows="8" onblur="checkTextarea('reason',1000)" onkeydown="textCounter('reason','spanSummary',4000)" onkeyup="textCounter('reason','spanSummary',4000)"/>
				 <span class="req" id="spanSummary">4000字符以内</span>
			</td>
		</tr>
		<tr>
			<td>下发人员:&nbsp;</td>
			<td><ex:employeeName id="${userEmpId}"/><html:hidden property="issue_person" value="${userEmpId}"/></td>
			<td>所属部门:&nbsp;</td>
			<td><ex:organNameById id="${deptId}"/><html:hidden property="person_dept" value="${deptId}"/></td>
		</tr>
	</table>
	<div class="saveDiv">
		<input type="button" id="btn_save" value="警情下发" " />&nbsp;&nbsp;&nbsp;
		<input value="<fmt:message key="button.back"/>" type="button" class="backButton" onclick="backToList()">
	</div>
</html:form>
</fieldset>	
</body>
</html:html>

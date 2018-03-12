<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>

<ex:bundle/>

<html:html>
<head>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">
var rule = "gif,jpg,jpeg,png,bmp";
function onchangeFile(object){
	var obj = jQuery(object) ;
	var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3,4}$/ig;
	var suffixError = "";
	var value = obj.val();
	if(filePath.test(value)==false){
		suffixError = "该文件未找到，请检查导入文件所在文件夹\n";
	}else{
		var rulePic = ","+rule+",";
		var suffix = value.substring(value.lastIndexOf(".") + 1).toLowerCase();
		if(rulePic.indexOf(","+suffix+",") <= -1){
			suffixError = "文件格式不合法,正确的文件格式为:" + rule+"\n";
		}
	}
	if(suffixError !=""){
		alert(suffixError);
	}
}

function getTotal(){
	var l = jQuery("[name='l']").val();
	var e = jQuery("[name='e']").val();
	var c = jQuery("[name='c']").val();
	if(l != "" && e !="" && c != ""){
		if(isNaN(l)) l = 0;
		if(isNaN(e)) e = 0;
		if(isNaN(c)) c = 0;
		var d;
		var levels;
		d = l*e*c;
		jQuery("[name='d']").val(d);
		if(d>=320){
			levels = 'AAAAA';
		}else if(d>=160 && d<320){
			levels = 'AAAA';
		}else if(d>=70 && d<160){
			levels = 'AAA';
		}else if(d>=20 && d<70){
			levels = 'AA';
		}else{
			levels = 'A';
		}
		jQuery("[name='levels']").val(levels);
	}
}
function saveRisk(obj) {
		var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3}$/ig;
		var importFile = jQuery("[name='file']");
		if(importFile.val()!=null && importFile.val()!=''){
			if(filePath.test(importFile.val())==false){
				alert("附件文件未找到，请检查附件文件所在文件夹");
				importFile.focus();
				return false;
			}
		}
		var properties=new Array(); 
			properties[0]=["riskName","危险源名称"];
			properties[1]=["riskType","危险源类型"];
			properties[2]=["riskReason","危险源原因"];
			properties[3]=["riskResult","可能导致事故"];
			saveValidateRequired("#btn_save",properties,"riskLibForm");
}
function delayChange(index){
	var begin_date = jQuery("[name='controlTimeStart']").val();
	var end_date = jQuery("[name='controlTimeEnd']").val();
	if(begin_date !="" && end_date != ""){
	    if(begin_date > end_date){
			if(index==0){
				jQuery("[name='controlTimeStart']").val("");
	      	}else{
	      		jQuery("[name='controlTimeEnd']").val('');
	      	}
	     	alert('开始时间不能晚于结束时间!');
	    }
   	}
}
function displayDate(index){
    try{
    	window.setTimeout("delayChange("+index+")",1);
    }
    catch(e){
    	alert(e);
    }
}

function backToList(){
	location.href="${ctx}/riskLibAction.do?method=list&line_id=${line_id}&segment_id=${segment_id}&station_id=${riskLib.stationId.station_id}&risk_name=${risk_name}&risk_type=${risk_type}&riskLibList_page=${riskLibList_page}";
}
</script>
</head>
<body>
<html:form action="riskLibAction.do" method="POST" enctype="multipart/form-data"  styleClass="form">
<input type="hidden" name="method" value="save"/>
<ex:formProperty name="riskId" var="risk_id"/>
<ex:formProperty name="spacePosition" var="spacePosition"/>
<ex:formProperty name="spacePositionName" var="spacePositionName"/>
<html:hidden property="riskId"/>
<html:hidden property="station_id" value="${param.station_id}"/>
<input type="hidden" name="riskLibList_page" value="${riskLibList_page}" />
<input type="hidden" name="line_id" value="${line_id}" />
<input type="hidden" name="segment_id" value="${segment_id}" />
<input type="hidden" name="station_id" value="${station_id}" />
<input type="hidden" name="risk_name" value="${risk_name}" />
<input type="hidden" name="risk_type" value="${risk_type}" />
<fieldset>
<c:if test="${riskLib.riskId==null}"><legend>新增</legend></c:if>
<c:if test="${riskLib.riskId!=null}"><legend>编辑</legend></c:if>
<table class="formTable" >
    <COLGROUP>
		<COL class="TdLeftTwo">
		<COL class="TdRightTwo">
		<COL class="TdLeftTwo">
		<COL class="TdRightTwo">
	</COLGROUP>
	
	<tr>
      <td>线路:&nbsp;<font color="red">*</font></td>
      <td colspan="3">${station.segment_id.line_id.line_name}</td>
    </tr>
	<tr>
      <td>标段:&nbsp;<font color="red">*</font></td>
      <td>${station.segment_id.segment_name}</td>
      <td>车站/区间:&nbsp;<font color="red">*</font></td>
      <td>${station.station_name}</td>
    </tr>
	<tr>
      <td>危险源名称:&nbsp;<font color="red">*</font></td>
      <td colspan="3"><html:text property="riskName" styleClass="text" size="60" maxlength="100"/></td>
    </tr>
    <tr>
      <td>危险源类型:&nbsp;<font color="red">*</font></td>
      <td><ex:dictSelect property="riskType" type="RiskLibType"/></td>
      <td>危险源子类型:&nbsp;&nbsp;&nbsp;</td>
      <td><ex:dictSelect property="riskSubType" type="RiskSubLibType"/></td>
    </tr>
    <tr>
      <td>L:&nbsp;</td>
      <td><ex:numberInput property="l" type="int" size="10" styleClass="text" onchange="getTotal()"/><font color="blue">(发生事故的可能性大小)</font></td>
      <td>E:&nbsp;&nbsp;&nbsp;</td>
      <td><ex:numberInput property="e" type="int" size="10" styleClass="text" onchange="getTotal()"/><font color="blue">(人体暴露于危险环境的频繁程度)</font></td>
    </tr>
    <tr>
      <td>C:&nbsp;</td>
      <td><ex:numberInput property="c" type="int" size="10" styleClass="text" onchange="getTotal()"/><font color="blue">(发生事故可能造成的后果)</font></td>
      <td>D:&nbsp;&nbsp;&nbsp;</td>
      <td><html:text property="d" styleClass="text" size="10" readonly="true"/>&nbsp;&nbsp;<font color="blue">(动态计算,危险性分值)</font></td>
    </tr>
    <tr>
      <td>危险级别:&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3"><html:text property="levels" styleClass="text" size="20" readonly="true"/>&nbsp;&nbsp;<font color="blue">(动态计算)</font>
      <br>
      <font color="blue">级别说明：AAAAA——极其危险，不可能继续作业；AAAA——高度危险，要立即整改；AAA——显著危险，需要整改；AA——一般危险，需要注意；A——稍有危险，可以接受</font>
      </td>
    </tr>
    <tr>
      <td>控制时间:&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">
      	<input type="text" name="controlTimeStart" value="<fmt:formatDate value="${riskLib.controlTimeStart }" />" onfocus="WdatePicker()" onChange="displayDate(0)"/>&nbsp;-&nbsp;<input type="text" name="controlTimeEnd" value="<fmt:formatDate value="${riskLib.controlTimeEnd }"/>" onfocus="WdatePicker()" onChange="displayDate(1)"/>
      </td>
    </tr>
    <tr>
      <td>空间位置关系:&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">
      	<html:textarea property="spaceRelation" rows="6" cols="70" styleId="spaceRelation" onkeydown="textCounter('spaceRelation','spanRelation',500)" onkeyup="textCounter('spaceRelation','spanRelation',500)" />
      	<span class="req" id="spanRelation" style="display:inline">200字符以内</span>
      	<br>
      	<html:file property="file" styleClass="text" size="40" onchange="onchangeFile(this)"/>
    		&nbsp;&nbsp;
	    <c:if test="${riskLib.riskId ne null and riskLib.spacePosition ne null}">
	      <font color="red"><a href="${ctx}/riskLibAction.do?method=download&risk_id=${riskLib.riskId}">${riskLib.spacePosition}</a>&nbsp;&nbsp;下载</font>
	      </c:if>
      </td>
    </tr>
    <tr>
      <td>危险源原因:&nbsp;<font color="red">*</font></td>
      <td colspan="3">
      	<html:textarea property="riskReason" styleId="riskReason" rows="6" cols="70" onkeydown="textCounter('riskReason','spanSummary',200)" onkeyup="textCounter('riskReason','spanSummary',200)"/>
      	<span class="req" id="spanSummary" style="display:inline">200字符以内</span>
      </td>
    </tr>
    <tr>
      <td>可能导致事故:&nbsp;<font color="red">*</font></td>
      <td colspan="3">
      	<html:textarea property="riskResult" styleId="riskResult" rows="6" cols="70" onkeydown="textCounter('riskResult','spanResult',500)" onkeyup="textCounter('riskResult','spanResult',500)"/>
      	<span class="req" id="spanResult" style="display:inline">500字符以内</span>
      </td>
    </tr>
    <tr>
      <td>存在条件/风险描述:&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">
      	<html:textarea property="descrble" styleId="descrble" rows="6" cols="70" onkeydown="textCounter('descrble','spandescrble',500)" onkeyup="textCounter('descrble','spandescrble',500)"/>
      	<span class="req" id="spandescrble" style="display:inline">500字符以内</span>
      </td>
    </tr>
</table>
</fieldset>
<div class="saveDiv">
	<input type="button" value="<fmt:message key="button.save"/>" class="saveButton" onclick="saveRisk(this)"/>&nbsp;
	<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" />
	</div>
</html:form>
<script type="text/javascript" src="${ctx}/scripts/validator.jsp"></script>
</body>
</html:html>
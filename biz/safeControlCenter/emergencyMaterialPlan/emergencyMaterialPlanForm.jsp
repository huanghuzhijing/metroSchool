<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>

<html:html>
<head>
<title>应急救援预案</title>
<content tag="heading">应急救援预案</content>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["lineId","线路"];
			properties[1]=["planName","计划名称"];
			properties[2]=["planYear","计划年份"];
			properties[3]=["planYear","计划月份"];
			saveValidateRequired("#btn_save",properties,"emergencyMaterialPlanForm");
		}); 
})
function lineChanged() {
//alert('${emergencyMaterialPlan.line_id.line_id}');
	//var url = "${ctx}/dtaq/dataLinkage.do?method=querySegment";
    //var myajax = new Ajax.Request(url, {method:"post", parameters:"line_id="+jQuery("[name='line_id']").val() , onComplete:responseList});
}
function backToList(){
   var url=location.href='${ctx}/emergencyMaterialPlanAction.do?method=list';
   document.forms[0].action=url;
   document.forms[0].submit();
}
//得到联动项目信息并构建options
function responseList(selRequest){
   	var segment_id = eval($("segment_id"));
	var resulttext = selRequest.responseText;
  	if(resulttext==null || resulttext==""){
  		segment_id.options.length=0;
		segment_id.add(document.createElement("OPTION"));
		segment_id.options[0].text = '--请选择--';
		segment_id.options[0].value = '';
		return false;
	}
	else{
	    segment_id.options.length=0;
		segment_id.add(document.createElement("OPTION"));
	    segment_id.options[0].text = '--请选择--';
	    segment_id.options[0].value = '';
		var selarr = resulttext.split(",");
		var subarr;
		var seg_id = '${segment_id}';
		var index = 0;
		for(i = 0;i<selarr.length;i++){
			subarr = selarr[i].split(";");
		   	segment_id.add(document.createElement("OPTION"));
			segment_id.options[i+1].value = subarr[0];
			segment_id.options[i+1].text = subarr[1];
			if(segment_id.options[i+1].value==seg_id){
				index = i+1;
			}
		}
		segment_id.options[index].selected=true;
	}
}
</script>
</head>
<body onload="lineChanged()">
<html:form enctype="multipart/form-data" action="emergencyMaterialPlanAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
<html:hidden property="qplanName"/>
<html:hidden property="qyearNum"/>
<html:hidden property="qmonthNum"/>
<html:hidden property="fid"/>
 <fieldset>
 <c:if test="${emergencyMaterialPlan.fid==null}"><legend>新增</legend></c:if>
<c:if test="${emergencyMaterialPlan.fid!=null}"><legend>编辑</legend></c:if>
 <table class="formTable" >
		<COLGROUP>
				<COL class="tdLeftTwo" />
                <COL class="tdRightTwo" />
                <COL class="tdLeftTwo" />
                <COL class="tdRightTwo" />
		</COLGROUP>
	
    <tr>
      <td>线路：&nbsp;<font color="red">*</font></td>
      <td colspan="3">
      	<html:select property="lineId" value="${emergencyMaterialPlan.line_id.line_id}">
	      	<html:option value="">--请选择--</html:option>
	    	<c:forEach var="line" items="${lines}">
	      		<option value="${line.line_id}" <c:if test="${line.line_id==emergencyMaterialPlan.line_id.line_id}">selected</c:if>>${line.line_name}</option>
	    	</c:forEach>
	    	</html:select>
      </td>
    </tr>
    <tr>
      <td>计划名称：&nbsp;<font color="red">*</font></td>
      <td colspan="3"><html:text property="planName" value="${emergencyMaterialPlan.planName}" styleClass="text" size="60" maxlength="100"/></td>
    </tr>
    <tr>
      <td>计划年份：&nbsp;<font color="red">*</font></td>
      <td>
      	<ex:formProperty name="planYear" var="year_v"/>
      	<html:select property="planYear" value="${emergencyMaterialPlan.planYear}">
     		<option value="">请选择</option>
     		<c:forEach items="${yearList}" var="y">
				<option value="${y}" <c:if test="${y==emergencyMaterialPlan.planYear}">selected</c:if>>${y}</option>
			</c:forEach>
  		</html:select>
      </td>
      <td>计划月份：&nbsp;<font color="red">*</font></td>
      <td>
      	<html:select property="planMonth" value="${emergencyMaterialPlan.planMonth}">
     		<html:option value=""><fmt:message key="dictSelect.select"/></html:option>
     		<ex:formProperty name="planMonth" var="month_v"/>
     		<c:forEach items="${monthList}" var="m">
				<option value="${m}" <c:if test="${m==emergencyMaterialPlan.planMonth}">selected</c:if>>${m}</option>
			</c:forEach>
  		</html:select>
      </td>
    </tr>
    <tr>
      <td>编制人员：&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3"><html:text property="author" value="${emergencyMaterialPlan.author}" styleClass="text" size="20"/></td>
    </tr>
    <tr>
      <td>编制情况：&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">
      	<html:textarea property="condition" rows="8" value="${emergencyMaterialPlan.condition}" cols="80" onkeydown="textCounter('condition','spanSummary',3000)" onkeyup="textCounter('condition','spanSummary',3000)"/>
      	<span class="req" id="spanSummary" style="display:inline">(3000字符以内)</span>
      </td>
    </tr>
    <tr>
      <td>处理措施：&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">
      	<html:textarea property="measure" rows="8" cols="80" value="${emergencyMaterialPlan.measure}" onkeydown="textCounter('measure','spanMeasure',1000)" onkeyup="textCounter('measure','spanMeasure',1000)"/>
      	<span class="req" id="spanMeasure" style="display:inline">(1000字符以内)</span>
      </td>
    </tr>
</table></fieldset>
<div class="saveDiv">
<input type="button" id="btn_save" value="<fmt:message key="button.save"/>" class="saveButton" />&nbsp;<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" />
</div>
</html:form>
<script type="text/javascript" src="${ctx}/scripts/validator.jsp"></script>
</body>
</html:html>
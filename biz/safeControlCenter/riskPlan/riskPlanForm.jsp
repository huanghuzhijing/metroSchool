<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="safedoc.riskPlan.title"/></title>
<content tag="heading">危险源监控计划新版</content>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
$(document).ready(function(){
			getLines('${riskPlan.lineId.line_id}','${riskPlan.segmentId.segment_id}');
		    getSections('${riskPlan.lineId.line_id}','${riskPlan.segmentId.segment_id}');
		   
})





function riskPlan(){
	var planName = jQuery("[name='planName']").val();
	var lineId = jQuery("[name='line_id']").val();
	var segmentId = jQuery("[name='segment_id']").val();
	var year = jQuery("[name='planYear']").val();
	var week = jQuery("[name='planWeek']").val();
	var res = "";
	if(planName =='' || planName == null){
		res+="计划监控名称 为必填项\n";
	}
	if(lineId =='' || lineId == null){
		res+="线路 为必填项\n";
	}
	if(segmentId =='' || segmentId == null){
		res+="标段 为必填项\n";
	}
	if(year =='' || year == null){
		res+="年度 为必填项\n";
	}
	if(week =='' || week == null){
		res+="周次 为必填项\n";
	}
	if(res!=''){
		alert(res);
		return false;
	}
	if('${riskPlan.planId}'==''){
	$.ajax({
	type:"post",
	url:"riskPlanAction.do?method=ajaxCheckRiskPlan&segmentId="+segmentId+"&year="+year+"&week="+week,
	success:function(msg){
	if(msg!='0'){
	   alert("重大风险源监控计划每周次只能填报一次!");
	   return false;
	}else{
	document.forms[0].submit();
	}
	}
	})
	}else{
	document.forms[0].submit();
	}
	
}
function backToList(){
	var url='${ctx}/riskPlanAction.do?method=list';
	document.forms[0].action=url;
	document.forms[0].submit();
	
	
	}
function showUploadDialogAndRefresh(URL,tWidth,tHeight)
    {   dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
    }
function selectYear(){
        var myDate= new Date(); 
	var startYear=myDate.getFullYear()-2;//起始年份 
	var endYear=myDate.getFullYear()+8;//结束年份 
	var obj=document.getElementById('planYear') 
	for (var i=startYear;i<=endYear;i++) 
	{ 
	obj.options.add(new Option(i,i)); 
	} 
	var yearNum='${riskPlan.planYear}'==''?myDate.getFullYear():'${riskPlan.planYear}';
	$("#planYear").val(yearNum); 
    }

function fileClear(){
	 $("#fileName_").val("");
	 $("#fileAddr_").val("");
}
</script>
</head>
<body onload=" selectYear()">
<html:form action="riskPlanAction.do" method="POST"  styleClass="form">
<input type="hidden" name="method" value="save"/>
<html:hidden property="planId"/>
<html:hidden property="qlineId"/>
<html:hidden property="qsegmentId"/>
<html:hidden property="qplanName"/>
<html:hidden property="qplanYear"/>
<html:hidden property="qplanWeek"/>
<fieldset>
<c:if test="${riskPlan.planId==null}"><legend>新增</legend></c:if>
<c:if test="${riskPlan.planId!=null}"><legend>编辑</legend></c:if>
<table class="formTable"  >
    <COLGROUP>
		<COL class="tdLeftTwo">
		<COL class="tdRighyTwo">
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
	</COLGROUP>
   <tr>
      <td>线路:&nbsp;<span class="redSpan">*</span></td>
      <td>
      	<c:if test="${lineId == null}">
	      <select style="width: 240px" id="qlineId" name="line_id"  onchange="getSections(this.value,'')"></select>
							   
      	</c:if>
      	<c:if test="${lineId != null}">
	      	<html:hidden property="line_id" value="${lineId.line_id}"/>
		    <html:text property="lineName" value="${lineId.line_name}" styleClass="text" size="30" readonly="true"/>
	    </c:if>
      </td>
      <td>标段:&nbsp;<span class="redSpan">*</span></td>
      <td>
	      <c:if test="${lineId == null}">
	      	<select id="qsectionId" name="segment_id"  onchange="getWokPoints(this.value,'')"></select>
							    
	      </c:if>
	      <c:if test="${lineId != null}">
	      	<html:hidden property="segment_id" value="${segmentId.segment_id}"/>
	      	<html:text property="segmentName" value="${segmentId.segment_name}" styleClass="text" size="30" readonly="true"/>
      	</c:if>
      </td>
    </tr>
    <tr>
      <td>计划监控名称&nbsp;<font color="red">*</font></td>
      <td colspan="3"><html:text property="planName" styleClass="text" size="60" maxlength="100"/></td>
    </tr>
    <tr>
      <td>计划年份&nbsp;<font color="red">*</font></td>
      <td>
      	 <select id="planYear" name="planYear" >
             <option>--请选择年份--</option>
           </select>
      </td>
      <td>计划周次 &nbsp;<font color="red">*</font></td>
      <td>
      <html:text property="planWeek" styleClass="text" size="30" maxlength="100"/>
      </td>
    </tr>
    <tr>
      <td>编制单位&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3"><input type="text"  class="text" value="${deptName}" size="35" readonly="readonly"/></td>
    </tr>
    <tr>
      <td>备注&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">
      	<html:textarea property="describe" rows="8" cols="80" onkeyup="textareaKeyup(this,2000);"/>
      	<span class="req" >(2000字符以内)</span>
      </td>
    </tr>
    <tr>
      <td>编制人&nbsp;&nbsp;&nbsp;</td>
      <td><html:text property="author" styleClass="text" value="${empName}" size="20" readonly="true"/></td>
      <td>编制日期&nbsp;&nbsp;&nbsp;</td>
      <td><input class="text" type="text" name="writeDate" id="writeDate" value="${currDate}" size="20" readonly="readonly"></td>
    </tr>
     <tr>
	      <td>
							上传附件：<span class="noRedSpan">*</span>
						</td>
							<td >
						       <span style="float: left;"><input type="text" id="fileName_" name="annexname"
							class="inputText" size="30" value="${riskPlan.annexname}" /></span>
						<span style="float: inherit;margin-left:5px;"><input type="button" icon="icon_currWeek"
							onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&suffix=t&flag=1&mainTableName=${maintable}',900,700);"
							style="width: 76px; height: 65px; cursor: pointer" value="文件上传"
							alt="进入文件上传页面" /></span>
						<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_"/>--%>
						<input type="button" icon="icon_delete" onclick="fileClear(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
							<c:if test="${riskPlan.annexaddress!=null}">
								<a href="<%=request.getContextPath()%>/riskPlanAction.do?method=download&id=${riskPlan.planId }">${riskPlan.annexname}</a>
							</c:if>
<%--							<html:text property="fileName_" styleClass="inputText"	value="${compCompleteCheck.reportAnnex}" maxlength="100" size="30"/>--%>
						</td>
						<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="annexaddress" class="inputText" readonly="readonly" size="30" value="${riskPlan.annexaddress}"/>
							
						</td>
	    </tr>
</table>
</fieldset>
<div class="saveDiv">
<input type="button" value="<fmt:message key="button.save"/>" class="button1" onclick="riskPlan()"/>&nbsp;<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" />
</div>
</html:form>
</body>
</html:html>
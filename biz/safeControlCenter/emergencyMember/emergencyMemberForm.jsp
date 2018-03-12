<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">应急组织机构新版</content>
<script src="${ctx}/biz/safedoc/scripts/common.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<style type="text/css">
.saveDiv1{     /*增加/修改页面 保存按钮显示区 样式*/
	text-align: left;
	border:none;
	background-color:#FFFFFF ;
	margin-top:5px ;
	margin-left:5px ;
	margin-right:5px ;
	margin-bottom:5px ;
	padding-right:0px;
	width:99% ;
}
.saveDiv1 .z-btn{
	display:inline-table;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
		$("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["line_id","线路"];
			properties[1]=["qsegmentId","标段"];
			properties[2]=["effect","预案作用"];
			saveValidateRequired("#btn_save",properties,"emergencyMemberForm");
		}); 
			getLines('${emergencyMember.lineId.line_id}','${emergencyMember.segmentId.segment_id}');
		    getSections('${emergencyMember.lineId.line_id}','${emergencyMember.segmentId.segment_id}');
}
            
)
function selectEmployee(){
			var url ="${ctx}/employeeAction.do?method=selectEmpNoteOGCOrgan&single=t";
		 	art.dialog({id:'commonDialog1',title:'选择人员', iframe:url, width:'800', height:'450',top:'10'});
}	
function backToList(){
var url='${ctx}/emergencyMemberAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}'
	document.forms[0].action=url;
	document.forms[0].submit();
}
function clearMember(){
$("#plug_organ_empName").val("");
$("#plug_organ_empId").val("");
}	
</script>
</head>
<body >
<html:form action="emergencyMemberAction.do"  styleClass="form" method="POST">
<input type="hidden" name="method" value="save"/>
<html:hidden property="ec_id" value="${param.fid}"/>
<html:hidden property="fid"/>
<html:hidden property="wf_instance_id"/>
<html:hidden property="wf_current_user"/>
<html:hidden property="wf_status"/>
<html:hidden property="qlineId"/>
<html:hidden property="peoplename"/>
<html:hidden property="qpersonId"/>
<html:hidden property="qlineId"/>
<html:hidden property="qsectionId"/>
<html:hidden property="status"/>
<html:hidden property="ts"/>
<html:hidden property="unitId" value="${unitId}"/>

<fieldset>
<c:if test="${emergencyMember.fid==null}"><legend>新增</legend></c:if>
<c:if test="${emergencyMember.fid!=null}"><legend>编辑</legend></c:if>
<table class="formTable" >
    <COLGROUP>
		<COL class="tdLeftTwo" >
		<COL class="tdRightTwo" >
		<COL class="tdLeftTwo" >
		<COL class="tdRightTwo">
	</COLGROUP>
	<tr>
      <td>预案人员:&nbsp;<span class="noRedSpan">*</span></td>
      <td >
      	<div  style="float: left;">
      	<input style="float: left;" type="text" name="peoplename" id="plug_organ_empName" value="${emergencyMember.personId.employee_name }" class="text" size="20" readonly="readonly" />
      	</div>
      	<div  style="float: left;" >
      	<input type="button" name="abc" value="选择" class="button1" onclick="selectEmployee()">
			</div>
      	<div  style="float: left;" >
		<input type="button" name="def" value="清空" class="button1" onclick="clearMember()">
		<input type="hidden" name="spersonId" id="plug_organ_empId" value="${emergencyMember.personId.employee_id }"/>
      	
     </div>
      	
      </td>
   <td style="display: none;">单位:&nbsp;</td>
      <td style="display: none;">
      	<input type="hidden" name="plug_organ_organName" id="plug_organ_organName"/>
      </td>
    </tr>
    <tr>
      <td>线路:&nbsp;<span class="redSpan">*</span></td>
      <td>
      	<c:if test="${orgsg == null}">
	      <select style="width: 240px" id="qlineId" name="line_id"  onchange="getSections(this.value,'')"></select>
							   
      	</c:if>
      	<c:if test="${orgsg != null}">
	      	<html:hidden property="lineId"/>
		    <html:text property="lineName" styleClass="text" size="30" readonly="true"/>
	    </c:if>
      </td>
      <td>标段:&nbsp;<span class="redSpan">*</span></td>
      <td>
	      <c:if test="${orgsg == null}">
	      	<select id="qsectionId" name="qsegmentId"  onchange="getWokPoints(this.value,'')"></select>
							    
	      </c:if>
	      <c:if test="${orgsg != null}">
	      	<html:hidden property="segmentId" />
	      	<html:text property="segmentName" value="${emergencyMember.segmentId}" styleClass="text" size="30" readonly="true"/>
      	</c:if>
      </td>
    </tr>
    <tr>
      <td>职务:&nbsp;<span class="noRedSpan">*</span></td>
      <td><html:text property="duty" value="${emergencyMember.duty}" styleClass="text" size="20" /></td>
      <td>联系方式:&nbsp;<span class="noRedSpan">*</span></td>
      <td><html:text property="contactMode" value="${emergencyMember.contactMode}" styleClass="text" size="20" /></td>
    </tr>
    <tr>
      <td>主要负责工作:&nbsp;<span class="noRedSpan">*</span></td>
      <td colspan="3">
      	<html:text property="mainWork" value="${emergencyMember.mainWork}" styleClass="text" size="60" maxlength="100" />
      </td>
    </tr>
    <tr>
      <td>预案作用:&nbsp;<span class="redSpan">*</span></td>
      <td colspan="3">
      	<html:textarea property="effect" value="${emergencyMember.effect}" rows="8" cols="80" onkeydown="textCounter('effect','spaneffect',1000)" onkeyup="textCounter('effect','spaneffect',1000)"/>
      	<span class="req" id="spaneffect" style="display:inline">（2000字符以内）</span>
      </td>
    </tr>
    <tr>
      <td>备注:&nbsp;<span class="noRedSpan">*</span></td>
      <td colspan="3">
      	<html:textarea property="description" value="${emergencyMember.description}" rows="8" cols="80" onkeydown="textCounter('description','spandescription',1000)" onkeyup="textCounter('description','spandescription',1000)"/>
      	<span class="req" id="spandescription" style="display:inline">（1000字符以内）</span>
      </td>
    </tr>
</table>
<%@ include file="/commons/uploadFilesExceptionList.jsp"%>
</fieldset>
<center>
<div class="saveDiv">
	<input type="button" id="btn_save" class="saveButton" value="<fmt:message key='button.save'/>"/>&nbsp;<input type="button" class="backButton" value="<fmt:message key='button.back'/>" onclick="backToList()"/>
</div>
</center>
<c:if test="${fid==null}"><c:set var="disabled" value="true"/></c:if>
</html:form>
</body>
</html:html>
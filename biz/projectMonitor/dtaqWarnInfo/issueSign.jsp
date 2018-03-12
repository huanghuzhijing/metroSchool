<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<base target="_self">
<title>原因分析</title>
<script src="<c:url value="/scripts/public.js"/>" type="tect/javascript"></script>
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
<script language="javascript">
function save() {
	 
		  var properties=new Array(); 
			properties[0]=["reason","下发原因"];
			properties[0]=["ids","下发人员"];
			saveValidateRequired("#btn_save",properties,"dtaqWarnInfoForm");
			parent.location.href='dtaqWarnInfoAction.do?method=list&info_id=${info_id}';
			alert("下发成功！");
		  parent.art.dialog({id:'showReason'}).close();
	  
}
function selectEmployee(){
			var url ="${ctx}/employeeAction.do?method=selectEmpNoteOGCOrgan";
		 	art.dialog({id:'selectEmployee',title:'选择人员', iframe:url, width:'800', height:'450'});
}				
function clearMember(){
$("#plug_organ_empNames").val();
$("#plug_organ_empIds").val();
}	  	
</script>
</head>
<body>
<html:form action="dtaqWarnInfoAction.do" method="post">
<input type="hidden" name="method" value="startSign">
<input type="hidden" name="info_id" value="${param.info_id}">
<fieldset  >
<legend>警情下发</legend>
<table class="formTable"  >
           <COLGROUP>
		<COL class="tdLeftTwo" >
		<COL class="tdRightTwo" >
		<COL class="tdLeftTwo" >
		<COL class="tdRightTwo">
	</COLGROUP>
<tr>
						<td>下发人员:<span class="redSpan">*</span></td>
						      <td >
						      	<input type="text" style="float: left;" name="peoplename" id="plug_organ_empNames" value="${emergencyMember.personId.employee_name }" class="text" size="20" readonly="readonly" />
						      	 
								<div class="saveDiv1" style="float: inherit;">
								<input type="button" name="abc" value="选择" class="button1" onclick="selectEmployee()">
								<input type="button" name="def" value="清空" class="button1" onclick="clearMember()">
								<input type="hidden" name="ids" id="plug_organ_empIds" value="${emergencyMember.personId.employee_id }"/>
						      	<input type="hidden" name="plug_organ_organName" id="plug_organ_organNames"/>
						      	
						    </div>
						    </td>
						   
						    </tr>
						    <tr>
						    <td>下发原因:<span class="redSpan">*</span></td>
						    <td>
							<html:textarea property="reason" cols="60" rows="8" />
							</td>
							</tr>
                            <tr>

</tr>
</table>
</fieldset>
<div class="saveDiv">
<%--<c:if test="${operate_mode!='view'}">--%>
	<input type="button" id="btn_save" class="button1" value="保 存" onclick="save()">
<%--</c:if>--%>
</div>
</html:form>
</body>
</html:html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript">
	function backToList(){
	var url='${ctx}/emergencyMemberAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}';
	document.forms[0].action=url;
	document.forms[0].submit();
	
	
	}
</script>
<title>应急组织机构</title>
<content tag="heading">应急组织机构</content>
</head>
<body>
<html:form action="/emergencyMemberAction.do"  styleClass="form" method="POST">
<html:hidden property="peoplename"/>
<html:hidden property="qpersonId"/>
<html:hidden property="qlineId"/>
<html:hidden property="qsectionId"/>
<fieldset>
<legend>详细</legend>
<table class="formTable" >
    <COLGROUP>
		<COL class="tdLeftTwo" >
		<COL class="tdRightTwo" >
		<COL class="tdLeftTwo" >
		<COL class="tdRightTwo">
	</COLGROUP>
	<tr>
      <td>预案人员:&nbsp;</td>
      <td colspan="3">
      	<ex:employeeName id='${emergencyMember.personId.employee_id}'/>&nbsp;
      </td>
    </tr>
    <tr>
      <td>线路:&nbsp;</td>
      <td>
      	${emergencyMember.lineId.line_name}
      	 </td>
      <td>标段:&nbsp;</td>
      <td>
			${emergencyMember.segmentId.segment_name}
      </td>
    </tr>
    <tr>
      <td>职务:&nbsp;</td>
      <td>${emergencyMember.duty}</td>
      <td>联系方式:&nbsp;</td>
      <td>${emergencyMember.contactMode}</td>
    </tr>
    <tr>
      <td>主要工作:&nbsp;</td>
      <td colspan="3">${emergencyMember.mainWork}
      </td>
    </tr>
    <tr>
      <td>用途:&nbsp;</td>
      <td colspan="3">${emergencyMember.effect}
      </td>
    </tr>
    <tr>
      <td>备注:&nbsp;</td>
      <td colspan="3">${emergencyMember.description}
      </td>
    </tr>

</table>
</fieldset>
<%@ include file="/commons/showFilesException.jsp"%>
<div class="saveDiv">
	<input type="button" class="backButton" value="<fmt:message key='button.back'/>" onclick="backToList()"/>
</div>
</html:form>
</body>
</html:html>
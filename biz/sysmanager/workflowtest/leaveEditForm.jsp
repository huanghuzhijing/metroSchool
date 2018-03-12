<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<content tag="heading">
     请假单管理
	</content>
	<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
	<script type="text/javascript">
	//
  jQuery(document).ready(function(){
  	//
    jQuery("#btn_save").click(function(){
	           var properties=[]; 
				properties.push(["leaveDate","请假日期"]);
				properties.push(["leaveDays","请假天数"]);
				saveValidateRequired("#btn_save",properties,"leaveForm");
	    })
	    //
	jQuery("#btn_back").click(function(){
	    document.forms[0].action='leaveAction.do?method=list&ec_p=${param.ec_p}&ec_id=${leave.id}&ec_auditStatus=${leave.auditStatus}';   
	    document.forms[0].submit();
	}) 
	//
}); 
    </script>
</head>
<body>

	<html:form action="leaveAction.do" enctype="multipart/form-data"  styleId="leaveForm" styleClass="form" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id" />
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${leave.id}"/>
		<html:hidden property="ec_auditStatus"  value="${leave.auditStatus}"/>
		<fieldset>
			<legend>
				请假单信息
			</legend>
			<table class="formTable">
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
				</COLGROUP>
						<tr>
								<td>
									请假人：<span class="redSpan">*</span>
								</td>
								<td >
								      <input type="text" name="null" value="${leave.leaver.empname }" readonly="readonly" class="showText"/>	
								</td>
								<td>
									请假类型：<span class="redSpan">*</span>
								</td>
								<td >
									<ex:dictSelect property="leaveType" type="LeaveType" showSelect="false" />
								</td>
						</tr>
						<tr>
								<td>
									请假日期：<span class="redSpan">*</span>
								</td>
								<td>
									<input type="text"  value='<fmt:formatDate value="${leave.leaveDate}" pattern="yyyy-MM-dd"/>'  name="leaveDate" class="inputText" size="15" onfocus="WdatePicker()"     />
								</td>
								<td>
									请假天数：<span class="redSpan">*</span>
								</td>
								<td>
									<input type="text" name="leaveDays" class="inputText"  value='${leave.leaveDays }'  usage="float"/>
								</td>
						</tr>
						<tr>
						   	<td>
								请假事由：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:textarea property="leaveContent"></html:textarea>
							</td>
						</tr>
						<tr>
							<td>
								备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:textarea property="remark"></html:textarea>
							</td>
						</tr>
					</table>
		</fieldset>
	</html:form>

		<div  class="inputInfoDiv">
			<span>填报人： ${userinfo.empName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<span>填报日期：${now_date}</span>
		</div>
		<div align="center" class="sbDiv">
			<input type="button" id="btn_save"
				value="<fmt:message key="button.save"/>" icon="icon_save" />
			&nbsp;&nbsp;
			<input type="button" id="btn_back"
				value="<fmt:message key="button.back"/>" icon="icon_back" />
		</div>

</body>
</html:html>

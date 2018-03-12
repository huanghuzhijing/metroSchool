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
		    location.href='leaveAction.do?method=list&ec_crd=${param.ec_crd}';
		}) 
		//
}); 
    </script>
</head>
<body>

	<html:form action="leaveAction.do" styleId="leaveForm"  enctype="multipart/form-data"  styleClass="form" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id" />
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
								      <input type="text" name="null" value="${userinfo.empName }" readonly="readonly" class="showText"/>	
								</td>
								<td>
									请假类型：<span class="redSpan">*</span>
								</td>
								<td >
									<ex:dictSelect property="leaveType" type="LeaveType" showSelect="false"/>
								</td>
						</tr>
						<tr>
								<td>
									请假日期：<span class="redSpan">*</span>
								</td>
								<td>
									<html:text property="leaveDate" value="${now_date}" styleClass="inputText" size="15" onfocus="WdatePicker()"/>
								</td>
								<td>
									请假天数：<span class="redSpan">*</span>
								</td>
								<td>
									<input type="text" name="leaveDays" class="inputText"  usage="float"/>
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
			<span>填报人： ${userinfo.username} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<span>填报日期：${now_date}</span>
		</div>
		<div align="center" class="sbDiv">
			<input type="button" class="button1" id="btn_save"  icon="icon_save" value="${texts['button.save']}" /> 
			&nbsp;&nbsp;
			<input type="button" class="button1" id="btn_back" icon="icon_back" value="<fmt:message key="button.back"/>"  />
		</div>

</body>
</html:html>

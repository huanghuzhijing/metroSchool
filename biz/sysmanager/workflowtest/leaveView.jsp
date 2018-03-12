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
			jQuery("#btn_back").click(function(){
			    document.forms[0].submit();
			})
			// 
		}); 
    </script>
</head>
<body>

	<html:form action="leaveAction.do?method=list&ec_p=${param.ec_p}&ec_id=${leave.id}&ec_auditStatus=${leave.auditStatus}&ec_crd=${param.ec_crd}" styleId="leaveForm"
		styleClass="form" method="POST">
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
									请假人：<span class="noRedSpan">*</span>
								</td>
								<td >
										${leave.leaver.empname }&nbsp;
								</td>
								<td>
									请假类型：<span class="noRedSpan">*</span>
								</td>
								<td >
									<ex:dicDisplay dictIdentify="LeaveType" dictValue="${leave.leaveType}"/>
								</td>
						</tr>
						<tr>
								<td>
									请假日期：<span class="noRedSpan">*</span>
								</td>
								<td>
									<fmt:formatDate value="${leave.leaveDate}" pattern="yyyy-MM-dd"/>
								</td>
								<td>
									请假天数：<span class="noRedSpan">*</span>
								</td>
								<td>	
									${leave.leaveDays }&nbsp;
								</td>
						</tr>
						<tr>
						   	<td>
								请假事由：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								${leave.leaveContent }&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								${leave.remark }&nbsp;
							</td>
						</tr>
			</table>

		</fieldset>
	</html:form>
<!--审核信息 -->
	<%@ include file="/commons/approveInfoList.jsp"%>
	<div align="center" class="sbDiv">
		<input type="button" class="button1" id="btn_back" icon="icon_back"
			value="<fmt:message key="button.back"/>" />
	</div>

</body>
</html:html>

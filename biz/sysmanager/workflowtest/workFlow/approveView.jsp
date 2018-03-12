<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
	<script type="text/javascript">
	//
	jQuery(document).ready(function(){
		jQuery("#btn_back").click(function(){
		    history.back(-1);
		}) 
	}); 
    </script>
</head>
<content tag="heading">
请假审核
</content>
<body>
	<ex:tab id="leaveTab">
		<ex:tabItem name="leavedataItem" label="审核内容"
			selected="true">
			<fieldset>
				<legend>请假详细信息</legend>
				<table class="titleTable" >
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
								<td colspan="3">
										${leave.leaver.empname }&nbsp;
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
					<div align="center" class="sbDiv">
			<input type="button" id="btn_back"
				value="<fmt:message key="button.back"/>" icon="icon_back" />
		</div>
		</ex:tabItem>
		<ex:tabItem name="leaveItem" label="审核意见"
			disabled="false"
			url="${ctx}/leaveAction.do?method=approveForm&id=${leave.id}&forwardFlag=approveForm">
		</ex:tabItem>
</ex:tab>
</body>
</html:html>

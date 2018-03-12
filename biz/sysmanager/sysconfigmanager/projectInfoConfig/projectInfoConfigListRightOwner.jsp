<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		//
		//
	});
</script>
<table class="titleTable" >
		<tr>
			<td>
				<div id="tt" class="easyui-tabs tabs-container" style="overflow:auto;width:860px;height:400px;">
				   <c:forEach items="${projectPeriodss}" var="projectPeriods">
						<div  id="${projectPeriods.id}"  cache="false" title="${projectPeriods.periodsname}" style="overflow:auto;padding:20px;display:none;"  <c:if test="${projectPeriods.id==p_id}">selected="true"</c:if>   >
							<iframe scrolling="yes" frameborder="0" style="overflow:auto;width:100%;height:100%;" src="${ctx}/projectInfoConfigAction.do?method=projectPeriodsEmplist&prjPerId=${projectPeriods.id}&prjid=${staticPrjId}" ></iframe>
						</div>
					</c:forEach>
				</div>
			</td>
		</tr>
</table>

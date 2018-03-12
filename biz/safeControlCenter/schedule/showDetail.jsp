<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.safetyDaylyLog.title"/></title>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	
	jQuery(document).ready(function(){
		initTable() ;
	})

	function viewInfo(main_id){
		location.href = "${ctx}/dtaqScheduleExcavateAction.do?method=showDetail&main_id="+main_id+"&station_id=${station_id}" ;
	}
	
	//初始化表
function initTable(){
	jQuery.each(jQuery(".inputTd"),function(index,item){
		var obj = jQuery(item);
		var inputHidden = obj.find("input[name=inputHidden]") ;
		var value = inputHidden.val() ;
		var tempval = value.split(",") ;
		if(tempval[1] == 2){
			obj.css("background-color","yellow") ;
		}else if(tempval[1] == 3){
			obj.css("background-color","green") ;
		}else if(tempval[1] == 1){
			obj.css("background-color","#cccdf0") ;
		}
	}) ;
	
}
	function closeWindow(){
			parent.art.dialog({id:'historydlg'}).close();
	}
	
	function backToList(){
		location.href = "${ctx}/dtaqScheduleMainAction.do?method=list&station_id=${dtaqStation.station_id}" ;
	}
</script>
</head>
  <body>
	
	<fieldset>
		<legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="50%" align="center">
						<font color="#50A2E6" size="2"><strong>车站/区间：${dtaqStation.station_name} <fmt:formatDate value="${dtaqScheduleMain.record_date}" pattern="yyyy-MM-dd"/></strong></font>
					</td>
				</tr>
			</table>
			<table class="listTable" id="tableTemp" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width="70px">段数</th>
							<c:forEach items="${schedulelayers}" var="schedulelayer">
								<th>${schedulelayer.data_name}</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dtaqSections}" var="section">
							<tr>
								<td align="center">${section.section_name}</td>
								<c:forEach items="${schedulelayers}" var="schedulelayer">
									<td class="inputTd">
										<span></span>
										<c:set var="flag" value="true"/>
										<c:forEach items="${schedules}" var="schedule">
											<c:if test="${schedule.section_id.section_id eq section.section_id && schedule.layer_on eq schedulelayer.data_short_name}">
												<input type="hidden" name="inputHidden" value="${schedule.excavate_id},${schedule.schedule_state},${schedulelayer.data_short_name},${section.section_id }"/>
												<c:set var="flag" value="false" />
											</c:if>
										</c:forEach>
										<c:if test="${flag}">
												<input type="hidden" name="inputHidden" value=",,${schedulelayer.data_short_name},${section.section_id }"/>
										</c:if>
									 </td>
								</c:forEach>			
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="saveDiv">
					<input type="button" value="返回" class="button1" onclick="backToList()" />
					<input type="button" value="关闭" class="button1" onclick="closeWindow()" />
				</div>
	</fieldset>
			
  </body>
</html:html>

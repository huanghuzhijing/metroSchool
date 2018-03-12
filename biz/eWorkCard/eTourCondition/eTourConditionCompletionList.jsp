<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">现场巡视计划完成</content>  
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
		function fillCondition(lineId){
			var url='eTourConditionAction.do?method=completionForm&line_id='+lineId; 
				commonUrl(url);
		
		}
		function supCondition(lineId,tourDate){
			var url='eTourConditionAction.do?method=create&line_id='+lineId+'&tourDate='+tourDate; 
				commonUrl(url);
		
		}

</script>
<body>

    <html:form action="eTourConditionAction.do" method="POST" styleClass="form" >
<!--		<input type="hidden" name="method" value="save"/>-->
		
  		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='25%'>线路名称</th>
				<th width='25%'>巡视时间</th>
				<th width='25%'>填报状态</th>
				<th width='25%'>操作</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${eTourConditionVos}" var="eTourConditionVo">
				<tr align="center">
						<td>${eTourConditionVo.lineId.line_name}</td>
						<td>${eTourConditionVo.tourDate}</td>
						<td>${eTourConditionVo.fillingStatus}</td>
						<td>
							<div class="saveDiv">
								<input type="button" id="btn_add" icon="icon_add" value="填报" onclick="fillCondition('${eTourConditionVo.lineId.line_id}');"/>
								<input type="button" id="btn_sup" icon="icon_edit" value="计划补充" onclick="supCondition('${eTourConditionVo.lineId.line_id}','${eTourConditionVo.tourDate}');"/>
							</div>	
						</td>
				</tr>	
				</c:forEach>
		
		</tbody>
		</table>
	</html:form>
 </body>
</html:html>

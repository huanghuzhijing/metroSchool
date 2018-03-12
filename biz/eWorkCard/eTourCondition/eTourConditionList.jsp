<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">现场巡视计划编制</content>  
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
		function fillCondition(lineId,status){
			var url='eTourConditionAction.do?method=create&line_id='+lineId; 
				commonUrl(url);
		
		}
		
		function selectLine(){//选择线路
			var widthTemp =  Math.round($(window).width()*0.6);
			var heightTemp = Math.round($(window).height()*0.8);
			var url ="${ctx}/eTourConditionAction.do?method=selectLine";
			art.dialog({id:'commonDialog1',title:'选择补充的线路', iframe:url, width:widthTemp, height:heightTemp,top:'10',lock:false});
		}
		
		function supCondition(lineId,tourDate){//计划补充
			var url='eTourConditionAction.do?method=create&line_id='+lineId+'&tourDate='+tourDate; 
				commonUrl(url);
		
		}
</script>
<body>
<div class="listButtonDiv">
		<input type="button" id="btn_add" icon="icon_add" value="计划补充" onclick="selectLine()"/>
</div>
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
								<input type="button" id="btn_add" icon="icon_add" value="填报" onclick="fillCondition('${eTourConditionVo.lineId.line_id}','${eTourConditionVo.fillingStatus}');"/>
							</div>	
						</td>
				</tr>	
				</c:forEach>
		
		</tbody>
		</table>
	</html:form>
 </body>
</html:html>

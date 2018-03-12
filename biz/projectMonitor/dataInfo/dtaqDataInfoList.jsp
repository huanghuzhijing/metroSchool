<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/restrictLines.js"></script>
<script type="text/javascript">
		jQuery(document).ready(function(){
			  restrictLines('${param.qlineId}','${param.qsegmentId}');
			  restrictSegments('${param.qlineId}','${param.qsegmentId}');
			  restrictStations('${param.qsegmentId}','${param.qstationId}');
			  restrictTypes('${param.qstationId}','${param.qtypeId}');
			  segmentChanged('${param.qsegmentId}');
			  
			  var qorganType='${qorganType}';
			  if(qorganType=='O'){
			  	 //施工获取工点
			
					var qsegmentId='${dtaqSegment.segment_id}';
					var qstationId='${param.qstationId}';
					if(qsegmentId!=''){
						$.post("dtaqDataInfoAction.do?method=restrictStationsSG&qsegmentId="+qsegmentId,function(msg){
							fillJsonNoSelect($("#qstationId"),msg,qstationId,3);
						});
					}else{
						fillJsonSelect($("#qstationId"),"","");
					}
				
				
			  }
			  
			  
			  //新增
			$("#btn_add").click(function(){ 
				var qlineId = jQuery("[name=qlineId]").val() ;
				var qsegmentId = jQuery("[name=qsegmentId]").val() ;
				var qstationId = jQuery("[name=qstationId]").val() ;
				var qtypeId = jQuery("[name=qtypeId]").val() ;
				var qstartDate = jQuery("[name=qstartDate]").val() ;
				var qendDate = jQuery("[name=qendDate]").val() ;
				var qorganType = jQuery("[name=qorganType]").val() ;
				
				
				var params = "&qlineId="+qlineId+"&qsegmentId="+qsegmentId+"&qstationId="+qstationId+"&qtypeId="+qtypeId+"&qstartDate="+qstartDate+"&qendDate="+qendDate+"&qorganType="+qorganType+"&dtaqDataInfoList_page=${dtaqDataInfoList_page}";
				
				location.href='dtaqDataInfoAction.do?method=create'+params; 
			}); 
		});
		
	
		//详细
		function viewInfo(id) {
			var qlineId = jQuery("[name=qlineId]").val() ;
			var qsegmentId = jQuery("[name=qsegmentId]").val() ;
			var qstationId = jQuery("[name=qstationId]").val() ;
			var qtypeId = jQuery("[name=qtypeId]").val() ;
			var qstartDate = jQuery("[name=qstartDate]").val() ;
			var qendDate = jQuery("[name=qendDate]").val() ;
			var qorganType = jQuery("[name=qorganType]").val() ;
			
			
			var params = "&qlineId="+qlineId+"&qsegmentId="+qsegmentId+"&qstationId="+qstationId+"&qtypeId="+qtypeId+"&qstartDate="+qstartDate+"&qendDate="+qendDate+"&qorganType="+qorganType+"&dtaqDataInfoList_page=${dtaqDataInfoList_page}";
		  	location.href="${ctx}/dtaqDataInfoAction.do?method=view&info_id="+id+params;
		  	
		}
		function editInfo(id) {//编辑
			var qlineId = jQuery("[name=qlineId]").val() ;
			var qsegmentId = jQuery("[name=qsegmentId]").val() ;
			var qstationId = jQuery("[name=qstationId]").val() ;
			var qtypeId = jQuery("[name=qtypeId]").val() ;
			var qstartDate = jQuery("[name=qstartDate]").val() ;
			var qendDate = jQuery("[name=qendDate]").val() ;
			var qorganType = jQuery("[name=qorganType]").val() ;
			
			var params = "&qlineId="+qlineId+"&qsegmentId="+qsegmentId+"&qstationId="+qstationId+"&qtypeId="+qtypeId+"&qstartDate="+qstartDate+"&qendDate="+qendDate+"&qorganType="+qorganType+"&dtaqDataInfoList_page=${dtaqDataInfoList_page}";
		  	location.href="${ctx}/dtaqDataInfoAction.do?method=edit&info_id="+id+params;
		  	
		}
		//导出
		function exportExcel(id) {
		  location.href="${ctx}/dtaqDataInfoAction.do?method=exportExcel&info_id="+id;
		}
		
		function validateDelete(id){//删除
		
		
		//	 var url = "${ctx}/dtaqDataInfoAction.do?method=validateDelete";
		//	 var myajax = new Ajax.Request(url, {method:"post", parameters:"info_id="+id, onComplete:showDeleteResponse});
			
			
			$.ajax({
				type: "POST",
				url: "${ctx}/dtaqDataInfoAction.do?method=validateDelete",
				data: "info_id="+id,
				success: function(msg){
					var tempStr = msg.split(",") ;
					if(tempStr[0] == "yes"){
						if(window.confirm("${texts['dtaq.common.delete.msg']}")){
							loadMessage("数据正在删除中，请稍候");
							
							var qlineId = jQuery("[name=qlineId]").val() ;
							var qsegmentId = jQuery("[name=qsegmentId]").val() ;
							var qstationId = jQuery("[name=qstationId]").val() ;
							var qtypeId = jQuery("[name=qtypeId]").val() ;
							var qstartDate = jQuery("[name=qstartDate]").val() ;
							var qendDate = jQuery("[name=qendDate]").val() ;
							var qorganType = jQuery("[name=qorganType]").val() ;
							
							var params = "&qlineId="+qlineId+"&qsegmentId="+qsegmentId+"&qstationId="+qstationId+"&qtypeId="+qtypeId+"&qstartDate="+qstartDate+"&qendDate="+qendDate+"&qorganType="+qorganType+"&dtaqDataInfoList_page=${dtaqDataInfoList_page}";
							
							
							location.href="${ctx}/dtaqDataInfoAction.do?method=deleteDataInfo&info_id="+id+params;
							//location.href="${ctx}/dtaqDataInfoAction.do?method=delete&info_id="+id+"&dtaqDataInfoList_page=${dtaqDataInfoList_page}&isthird=${isthird}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&typeId=${typeId}&startDate=${startDate}&endDate=${endDate}";
						}
					}else{
						alert("此记录不是该类型下最近的监测记录，不能被删除！") ;
					}
				}
			});
		}
		
	</script>
</head>
<content tag="heading">
<c:if test="${qorganType=='O'}">
施工方数据编制
</c:if>
<c:if test="${qorganType=='T'}">
第三方数据编制
</c:if>
</content>

<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dtaqDataInfoAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&qorganType=${param.qorganType}">
					<table align="left">
						
					<c:if test="${qorganType=='T'}">
						<tr>
								<td>线路：</td>
							    <td >
							    	<select style="width: 240px" id="qlineId" name="qlineId" onchange="restrictSegments(this.value,'')"></select>
							    </td>
							    <td>标段：</td>
							    <td>
							     	<select id="qsegmentId" name="qsegmentId" onchange="restrictStations(this.value,''); segmentChanged(this.value);"></select>
							    </td>
					 	</tr>
					 	<tr>
							    <td>车站/区间：</td>
							    <td>
							    	<select id="qstationId" name="qstationId" onchange="restrictTypes(this.value,'')"></select>
							    </td>
							    <td>监测类型：</td>
							    <td>
							    	<select id="qtypeId" name="qtypeId" ></select>
							    </td>
						</tr>
						<tr>
								<td>施工单位：</td>
								<td>
									<html:text property="eorg"  styleClass="text" size="35" />
								</td>
								<td>监理单位：</td>
								<td>
									<html:text property="eorgjl"  styleClass="text" size="35" />
								</td>
						</tr>
						
					</c:if>
					<c:if test="${qorganType=='O'}">
						<tr>
								<td>线路：</td>
							    <td >
							    	<input type="text" class="text" size="40" name="line_name" readonly="readonly" value="${line.line_name}">
							    </td>
							    <td>标段：</td>
							    <td>
							     	<input type="text" class="text" size="40" name="segment_name" readonly="readonly" value="${dtaqSegment.segment_name}">
							    </td>
					 	</tr>
					 	<tr>
							    <td>车站/区间：</td>
							    <td>
							    	<select id="qstationId" name="qstationId" onchange="restrictTypes(this.value,'')"></select>
							    </td>
							    <td>监测类型：</td>
							    <td>
							    	<select id="qtypeId" name="qtypeId" ></select>
							    </td>
						</tr>
						<tr>
								<td>施工单位：</td>
								<td>
									<input type="text" class="text" size="40" name="orgSg" readonly="readonly" value="${orgSg}">
								</td>
								<td>监理单位：</td>
								<td>
									<input type="text" class="text" size="40" name="orgJL" readonly="readonly" value="${orgJL}">
									
								</td>
						</tr>
						
					</c:if>
						<tr>
						 		<td>填报时间：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								
								<td align="right">
									<input type="submit" value="查询" icon="icon_query" />
								</td>
								</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
<div class="listButtonDiv">
 <c:if test="${fn:contains(userinfo.usercmd,'dtaqDataInfo1_add')==true || fn:contains(userinfo.usercmd,'dtaqDataInfo3_add')==true}">
	<input type="button" id="btn_add" icon="icon_add" value="新增"/>
</c:if>
</div>
<ec:table items="dtaqDataInfos" var="dtaqDataInfo" action="dtaqDataInfoAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
		<ec:column property="segment_id.segment_name"  title="标段" width="10%"/>
		<ec:column property="station_id.station_name" title="车站/区间" width="10%"/>
		<ec:column property="type_id.type_name" title="监测类型" width="10%"/>
		<ec:column property="write_date" title="填报日期" width="10%">
			<fmt:formatDate value="${dtaqDataInfo.write_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</ec:column>
		<ec:column property="monitoring_date" title="监测日期" width="10%"/>
		<ec:column property="write_user" title="填报人" width="10%">
			<ex:employeeName id="${dtaqDataInfo.write_user}" />
		</ec:column>
		<ec:column property="null" title="操作" width="15%">
<!--			<div align="center">-->
<!--				<input type="button" class="button1" value="编辑" onclick="editInfo('${dtaqDataInfo.info_id}')">-->
<!--				<input type="button" class="button1" value="查看明细" onclick="viewInfo('${dtaqDataInfo.info_id}')">-->
<!--		    	<input type="button" class="button1"value="导出Excel" onclick="exportExcel('${dtaqDataInfo.info_id}')">-->
<!--			</div>-->
			
			
				<div align="center">
					<fmt:formatDate var="dateStr" value="${dtaqDataInfo.write_date}" pattern="yyyy-MM-dd"/>
					<c:if test="${userinfo.empId == dtaqDataInfo.write_user}">
						<c:if test="${dtaqDataInfo.station_id.station_state == '1'}">
							<c:if test="${dtaqDataInfo.station_id.update_data=='1' || (dateStr==now_date && dtaqDataInfo.filing_state=='0' && dtaqDataInfo.station_id.station_state == '1')}">
								 <c:if test="${fn:contains(userinfo.usercmd,'dtaqDataInfo1_update')==true || fn:contains(userinfo.usercmd,'dtaqDataInfo3_update')==true}">
									<input type="button" class="button1" value="编辑" onclick="editInfo('${dtaqDataInfo.info_id}')">
								</c:if>
							</c:if>
							<c:if test="${dtaqDataInfo.station_id.delete_data=='1' || (dateStr==now_date && dtaqDataInfo.filing_state=='0' && dtaqDataInfo.station_id.station_state == '1')}">
								 <c:if test="${fn:contains(userinfo.usercmd,'dtaqDataInfo1_delete')==true || fn:contains(userinfo.usercmd,'dtaqDataInfo3_delete')==true}">
									<input type="button" class="button1" value="删除" onclick="validateDelete('${dtaqDataInfo.info_id}')">
								</c:if>
							</c:if>
							<c:if test="${dateStr!=now_date || dtaqDataInfo.filing_state=='1'}">
								<input type="button" class="button1" value="查看明细" onclick="viewInfo('${dtaqDataInfo.info_id}')">
							</c:if>
							<c:if test="${fn:contains(userinfo.usercmd,'dtaqDataInfo1_exportExcel')==true || fn:contains(userinfo.usercmd,'dtaqDataInfo3_exportExcel')==true}">
								<input type="button" class="button1"value="导出Excel" onclick="exportExcel('${dtaqDataInfo.info_id}')">
							</c:if>
						</c:if>
						<c:if test="${dtaqDataInfo.station_id.station_state != '1'}">
							 <input type="button" class="button1" value="查看明细" onclick="viewInfo('${dtaqDataInfo.info_id}')">
							<input type="button" class="button1"value="导出Excel" onclick="exportExcel('${dtaqDataInfo.info_id}')">
						</c:if>
					</c:if>
					<c:if test="${userinfo.empId != dtaqDataInfo.write_user}">
						<input type="button" class="button1" value="查看明细" onclick="viewInfo('${dtaqDataInfo.info_id}')">
						<input type="button" class="button1"value="导出Excel" onclick="exportExcel('${dtaqDataInfo.info_id}')">
					</c:if>
				</div>
		</ec:column>
		
		
	</ec:row>
</ec:table>
</body>

</html:html>
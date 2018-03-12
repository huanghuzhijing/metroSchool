<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/restrictLines.js"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
		jQuery(document).ready(function(){
			   getLines('${param.qlineId}','${param.qsegmentId}');
		    getSections('${param.qlineId}','${param.qsegmentId}');
		    getWokPoints('${param.qsegmentId}','${param.qstationId}');
			  restrictTypes('${param.qstationId}','${param.qtypeId}');
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
			
			
			var params = "&qlineId="+qlineId+"&qsegmentId="+qsegmentId+"&qstationId="+qstationId+"&qtypeId="+qtypeId+"&qstartDate="+qstartDate+"&qendDate="+qendDate+"&qorganType="+qorganType+"&ec_p="+$('input[name="ec_p"]').val()+"&ec_crd="+$('[name="ec_rd"]').val();
		  	location.href="${ctx}/dtaqWarnInfoAction.do?method=edit&viewFlag=t&info_id="+id+params;
		  	
		}
		function editInfo(id) {//编辑
			var qlineId = jQuery("[name=qlineId]").val() ;
			var qsegmentId = jQuery("[name=qsegmentId]").val() ;
			var qstationId = jQuery("[name=qstationId]").val() ;
			var qtypeId = jQuery("[name=qtypeId]").val() ;
			var qstartDate = jQuery("[name=qstartDate]").val() ;
			var qendDate = jQuery("[name=qendDate]").val() ;
			var qorganType = jQuery("[name=qorganType]").val() ;
			
			var params = "&qlineId="+qlineId+"&qsegmentId="+qsegmentId+"&qstationId="+qstationId+"&qtypeId="+qtypeId+"&qstartDate="+qstartDate+"&qendDate="+qendDate+"&qorganType="+qorganType+"&ec_p="+$('input[name="ec_p"]').val()+"&ec_crd="+$('[name="ec_rd"]').val();
		  	location.href="${ctx}/dtaqWarnInfoAction.do?method=edit&info_id="+id+params;
		  	
		}
		//导出
		function exportExcel(id) {
		  location.href="${ctx}/dtaqDataInfoAction.do?method=exportExcel&info_id="+id;
		}
		
		//根据工点获取第三方监测单位
	function stationChanged(stationId) {
		$.ajax({
			type: "POST",
			url: "dtaqDataInfoAction.do?method=queryThird",
			data: "stationId="+stationId,
			success: function(msg){
				responseJc(msg);
			}
		});
	}	
	
	//施工单位监理单位
	function responseJc(selResponse){
		var text = selResponse;
		if(text != ""){
			jQuery("[name='eorgjc']").val(text) ;
		}else{
			jQuery("[name='eorgjc']").val("") ;
		}
	}
	function issueSign(id){
	var url='dtaqWarnAnalysisAction.do?method=downSend&flag=1&qlineId='+$("[name='qlineId']").val()+'&qsegmentId='+$("[name='qsegmentId']").val()+'&qstationId='+
			$("[name='qstationId']").val()+'&qtypeId='+$("[name='qtypeId']").val()+'&qstartDate='+$("[name='qstartDate']").val()+'&qendDate='+
			$("[name='qendDate']").val()+'&qorganType='+$("[name='qorganType']").val()+'&info_id='+id;
	location.href=url;
	}
	</script>
</head>
<content tag="heading">
	监测超限填报记录
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
				<html:form action="dtaqWarnInfoAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table align="left">
						<tr>
								<td>线路：</td>
							    <td >
							    	<select style="width: 240px" id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
							    </td>
							    <td>标段：</td>
							    <td>
							     	<select id="qsectionId" name="qsegmentId" onchange="getWokPoints(this.value,'')"></select>
							    </td>
					 	</tr>
					 	<tr>
							    <td>车站/区间：</td>
							    <td>
							    	<select id="qworkPointId" name="qstationId" onchange="restrictTypes(this.value,'')"></select>
							    </td>
							    <td>监测类型：</td>
							    <td>
							    	<select id="qtypeId" name="qtypeId" ></select>
							    </td>
						</tr>
						
						<tr>
						 		<td>填报时间：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								<td align="right">第三方/施工方：</td>
								<td>
									<html:select property="qorganType">
										<html:option value="T">第三方</html:option>
										<html:option value="O">施工方</html:option>
									</html:select>
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
<ec:table items="dtaqDataInfos" var="dtaqDataInfo" action="dtaqWarnInfoAction.do?method=list"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
		<ec:column property="segment_id.segment_name"  title="标段" width="10%"/>
		<ec:column property="station_id.station_name" title="车站/区间" width="10%"/>
		<ec:column property="type_id.type_name" title="监测类型" width="10%"/>
		<ec:column property="SG_Org" title="施工单位" width="10%">
		<ex:organNameById id="${dtaqDataInfo.SG_Org}"/>
		</ec:column>
		<ec:column property="JC_Org" title="监测单位" width="10%">
		<ex:organNameById id="${dtaqDataInfo.JC_Org}"/>
		</ec:column>
		<ec:column property="write_date" title="填报日期" width="10%">
			<fmt:formatDate value="${dtaqDataInfo.write_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</ec:column>
		<ec:column property="write_user" title="填报人" width="10%">
			<ex:employeeName id="${dtaqDataInfo.write_user}" />
		</ec:column>
		<ec:column property="null" title="操作" width="15%">
		<div algin="center">
	<c:if test="${dtaqDataInfo.state eq '0'}">
<%--		<c:if test="${fn:contains(userinfo.usercmd,'warnInfo_update')==true}">--%>
			<input type="button" class="button1" value="编辑" onclick="editInfo('${dtaqDataInfo.info_id}')">
<%--		</c:if>--%>
	</c:if>
	<c:if test="${dtaqDataInfo.state eq '0'}">
<%--		<c:if test="${fn:contains(userinfo.usercmd,'warnInfo_sign')==true}">--%>
			<input type="button" class="button1"value="警情下发" onclick="issueSign('${dtaqDataInfo.info_id}')">
<%--		</c:if>--%>
	</c:if>
  	<input type="button" class="button1" value="查看明细" onclick="viewInfo('${dtaqDataInfo.info_id}')">
	</div>
	
		</ec:column>
		
		
	</ec:row>
</ec:table>
</body>

</html:html>
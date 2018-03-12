<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<style type="text/css">
.state1, .state2, .state3, .state4 {
    border: 1px solid #000000;
    display: inline-block;
    height: 15px;
    width: 80px;
}
span.state1 {
    background-color: #9eff8d;
}
span.state2 {
    background-color: #fffc6c;
}
span.state3 {
    background-color: #ffa40a;
}
span.state4 {
    background-color: #ff3f32;
}

<!--.divagree0{background:#FAF7F7;}-->
<!--.divagree1{background:#B4C0EC;}-->
<!--.divagree2{background:#ECAB95;}-->
</style>
	
	
	<script type="text/javascript">
           var oper_id="";
		jQuery(document).ready(function(){
		
		//控制按钮状态
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			$("#btn_view").hide();

			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);	
				//新增
			$("#btn_add").click(function(){ 
			    var object="${dtaqStation}";			   
			    if(object==""){
			     alert("请选中车站后再新增!");
			     return  false;
			    }
				location.href='dtaqSituationMotionanalAction.do?method=create&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&ec_crd='+$("[name='ec_rd']").val()+'';
			}); 
			//编辑
			$("#btn_edit").click(function(){		  
				var url='dtaqSituationMotionanalAction.do?method=edit&id='+oper_id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='dtaqSituationMotionanalAction.do?method=delete&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			
			//详情
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
							
		});
		
		//详细页面
		function showView(id){
		   
	    	var url ='dtaqSituationMotionanalAction.do?method=view&id='+id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			commonUrl(url);
	  	}
		
		
		
		//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;		
		}
		
		//指令码判断
		function checkCmd(){
			var cmdIds='${userinfo.usercmd}';
		}
		
</script>
</head>
<body>
	<table class="queryTable">

		<tr>
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form
					action="dtaqSituationMotionanalAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&qlineId=${qlineId}&qsegmentId=${qsegmentId}&qstationId=${qstationId}">
					<table align="left">
						<tr>
							<td align="right">
								线路：
							</td>
							<td>
								${dtaqStation.segment_id.line_id.line_name}
							</td>
							<td align="right">
								标段：
							</td>
							<td>
								${dtaqStation.segment_id.segment_name}
							</td>
						</tr>
						<tr>
							<td align="right">
								车站/区间：
							</td>
							<td>
								${dtaqStation.station_name}
							</td>
							<td>
								工程安全风险状态：
							</td>
							<td>
								<ex:dictSelect property="qsafeState" type="AnalyseSafeState" />
							</td>
						</tr>
						<tr>
							<td align="right">
								填报时间：
							</td>
							<td>
								<input type="text" name="qstartDate" class="inputText"
									value="${qstartDate}" onfocus="WdatePicker()" />
								--
								<input type="text" name="qendDate" class="inputText"
									value="${qendDate}" onfocus="WdatePicker()" />
							</td>
							<td>
								是否重点关注:
							</td>
							<td>
								<ex:dictSelect property="qriskAttention" type="RiskAttention" />
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
		<input id="btn_add" value="${texts['button.new']}" type="button"
			icon="icon_add" />
		<input id="btn_view" value="${texts['button.detail']}" type="button"
			icon="icon_view" />
		<input id="btn_edit" value="${texts['button.edit']}" type="button"
			icon="icon_edit" />
		<input id="btn_delete" value="${texts['button.delete']}" type="button"
			icon="icon_delete" />
	</div>
	<ec:table items="dtaqSituationMotionanals"
		var="dtaqSituationMotionanal"
		action="dtaqSituationMotionanalAction.do?method=list" title=""
		width="100%" sortable="false" rowsDisplayed="10"
		imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		locale="zh_CN" retrieveRowsCallback="limit" filterRowsCallback="limit"
		sortRowsCallback="limit">
		<ec:row highlightRow="true"
			onclick="pullValue('${dtaqSituationMotionanal.id}','');"
			ondblclick="showView('${dtaqSituationMotionanal.id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%" />
			<ec:column property="null" sortable="false" title="选择" width="5%">
				<input name="select_id" value="${dtaqSituationMotionanal.id}"
					type="radio" />
			</ec:column>

			<ec:column property="segmentId" title="标段" width="8%">
				<c:forEach items="${segments}" var="segment">
					<c:if
						test="${segment.segment_id == dtaqSituationMotionanal.segmentId}">
						<c:out value="${segment.segment_name}"></c:out>
					</c:if>
				</c:forEach>
			</ec:column>
			<ec:column property="stationId" title="车站/区间" width="8%">
				<c:forEach items="${stations}" var="station">
					<c:if
						test="${station.station_id== dtaqSituationMotionanal.stationId}">
							${station.station_name}
							</c:if>
				</c:forEach>
			</ec:column>
			<ec:column property="safeState" title="工程安全风险状态" width="5%">
				<div style="width: 100%; height: 30px">
					<span class="state${dtaqSituationMotionanal.safeState}"></span>
				</div>
			</ec:column>
			<ec:column property="riskAttention" title="是否重点关注" width="5%">
				<div style="width: 100%; height: 30px">
					<ex:dicDisplay dictIdentify="RiskAttention"
						dictValue="${dtaqSituationMotionanal.riskAttention}" />
				</div>
			</ec:column>
			<ec:column property="weaveDate" title="编制日期" width="9%">
				<div style="width: 100%; height: 30px">
					<fmt:formatDate value="${dtaqSituationMotionanal.weaveDate}"
						pattern="yyyy-MM-dd" />
				</div>

			</ec:column>
			<ec:column property="recordDate" title="填报日期" width="5%">
				<div style="width: 100%; height: 30px">
					<fmt:formatDate value="${dtaqSituationMotionanal.recordDate}"
						pattern="yyyy-MM-dd" />
				</div>

			</ec:column>

		</ec:row>
	</ec:table>
</body>

</html:html>
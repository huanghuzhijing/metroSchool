<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
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

.divagree0{background:#FAF7F7;}
.divagree1{background:#B4C0EC;}
.divagree2{background:#ECAB95;}
</style>
<script type="text/javascript">

		var returnVal2 = "";
		returnVal2='${param.returnVal2}';
		if(returnVal2=='0'){
			alert('保存成功，接口数据上传成功');
		}else if(returnVal2=='1'){
		    alert('保存成功，接口数据上传失败，用户名密码错误');
		}else if(returnVal2=='2'){
		    alert('保存成功，接口数据上传失败，指定的工点和日期已上报');
		}else if(returnVal2=='3'){
		    alert('保存成功，接口数据上传失败，格式错误或服务端异常');
		}else if(returnVal2=='4'){
		    alert('保存成功，接口数据上传失败，工点编码不存在或不匹配');
		}else if(returnVal2=='5'){
		    alert('保存成功，接口数据上传失败，未能找到安全形势报告，请先确认页面一上传成功');
		}else if(returnVal2=='6'){
		    alert('保存成功，接口数据上传失败，施工进度图，施工进度模型上传异常');
		}else if(returnVal2=='7'){
		    alert('保存成功，接口数据上传失败，用户验证异常');
		}

		$(document).ready(function(){
			
			//获取线路标段工点
		    getLines('${param.qlineId}','${param.qsectionId}');
		    getSections('${param.qlineId}','${param.qsectionId}');
		    getWokPoints('${param.qsectionId}','${param.qworkPointId}');
		    
		
			//新增
			$("#btn_add").click(function(){ 
				location.href='dtaqSituationAnalyseAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val(); 
			}); 
			//编辑
			//$(".btn_edit").click(function(){
		//	alert(1);
		//		var url='dtaqSituationAnalyseAction.do?method=edit&fid='+$(this).attr("paramid"); 
		//		commonUrl(url);
		//	}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='dtaqSituationAnalyseAction.do?method=delete&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			//详细
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
		});
		//刷新
		function pageRefresh(){
			document.forms[0].action='dtaqSituationAnalyseAction.do?method=list'+'&ec_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();   
    		document.forms[0].submit();
		}
		//详细页面
		function showView(id){
	    	var url ='dtaqSituationAnalyseAction.do?method=view'+'&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
			commonUrl(url);
	  	}
	  	//删除
	 	function del(p){
		   if(confirm('删除后将不能恢复，您确认删除？')){ 
		       location.href=p;
		   }
		}
	
		
	</script>
</head>
<content tag="heading">
	安全形势分析室
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
				<html:form action="dtaqSituationAnalyseAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table class="queryContentTable">
						<tr>
								<td>线路：</td>
							    <td >
							    	<select id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
							    </td>
							     <td>标段：</td>
							    <td><select id="qsectionId" name="qsectionId" onchange="getWokPoints(this.value,'')"></select>
							    </td>
					 	</tr>
					 	<tr>
							    <td>车站/区间：</td>
							    <td><select id="qworkPointId" name="qworkPointId"></select>
							    </td>
						 		<td>工程安全风险状态：</td>
					 			<td>
					 				<ex:dictSelect property="qsafeState" type="AnalyseSafeState"/>
					 			</td>
						</tr>
					 	<tr>
						 		<td>填报日期：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								<td>是否重点关注:</td>
								<td>
									<ex:dictSelect property="qriskAttention" type="RiskAttention"/>
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
<div class="listButtonDiv" align="right">
	<input type="button" id="btn_add" icon="icon_add" value="新 增"/>
<!--	<input type="button" id="btn_view" icon="icon_view" value="详 细"/>-->
<!--	<input type="button" id="btn_delete" icon="icon_delete" value="删 除"/> -->
</div>
	<td align="left">
   			<font color="#4A77A3"><strong> 信息状态说明：</strong></font><font color="#494949"> 
   			默认为未审批状态；
   			<span class="divagree1" style="width: 40px"></span>&nbsp;内部审批同意；&nbsp;&nbsp; 
   			<span class="divagree2" style="width: 40px"></span>&nbsp;内部审批不同意；&nbsp;&nbsp; 
	</font>
   	</td>
<ec:table items="dtaqSituationAnalyses" var="dtaqSituationAnalyse" action="dtaqSituationAnalyseAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true"  >
		<ec:column property="segment_id.segment_name"  title="标段" width="5%" >
			<div style="width:100%;height:30px" class="divagree${dtaqSituationAnalyse.check_status}">${dtaqSituationAnalyse.segment_id.segment_name}</div>
		</ec:column>
		<ec:column property="station_id.station_name" title="车站/区间" width="5%" >
			<div style="width:100%;height:30px" class="divagree${dtaqSituationAnalyse.check_status}">${dtaqSituationAnalyse.station_id.station_name}</div>
		</ec:column>
		<ec:column property="safe_state"  title="工程安全风险状态" width="5%">
				<div style="width:100%;height:30px" class="divagree${dtaqSituationAnalyse.check_status}"><span class="state${dtaqSituationAnalyse.safe_state}"></span></div>
			
		
		</ec:column>
		
		<ec:column property="risk_attention"  title="是否重点关注"  width="5%">
			<div style="width:100%;height:30px" class="divagree${dtaqSituationAnalyse.check_status}"><ex:dicDisplay dictIdentify="RiskAttention" dictValue="${dtaqSituationAnalyse.risk_attention}"/></div>
			
		</ec:column>
		<ec:column property="null" title="编制日期" width="9%">
			<div style="width:100%;height:30px" class="divagree${dtaqSituationAnalyse.check_status}"><fmt:formatDate value="${dtaqSituationAnalyse.weave_Date}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
			
		</ec:column>
		<ec:column property="null" title="填报日期" width="5%">
			<div style="width:100%;height:30px" class="divagree${dtaqSituationAnalyse.check_status}"><fmt:formatDate value="${dtaqSituationAnalyse.record_date}" pattern="yyyy-MM-dd"/></div>
			
		</ec:column>
		<ec:column property="null" title="上报情况" width="5%">
			<div style="width:100%;height:30px" class="divagree${dtaqSituationAnalyse.check_status}"><ex:dicDisplay dictIdentify="ReturnVal" dictValue="${dtaqSituationAnalyse.returnVal}"/></div>
			
		</ec:column>
		<ec:column property="null" title="操作" width="15%">
			<div style="width:100%;height:30px" class="divagree${dtaqSituationAnalyse.check_status}">
		 		<input type="button" class="button1" onclick="location.href='${ctx}/dtaqSituationAnalyseAction.do?method=view&fid=${dtaqSituationAnalyse.fid}&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${qlineId}&qsectionId=${qsectionId}&qworkPointId=${qworkPointId}&qsafeState=${qsafeState}&qriskAttention=${qriskAttention}&qstartDate=${qstartDate}&qendDate=${qendDate}'" value="详细" icon="icon_view"/>
						<c:if test="${dtaqSituationAnalyse.station_id.station_state == '1'  && dtaqSituationAnalyse.oldOrNew eq 1}">
						<c:if test="${fn:contains(userinfo.usercmd,'expert_group')==true && dtaqSituationAnalyse.check_status ne 1}">
							<input type="button" class="button1" value="审批" onclick="location.href='${ctx}/dtaqSituationAnalyseAction.do?method=check&fid=${dtaqSituationAnalyse.fid}&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${qlineId}&qsectionId=${qsectionId}&qworkPointId=${qworkPointId}&qsafeState=${qsafeState}&qriskAttention=${qriskAttention}&qstartDate=${qstartDate}&qendDate=${qendDate}'" icon="icon-config"/>
						</c:if>
						<c:if test="${fn:contains(userinfo.usercmd,'clear_check')==true && dtaqSituationAnalyse.check_status eq 1}">
							<input type="button" class="button1" value="反审核" onclick="if(confirm('是否要反审查？反审查后会删除该条安全形势分析的所有审批意见！'))location.href='${ctx}/dtaqSituationAnalyseAction.do?method=clearCheck&fid=${dtaqSituationAnalyse.fid}&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${qlineId}&qsectionId=${qsectionId}&qworkPointId=${qworkPointId}&qsafeState=${qsafeState}&qriskAttention=${qriskAttention}&qstartDate=${qstartDate}&qendDate=${qendDate}'" icon="icon-pkg"/>
						</c:if>
				 		<c:if test="${ dtaqSituationAnalyse.check_status ne 1}">
							<c:if test="${fn:contains(userinfo.userroleid,'25')==true}">
								<c:if test="${fn:contains(userinfo.usercmd,'situationAnalyse_update')==true}">				
									<input type="button" class="button1" onclick="location.href='${ctx}/dtaqSituationAnalyseAction.do?method=edit&fid=${dtaqSituationAnalyse.fid}&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${qlineId}&qsectionId=${qsectionId}&qworkPointId=${qworkPointId}&qsafeState=${qsafeState}&qriskAttention=${qriskAttention}&qstartDate=${qstartDate}&qendDate=${qendDate}'" value="修改" icon="icon_edit"/>
								</c:if>
								<c:if test="${fn:contains(userinfo.usercmd,'situationAnalyse_delete')==true}">
									<input type="button" class="button1" onclick="del('dtaqSituationAnalyseAction.do?method=delete&fid=${dtaqSituationAnalyse.fid}&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${qlineId}&qsectionId=${qsectionId}&qworkPointId=${qworkPointId}&qsafeState=${qsafeState}&qriskAttention=${qriskAttention}&qstartDate=${qstartDate}&qendDate=${qendDate}')" value="删除" icon="icon_delete"/>
								</c:if>
							</c:if>
							<c:if test="${fn:contains(userinfo.userroleid,'25')==false}">
								<c:if test="${(userinfo.empId ==  dtaqSituationAnalyse.weave_author) && (nowDate -  dtaqSituationAnalyse.weave_Date.time < 3600*24*1000*1)}">
									<c:if test="${fn:contains(userinfo.usercmd,'situationAnalyse_update')==true}">				
										<input type="button" class="button1" onclick="location.href='${ctx}/dtaqSituationAnalyseAction.do?method=edit&fid=${dtaqSituationAnalyse.fid}&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${qlineId}&qsectionId=${qsectionId}&qworkPointId=${qworkPointId}&qsafeState=${qsafeState}&qriskAttention=${qriskAttention}&qstartDate=${qstartDate}&qendDate=${qendDate}'" value="修改 " icon="icon_edit"/>
									</c:if>
									<c:if test="${fn:contains(userinfo.usercmd,'situationAnalyse_delete')==true}">
										<input type="button" class="button1"  onclick="del('dtaqSituationAnalyseAction.do?method=delete&fid=${dtaqSituationAnalyse.fid}&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${qlineId}&qsectionId=${qsectionId}&qworkPointId=${qworkPointId}&qsafeState=${qsafeState}&qriskAttention=${qriskAttention}&qstartDate=${qstartDate}&qendDate=${qendDate}')" value="删除" icon="icon_delete"/>
									</c:if>
								</c:if>
							</c:if>
		 				</c:if>
					</c:if>
		
			</div>
		</ec:column>
		
	</ec:row>
</ec:table>
</body>

</html:html>

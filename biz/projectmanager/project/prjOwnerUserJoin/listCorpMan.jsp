<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript">
	//
	$(document).ready(function(){
		//
		$(".btn_constrAdd").click(function(){ 
			var url="prjCorpUserJoinAction.do?method=selectEmpForConstr"
			        +"&prjid="+$(this).attr("paramArray").split(",")[0]+"&segmentid="+$(this).attr("paramArray").split(",")[1]
					+"&ctrid="+$(this).attr("paramArray").split(",")[2]+"&corpid="+$(this).attr("paramArray").split(",")[3]
					+"&flag=${param.flag}&staticPrjId=${param.staticPrjId}";
			art.dialog({id:'commonDialog1',title:'参建人员信息', iframe:url, width:'600', height:'400',top:'30'});
		});
		//
		$(".btn_constrEdit").click(function(){ 
			var url="prjCorpUserJoinAction.do?method=editEmpForConstr"
			        +"&prjid="+$(this).attr("paramArray").split(",")[0]+"&segmentid="+$(this).attr("paramArray").split(",")[1]
					+"&ctrid="+$(this).attr("paramArray").split(",")[2]+"&corpid="+$(this).attr("paramArray").split(",")[3]
					+"&prjcfgid="+$(this).attr("paramArray").split(",")[4];
			art.dialog({id:'commonDialog1',title:'参建人员信息', iframe:url, width:'600', height:'300',top:'30'});
		});
		//
		$(".btn_constrDelete").click(function(){ 
			ret = window.confirm('${texts['dtaq.common.delete.msg']}');
			if(ret){
				location.href="prjCorpUserJoinAction.do?method=delete"
				              +"&prjcfgid="+$(this).attr("paramArray").split(",")[4] 
				              +"&flag=${param.flag}&staticPrjId=${param.staticPrjId}";
			}
		});
		//
	});
</script>
	<c:forEach items="${voConstrs}" var="voConstr">
				<fieldset class="specialFs">
					<legend>
						施工单位<c:set var="ConstIndex" value="${ConstIndex+1}"></c:set>${ConstIndex}
					</legend>
					<br/>
					<table class="formTable" >
					    	<colgroup>
								<COL class="tdLeftOneTwo" />
							<COL class="tdRightOneTwo" />
							</colgroup>
						  <tr>
							    <td >单位名称：<span class="noRedSpan">*</span></td>
							    <td colspan="3">
									${voConstr.corp.corpname}&nbsp;
								</td>
						  </tr>
						  <tr>
							    <td >所属合同：<span class="noRedSpan">*</span></td>
							    <td colspan="3">
									${voConstr.contractInfo.ctrName}&nbsp;
								</td>
						  </tr>
						  <tr>
							 <td >
							施工单位：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<input type="text" id="segName" name="segName" value="${prjCorpUserJoin.corpid.corpname}" class="showText" readonly="readonly" maxlength="100" size="50"/>
							<%@ include file="/biz/common/sysPlug/selectPS/selectProjectSeg.jsp" %>
							<input type="hidden" id="corp_id" name="corp_id" value="${corp_id}" />
						</td>
						</td>
						 </tr>
					</table>
						<div  class="listButtonDiv">
							<input value="${texts['button.new']}" type="button" class="btn_constrAdd" icon="icon_add"
							       paramArray="${projectInfo.id},${voConstr.prjSegmentInfo.id},${voConstr.contractInfo.id},${voConstr.corp.id}"
							 />
						</div>
					<ec:table items="voConstr.employees1" var="employee" 
						action="prjCorpUserJoinAction.do?method=listRight" title=""  locale="zh_CN"
					  	showPagination="false" sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
					>
						<ec:row highlightRow="true" 		>
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
							<ec:column property="empname" title="姓名" />
							<ec:column property="empduty" title="职务" />
							<ec:column property="tel" title="电话" />
							<ec:column property="phone" title="手机" />
							<ec:column property="null" title="${texts['label.operate']}" >
								<input value="${texts['button.edit']}" type="button" class="btn_constrEdit" icon="icon_edit" 
								       paramArray="${projectInfo.id},${voConstr.prjSegmentInfo.id},${voConstr.contractInfo.id},${voConstr.corp.id},${employee.id}"   
								 />
								<input value="${texts['button.delete']}" type="button" class="btn_constrDelete" icon="icon_delete" 
								       paramArray="${projectInfo.id},${voConstr.prjSegmentInfo.id},${voConstr.contractInfo.id},${voConstr.corp.id},${employee.id}"
								 />
							</ec:column>	
						</ec:row>
					</ec:table>
					<br/>
				</fieldset>	
	</c:forEach>


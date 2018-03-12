<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		//
		$(".btn_survSelectSeg").click(function(){
			var url="prjCorpUserJoinAction.do?method=selectSegForSurv"
			        +"&prjid="+$(this).attr("paramArray").split(",")[0]+"&corpid="+$(this).attr("paramArray").split(",")[2];
			art.dialog({id:'commonDialog1',title:'标段信息', iframe:url, width:'600', height:'400',top:'30'}); 
		});
		//
		$(".btn_survAdd").click(function(){
			var  corpid=$(this).attr("paramArray").split(",")[2];
			if($("#segids"+corpid).val()==""){
				alert("请选择标段");
			}else{
				var url="prjCorpUserJoinAction.do?method=selectEmpForSurv"
			        +"&prjid="+$(this).attr("paramArray").split(",")[0]+"&segmentid="+$("#segids"+corpid).val()
					+"&ctrid="+$(this).attr("paramArray").split(",")[1]+"&corpid="+$(this).attr("paramArray").split(",")[2]
					+"&flag=${param.flag}&staticPrjId=${param.staticPrjId}";
				art.dialog({id:'commonDialog1',title:'参建人员信息', iframe:url, width:'600', height:'400',top:'30'});
			}
		});
		//
		$(".btn_survEdit").click(function(){
			var  corpid=$(this).attr("paramArray").split(",")[2];
			var url="prjCorpUserJoinAction.do?method=editEmpForSurv"
			        +"&prjid="+$(this).attr("paramArray").split(",")[0]+"&segmentid="+$("#segids"+corpid).val()
					+"&ctrid="+$(this).attr("paramArray").split(",")[1]+"&corpid="+$(this).attr("paramArray").split(",")[2]
					+"&prjcfgid="+$(this).attr("paramArray").split(",")[3];
			art.dialog({id:'commonDialog1',title:'参建人员信息', iframe:url, width:'600', height:'300',top:'30'});
		});
		$(".btn_survSeg").click(function(){
			var  corpid=$(this).attr("paramArray").split(",")[2];
			var url="prjCorpUserJoinAction?method=selectSeg"
			        +"&prjid="+$(this).attr("paramArray").split(",")[0]+"&segmentid="+$("#segids"+corpid).val()
					+"&ctrid="+$(this).attr("paramArray").split(",")[1]+"&corpid="+$(this).attr("paramArray").split(",")[2]
					+"&prjcfgid="+$(this).attr("paramArray").split(",")[3];
			art.dialog({id:'commonDialog1',title:'标段信息', iframe:url, width:'600', height:'400',top:'30'});
		});
		//
		$(".btn_survDelete").click(function(){ 
			ret = window.confirm('${texts['dtaq.common.delete.msg']}');
			if(ret){
				location.href="prjCorpUserJoinAction.do?method=delete"
				              +"&prjcfgid="+$(this).attr("paramArray").split(",")[3] 
				              +"&flag=${param.flag}&staticPrjId=${param.staticPrjId}";
			}
		});
		//
	});
</script>
	<c:forEach items="${voSurvs}" var="voSurv">
				<fieldset class="specialFs">
					<legend>
						监理信息<c:set var="superIndex" value="${superIndex+1}"></c:set>${superIndex}
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
									${voSurv.corp.corpname}&nbsp;
								</td>
						  </tr>
						  <tr>
							    <td >所属合同：<span class="noRedSpan">*</span></td>
							    <td colspan="3">
									${voSurv.contractInfo.ctrName}&nbsp;
								</td>
						  </tr>
<!--						  -->
<!--						  <tr>-->
<!--							    <td >对应标段：<span class="noRedSpan">*</span></td>-->
<!--							    <td colspan="3">-->
<!--							    	<input id="segids${voSurv.corp.id}" value="${voSurv.segids}" type="hidden">-->
<!--							    	<input id="segnames${voSurv.corp.id}" value="${voSurv.segnames}" class="showText"   size="48"/>-->
<!--									<input value="选择标段" type="button" class="btn_survSelectSeg" icon="icon_selectInfo" -->
<!--							           	   paramArray="${projectInfo.id},${voSurv.contractInfo.id},${voSurv.corp.id}"-->
<!--									/>-->
<!--								</td>-->
<!--						  </tr>-->
						  
<!--						  <tr>-->
<!--							    <td >项目部名称：<span class="noRedSpan">*</span></td>-->
<!--							    <td colspan="3">-->
<!--									&nbsp;-->
<!--								</td>-->
<!--						  </tr>-->
					</table>
					<div  class="listButtonDiv">
						
							<input value="${texts['button.new']}" type="button" class="btn_survAdd" icon="icon_add" 
							       paramPrjId="${projectInfo.id}"  
							       paramCtrId="${voSurv.contractInfo.id}" paramCorpId="${voSurv.corp.id}"
							       paramArray="${projectInfo.id},${voSurv.contractInfo.id},${voSurv.corp.id}"  
							 />
						</div>
					<ec:table items="voSurv.employees" var="employee"
						action="prjCorpUserJoinAction.do?method=listRight" title=""  locale="zh_CN"
						showPagination="false" sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
					>
						<ec:row highlightRow="true" 
						>
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
							<ec:column property="empname" title="姓名" />
							<ec:column property="empduty" title="职务" />
							<ec:column property="phone" title="手机" />
							<ec:column property="segNames" title="对应标段">
							${employ.segNames }
							</ec:column>
							<ec:column property="null" title="${texts['label.operate']}" >
								<input value="${texts['button.edit']}" type="button" class="btn_survEdit"  icon="icon_edit" 
							           paramArray="${projectInfo.id},${voSurv.contractInfo.id},${voSurv.corp.id},${employee.id}"
								 />
								 <input value="对应标段" type="button" class="btn_survSeg"  icon="icon_edit" 
							           paramArray="${projectInfo.id},${voSurv.contractInfo.id},${voSurv.corp.id},${employee.id}"
								 />
								<input value="${texts['button.delete']}" type="button" class="btn_survDelete" icon="icon_delete"  
							           paramArray="${projectInfo.id},${voSurv.contractInfo.id},${voSurv.corp.id},${employee.id}"
								 />
							</ec:column>	
						</ec:row>
					</ec:table>
					<br/>
				</fieldset>	
	</c:forEach>


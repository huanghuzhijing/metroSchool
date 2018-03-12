<%@ page contentType="text/html;charset=UTF-8" %>
<script type="text/javascript">

	//人员选择
	function setParamValue(empIds,empNames,organNames){
		if(empIds!=''){
			var url="prjOwnerUserJoinAction.do?method=selectEmpForOrg&corpId=${contractInfo.secondPartyId.id}&staticPrjId=${projectInfo.id}&empIds="+empIds;
			art.dialog({id:'commonDialog2',title:'人员信息', iframe:url, width:'20', height:'20'});
		}
	}
	//刷新页面
	function pageRefresh(){
		var url='prjCorpUserJoinAction.do?method=listRight&prjId=${projectInfo.id}&ec_p=${param.ec_p}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		commonUrl(url);
	}
	//编辑 业主
	function orgEdit(id){
	alert(id);
		var url="prjOwnerUserJoinAction.do?method=editEmpForOrg&staticPrjId=${projectInfo.id}&joinId="+id;
		art.dialog({id:'commonDialog1',title:'人员信息', iframe:url, width:'600', height:'400',top:'30'});
		
	}
	//删除 业主
	function orgDelete(id){
		ret = window.confirm('${texts['dtaq.common.delete.msg']}');
		if(ret){
			location.href="prjOwnerUserJoinAction.do?method=deleteCorpMan&staticPrjId=${projectInfo.id}&flag=3&joinId="+id+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${projectInfo.id}'+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		}
	}
</script>
	<fieldset>
			<legend>业主单位</legend>
			<div  class="listButtonDiv">
				<%@ include file="/biz/sysmanager/sysmaintain/sysPlug/selectEmpNoteOrganGroup/selectEmpNoteOrganGroup.jsp" %>
			</div>
			<ec:table items="segOrgUserJoins" var="segOrgUserJoin" 
				action="prjCorpUserJoinAction.do?method=listRight" title=" "  locale="zh_CN"
			  	showPagination="false" sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			>
				<ec:row highlightRow="true" 		>
					<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
					<ec:column property="empId" title="姓名" >
						<ex:employeeName id="${segOrgUserJoin.empId}" />
					</ec:column>
					<ec:column property="postName" title="职务" />
					<ec:column property="tel" title="手机" />
					<ec:column property="null" title="${texts['label.operate']}" >
						<input value="${texts['button.edit']}" type="button" icon="icon_edit" onclick="orgEdit(${segOrgUserJoin.id});" 
						 />
						<input value="${texts['button.delete']}" type="button" onclick="orgDelete(${segOrgUserJoin.id});" icon="icon_delete" />
					</ec:column>	
				</ec:row>
			</ec:table>
	</fieldset>




<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript">
	//
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		document.forms[0].submit();
       });
       //
	 });
	//人员选择
	function setParamValue(empIds,empNames,organNames){
		if(empIds!=''){
			var url="projectInfoAction.do?method=selectEmpForOrg&corpId=${contractInfo.secondPartyId.id}&staticPrjId=${projectInfo.id}&empIds="+empIds;
			art.dialog({id:'commonDialog2',title:'人员信息', iframe:url, width:'20', height:'20'});
		}
	}
	//刷新页面
	function pageRefresh(){
		var url='projectInfoAction.do?method=manConfig&id=${projectInfo.id}&staticPrjStatus=${param.staticPrjStatus}&ec_p=${param.ec_p}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		commonUrl(url);
	}
	//编辑 业主
	function orgEdit(id){
		var url="prjSegmentInfoAction.do?method=editEmpForOrg&staticSegId=${param.staticSegId}&joinId="+id;
		art.dialog({id:'commonDialog1',title:'人员信息', iframe:url, width:'600', height:'400',top:'30'});
	}
	//删除 业主
	function orgDelete(id){
		ret = window.confirm('${texts['dtaq.common.delete.msg']}');
		if(ret){
			location.href="projectInfoAction.do?method=deleteCorpMan&staticSegId=${param.staticSegId}&flag=3&joinId="+id+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${projectInfo.id}'+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		}
	}
</script>
</head>
<content tag="heading">
项目组织人员预览
</content>
<body>
	<html:form enctype="multipart/form-data" action="projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&ec_p=${param.ec_p}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}" method="POST">
		<!--查询定位 开始-->
		<html:hidden property="qprjCode" />
		<html:hidden property="qprjName"/>
		<html:hidden property="qauditStatus"/>
		<!--查询定位 结束-->
	</html:form>
	<fieldset >
		<legend>项目信息</legend>
		<table class="formTable" >
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
				</COLGROUP>
				<tr>
					<td>
						项目编号：<span class="noRedSpan">*</span>
					</td>
					<td>
						${projectInfo.prjCode}&nbsp;
					</td>
					<td>
						项目名称：<span class="noRedSpan">*</span>
					</td>
					<td>
						${projectInfo.prjName}&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						项目类型：<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						<ex:dicDisplay dictIdentify="PrjType" dictValue="${projectInfo.prjType}"/>
					</td>
				</tr>
		</table>
	</fieldset>
	<fieldset>
			<legend>业主单位</legend>
			<div  class="listButtonDiv">
				<%@ include file="/biz/sysmanager/sysmaintain/sysPlug/selectEmpNoteOrganGroup/selectEmpNoteOrganGroup.jsp" %>
			</div>
			<ec:table items="segOrgUserJoins" var="segOrgUserJoin" 
				action="projectInfoAction.do?method=manConfig" title=""  locale="zh_CN"
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
	<div class="saveDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
	</div>
  </body>
</html>



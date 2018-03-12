<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>

<script type="text/javascript">
	
	$(document).ready(function(){
		//
		//返回
	    $("#btn_back").click(function(){
	    	var url='prjSegmentInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&ec_p='+$("input[name='ec_p']").val()+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
            commonUrl(url);
	     }); 
		//
		//
		$(".btn_constrAdd").click(function(){
			if('${contractInfo.secondPartyId.id}'!=''){
				var url="prjSegmentInfoAction.do?method=selectEmpForConstr&corpId=${contractInfo.secondPartyId.id}&staticSegId=${param.staticSegId}";
				art.dialog({id:'commonDialog1',title:'参建人员信息', iframe:url, width:'600', height:'400',top:'30'});
			}else{
				alert("没有施工单位！");
			} 
		});
		//
		$(".btn_superAdd").click(function(){ 
			if('${contractInfo.supervisionUnit}'!=''){
				var url="prjSegmentInfoAction.do?method=selectEmpForSurv&corpId=${contractInfo.supervisionUnit}&staticSegId=${param.staticSegId}";
				art.dialog({id:'commonDialog1',title:'参建人员信息', iframe:url, width:'600', height:'400',top:'30'});
			}else{
				alert("没有监理单位！");
			}
		});
		//
		$(".btn_orgAdd").click(function(){ 
			//var url="prjSegmentInfoAction.do?method=selectEmpForSurv&corpId=${contractInfo.supervisionUnit}&staticSegId=${param.staticSegId}";
			//art.dialog({id:'commonDialog1',title:'参建人员信息', iframe:url, width:'600', height:'400',top:'30'});
		});
		//
		
	});
	//刷新页面
	function pageRefresh(){
		var url='prjSegmentInfoAction.do?method=listCorpMan&staticSegId=${param.staticSegId}'+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		location.href=url;
	}
	//编辑 施工
	function constrEdit(id){
		var url="prjSegmentInfoAction.do?method=editEmpForConstr&staticSegId=${param.staticSegId}&joinId="+id;
		art.dialog({id:'commonDialog1',title:'参建人员信息', iframe:url, width:'600', height:'400',top:'30'});
	}
	//删除 施工
	function constrDelete(id){
		ret = window.confirm('${texts['dtaq.common.delete.msg']}');
		if(ret){
			location.href="prjSegmentInfoAction.do?method=deleteCorpMan&staticSegId=${param.staticSegId}&flag=1&joinId="+id+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		}
	}
	//编辑 监理
	function superEdit(id){
		var url="prjSegmentInfoAction.do?method=editEmpForSurv&staticSegId=${param.staticSegId}&joinId="+id;
		art.dialog({id:'commonDialog1',title:'参建人员信息', iframe:url, width:'600', height:'400',top:'30'});
	}
	//删除 监理
	function superDelete(id){
		ret = window.confirm('${texts['dtaq.common.delete.msg']}');
		if(ret){
			location.href="prjSegmentInfoAction.do?method=deleteCorpMan&staticSegId=${param.staticSegId}&flag=2&joinId="+id+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		}
	}
	
	//人员选择
	function setParamValue(empIds,empNames,organNames){
		if(empIds!=''){
			var url="prjSegmentInfoAction.do?method=selectEmpForOrg&corpId=${contractInfo.secondPartyId.id}&staticSegId=${param.staticSegId}&empIds="+empIds;
			art.dialog({id:'commonDialog2',title:'人员信息', iframe:url, width:'20', height:'20'});
		}
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
			location.href="prjSegmentInfoAction.do?method=deleteCorpMan&staticSegId=${param.staticSegId}&flag=3&joinId="+id+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		}
	}
</script>
</head>
<content tag="heading">
参建人员配置
</content>
<body>
	<html:form enctype="multipart/form-data" action="prjSegmentInfoAction.do?method=list&ec_p=${param.ec_p}&ec_id=${contractInfo.id}&ec_crd=${param.ec_crd}" method="POST">
		<!--查询定位 开始-->
		<!--查询定位 结束-->
	</html:form>
	<div class="listButtonDiv">
		<input type="button" id="btn_back" value="<fmt:message key="button.back"/>" icon="icon_back" />
	</div>
	<fieldset>
			<legend>标段基本信息</legend>
			<table class="titleTable" >
		         <COLGROUP>
		           	<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
		          </COLGROUP>
		          
		            <tr>
						<td>
							标段编号：<span class="noRedSpan">*</span>
						</td>
						<td>
							${prjSegmentInfo.segCode}&nbsp;
						</td>
						<td>
							标段名称：<span class="noRedSpan">*</span>
						</td>
						<td>
							${prjSegmentInfo.segName}&nbsp;
						</td>
					</tr>
			</table>
	</fieldset>
	<%-- 
	<fieldset>
			<legend>业主单位</legend>
			<div  class="listButtonDiv">
				<%@ include file="/biz/sysmanager/sysmaintain/sysPlug/selectEmpNoteOrganGroup/selectEmpNoteOrganGroup.jsp" %>
			</div>
			<ec:table items="segOrgUserJoins" var="segOrgUserJoin" 
				action="prjSegmentInfoAction.do?method=listCorpMan" title=""  locale="zh_CN"
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
	--%>
	
	<fieldset>
			<legend>施工单位</legend>
			<table class="titleTable" >
		         <COLGROUP>
		           	<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
		          </COLGROUP>
		          
		            <tr>
						<td>
							单位名称：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<ex:corpDisplay  id="${contractInfo.secondPartyId.id}" />
						</td>
					</tr>
			</table>
			<div  class="listButtonDiv">
				<input value="${texts['button.new']}" type="button" class="btn_constrAdd" icon="icon_add" />
			</div>
			<ec:table items="ctrConstructionUserJoins" var="ctrConstructionUserJoin" 
				action="prjSegmentInfoAction.do?method=listCorpMan" title=""  locale="zh_CN"
			  	showPagination="false" sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			>
				<ec:row highlightRow="true" 		>
					<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
					<ec:column property="constructionId" title="姓名" >
						<ex:employeeName id="${ctrConstructionUserJoin.constructionId}" />
					</ec:column>
					<ec:column property="postName" title="职务" />
					<ec:column property="tel" title="手机" />
					<ec:column property="null" title="${texts['label.operate']}" >
						<input value="${texts['button.edit']}" type="button" icon="icon_edit" onclick="constrEdit(${ctrConstructionUserJoin.id});" 
						 />
						<input value="${texts['button.delete']}" type="button" onclick="constrDelete(${ctrConstructionUserJoin.id});" icon="icon_delete" />
					</ec:column>	
				</ec:row>
			</ec:table>
	</fieldset>
	<fieldset>
			<legend>监理单位</legend>
			<table class="titleTable" >
		         <COLGROUP>
		           	<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
		          </COLGROUP>
		          
		            <tr>
						<td>
							单位名称：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<ex:corpDisplay  id="${contractInfo.supervisionUnit}" />
						</td>
					</tr>
			</table>
			<div  class="listButtonDiv">
				<input value="${texts['button.new']}" type="button" class="btn_superAdd" icon="icon_add" />
			</div>
			<ec:table items="ctrSupervisionUserJoins" var="ctrSupervisionUserJoin" 
				action="prjSegmentInfoAction.do?method=listCorpMan" title=""  locale="zh_CN"
			  	showPagination="false" sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			>
				<ec:row highlightRow="true" 		>
					<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
					<ec:column property="constructionId" title="姓名" >
						<ex:employeeName id="${ctrSupervisionUserJoin.supervisionId}" />
					</ec:column>
					<ec:column property="postName" title="职务" />
					<ec:column property="tel" title="手机" />
					<ec:column property="null" title="${texts['label.operate']}" >
						<input value="${texts['button.edit']}" type="button" icon="icon_edit" onclick="superEdit(${ctrSupervisionUserJoin.id});" 
						 />
						<input value="${texts['button.delete']}" type="button" onclick="superDelete(${ctrSupervisionUserJoin.id});" icon="icon_delete" />
					</ec:column>	
				</ec:row>
			</ec:table>
	</fieldset>
</body>
</html:html>

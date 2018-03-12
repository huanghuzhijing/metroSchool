<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
		var oper_id="";
		$(document).ready(function(){
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			$("#btn_view").hide();
			//控制按钮
			var ec_id='${param.ec_id}';
			var ec_auditStatus='${param.ec_auditStatus}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id,ec_auditStatus);
			//新增
			$("#btn_add").click(function(){ 
				location.href='prjSingleBuildingAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val()+'&staticPrjId=${param.staticPrjId}'+'&staticSegId=${param.staticSegId}'; 
			}); 
			//编辑
			$("#btn_edit").click(function(){
				var url='prjSingleBuildingAction.do?method=edit&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&staticPrjId=${param.staticPrjId}'+'&staticSegId=${param.staticSegId}'; 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='prjSingleBuildingAction.do?method=delete&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			//返回标段
			$("#btn_back").click(function(){ 
				var url='prjSegmentInfoAction.do?method=listRight&staticPrjId=${param.staticPrjId}'+'&staticSegId=${param.staticSegId}';
				commonUrl(url);
			}); 
			//详细
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
		});
		//刷新
		function pageRefresh(){
			document.forms[0].action='prjSingleBuildingAction.do?method=list'+'&ec_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();   
    		document.forms[0].submit();
		}
		//详细页面
		function showView(id){
	    	var url ='prjSingleBuildingAction.do?method=view'+'&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
			commonUrl(url);
	  	}
	  	//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;
		}
		//指令码判断
		function checkCmd(){
			var cmdIds='${userinfo.cmdIds}';
	//		if(!isContains(cmdIds,",oaMeetingSummary_add,"))$("#btn_add").hide();
	//		if(!isContains(cmdIds,",oaMeetingSummary_edit,"))$("#btn_edit").hide();
	//		if(!isContains(cmdIds,",oaMeetingSummary_delete,"))$("#btn_delete").hide();
		}
	</script>
</head>
<content tag="heading">
	项目单体
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
				<html:form action="prjSingleBuildingAction.do?method=listRight&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table class="queryContentTable">
						<tr>
							<td >单体编号：</td>
							<td><html:text property="qsingleCode" styleClass="inputText" maxlength="25"></html:text></td>
							<td >单体名称：</td>
								<td><html:text property="qsingleName" styleClass="inputText" maxlength="25"></html:text></td>
							<td >
								<input type="submit" value="查询" icon="icon_query" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
<div class="promptDiv">
		项目名称:<span class="keyInfoSpan">${projectInfo.prjName}</span>
		标段名称:<span class="keyInfoSpan">${prjSegmentInfo.segName}</span>
	</div>
<div class="listButtonDiv">
	<input type="hidden" id="btn_back" icon="icon_back" value="返回标段"/> 
	<input type="button" id="btn_add" icon="icon_add" value="新 增"/>
	<input type="button" id="btn_view" icon="icon_view" value="详 细"/>
	<input type="button" id="btn_edit" icon="icon_edit" value="编 辑"/>
	<input type="button" id="btn_delete" icon="icon_delete" value="删 除"/> 
</div>
<ec:table items="prjSingleBuildings" var="prjSingleBuilding" action="prjSingleBuildingAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" onclick="pullValue('${prjSingleBuilding.id}','${prjSingleBuilding.auditStatus}');" ondblclick="showView('${prjSingleBuilding.id}');">
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
		<ec:column property="null" sortable="false" title="选择" width="6%">
				<input type="radio" name="select_id" value="${prjSingleBuilding.id}"/>
		</ec:column>
		<ec:column property="singleCode" calcTitle="singleCode" title="单体编号"/>
		<ec:column property="singleName" calcTitle="singleName" title="单体名称"/>
	</ec:row>
</ec:table>
</body>

</html:html>

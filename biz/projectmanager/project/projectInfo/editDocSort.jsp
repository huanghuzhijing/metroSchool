<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree-1.1.3.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
<script type="text/javascript">
	var gridTree;	
	tree_path="${ctx}";
	var oper_id='${param.oper_id}';
	var static_ParentId;
	//加载
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		document.forms[0].submit();
       });
       //
		//
		$("#btn_save").click(function(){ 
			var url='projectInfoAction.do?method=saveDocSort&staticPrjStatus=${param.staticPrjStatus}&ec_p=${param.ec_p}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
			commonUrl(url);
		}); 
		//
		$("[name='select_row']").parent().parent().click(function(){
			//var select_row = $(this).find("[name='select_row']") ;
			//if(select_row.attr("checked")){
			//	select_row.attr("checked","") ;
			//}else{
			//	select_row.attr("checked","checked") ;
			//}
			//pullTreeValue(select_row.get(0).value,select_row.get(0).paramId) ;
		})
		//
	});
	//树
	function showGridTree(){
			gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
			gridTree.tableDesc="<table border=\"1\" class=\"GridView\" width=\"100%\" id=\"table1\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: collapse\"  bordercolordark=\"#C0C0C0\" bordercolorlight=\"#C0C0C0\" >";	
			var headerDataList=new Array("名称","排序号","选择");
			var widthList=new Array("84%","8%","8%");
			//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
			gridTree.setHeader(headerDataList,-1,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
			//设置列样式
			gridTree.gridHeaderColStyleArray=new Array("leftClo","centerClo","centerClo");
			gridTree.gridDataCloStyleArray=new Array("leftClo","centerClo","centerClo");
			
			var icon = gridTree.icon.folder;
			var openIcon = gridTree.icon.folderOpen;
			var booleanOpen='';
			var src ='';
			
			var classStyle='';
			var target="self";
			var codeTip='';
			<c:forEach items="${docSortInfos}" var="docSortInfo">
				var f_name = '${docSortInfo.code}'+'${docSortInfo.name}';
				var f_orderNum = '${docSortInfo.orderNum}';
				<c:set var="s_id" value=",${docSortInfo.id},"></c:set>
				var f_select ='<input <c:if test="${fn:contains(docSortIds,s_id)}">checked</c:if> name="select_row" type="checkbox" onclick="pullTreeValue(${docSortInfo.id},${docSortInfo.parentId});" value="${docSortInfo.id}" paramId="${docSortInfo.parentId}" />';
				var dataList=new Array(f_name,f_orderNum,f_select);
				//添加节点
				gridTree.addGirdNode(dataList,'${docSortInfo.id}','${docSortInfo.parentId}',booleanOpen,Number('${docSortInfo.orderNum}'),src,target,"",classStyle,icon,null,codeTip,"");
			</c:forEach>
			gridTree.printTableTreeToElement("gridTreeDiv");
			gridTree.openAllNodes();
		}
	//点击选择
	function pullTreeValue(objId,objparentId){
		oper_id=objId;
		static_ParentId=objparentId;
		gridTree.checkClickNodeChild(oper_id,$("[name='select_row'][type='checkbox'][value='"+objId+"']").attr("checked"));
		gridTree.checkClickNodeParent(oper_id,$("[name='select_row'][type='checkbox'][value='"+objId+"']").attr("checked"));
	}
	//刷新页面
	function pageRefresh(){
		location.href='docSortInfoAction.do?method=list&oper_id='+oper_id;
	}
</script>
</head>
<content tag="heading">
工程文档分类
</content>
<body>
	<html:form enctype="multipart/form-data" action="projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&ec_p=${param.ec_p}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}" method="POST">
		<html:hidden property="prjId" value="${projectInfo.id}"/>
		<!--查询定位 开始-->
		<html:hidden property="staticPrjStatus" />
		<html:hidden property="staticPrjSort" />
		<html:hidden property="staticFootNode" />
		<html:hidden property="flag" />
		<!--查询定位 开始-->
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${projectInfo.id}"/>
		<html:hidden property="ec_auditStatus"  value="${projectInfo.auditStatus}"/>
		<html:hidden property="qprjCode" />
		<html:hidden property="qprjName"/>
		<html:hidden property="qauditStatus"/>
		<!--查询定位 结束-->
	
	<div class="listButtonDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
		<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
	</div>
    <div id="gridTreeDiv" class="tableTreeDiv"></div>
	<script type="text/javascript">
		showGridTree();
	</script>

</html:form>
</body>
</html:html>

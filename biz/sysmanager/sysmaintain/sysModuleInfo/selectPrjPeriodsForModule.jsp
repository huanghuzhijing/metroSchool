<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
	var gridTree;	
	tree_path="${ctx}";
	
	$(document).ready(function(){
		//
		$(".selectButton").click(function(){ 
			parent.$("input[name='periodsid']").val($(this).attr("paramId"));
			parent.$("input[name='periodsname']").val($(this).attr("paramName"));
			parent.art.dialog({id:'commonDialog2'}).close();
		});
		//
	}); 
	
	function showGridTree(){
		gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
		gridTree.tableDesc="<table border=\"1\" class=\"GridView\" id=\"table1\">";	
		var headerDataList=new Array("项目周期名称","选择");
		var widthList=new Array("70%","30%");
		//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
		gridTree.setHeader(headerDataList,-1,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
		//设置列样式
		gridTree.gridHeaderColStyleArray=new Array("leftClo","centerClo");
		gridTree.gridDataCloStyleArray=new Array("leftClo","centerClo");
		
		var icon = gridTree.icon.folder;
		var openIcon = gridTree.icon.folderOpen;
		var booleanOpen='';
		var src ='';
		
		var checkbox_con;
		var classStyle='';
		var target="self";
		var codeTip='';
		<c:forEach items="${ProjectPeriodss}" var="projectPeriods" varStatus="vs">
			var f_tname = '${projectPeriods.periodsname}';
			<c:if test="${projectPeriods.footnode eq 0}">
				checkbox_con='<input value="选  择" type="button"  class="selectButton" icon="icon_confirm" paramId="${projectPeriods.id}" paramName="${projectPeriods.periodsname}" />';
			</c:if>
			<c:if test="${projectPeriods.footnode eq 1}">
			    checkbox_con = '';
			</c:if>
			var dataList=new Array(f_tname,checkbox_con);
			//添加节点
			gridTree.addGirdNode(dataList,'${projectPeriods.id}','${projectPeriods.parentid}',booleanOpen,'${projectPeriods.nodecode}',src,target,"",classStyle,icon,null,codeTip,"");
		</c:forEach>
		gridTree.printTableTreeToElement("gridTreeDiv");
		gridTree.openAllNodes();
		var static_parentid=getCookie(gridTree.obj+"currentId");					
		initBody(static_parentid);//记住刷新前勾选的结点 			
	}
</script>

</head>
<body>

      	<div id="gridTreeDiv" class="tableTreeDiv"></div>
      	
<script type="text/javascript">
	showGridTree();
</script>
</body>

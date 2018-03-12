<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
<script type="text/javascript">
	var gridTree;	
	tree_path="${ctx}";

	$(document).ready(function(){
		$("#btn_close").click(function(){ 
				parent.art.dialog({id:'editMod'}).close();
			});
				
	});
	//选择
	function fill(obj){
		var id=jQuery(obj).attr("paramId");
		var name=jQuery(obj).attr("paramName");
		var type=jQuery(obj).attr("paramType");
		parent.jQuery("[name='hiddenGradetemp']").val(id);
		parent.jQuery("[name='hiddenContent']").val(name);
		parent.jQuery("[name='hiddenGrade']").val(type);
		parent.art.dialog({id:"editMod"}).close();
	}
	function showGridTree(){
		gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
		gridTree.tableDesc="<table border=\"1\" class=\"GridView\"  id=\"table1\"   >";	
		var headerDataList=new Array("类别编码","类别名称","类别层级","隐患级别","综合分值","操作");
		var widthList=new Array("25%","42%","10%","10%","6%","7%");
		//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
		gridTree.setHeader(headerDataList,-1,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
		//设置列样式
		gridTree.gridHeaderColStyleArray=new Array("leftClo","leftClo","leftClo","leftClo","leftClo","leftClo");
		gridTree.gridDataCloStyleArray=new Array("leftClo","leftClo","leftClo","leftClo","leftClo","leftClo");
		
		var icon = gridTree.icon.folder;
		var openIcon = gridTree.icon.folderOpen;
		var booleanOpen='';
		var src ='';
		
		var classStyle='';
		var target="_self";
		var codeTip='';
		
		var pdataList=new Array("隐患类别树","","","","","");
		gridTree.addGirdNode(pdataList,-1,-98,booleanOpen,'-1',src,target,"",classStyle,icon,null,codeTip,"");
		<c:forEach items="${hcHiddenTypes}" var="hcHiddenType">
			var select="";
			var FMid='${hcHiddenType.id}';
			var sortType='<ex:dicDisplay dictIdentify="SortType" dictValue="${hcHiddenType.sortType}"/>';
			var grade='<ex:dicDisplay dictIdentify="HiddenType" dictValue="${hcHiddenType.hiddenGrade}"/>';
			<c:if test='${hcHiddenType.sortType==3}'>
				select="<input type='button' class='button1' value='选择' name='noderadio' paramId='${hcHiddenType.id}' paramName='${hcHiddenType.sortName}' paramType='"+grade+"' onclick='fill(this)'/>";
			</c:if>
			var dataList=new Array('${hcHiddenType.sortCode}',
					'${hcHiddenType.sortName}',
					sortType,
					grade,
					'${hcHiddenType.evaluateScore}',
					select);
			//添加节点
			gridTree.addGirdNode(dataList,'${hcHiddenType.id}','${hcHiddenType.parentId}',booleanOpen,Number('${hcHiddenType.sortNo}'),src,target,"",classStyle,icon,null,codeTip,"");
		</c:forEach>
		gridTree.printTableTreeToElement("gridTreeDiv");
		
	}
	
</script>
</head>

<body>
	

    <div id="gridTreeDiv" class="tableTreeDiv"></div>

<script type="text/javascript">
	showGridTree();
</script>
<div class="saveDiv">
			
			<input id="btn_close" value="关闭" type="button" icon="icon_back"/>
		</div>
</body>
</html:html>

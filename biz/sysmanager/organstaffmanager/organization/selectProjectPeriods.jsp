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
	var oper_id='${param.oper_id}';
	$(document).ready(function(){
		$("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			});
		$("[name='select_row']").parent().parent().click(function(){
			var select_row = $(this).find("[name='select_row']");
			select_row.attr("checked","checked");
			pullValue(select_row.get(0)) ;
		})
		
			$(".select").click(function(){ 
		 parent.$("[name='parent_id']").val($(this).attr("paramId"));
		 parent.$("[name='parentName']").val($(this).attr("paramName"));
		 parent.art.dialog({id:'commonDialog1'}).close();
			})
	});
	function pullValue(obj){
		oper_id=obj;
	}
	
	
	function showGridTree(){
		gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
		gridTree.tableDesc="<table border=\"1\" class=\"GridView\"  id=\"table1\"   >";	
			var headerDataList=new Array("组织编号","组织名称","电话","组织名称","电话");
		var widthList=new Array("35%","20%","10%","20%","10%");
		//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
		gridTree.setHeader(headerDataList,-99,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
		//设置列样式
		gridTree.gridHeaderColStyleArray=new Array("leftClo","centerClo","centerClo","centerClo");
		gridTree.gridDataCloStyleArray=new Array("leftClo","centerClo","centerClo","centerClo");
		
		var icon = gridTree.icon.folder;
		var openIcon = gridTree.icon.folderOpen;
		var booleanOpen='';
		var src ='';
		
		var classStyle='';
		var target="_self";
		var codeTip='';

		var pselect_radio ='';
		var pdataList=new Array("目录",'','','','');
		gridTree.addGirdNode(pdataList,-1,-99,booleanOpen,'-1',src,target,"",classStyle,icon,null,codeTip,"");
		
		<c:forEach items="${organizations}" var="org">
		    var code='${org.f_no}'
			var typename = '${org.f_name}';
			var modulename = '${org.f_tel}';
			var data='<fmt:formatDate value="${org.f_createdate}" pattern="yyyy-MM-dd"/>';
			var select_radio ='<input class="select" name="select_id" type="button" onclick="pullValue(${org.f_id});" value="选择"  paramId="${org.f_id}" paramName="${org.f_name}" />';
			
			var dataList=new Array(code,typename,modulename,data,select_radio);
			//添加节点
			gridTree.addGirdNode(dataList,'${org.f_id}','${org.parent_id}',booleanOpen,'${org.f_no}',src,target,"",classStyle,icon,null,codeTip,"");
		</c:forEach>
		
		
		
		
		gridTree.printTableTreeToElement("gridTreeDiv");
		gridTree.openAllNodes();
	}
	
	//刷新页面
	function pageRefresh(){
		location.href='esheetItemAction.do?method=list&oper_id='+oper_id;
	}
</script>
</head>

<body>
	
<div class="saveDiv">
			
			<input id="btn_close" value="关闭" type="button" icon="icon_back"/>
			
		</div>
    <div id="gridTreeDiv" class="tableTreeDiv"></div>

<script type="text/javascript">
	showGridTree();
</script>

</body>
</html:html>

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
		$(".choose").click(function(){ //parent.$("[name='seg_name']").innerText='$(this).attr("paramSeg")';
		if(oper_id!=''){
		        parent.$("[name='station_id']").val($(this).attr("paramId"));
				parent.$("[name='station_name']").val($(this).attr("paramName"));
				
			    parent.art.dialog({id:'commonDialog1'}).close();
		}
			});
	});
	function pullValue(obj){
		oper_id=obj;
	}
	
	
	function showGridTree(){
		gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
		gridTree.tableDesc="<table border=\"1\" class=\"GridView\"  id=\"table1\"   >";	
		var headerDataList=new Array("线路/标段/站点","编码","操作");
		var widthList=new Array("35%","20%","10%");
		//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
		gridTree.setHeader(headerDataList,-99,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
		//设置列样式
		gridTree.gridHeaderColStyleArray=new Array("leftClo","centerClo","centerClo");
		gridTree.gridDataCloStyleArray=new Array("leftClo","centerClo","centerClo");
		
		var icon = gridTree.icon.folder;
		var openIcon = gridTree.icon.folderOpen;
		var booleanOpen='';
		var src ='';
		
		var classStyle='';
		var target="_self";
		var codeTip='';

		var pselect_radio ='';
		var pdataList=new Array("线路标段工点目录",'','');
		gridTree.addGirdNode(pdataList,-1,-99,booleanOpen,'-1',src,target,"",classStyle,icon,null,codeTip,"");
		
		<c:forEach items="${stations}" var="station">
			var typename = '${station.station_name}';
			var modulename = '${station.station_code}';
			var select_radio ='<input class="choose" type="button" onclick="pullValue(${station.station_id});" value="选择"   segname="${station.segment_id.segment_name}" paramId="${station.station_id}" paramName="${station.segment_id.line_id.shortName}-${station.segment_id.segment_name}-${station.station_name}" />';
			
			var dataList=new Array(typename,modulename,select_radio);
			//添加节点
			gridTree.addGirdNode(dataList,'${station.station_id}','=${station.segment_id.segment_id}',booleanOpen,'${station.station_code}',src,target,"",classStyle,icon,null,codeTip,"");
		</c:forEach>
		<c:forEach items="${segs}" var="seg">
			var typename = '${seg.segment_name}';
			var modulename = '${seg.segment_code}';
			var select_radio ='';
			var dataList=new Array(typename,modulename,select_radio);
			//添加节点
			gridTree.addGirdNode(dataList,'=${seg.segment_id}','--${seg.line_id.line_id}',booleanOpen,'${seg.segment_code}',src,target,"",classStyle,icon,null,codeTip,"");
		</c:forEach>
		
		<c:forEach items="${lines}" var="line">
			var typename = '${line.line_name}';
			var modulename = '${line.line_code}';
		    var select_radio ='';
			var dataList=new Array(typename,modulename,select_radio);
			//添加节点
			gridTree.addGirdNode(dataList,'--${line.line_id}','-1',booleanOpen,'${line.line_code}',src,target,"",classStyle,icon,null,codeTip,"");
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
	

    <div id="gridTreeDiv" class="tableTreeDiv"></div>

<script type="text/javascript">
	showGridTree();
</script>
<div class="saveDiv">
			
			<input id="btn_close" value="关闭" type="button" icon="icon_back"/>
		</div>
</body>
</html:html>

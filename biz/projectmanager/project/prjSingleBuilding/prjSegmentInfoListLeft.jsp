<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree-1.1.0.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
	<script type="text/javascript">
		var gridTree;
		tree_path="${ctx}";	
		var	prjMap=new HashMap();
		//加载
		$(document).ready(function(){
			//
			
			//
		});
		//文档树
		function showGridTree(){
			gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
			gridTree.toMenuMode();
			gridTree.setMenuRoot("项目总汇",-1,true,"MenuRoot","项目总汇","项目总汇","","");
		
			var icon = gridTree.icon.folder;
			var openIcon = gridTree.icon.folderOpen;
			var booleanOpen='';
			
			var classStyle='';
			var codeTip='';
			var nodeTarget="main";
		
			var i=0;
			<c:forEach items="${prjTypeTrees}" var="prjTypeTree">
				i++;
				var nodeId='${prjTypeTree.nodeId}';
				var nodeUrl='${ctx}/prjSingleBuildingAction.do?method=listRight&staticPrjStatus=${prjTypeTree.prjStatus}&prjId=${prjTypeTree.nodeId}&staticPrjId=${prjTypeTree.nodeId}';
				var nodeParentId='${prjTypeTree.parentId}';
				var nodeOrderno='100000';
				var footnode='0';
				var nodeName='${prjTypeTree.nodeName}';				
				var nodeCode="["+'${prjTypeTree.nodeCode}'+"]";
				var item=nodeCode+nodeName;
				
				prjMap.put(nodeId,'${prjTypeTree.nodeId}');
				gridTree.addMenuNode(item,nodeId,nodeParentId,booleanOpen,nodeOrderno,nodeUrl,nodeTarget,"",classStyle,icon,null,codeTip,footnode);
				datatreeList[listsize]=[nodeName,nodeId,nodeParentId,booleanOpen,nodeOrderno,nodeUrl,nodeTarget,"",classStyle,icon,null,codeTip,footnode];
				listsize++;
			</c:forEach>
			gridTree.printTableTreeToElement("gridTreeDiv");
			gridTree.openAllNodes();
		}
		
	</script>
</head>
<body >
	<table width="100%" border="0" cellpadding="0" cellspacing="0" >
			<tr>
				<td valign="top" >
					<div id="gridTreeDiv" style="overflow:auto; width: 500px;"></div>
				</td>
			</tr>
		</table>
		<script type="text/javascript">showGridTree();</script>	
</body>
</html:html>

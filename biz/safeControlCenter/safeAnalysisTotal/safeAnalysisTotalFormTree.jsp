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
		//加载
		$(document).ready(function(){
		});
		//文档树
		function showGridTree(){
			gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
			gridTree.toMenuMode();
			gridTree.setMenuRoot("地铁线路",-1,true,"MenuRoot","项目总汇","项目总汇","","");
		
			var icon = gridTree.icon.folder;
			var openIcon = gridTree.icon.folderOpen;
			var booleanOpen='';
			
			var classStyle='';
			var codeTip='';
			var nodeTarget="main";
			<c:forEach items="${linesTrees}" var="linesTree">
				var nodeId='${linesTree.nodeId}';
				
				var nodeParentId='${linesTree.parentId}';
				
				if(${linesTree.nodeUrl!=null}){
					var nodeUrl='${ctx}/${linesTree.nodeUrl}';
				}else{
					var nodeUrl='';
				}
				var nodeOrderno='${linesTree.nodeCode}';
				var footnode='0';
				var nodeName='${linesTree.nodeName}';				
				
				gridTree.addMenuNode(nodeName,nodeId,nodeParentId,booleanOpen,nodeOrderno,nodeUrl,nodeTarget,"",classStyle,icon,null,codeTip,footnode);
			</c:forEach>
			gridTree.printTableTreeToElement("gridTreeDiv");
			//gridTree.closeAllNodes();
		}
		
	</script>
</head>
<body >
	<table width="100%" border="0" cellpadding="0" cellspacing="0" >
			<tr>
				<td valign="top" >
					<div id="gridTreeDiv" style="overflow:auto; width: 500px;"></div>
				</td><script type="text/javascript">showGridTree();</script>	
				
			</tr>
		</table>
		
</body>
</html:html>

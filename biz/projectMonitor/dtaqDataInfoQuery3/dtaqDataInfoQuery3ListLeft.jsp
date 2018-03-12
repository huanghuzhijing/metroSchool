<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
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
			gridTree.setMenuRoot("地铁线路",-99,true,"MenuRoot","地铁线路","地铁线路","","");
		
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
					var nodeUrl='${ctx}/${linesTree.nodeUrl}&thirdList=${param.thirdList}';
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
					<script language="javascript">
						var checkPointTree = new dTree('checkPointTree');
						checkPointTree.setIconPath('${ctx}/scripts/dtree/');
						checkPointTree.add('-1',-99,'地铁线路','${ctx}/dtaqDataInfoQuery3Action.do?method=list','','main','','');
						<c:forEach items="${linesTrees}" var="linesTree">
							if(${linesTree.nodeUrl!=null}){
								var nodeUrl='${ctx}/${linesTree.nodeUrl}&thirdList=${param.thirdList}';
							}else{
								var nodeUrl='';
							}
						  checkPointTree.add('${linesTree.nodeId}','${linesTree.parentId}','${linesTree.nodeName}',nodeUrl,'','main','','','');
						</c:forEach>
						document.write(checkPointTree);
					</script>
				</td>	
				
			</tr>
		</table>
		
</body>
</html:html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
	<script type="text/javascript">
		//gridTree
		var gridTree;
		tree_path="${ctx}";	
		//
		$(document).ready(function(){
			//
			showGridTree();
			//
		});
		//
		function showGridTree(){
				gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
				gridTree.toMenuMode();
				gridTree.setMenuRoot("权限信息",-1,true,"MenuRoot","权限信息","权限信息","","");
			
				var icon = gridTree.icon.folder;
				var openIcon = gridTree.icon.folderOpen;
				var booleanOpen='';
				var src ='';
				
				var classStyle='leftClo';
				var target="";
				var codeTip='';
			
				var i=1;
				<c:forEach items="${voRoleModuels}" var="voRoleModuel">
					i++;
					var id='-${voRoleModuel.sysRole.id+1}';
					var parentid=-1;
					var prjname='(角色)${voRoleModuel.sysRole.rolename}';
					gridTree.addMenuNode(prjname,id,parentid,booleanOpen,i,src,target,"",classStyle,icon,null,codeTip,"");
					<c:forEach items="${voRoleModuel.sysModuleInfos}" var="sysModuleInfo">
						id='${sysModuleInfo.id+voRoleModuel.sysRole.id*10000}';
						parentid='${sysModuleInfo.parentid+voRoleModuel.sysRole.id*10000}';
						var trueParentid='${sysModuleInfo.parentid}';
						if(trueParentid==1){
							parentid='-${voRoleModuel.sysRole.id+1}';
						}
						prjname='(模块)${sysModuleInfo.modulename}';
						gridTree.addMenuNode(prjname,id,parentid,booleanOpen,'${sysModuleInfo.nodecode}',src,target,"",classStyle,icon,null,codeTip,"");
					</c:forEach>
				</c:forEach>
				gridTree.printTableTreeToElement("gridTreeDiv");
			}
	</script>
</head>
<body >
	<table width="100%" border="0" cellpadding="0" cellspacing="0" style="">
			<tr>
				<td valign="top" >
					<div id="gridTreeDiv"  ></div>
				</td>
			</tr>
		</table>
		
</body>
</html:html>

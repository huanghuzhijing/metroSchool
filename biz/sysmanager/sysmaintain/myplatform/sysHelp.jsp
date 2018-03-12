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
					src='bizplat.do?method=helpManager&qroleId=${voRoleModuel.sysRole.id}';
					//gridTree.addMenuNode(prjname,id,parentid,booleanOpen,i,src,target,"",classStyle,icon,null,codeTip,"");
					<c:forEach items="${voRoleModuel.sysModuleInfos}" var="sysModuleInfo">
						id='${sysModuleInfo.id+voRoleModuel.sysRole.id*10000}';
						parentid='${sysModuleInfo.parentid+voRoleModuel.sysRole.id*10000}';
						var trueParentid='${sysModuleInfo.parentid}';
						if(trueParentid==1){
							parentid='-1';
						}
						prjname='${sysModuleInfo.modulename}';
						src='bizplat.do?method=helpManager&qroleId=${voRoleModuel.sysRole.id}&qmoduleId=${sysModuleInfo.id}';
						gridTree.addMenuNode(prjname,id,parentid,booleanOpen,'${sysModuleInfo.nodecode}',src,target,"",classStyle,icon,null,codeTip,"");
					</c:forEach>
				</c:forEach>
				gridTree.printTableTreeToElement("gridTreeDiv");
			}
	</script>
</head>
<body >
	<table  width="100%" >
		<tr>
			<td valign="top" >
					<div id="gridTreeDiv"  ></div>
				</td>
			<td valign="top">
				<table class="listTable" >
					<thead>
						<tr>
						    <th align="center">
								类&nbsp;&nbsp;&nbsp;&nbsp;型
							</th>
							<th align="center">
								模块名称
							</th>

							<th align="center">
								帮助文档
							</th>
						</tr>
					</thead>
						<c:forEach items="${sysHelpDetails}" var="details">
							<tr>
							    <td align="center">
									<c:if test="${details.f_rtreecode==0}">角&nbsp;&nbsp;&nbsp;&nbsp;色</c:if>
									<c:if test="${details.f_rtreecode==1}">一级模块</c:if>
									<c:if test="${details.f_rtreecode==2}">二级模块</c:if>
									<c:if test="${details.f_rtreecode==3}">三级模块</c:if>
									<c:if test="${details.f_rtreecode==4}">功&nbsp;&nbsp;&nbsp;&nbsp;能</c:if>
								</td>
								<td align="center">
									${details.addressandname} 
								</td>
								<td align="center">
									<c:if test="${details.f_mname!=null}">
										<c:if test="${details.f_rtreecode==0}">	<a href="bizplat.do?method=htmlshow&address=${details.f_mname}">[${details.fileName}]</a></c:if>
										<c:if test="${details.f_rtreecode==1||details.f_rtreecode==2||details.f_rtreecode==3}">	<a href="bizplat.do?method=htmlshow&address=${details.f_mname}">[${details.fileName}]</a></c:if>
										<c:if test="${details.f_rtreecode==4}">	<a href="bizplat.do?method=htmlshow&address=${details.f_mname}">[${details.fileName}]</a></c:if>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					
				</table>
		</td>
		</tr>
	</table>
</body>
</html:html>

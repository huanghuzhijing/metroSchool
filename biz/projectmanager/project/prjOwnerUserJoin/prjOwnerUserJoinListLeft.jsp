<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
	<script type="text/javascript">
		$(document).ready(function(){
			//
			//
		});
	</script>
</head>
<body >
	<table width="100%" border="0" cellpadding="0" cellspacing="0" style="">
			<tr>
				<td valign="top" >
					<div id="gridTreeDiv" style="overflow: auto; width: 300px; height: auto;">
					<script language='javascript'>
						//gridTree
						var gridTree;
						tree_path="${ctx}";	
						function showGridTree(){
							gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
							gridTree.toMenuMode();
							gridTree.setMenuRoot("项目树",-1,true,"MenuRoot","项目树","项目树","","");
						
							var icon = gridTree.icon.folder;
							var openIcon = gridTree.icon.folderOpen;
							var booleanOpen='';
							var src ='';
							
							var classStyle='';
							var target="main";
							var codeTip='';
						
							
							var i=1;
							<c:forEach items="${projectInfos}" var="projectInfo">
								i++;
								var prjCode="["+'${projectInfo.prjCode}'+"]";
								var id='${projectInfo.id}';
								var prjname='${projectInfo.prjName}';
								var item=prjCode+prjname;
								gridTree.addMenuNode(item,id,-1,booleanOpen,i,'${ctx}/prjOwnerUserJoinAction.do?method=tab&flag=1&staticPrjId='+id,target,"",classStyle,icon,null,codeTip);
							</c:forEach>
							gridTree.printTableTreeToElement("gridTreeDiv");
						}
						showGridTree();	
					</script>
					</div>
				</td>
			</tr>
		</table>
</body>
</html:html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html lang="en">
<head>
	<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
	<script type="text/javascript">
		//
		$(document).ready(function(){
			//
			$("#btn_save").click(function(){
				var selectPrjId=$("input[type='radio'][name='selectPrjId'][checked]").val();
				top.location.href = "loginsystem.do?method=changPrjLogin&selectPrjId="+selectPrjId+"&contentFrameUrl=${param.contentFrameUrl}";
			});
			//
		});
	</script>
</head>
<content tag="heading">
切换项目
</content>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" > 
       <tr>
       	 <td valign="top" width="40%"> 
	          <div style="overflow: auto;" class="dtreeFirstDiv" >
					<script language='javascript'>
						var projectInfoTree = new dTree('projectInfoTree');
						projectInfoTree.setIconPath("${ctx}/scripts/dtree/");
						projectInfoTree.add('-1',-99,'项目总汇&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="btn_save" value="设置为默认" icon="icon-success"  type="submit" class="button2"/>','');
						<c:forEach items="${prjTypeTrees}" var="prjTypeTree">
								<c:choose>
									<c:when test="${prjTypeTree.prjId!=null}">
										projectInfoTree.add('${prjTypeTree.nodeId}','${prjTypeTree.parentId}','<input type="radio" name="selectPrjId" value="${prjTypeTree.prjId}" <c:if test="${prjTypeTree.prjId==userinfo.prjId}">checked</c:if> />${prjTypeTree.nodeName}','','','','','');
									</c:when>
									<c:otherwise>
										projectInfoTree.add('${prjTypeTree.nodeId}','${prjTypeTree.parentId}','${prjTypeTree.nodeName}','','','','','','');
									</c:otherwise>
								</c:choose>	
						</c:forEach>
						document.write(projectInfoTree);
						projectInfoTree.openAll();
					</script>
				</div>
		 </td>
		</tr>
	</table>
</body>
</html>





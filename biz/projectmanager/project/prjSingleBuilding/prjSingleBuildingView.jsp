<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
jQuery(document).ready(function(){
		$("#btn_back").click(function(){
		    document.forms[0].action='prjSingleBuildingAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}';
			document.forms[0].submit();
		}) ;
	})
</script>
</head>
<content tag="heading">
	项目单体-详细
</content>
<body>
<html:form enctype="multipart/form-data" action="prjSingleBuildingAction.do" method="POST">
</html:form>
<fieldset>
	<legend>项目单体-详细</legend>
				<table class="titleTable">
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>		
					<tr>
						<td>
							项目名称：<span class="noRedSpan">*</span>
						</td>
						<td>
							${projectInfo.prjName}
						</td>
						<td>
							标段名称：<span class="noRedSpan">*</span>
						</td>
						<td>
							${prjSegmentInfo.segName}
						</td>
					</tr>
					<tr>
						<td>
							单体编号：<span class="noRedSpan">*</span>
						</td>
						<td>
							${prjSingleBuilding.singleCode}
						</td>
						<td>
							单体名称：<span class="noRedSpan">*</span>
						</td>
						<td>
							${prjSingleBuilding.singleName}
						</td>
					</tr>
					<tr>
						<td>
							备注：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${prjSingleBuilding.remark}
						</td>
					</tr>
					<tr>
			             <td>
			             	登记人：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<ex:empName id="${prjSingleBuilding.recorder}"/>
			             </td>
			             <td>
			             	登记日期：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<fmt:formatDate value="${prjSingleBuilding.recordDate}"/>
			             </td>
		           </tr>
		           <tr>
			             <td>
			             	修改人：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<ex:empName id="${prjSingleBuilding.updateMan}"/>
			             </td>
			             <td>
			             	修改日期：<span class="noRedSpan">*</span>
			             </td>
			             <td >
			             	<fmt:formatDate value="${prjSingleBuilding.updateDate}" />
			             </td>
		           </tr>	
		</table>
</fieldset>
	<div class="saveDiv">
		<input id="btn_back" value="返回" type="button" icon="icon_back"/>
	</div>
  </body>
</html:html>

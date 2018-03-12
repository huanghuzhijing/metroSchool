<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
	//
	$(document).ready(function(){
			//
	  		if('${parentPrjSort}'==""){
	   			$("#parenTR").show();
	   			$("#parenTR1").hide();
	   		}else{
	   			$("#parenTR").hide();
	   			$("#parenTR1").show();
	   		}
			//
			$("#btn_close").click(function(){ 
					parent.art.dialog({id:'commonDialog'}).close();
			}); 
			//
	 });
</script>
</head>
<body>
	<fieldset>
			<legend>上级节点信息</legend>
			<table class="formTable" >
		         <COLGROUP>
		           	<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
		          </COLGROUP>
		             <tr id="parenTR">
		           		 <td colspan='2'>顶层节点</td><td colspan='2'>&nbsp;</td>
		           </tr>
		           <tr id="parenTR1">
		           		 <td>
		           		 	工程子类编号：<span class="noRedSpan">*</span>
		           		 </td>
			             <td>
			             	${parentPrjSort.sortCode }&nbsp;
			             </td>
			             <td>
			             	工程子类名称：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	${parentPrjSort.sortName }&nbsp;
			             </td>
		           </tr>
			</table>
	</fieldset>
	<fieldset>
			<legend>总进度计划</legend>
			<table class="formTable" >
		         <COLGROUP>
		           	<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
		          </COLGROUP>
		          <tr>
						<td>
							工程子类编号：<span class="noRedSpan">*</span>
						</td>
						<td >
								${prjSort.sortCode }&nbsp;
						</td>
						<td>
							工程子类名称：<span class="noRedSpan">*</span>
						</td>
						<td>
								${prjSort.sortName }&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							排序号：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
								${prjSort.orderNum }&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							备注：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
								${prjSort.remark }&nbsp;
						</td>
					</tr>
		            <tr>
			             <td>
			             	登记人：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<ex:empName id="${prjSort.recorder}"/>&nbsp;
			             </td>
			             <td>
			             	登记日期：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<fmt:formatDate value="${prjSort.recordDate}" pattern="yyyy-MM-dd"/>&nbsp;
			             </td>
		           </tr>
		           <tr>
			             <td>
			             	修改人：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<ex:empName id="${prjSort.updateMan}"/>&nbsp;
			             </td>
			             <td>
			             	修改日期：<span class="noRedSpan">*</span>
			             </td>
			             <td >
			             	<fmt:formatDate value="${prjSort.updateDate}" pattern="yyyy-MM-dd"/>&nbsp;
			             </td>
		           </tr>
			</table>
	</fieldset>
	<div class="saveDiv">
		<input id="btn_close" value="${texts['button.close']}" type="button"  icon="icon_close"/>
	</div>
  </body>
</html>



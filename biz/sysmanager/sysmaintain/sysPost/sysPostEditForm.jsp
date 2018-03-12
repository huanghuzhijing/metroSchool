<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
	   $(document).ready(function(){
	   		//
	   		if('${parentSysPost}'==""){
	   			$("#parenTR").html("<td colspan='2'>顶层节点</td><td colspan='2'>&nbsp;</td>");
	   		}
			//
			$("#btn_save").click(function(){
				var properties=new Array(); 
				properties[0]=["postName","岗位名称"];
				properties[1]=["orderNum","排序号"];
				saveValidateRequired("#btn_save",properties,"sysPostForm");
			}); 
			//
			$("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
		});
	</script>
</head>
<body>
	<fieldset>
			<legend>上级节点信息</legend>
			<table class="titleTable" >
		         <COLGROUP>
		           	<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
		          </COLGROUP>
		           <tr id="parenTR">
		           		 <td>
			             	岗位名称：<span class="noRedSpan">*</span>
			             </td>
			             <td colspan="3">
			             	${parentSysPost.postName }&nbsp;
			             </td>
		           </tr>
			</table>
	</fieldset>

	<html:form enctype="multipart/form-data" action="sysPostAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="id" />
		<fieldset >
			<legend>岗位管理-编辑</legend>
			<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
							岗位名称：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="postName" styleClass="inputText" maxlength="100"/>
						</td>
						<td>
							排列序号：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text property="orderNum" styleClass="inputText" maxlength="100" />
						</td>
					</tr>
					<tr>
						<td>
							备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<html:textarea property="remark"></html:textarea>
						</td>
					</tr>
			</table>
		</fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" class="button1" icon="icon_save"/>
			<input id="btn_close" value="${texts['button.close']}" type="button"  class="button1" icon="icon_close"/>
		</div>
	</html:form>
</body>
</html:html>

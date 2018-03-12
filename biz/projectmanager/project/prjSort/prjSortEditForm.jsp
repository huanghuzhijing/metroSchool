<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
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
			$("#btn_save").click(function(){
				var sortCode=$("[name='sortCode']").val();
				if(sortCode==""){
					var properties=new Array(); 
					properties[0]=["sortCode","工程子类编号"];
					properties[1]=["sortName","工程子类名称"];
					saveValidateRequired("#btn_save",properties,"prjSortForm");
				}else{
					if(sortCode=='${parentPrjSort.sortCode }'){
						alert("不能增加与父节点一样的编号!");
					}else{
						var properties=new Array(); 
						properties[0]=["sortCode","工程子类编号"];
						properties[1]=["sortName","工程子类名称"];
						saveValidateRequired("#btn_save",properties,"prjSortForm");
					}
				}
			});
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
			<table class="titleTable" >
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
	
	<html:form enctype="multipart/form-data" action="prjSortAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="id" />
		<fieldset >
			<legend>工程子类-编辑</legend>
			<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
							工程子类编号：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text property="sortCode" styleClass="inputText" maxlength="50" size="30" />
						</td>
						<td>
							工程子类名称：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="sortName"  styleClass="inputText" maxlength="50" size="30"/>
						</td>
					</tr>
					<tr>
						<td>
							排序号：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
						<html:text property="orderNum"  styleClass="inputText"  usage="int+" maxlength="100" size="30"/>
						</td>
					</tr>
					<tr>
						<td>
							备注：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<html:textarea property="remark"  />
						</td>
					</tr>
				</table>
		</fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
			<input id="btn_close" value="${texts['button.close']}" type="button"  icon="icon_close"/>
		</div>
	</html:form>
</body>
</html:html>

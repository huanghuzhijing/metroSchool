<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			$("#btn_select").click(function(){ 
				var url = "sysModuleInfoAction.do?method=selectPrjPeriodsForModule";
				art.dialog({id:'commonDialog2',title:'模块管理', iframe:url, width:'300', height:'350',top:'40'});
			});
			//
			$("[name='modulename']").blur(function(){
				$("[name='annexmodulename']").val($(this).val()+"帮助文档") ;
			})
			//
			
			$("#btn_save").click(function(){
				var properties=new Array(); 
				properties[0]=["f_mname","模块名称"];
				properties[1]=["validstate","有效状态"];
				properties[1]=["secondFlag","是否为新系统模块"];
				saveValidateRequired("#btn_save",properties,"sysModuleInfoForm");
			}); 
			//
			$("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
		});
		//单附件上传
		function showUploadDialogAndRefresh(URL,tWidth,tHeight)
		{
		dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	     var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
		}   
	</script>
</head>

<body >
	<html:form enctype="multipart/form-data" action="sysModuleInfoAction.do" method="POST">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="id" />
		<html:hidden property="parentid" value="${param.parentid}"/>
			<fieldset >
		<legend>模块管理</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
					 
					  <tr>
					    <td >上级模块名称：<span class="noRedSpan">*</span></td>
					    <td >
							${sysmodu.f_mname}
						</td>
					  </tr>
					  <tr>
					    <td >模块名称：<span class="redSpan">*</span></td>
					    <td >
							<html:text property="f_mname" size="48" styleClass="inputText" maxlength="100"/>
						</td>
					  </tr>
					  <tr>
					    <td >模块地址码：<span class="noRedSpan">*</span></td>
					    <td >
					    	<html:text property="f_mcode"  size="48" styleClass="inputText" maxlength="100"/>
						</td>
					  </tr>
					   <tr>
					    <td >指令码：<span class="noRedSpan">*</span></td>
					    <td >
					    	<html:text property="f_rtreecode"  size="48" styleClass="inputText" maxlength="100"/>
						</td>
					  </tr>		
					  <tr>
					    <td >有效状态：<span class="redSpan">*</span></td>
					    <td >
					    	<html:radio property="f_mstate" value="1" >启  用</html:radio>
							&nbsp;&nbsp;
							<html:radio property="f_mstate" value="0">禁  用</html:radio>
						</td>
					  </tr>		
					   <tr>
					    <td >是否为新系统模块：<span class="redSpan">*</span></td>
					    <td >
					    	<html:select property="secondFlag">
					    	  <html:option value="" >请选择</html:option>
								<html:option value="0" >老系统</html:option>
								<html:option value="1" >新系统</html:option>
							</html:select>
						</td>
					  </tr>		
					 
					 <tr>
						<td>
							帮助路径：<span class="redSpan">*</span>
						</td>
						<td >
							<input type="text" id="fileName_" name="fileName_" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="fileClear(this)" style="width: 76px; height: 65px; cursor:pointer" value="清空"/>
			
						</td>
						<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="fileAddr_" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
					</tr>
					 
					</table>
					</fieldset>
	

			<div  class="saveDiv">
				<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
				<input id="btn_close" value="${texts['button.close']}" type="button"  icon="icon_close"/>
			</div>

	</html:form>
</body>
</html:html>

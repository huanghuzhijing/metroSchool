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
			$("[name='commandname']").blur(function(){
				$("[name='annexname']").val($(this).val()+"帮助文档") ;
			});
		
			//
			$("#btn_save").click(function(){
				$.ajax({
				   type: "POST",
				   url: "${ctx}/sysModuleOperationAction.do?method=checkcommandcode",
				   data: "id=&commandcode="+$("input[name='f_mcode']").val(),
				   success: function(msg){
				   		 if(msg=="no"){ 
				   		 		alert("此指令码代码已存在!");     
						  }else{
						       var properties=new Array(); 
								properties[0]=["f_mname","指令码名称"];
								properties[1]=["f_mcode","指令编码"];
								saveValidateRequired("#btn_save",properties,"sysModuleOperationForm");
						  }
				   }
				});
			}); 
			//
			$("#btn_close").click(function(){ 
			location.href="sysModuleOperationAction.do?method=list&&staticModuleId=${param.staticModuleId}";
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
	<html:form enctype="multipart/form-data" action="sysModuleOperationAction.do" method="POST">
		<input type="hidden" name="method" value="save" />
		
		<html:hidden property="staticModuleId" value="${param.staticModuleId }"/>
	<fieldset >
		<legend>模块指令管理</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne"  />
						</COLGROUP>
					  <tr>
					    <td >指令码名称：<span class="redSpan">*</span></td>
					    <td >
					    	<html:text property="f_mname"  styleClass="inputText" maxlength="100" size="48"/>
						</td>
					  </tr>
					  <tr>
					    <td >指令编码：<span class="redSpan">*</span></td>
					    <td >
					    	<html:text property="f_mcode"  styleClass="inputText" maxlength="100" size="48" />
						</td>
					  </tr>	
					 
					  <tr>
						<td>
							帮助路径：<span class="noRedSpan">*</span>
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
				<input id="btn_save" type="button" icon="icon_save" value="${texts['button.save']}"  />
				<input id="btn_close" type="button"  icon="icon_close" value="返回" />
			
		</div>
	</html:form>
</body>
</html:html>

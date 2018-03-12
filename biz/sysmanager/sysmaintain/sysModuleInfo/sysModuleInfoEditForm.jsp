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
				properties[1]=["f_mstate","有效状态"];
				properties[1]=["secondFlag","是否为新系统模块"];
				saveValidateRequired("#btn_save",properties,"sysModuleInfoForm");
			});
			//
			$("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
			
		});
			function showUploadDialogAndRefresh(URL,tWidth,tHeight)
    {   dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
    }
    function fileClear(){
    $("#fileName_").val("");
    $("#fileAddr_").val("");
    }
    
   /* function checkActionCode(action_code){
	var old_action_code = jQuery("[name='old_action_code']").val();
	if(action_code != "" && action_code != old_action_code){
		var url = "${ctx}/sysModuleinfoAction.do?method=checkActionCode";
       	var myajax = new Ajax.Request(url, {method:"post", parameters:"action_code="+action_code, onComplete:showResponse});//实现ajax请求
	}
}*/
	</script>
</head>
<body >
	<html:form enctype="multipart/form-data" action="sysModuleInfoAction.do" method="POST">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="f_mid" />
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
								<html:radio property="f_mstate" value="1">启  用</html:radio>
								&nbsp;&nbsp;
								<html:radio property="f_mstate" value="0">禁  用</html:radio>
							</td>
						  </tr>	
						  <c:if test="${flag==1}">
						 <tr>
						  <tr>
						    <td >是否为C/S版本模块：<span class="noRedSpan">*</span></td>
						    <td >
								<html:radio property="is_cssystem" value="0">否</html:radio>
								&nbsp;&nbsp;
								<html:radio property="is_cssystem" value="1">是</html:radio>
							</td>
						  </tr>		
						   <tr>
						  <tr>
						    <td >事件指令码：<span class="noRedSpan">*</span></td>
						    <td >
						    <html:text property="action_code"  size="48" styleClass="inputText" maxlength="100" onblur="checkActionCode(this.value)"/>
						    <html:hidden property="old_action_code" value="${sysmodu.action_code}"/>
								
							</td>
						  </tr>	
						   <tr>
						    <td >首页元素：<span class="noRedSpan">*</span></td>
						    <td >
						   <ex:dictSelect property="f_indexpage" type="SysModuleinfoIndexPage" />
								
							</td>
						  </tr>	
						   <tr>
						    <td >是否为工具栏菜单：<span class="noRedSpan">*</span></td>
						    <td >
								<html:radio property="is_toolbar" value="0">否</html:radio>
								&nbsp;&nbsp;
								<html:radio property="is_toolbar" value="1">是</html:radio>
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
					  </c:if>				
						 <tr>
						<td>
							帮助文档附件：<span class="noRedSpan">*</span>
						</td>
							<td >
						       <span style="float: left;"><input type="text" id="fileName_" name="fileName_"
							class="inputText" size="30" value="${object.annexModuleName}" /></span>
						<span style="float: inherit;margin-left:5px;"><input type="button" icon="icon_currWeek"
							onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);"
							style="width: 76px; height: 65px; cursor: pointer" value="文件上传"
							alt="进入文件上传页面" /></span>
						<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_"/>--%>
						<input type="button" icon="icon_delete" onclick="fileClear(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
							<c:if test="${object.annexModuleAddr!=null}">
								<a href="<%=request.getContextPath()%>/sysModuleInfoAction.do?method=downloadSingle&f_mid=${object.f_mid}">${object.annexModuleName}</a>
							</c:if>
<%--							<html:text property="fileName_" styleClass="inputText"	value="${compCompleteCheck.reportAnnex}" maxlength="100" size="30"/>--%>
						</td>
						<td style="display:none">
							制度文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="fileAddr_" class="inputText" readonly="readonly" size="30" value="${object.annexModuleAddr}"/>
							
						</td>
					</tr>
						 
					</table>
</fieldset>
		
			<div class="saveDiv">
				<input id="btn_save" type="button"  icon="icon_save" value="${texts['button.save']}" />
				<input id="btn_close" type="button"  icon="icon_close" value="${texts['button.close']}" />
			</div>
		
	</html:form>
</body>
</html:html>

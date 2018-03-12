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
			$("#btn_save").click(function(){
				var errors = "";
				var focus= "";
				//模块名称
				var planStartDate = $("input[name='planStartDate']").val();
				if(planStartDate == ""){
					errors += "编辑日期 为必填项!\n";
				  	focus += "modulename,";
				}
				if(errors != ""){
					alert(errors);
					var focusStr = focus.substring(0,focus.indexOf(","));
					$("input[name='"+focusStr+"']").focus();
					return false;
				}
				if($("[name='prjStatus']").val()=='${projectInfo.prjStatus}'){
					alert("项目状态没有发生改变，请变更！");
					return false;
				}
				$("#btn_save").addClass("z-btn-dsb");
				$("#btn_save").attr("disabled","disabled");
				document.forms[0].submit();
			});
			//
			$("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
			
		});
	</script>
</head>
<body >
	<html:form enctype="multipart/form-data" action="projectInfoAction.do" method="POST">
		<input type="hidden" name="method" value="savePrjStatus"/>
		<html:hidden property="id"  />
			<fieldset >
		<legend>项目管理</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						  <tr>
							    <td >项目名称：<span class="redSpan">*</span></td>
							    <td colspan="3">
							    	<html:text property="tempprjName" value="${projectInfo.prjName}" size="50" readonly="true" styleClass="showText" maxlength="100"/>
								</td>
						  </tr>
						  <tr>
							    <td >项目状态：<span class="redSpan">*</span></td>
							    <td >
							    	<ex:dictSelect property="prjStatus"  showSelect="false" type="PrjStatus"/>
								</td>
								<td>
									编辑日期：<span class="redSpan">*</span>
								</td>
								<td>
									<html:text property="planStartDate" value="${now_date}" styleClass="inputText"  onfocus="WdatePicker()"/>
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

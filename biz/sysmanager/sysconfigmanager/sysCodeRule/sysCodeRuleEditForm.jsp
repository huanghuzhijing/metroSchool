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
				//编码规则编号
				var ruleCode = $("input[name='ruleCode']").val();
				if(ruleCode == ""){
					errors += "编码规则编号 为必填项!\n";
				  	focus += "ruleCode,";
				}
				//编码规则名称
				var rulename = $("input[name='rulename']").val();
				if(rulename == ""){
					errors += "编码规则名称 为必填项!\n";
				  	focus += "rulename,";
				}
				if(errors != ""){
					alert(errors);
					var focusStr = focus.substring(0,focus.indexOf(","));
					$("input[name='"+focusStr+"']").focus();
					return false;
				}
				//
				$.ajax({
				   type: "POST",
				   url: "${ctx}/sysCodeRuleAction.do?method=checkRuleCode",
				   data: "id="+$("input[name='id']").val()+"&ruleCode="+$("input[name='ruleCode']").val(),
				   success: function(msg){
				   		 if(msg=="no"){ 
				   		 		alert("编码规则编号 已存在!");
				   		 		$("input[name='ruleCode']").val("");     
						  }else{
							  	$("#btn_save").addClass("z-btn-dsb");
								$("#btn_save").attr("disabled","disabled"); 
								document.forms[0].submit();
						  }
				   }
				});
				//
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
	<html:form enctype="multipart/form-data" action="sysCodeRuleAction.do" method="POST">
		<input  name="method" value="save" type="hidden"/>
		<html:hidden property="id" />
		<!-- 查询条件 开始-->
		<input name="pageIndex" value="${param.pageIndex}" type="hidden" />
		<input name=qrulename value="${param.qrulename}" type="hidden" />
		<!-- 查询条件 结束-->
<fieldset >
		<legend>编码规则-编辑</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne"  />
						</COLGROUP>
						<tr>
						    <td width="30%">
						    	编码规则编号：<span class="redSpan">*</span>
						    </td>
						    <td width="70%" colspan="3">
						    	<html:text property="ruleCode" styleClass="inputText" maxlength="100" size="40"/>
							</td>
					  </tr>	
					  <tr>
					    <td width="30%">编码规则名称：<span class="redSpan">*</span></td>
					    <td width="70%">
					    	<html:text property="rulename"  size="40" styleClass="inputText" maxlength="100"/>
						</td>
					  </tr>
					  <tr>
					    <td width="30%">备  注：<span class="noRedSpan">*</span></td>
					    <td width="70%" colspan="3">
							<html:textarea property="remark"  />
						</td>
					  </tr>
					   <tr>
					    <td width="30%">显示设定规则示例：<span class="noRedSpan">*</span></td>
					    <td width="70%" colspan="3">
					    	<input id="ruleall" value="${ruleall}" class="showText"  size="48"/>
						</td>
					</table>
		</fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
			<div  class="saveDiv">
				<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
				<input id="btn_close" value="${texts['button.close']}" type="button"  icon="icon_close"/>
			</div>
	</html:form>
</body>
</html:html>

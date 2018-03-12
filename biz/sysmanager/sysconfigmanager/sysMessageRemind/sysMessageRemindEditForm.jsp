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
				var modulename = $("input[name='modulename']").val();
				if(modulename == ""){
					errors += "模块名称 为必填项!\n";
				  	focus += "modulename,";
				}
				if(errors != ""){
					alert(errors);
					var focusStr = focus.substring(0,focus.indexOf(","));
					$("input[name='"+focusStr+"']").focus();
					return false;
				}
				 $("#btn_save").addClass("z-btn-dsb");
				$("#btn_save").attr("disabled","disabled");
				document.forms[0].submit();
			}); 
			//
			$("#btn_back").click(function(){ 
				history.back(-1);
			}); 
			//
			$("#btn_selectRole").click(function(){
				$("#roleIds").val($("#tempRoleIds").val());
				$("#roleNames").val($("#tempRoleNames").val());
				var url = "sysMessageRemindAction.do?method=selectRoleForMessRemind";
				art.dialog({id:'commonDialog1',title:'角色信息', iframe:url, width:'600', height:'400',top:'30'}).close(function(){
					$("#tempRoleIds").val($("#roleIds").val());
					$("#tempRoleNames").val($("#roleNames").val());
				});
			}); 
			//
			$("#btn_selectOrgan").click(function(){ 
				$("#organIds").val($("#tempOrganIds").val());
				$("#organNames").val($("#tempOrganNames").val());
				var url = "sysMessageRemindAction.do?method=selectOrganForMessRemind";
				art.dialog({id:'commonDialog1',title:'组织信息', iframe:url, width:'600', height:'400',top:'30'}).close(function(){
					$("#tempOrganIds").val($("#organIds").val());
					$("#tempOrganNames").val($("#organNames").val());
				});
			}); 
			//
		});
	</script>
</head>
<body >
	<html:form enctype="multipart/form-data" action="sysMessageRemindAction.do" method="POST">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="id" />
		<html:hidden property="staticPrjId" value="${staticPrjId}"/>
		<!--查询定位 开始-->
		<html:hidden property="sysMessageRemindList_page"  value="${param.sysMessageRemindList_page }"/>
		<html:hidden property="qusername"  value="${param.qusername }"/>
		<!--查询定位 结束-->
<fieldset >
		<legend>消息提醒管理</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
					  <tr>
					    <td >模块名称：<span class="redSpan">*</span></td>
					    <td >
							<html:text property="modulename" styleClass="showText" maxlength="100" size="48"/>
						</td>
					  </tr>	
					  <tr>
					    <td >角  色：<span class="noRedSpan">*</span></td>
					    <td >
					    	<input id="tempRoleIds" type="hidden" value="${roleIds }" />
					    	<input id="tempRoleNames" type="hidden" value="${roleNames }" />
					    	<input id="roleIds" name="roleIds" value="${roleIds }" type="hidden" />
					    	<input id="roleNames" value="${roleNames }" type="text" class="showText"  size="48" />
							<input id="btn_selectRole" value="选择角色" icon="icon_selectInfo" type="button"  />
						</td>
					  </tr>
					  <tr>
					    <td >组 织：<span class="noRedSpan">*</span></td>
					    <td >
					    	<input id="tempOrganIds" type="hidden" value="${organIds }"/>
					    	<input id="tempOrganNames" type="hidden" value="${organNames }"/>
					    	<input id="organIds" name="organIds" value="${organIds }" type="hidden" />
					    	<input id="organNames" value="${organNames }" type="text" class="showText"  size="48"/>
							<input id="btn_selectOrgan" value="选择组织" icon="icon_selectInfo" type="button"  />
						</td>
					  </tr>		
					 <tr>
					    <td >提醒说明：<span class="noRedSpan">*</span></td>
					    <td >
							<html:textarea property="memo"  />
						</td>
					  </tr>
					</table>
		</fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
			<div  class="saveDiv">
				<input id="btn_save" type="button"  icon="icon_save" value="${texts['button.save']}" />
				<input id="btn_back" type="button"  icon="icon_back" value="${texts['button.back']}" />
			</div>
	</html:form>
</body>
</html:html>

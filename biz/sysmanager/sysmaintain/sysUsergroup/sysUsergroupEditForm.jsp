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
				//岗位名称
				var usergroupname = $("input[name='usergroupname']").val();
				if(usergroupname == ""){
					errors += "岗位名称 为必填项!\n";
				  	focus += "usergroupname,";
				}
				if(errors != ""){
					alert(errors);
					var focusStr = focus.substring(0,focus.indexOf(","));
					$("input[name='"+focusStr+"']").focus();
					return false;
				}
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
	<html:form enctype="multipart/form-data" action="sysUsergroupAction.do" method="POST">
		<input type="hidden" name="method" value="save">
		<html:hidden property="id" />
		<fieldset >
		<legend>用户组管理-编辑</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne">
							<COL class="tdRightOne">
						</COLGROUP>
					  <tr>
					    <td >岗位名称：<span class="redSpan">*</span></td>
					    <td >
					    	<html:text property="usergroupname" styleClass="inputText" maxlength="100" size="30"/>
						</td>
					  </tr>
					  <tr>
					    <td >岗位描述：<span class="noRedSpan">*</span></td>
					    <td >
					    	<html:text property="memo" styleClass="inputText" maxlength="100" size="30"/>
						</td>
					  </tr>
					  <tr>
					    <td >排列号：<span class="redSpan">*</span></td>
					    <td >
					    	<html:text property="orderNo" styleClass="inputText" maxlength="100" size="30" usage="int+"/>
						</td>
					  </tr>
					</table>
         </fieldset>
		 <div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
			<div class="saveDiv">
				<input id="btn_save" type="button"  icon="icon_save" value="${texts['button.save']}" />
				<input id="btn_close" type="button"  icon="icon_close" value="${texts['button.close']}" />
			</div>
	</html:form>
</body>
</html:html>

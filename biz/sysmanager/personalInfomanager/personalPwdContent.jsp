<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript">
//
$(document).ready(function(){
	//
	$("#btn_save").click(function(){ 
		if($("#btn_save").hasClass("z-btn-dsb")==false){
			sub();
		}
	}); 
	//
});
//
function checkpwd(pwd){
	var oldpwd = $("#oldpwd").val();
	if(oldpwd != ""){
		if(oldpwd==pwd){
		    $("btn_save").disabled='';
		    $("#btn_save").removeClass("z-btn-dsb");
		    document.all.divoldpwd.style.display='none';
		}else{
			document.all.divoldpwd.style.display='inline';
		}
	}
}
//
function chknum(obj){
	if(obj.value != ""){
		var num = obj.value.length;
		if(num>10 || num<3)
		{
			if(obj.name=='newpwd')
			{
				document.getElementById("divpwd").style.display='inline';
			}
			if(obj.name=='repwd')
			{
				document.getElementById("divrepwd").style.display='inline';
			}
			return false;
		}
		else{
			if(obj.name=='newpwd')
			{
				document.getElementById("divpwd").style.display='none';
			}
			if(obj.name=='repwd')
			{
				document.getElementById("divrepwd").style.display='none';
			}
			return true;
		}
	}
}
//
function sub(){
	var pwd = document.getElementById("newpwd").value;
	var repwd = document.getElementById("repwd").value;
	if(pwd==repwd){
		if(pwd!='' && repwd!=''){
			if(chknum(document.getElementById("newpwd")) && chknum(document.getElementById("repwd")))
				document.forms[0].submit();
		}
		else
			alert("${texts['system.passEdit.pwd_free']}");
	}
	else
	{
		document.getElementById("newpwd").value='';
		document.getElementById("repwd").value='';
		alert("${texts['system.passEdit.pwd_defent']}");
	}
}
</script>

<html:form action="personalInfoAction.do?method=pwdedit" method="POST" >
	<html:hidden property="flag" value="${param.flag}"/>
	<fieldset>
		<legend>[个人密码设置]</legend>
					<table class="formTable" >
						<COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
				    <tr>
				    	<td><fmt:message key="system.passEdit.user_name"/>：<span class="noRedSpan">*</span></td>
				    	<td><c:out value="${userinfo.username}"></c:out> </td>
				    </tr>
				    <tr>
				    	<td><fmt:message key="system.passEdit.oldpwd"/>：<span class="redSpan">*</span></td>
				    	<td>
				    		<input type="password" onblur="checkpwd('${userinfo.password}');"  id="oldpwd" class="inputText" />
				    		<div id="divoldpwd" style="display:none"><font color="red"><fmt:message key="system.passEdit.pwd_error"/></font></div>
				    	</td>
				    </tr>
					    <tr>
					    	<td><fmt:message key="system.passEdit.newpwd"/>：<span class="redSpan">*</span></td>
					    	<td> 
					    		<input id="newpwd" name="newpwd" onblur="chknum(this);" type="password" class="inputText" >
					    	<div id="divpwd" style="display:none"> <font color="red"><fmt:message key="system.passEdit.pwd_limit"/></font> </div>
					    	</td>
					    </tr>
					    <tr>
					    	<td><fmt:message key="system.passEdit.repwd"/>：<span class="redSpan">*</span></td>
					    	<td> 
					    		<input id="repwd" name="newpwd" onblur="chknum(this);" type="password" class="inputText" >
						    	<div id="divrepwd" style="display:none"> <font color="red"><fmt:message key="system.passEdit.pwd_limit"/></font> </div>
					    	 </td>
					    </tr>
					  
					 </table>   
					 </fieldset>
					   	<div  class="saveDiv">
					    	<input disabled="disabled"  id="btn_save"  icon="icon_save" type="button"  value="<fmt:message key="button.save"/>" >
					   	</div>
</html:form>
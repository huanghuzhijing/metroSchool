<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="system.passEdit.title"/></title>
<content tag="heading"><fmt:message key="system.passEdit.title"/></content>
<STYLE type=text/css>
.blueFont {color: #6699CC}
.redFont {color: #FF0000}
/***** Other Elements in Page Content *****/
.pwd-strength {padding: 2px;padding-left: 5px;padding-right: 5px;width: 180px;border: solid 1px #CCCCCC;}
.pwd-strength-box,.pwd-strength-box-low,.pwd-strength-box-med,.pwd-strength-box-hi{color: #464646;text-align: center;width: 33%;}
.pwd-strength-box-low{color: #990000;background-color: #FFECEC;text-align: left;}
.pwd-strength-box-med{color: #000066;background-color: #D2E9FF;}
.pwd-strength-box-hi{color: #003300;background-color: #DDFFDD;}
table.FCK__ShowTableBorders, table.FCK__ShowTableBorders td, table.FCK__ShowTableBorders th
{
	border: #d3d3d3 1px solid;
}
</STYLE>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">

jQuery(document).ready(function(){
	init() ;
	jQuery("#divoldpwd").hide();
	jQuery("#passwordWarn").hide();
	jQuery("#divrepwd").hide();
	jQuery("#differentpwd").hide();
	jQuery("#divpwd").hide();
	jQuery("#passwordSuggest").hide();
})

function checkpwd(pwd){
	var oldpwd = jQuery("#oldpwd").val()
	if(oldpwd != ""){
		 var url = "sysOperatorAction.do?method=validatePassWord&oldpwd="+pwd.value;
		 $.post(url,function(msg){
				if(msg){
				showPassWord(msg);
				}
			});
	}
}

function showPassWord(selResponse){
	var text = selResponse;
	var oldpwd = jQuery("#oldpwd").val();
	if(text == "yes"){
		jQuery("#btnsub").show() ;
		jQuery("#btnsub").attr("disabled","") ;
		jQuery("#divoldpwd").hide();
		var p1= (oldpwd.search(/[a-zA-Z]/)!=-1) ? 1 : 0;
	    var p2= (oldpwd.search(/[0-9]/)!=-1) ? 1 : 0;
	    var p3= (oldpwd.search(/[^A-Za-z0-9_]/)!=-1) ? 1 : 0;
	    var pa=p1+p2+p3;
	    if(oldpwd.length < 6 || pa==1){
	    	jQuery("#passwordWarn").show();
	    }else{
	    	jQuery("#passwordWarn").hide();
	    }
	}else{
		jQuery("#btnsub").attr("disabled","disabled") ;
		jQuery("#divoldpwd").show();	
		jQuery("#passwordWarn").hide();	
	}
}

function chknum(obj){
	var flag = false;
	var temp = jQuery(obj) ;
	if(temp.val() != ""){
		var num = temp.val().length;
		if(num>15 || num<6)
		{
			if(temp.attr("name")== 'newpwd')
			{
				jQuery("#divpwd").show() ;
			}
			if(temp.attr("name")=='repwd')
			{
				jQuery("divrepwd").show();
			}
		}
		else{
			if(temp.attr("name")=='newpwd')
			{
				jQuery("#btnsub").show();
				jQuery("#divpwd").hide();
				flag = true;
			}
			if(temp.attr("name")=='repwd')
			{
				var newpwdValue = jQuery("[name='newpwd']").val();
				
				if(temp.val() != newpwdValue){
					jQuery("#differentpwd").show() ;
					temp.val("") ;
					flag = false;
				}else{
					flag = true;
				}
				jQuery("#divrepwd").hide();
			}
		}
	}else{
		if(temp.attr("name")=='newpwd'){
		
			jQuery("#btnsub").attr("disabled","") ;
			jQuery("#divpwd").hide();
			
		}else if(temp.attr("name")=='repwd'){
			jQuery("#differentpwd").hide();
			jQuery("#divrepwd").hide();
		}
	    jQuery("#pwdLow").removeClass().addClass("pwd-strength-box") ;
	    jQuery("#pwdMed").removeClass().addClass("pwd-strength-box") ;
	    jQuery("#pwdHi").removeClass().addClass("pwd-strength-box") ;
	}
	return flag;
}

function sub()
{
	var pwd =  jQuery("#newpwd").val() ;
	var repwd = jQuery("#repwd").val();
	if(pwd==repwd)
	{
		if(pwd!='' && repwd!='')
		{	
			if(chknum(document.getElementById("newpwd")) && chknum(document.getElementById("repwd"))){
				document.forms[0].submit();
			}
		}
	}
	else
	{
		jQuery("#repwd").val("") ;
		jQuery("#divrepwd").hide();
		jQuery("#divpwd").hide();
		jQuery("#differentpwd").show()
	}
}

function checkPassword(pwd){
    var objLow=jQuery("#pwdLow");
    var objMed=jQuery("#pwdMed");
    var objHi=jQuery("pwdHi");
    objLow.addClass("pwd-strength-box");
    objMed.addClass("pwd-strength-box");
    objHi.addClass("pwd-strength-box");
    if(pwd.length<6){
    	objLow.removeClass().addClass("pwd-strength-box-low");
    }else{
	    var p1= (pwd.search(/[a-zA-Z]/)!=-1) ? 1 : 0;
	    var p2= (pwd.search(/[0-9]/)!=-1) ? 1 : 0;
	    var p3= (pwd.search(/[^A-Za-z0-9_]/)!=-1) ? 1 : 0;
	    var pa=p1+p2+p3;
	    if(pa==1){
	    	objLow.removeClass().addClass("pwd-strength-box-low");
	    }else if(pa==2){
	   	 	objMed.removeClass().addClass("pwd-strength-box-med");
	    }else if(pa==3){
	    	objHi.removeClass().addClass("pwd-strength-box-hi");
	    }
    }
}

function init(){
	addshowhelp("0","xgmm") ;
	var isMD5 = jQuery("[name='isMD5']").val();
	if(isMD5 != ""){
		 var isMD5Codes = jQuery("[name='isMD5Code']");
		 for(var i=0; i<isMD5Codes.length; i++){
		 	var MD5Code = jQuery("[name='isMD5Code']:eq("+i+")") ;
		 	if(MD5Code.val() == isMD5){
		 		MD5Code.attr("checked","checked") ;
		 		break;
		 	}
		 }
	}
}
</script>
<body>
  	<html:form action="sysOperatorAction.do?method=pwdedit" method="POST" >
  		<fieldset >
			<legend>密码修改</legend>
	   <table class="formTable"  >
		<COLGROUP>
	    <COL class="tr03" align="right" width="20%">
	    <COL class="tr02" width="80%" >
	    </COLGROUP>
	    <tr>
	    	<td>用户名：<span class="noRedSpan">*</span></td>
	    	<td><c:out value="${userinfo.username}"></c:out> </td>
	    </tr>
	    <tr>
	    	<td>原密码：<span class="noRedSpan">*</span></td>
	    	<td>
	    		<input type="password"  onblur="checkpwd(this);" name="oldpwd" size="50" id="oldpwd" class="text" />
	    		<span id="divoldpwd" style="color:red;">密码错误</span>
	             <span id="passwordWarn">	密码输入正确,但安全等级太低,请即时修改!</span>
	    	</td>
	    </tr>
		    <tr>
		    	<td>新密码：<span class="noRedSpan">*</span></td>
		    	<td> <input type="password" onblur="chknum(this);" onkeyup="checkPassword(this.value)" styleClass="text" size="40" name="newpwd" id="newpwd"/> 
		    	<span id="divpwd" style="color:red;">密码必须在6~15位之间</span>
		    	<span class="req" id="passwordSuggest">密码必须在6~15位之间</span>
		    	</td>
		    </tr>
		    <tr>
		    	<td>再次输入新密码：<span class="noRedSpan">*</span></td>
		    	<td> 
		    	<input type="password" onblur="chknum(this);" styleClass="text" name="repwd" size="40" id="repwd"/>
		    	<span id="divrepwd" style="color:red;">密码必须在6~15位之间 </span>
		    	<span id="differentpwd" style="color:red;">密码不一致</span>
		    	 </td>
		    </tr>
		    <tr>
             <td>密码安全等级：<span class="noRedSpan">*</span></td>
             <td align="left">
          		<TABLE class="pwd-strength FCK__ShowTableBorders" cellSpacing=0 cellPadding=0 width="100%">
				    <TBODY>
				    <TR>
					    <TD class="pwd-strength-box" id="pwdLow" style="text-align: center">低</TD>
					    <TD class="pwd-strength-box" id="pwdMed">中</TD>
					    <TD class="pwd-strength-box" id="pwdHi" style="text-align: center">高</TD>
				   </TR>
					</TBODY>
				</TABLE>
             </td>
           </tr>
            <tr>
             	<td>是否进行MD5加密：<span class="noRedSpan">*</span></td>
             	<td>
             		<html:radio property="isMD5Code" value="1">是</html:radio>
             		<html:radio property="isMD5Code" value="0">否</html:radio>
             		<html:hidden property="isMD5" value="1" />
             	</td>
             </tr>
	    </table>
	    </fieldset>
	   
	    <div align="center">
	    	<input  id="btnsub" name="btnsub" type="button" onclick="sub()" value="保存" class="button1">
	    </div>
  	</html:form>
  </body>
 </html:html>

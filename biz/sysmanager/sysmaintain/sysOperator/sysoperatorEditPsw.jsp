<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<STYLE type=text/css>
.blueFont {color: #6699CC}
.redFont {color: #FF0000}
/***** Other Elements in Page Content *****/
.pwd-strength {padding: 2px;padding-left: 5px;padding-right: 5px;width: 180px;border: solid 1px #CCCCCC;}
.pwd-strength-box, .pwd-strength-box-low,.pwd-strength-box-med,.pwd-strength-box-hi{color: #464646;text-align: center;width: 33%;}
.pwd-strength-box-low{color: #990000;background-color: #FFECEC;}
.pwd-strength-box-med{color: #000066;background-color: #D2E9FF;}
.pwd-strength-box-hi{color: #003300;background-color: #DDFFDD;}
#pwdLow,#pwdHi,#pwdMed{
text-align: center;
border: solid 1px #CCCCCC;
}
</STYLE>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn_save").click(function(){
				  	var properties=new Array(); 
					properties[0]=["f_spasswTemp","密码"];
					saveValidateRequired("#btn_save",properties,"sysOperatorForm");
			}); 
			$("#btn_back").click(function(){ 
				 	document.forms[0].action='sysOperatorAction.do?method=list&ec_id=${param.f_sid}&ec_p=${param.ec_p}&ec_crd=${eparam.c_rd}';
					document.forms[0].submit();
			}); 
		});
		
function checkPassword(pwd){
    var objLow=jQuery("#pwdLow");
    var objMed=jQuery("#pwdMed");
    var objHi=jQuery("#pwdHi");
    objLow.removeClass().addClass("pwd-strength-box") ;
    objMed.removeClass().addClass("pwd-strength-box") ;
    objHi.removeClass().addClass("pwd-strength-box") ;
    if(pwd.length<6){
    	objLow.addClass("pwd-strength-box-low");
    }else{
	    var p1= (pwd.search(/[a-zA-Z]/)!=-1) ? 1 : 0;
	    var p2= (pwd.search(/[0-9]/)!=-1) ? 1 : 0;
	    var p3= (pwd.search(/[^A-Za-z0-9_]/)!=-1) ? 1 : 0;
	    var pa=p1+p2+p3;
	    if(pa==1){
	    	objLow.addClass("pwd-strength-box-low");
	    }else if(pa==2){
	   	 	objMed.addClass("pwd-strength-box-med");
	    }else if(pa==3){
	    	objHi.addClass("pwd-strength-box-hi");
	    }
    }
}
function leavelClass(value){
	if(value == ""){
		var objLow=jQuery("#pwdLow");
	    var objMed=jQuery("#pwdMed");
	    var objHi=jQuery("#pwdHi");
	    objLow.removeClass().addClass("pwd-strength-box") ;
	    objMed.removeClass().addClass("pwd-strength-box") ;
	    objHi.removeClass().addClass("pwd-strength-box") ;
	}
}
	</script>
</head>
<content tag="heading">
	系统用户信息维护
</content>
<body >
	<html:form enctype="multipart/form-data" action="sysOperatorAction.do" method="POST" styleClass="form" styleId="sysOperatorForm">
		<input type="hidden" name="method" value="save">
		<html:hidden property="f_sid" value="${param.f_sid}" />
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${param.f_sid}" />
		<!--查询定位 开始-->
		<html:hidden property="qusername" />
		<html:hidden property="qempname" />
		<html:hidden property="qcorptype" />
		<html:hidden property="qrolename" />
		<!--查询定位 结束-->
<fieldset>
			<legend>
				修改密码
			</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOneTwo">
					        <COL class="tdRightOneTwo">
						</COLGROUP>
						 <tr>
					    <td >${texts['sysOperator.sysOperatorList.qusername']}：<span class="noRedSpan">*</span></td>
					    <td >
					    	${sysOperator.f_sname}
						</td>
					  </tr>
					  <tr>
					    <td >${texts['sysOperator.sysOperatorForm.password']}：<span class="redSpan">*</span></td>
					    <td >
					    	<html:password property="f_spasswTemp"  size="50" styleClass="inputText" maxlength="100"  onblur="leavelClass(this.value)" onkeyup="checkPassword(this.value)"/>
					      	<span id="passwordSuggest" style="display:inline">(建议6-15个字符. 请使用强密码以保证安全)</span>
	                      	<span id="passwordWarn" style="display:none"><font color="red">该密码安全等级太低，为了您的使用安全，请即时修改!</font></span>
					 	</td>
					  </tr>
					  
					   <tr>
					    <td >密码安全等级：<span class="noRedSpan">*</span></td>
					    <td align="left">
							<TABLE class="pwd-strength FCK__ShowTableBorders" cellSpacing=0 cellPadding=0 width="100%">
				    <TBODY>
				    <TR>
					    <TD class=pwd-strength-box id=pwdLow>低</TD>
					    <TD class=pwd-strength-box id=pwdMed>中</TD>
					    <TD class=pwd-strength-box id=pwdHi>高</TD>
				   </TR>
					</TBODY>
				</TABLE>
						</td>
					  </tr>
					   </tr>
					  <tr>
					    <td >是否进行MD5加密：<span class="noRedSpan">*</span></td>
					    <td >
					      <html:radio property="f_isMD5Code" value="1">是</html:radio>
							&nbsp;&nbsp;
					    <html:radio property="f_isMD5Code" value="0" >否</html:radio>
					    </td>
					  </tr>
					  
					</table>
</fieldset>
	
			<div align="center" class="saveDiv">
				<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
				<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
			</div>
	</html:form>
</body>
</html:html>

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
	var roleIds=""
		$(document).ready(function(){
			//init('${param.f_sid}');
			//
			if('${sysOperator.f_speopletype}'==1){
			$("#hidd").hide();
			}
			$("#btn_save").click(function(){
		          	
			
				$.ajax({
				   type: "POST",
				   url: "${ctx}/sysOperatorAction.do?method=checkusername",
				   data: "f_sid=${param.f_sid}&username="+$("input[name='f_sname']").val(),
				   success: function(msg){
				   		 if(msg=="no"){ 
				   		 		alert("此用户名 已存在!");     
						  }else{
						      var properties=new Array(); 
					    	properties[0]=["f_rname","姓名"];
							properties[1]=["f_rstate","角色名 "];
							properties[2]=["qmidName","用户名 "];
							properties[3]=["qmidName","密码 "];
							saveValidateRequired("#btn_save",properties,"sysOperatorForm");
						  }
				   }
				});
			}); 
			//
			$("#btn_back").click(function(){ 
				 	document.forms[0].action='sysOperatorAction.do?method=list&ec_id=${param.f_sid}&ec_p=${param.ec_p}&ec_crd=${eparam.c_rd}';
					document.forms[0].submit();
			}); 
			//选择用户
			$("#btn_selectEmployeein").click(function(){
				var qorganidentify = $("input[name='f_speopletype']:checked").val() ;
				if(qorganidentify==0){
				var url = "employeeAction.do?method=selectEmpsForSysOperator&qorganidentify="+qorganidentify ;
				}else{
				var url = "employeeExtendAction.do?method=selectEmpsForSysOperator&qorganidentify="+qorganidentify ;
				}
				art.dialog({id:'commonDialog1',title:'员工信息', iframe:url, width:'800', height:'500',top:'30'}).close(function(){
					$("input[name='username']").val($("#empName").val());
				});
			}); 
			//
			$("#btn_selectSysRole").click(function(){ 
				var roleIds=$("input[name='roleIds']").val();
				if(roleIds==''){
				var url = "sysRoleAction.do?method=selectForSysOperator&qorganidentify="+$("input[name='f_speopletype']:checked").val()+"&roleIds=,&roleNames=,";
				art.dialog({id:'commonDialog1',title:'角色信息', iframe:url, width:'700', height:'500',top:'30'}).close(function(){
				});
				}else{
				var url = "sysRoleAction.do?method=selectForSysOperator&qorganidentify="+$("input[name='f_speopletype']:checked").val()+"&roleIds="+$("input[name='roleIds']").val()+"&roleNames="+$("input[name='roleNames']").val();
				art.dialog({id:'commonDialog1',title:'角色信息', iframe:url, width:'700', height:'500',top:'30'}).close(function(){
				});
				}
			}); 
			//selectStations  btn_manage_stations   工点选择 
			$("#btn_manage_stations").click(function(){ 
			var   manage_stations =$("input[name='manage_stations']").val();
			if(manage_stations==''){
				var url = "${ctx}/dtaqStationAction.do?method=selectStations&manage_stations=,&stationName=,";
				art.dialog({id:'commonDialog1',title:'工点选择', iframe:url, width:'700', height:'500',top:'30'}).close(function(){
				}); 
			}else{
			    var url = "${ctx}/dtaqStationAction.do?method=selectStations&manage_stations="+$("input[name='manage_stations']").val()+"&stationName="+$("input[name='stationName']").val();
				art.dialog({id:'commonDialog1',title:'工点选择', iframe:url, width:'700', height:'500',top:'30'}).close(function(){
				}); 
			}
			}); 
			$("#clear").click(function(){ 
			$("#manage_stations").val("");
			$("#stationName").val("");
			}); 
			$("#clear1").click(function(){ 
			$("#roleIds").val("");
			$("#roleNames").val("");
			}); 
		});
		function hidd(){
		var qorganidentify = $("input[name='f_speopletype']:checked").val() ;
		if(qorganidentify==1){
		$("#hidd").hide();
		}else{
		$("#hidd").show();
		}
		}
		
	function init(operid){
	
	jQuery("[name='f_sname']").hide();
	jQuery("[name='fmfsname']").show();
	
	var password = $("[name='f_spassw']").val();
	if(password != ""){
		var p1= (password.search(/[a-zA-Z]/)!=-1) ? 1 : 0;
	    var p2= (password.search(/[0-9]/)!=-1) ? 1 : 0;
	    var p3= (password.search(/[^A-Za-z0-9_]/)!=-1) ? 1 : 0;
	    var pa=p1+p2+p3;
	    if(password.length < 6 || pa==1){
			$("#passwordSuggest").hide();
			$("#passwordWarn").show();
			
	    }else{
			$("#passwordSuggest").show();
			$("#passwordWarn").hide();
	    }
		checkPassword(password);
	}

}
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
<!--		<ex:formProperty name="f_sname" var="fmfsname"/>-->
<fieldset>
			<legend>
				用户管理-编辑
			</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOneTwo">
					        <COL class="tdRightOneTwo">
						</COLGROUP>
						 <tr>
					    <td >${texts['sysOperator.sysOperatorList.qusername']}：<span class="redSpan">*</span></td>
					    <td >
							<html:text property="f_sname"  size="48" styleClass="inputText" maxlength="100"/>
<!--							 <html:text property="fmfsname" value="${fmfsname }" styleClass="text" readonly="true" />-->
							<span>（用户名确认后不可修改，请慎重填写）</span>
						</td>
					  </tr>
<!--					  <tr>-->
<!--					    <td >${texts['sysOperator.sysOperatorForm.password']}：<span class="redSpan">*</span></td>-->
<!--					    <td >-->
<!--					    <html:hidden property="oldfspassw" value="${sysOperator.f_spassw}"/>-->
<!--                     	<html:hidden property="oldisMD5Code" value="${sysOperator.f_isMD5Code}"/>-->
<!--					    	<html:password property="f_spassw"  size="50" styleClass="inputText" maxlength="100"  onblur="leavelClass(this.value)" onkeyup="checkPassword(this.value)"/>-->
<!--					      <span id="passwordSuggest" style="display:inline">(建议6-15个字符. 请使用强密码以保证安全)</span>-->
<!--	                      <span  class="promptSpan" id="passwordWarn" style="display:none"><font color="red">该密码安全等级太低，为了您的使用安全，请即时修改!</font></span>-->
<!--            -->
<!--					    </td>-->
<!--					  </tr>-->
<!--					  -->
<!--					   <tr>-->
<!--					    <td >密码安全等级：<span class="noRedSpan">*</span></td>-->
<!--					    <td align="left">-->
<!--							<TABLE class="pwd-strength FCK__ShowTableBorders" cellSpacing=0 cellPadding=0 width="100%">-->
<!--				    <TBODY>-->
<!--				    <TR>-->
<!--					    <TD class=pwd-strength-box id=pwdLow>低</TD>-->
<!--					    <TD class=pwd-strength-box id=pwdMed>中</TD>-->
<!--					    <TD class=pwd-strength-box id=pwdHi>高</TD>-->
<!--				   </TR>-->
<!--					</TBODY>-->
<!--				</TABLE>-->
<!--						</td>-->
<!--					  </tr>-->
<!--					   </tr>-->
<!--					  <tr>-->
<!--					    <td >是否进行MD5加密：<span class="noRedSpan">*</span></td>-->
<!--					    <td >-->
<!--					      <html:radio property="f_isMD5Code" value="1">是</html:radio>-->
<!--							&nbsp;&nbsp;-->
<!--					    <html:radio property="f_isMD5Code" value="0" >否</html:radio>-->
<!--					    </td>-->
<!--					  </tr>-->
					  
					  <tr>
					    <td >单位类型：<span class="noRedSpan">*</span></td>
					    <td >
					    <html:radio property="f_speopletype" value="0" onclick="hidd()">${texts['sysOperator.sysOperatorForm.incrop']}</html:radio>
							&nbsp;&nbsp;
						<html:radio property="f_speopletype" value="1" onclick="hidd()">${texts['sysOperator.sysOperatorForm.outcrop']}</html:radio>
					    
						</td>
					  </tr>
					  <tr>
					    <td >姓名：<span class="redSpan">*</span></td>
					    <td >
					    	<input id="empId" name="empId" type="hidden" value="${empId }">
					    	<input id="empName" value="${empName}" type="text" class="showText" 
					    		   maxlength="100" size="48">
							<input id="btn_selectEmployeein" value="选择用户"  type="button"  icon="icon_selectInfo" />
						</td>
					  </tr>
					    <tr>
					    <td >别名：<span class="noRedSpan">*</span></td>
					    <td ><html:text property="regname" styleClass="inputText" maxlength="100" size="48"/>
					    	
						</td>
					  </tr>
					  <tr>
					    <td >角色名：<span class="redSpan">*</span></td>
					    <td >
					    	
					    	<input id="roleIds" name="roleIds"  type="hidden" value="${roleIds}">
					    	<input id="roleNames" name="roleNames" type="text" class="showText" 
					    		   maxlength="100" size="80"  value="${roleNames}">
							<input id="btn_selectSysRole" value="${texts['sysOperator.button.selectSysRole']}" 
							       type="button"   icon="icon_selectInfo" />
							       <input id="clear1" value="清空"  type="button"   icon="icon_selectInfo" />
						</td>
					  </tr>		
					  </tr>
					    <tr id="hidd">
					    <td >管理的工点：<span class="noRedSpan">*</span></td>
					    <td >
					    <input id="manage_stations" name="manage_stations" type="hidden" value="${manage_stations}"/>
					     <input id="stationName" name="stationName" type="text" value="${stationName}" class="showText"  maxlength="100" size="80">
					    		   <input id="btn_manage_stations" value="选择"  type="button"   icon="icon_selectInfo" />
							       <input id="clear" value="清空"  type="button"   icon="icon_selectInfo" />
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.net.URLDecoder,java.io.UnsupportedEncodingException"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>
<head>
		<%@ include file="/commons/meta.jsp"%>
		<title>综合信息系统</title>
		<!--[if IE 6]> 
		<script  src="scripts/DD_belatedPNG.js">></script> 
		<script> 
		DD_belatedPNG.fix('.png,img,.login_bg'); 
		</script> 
		<![endif]--> 
		<script>
		//初始
		if(window.opener != null){   
		   if(window.opener.top.location.href.indexOf("<%=request.getServerName()%>")!=-1){
				window.opener.top.location.href = "logout.jsp";
				window.close();
			}else{
				window.top.location.href = "logout.jsp";
			}
		}
		if(window.dialogArguments != null){
			window.top.location.href = "logout.jsp";
			window.close();
		}
		if(self != window.top){
			top.location.href="logout.jsp";	
		}
		//加载
		$(document).ready(function(){ 
			//
			var errorShow='${param.errorShow}';
			if(errorShow==1){
				document.getElementById("divFName").innerHTML = "<font size=2 color='red'><fmt:message key="system.login__name_error" /></font>";
			}
			//时间
			//document.getElementById('span_00').innerHTML=new Date().toLocaleDateString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
	
			//
			if(GetCookie("fsname")){
				$("#chkbox_0").attr("checked","checked");
				$("#fsname").val(GetCookie("fsname"));
			}
			if(GetCookie("fspassw")){
				$("#chkbox_1").attr("checked","checked");
				$("#fspassw").val(GetCookie("fspassw"));
			}
			//输入默认
			$("#fsname").focus() ;
			$("#fsname").keydown(function(){
				if (event.keyCode==13) { 
					$("#fspassw").focus() ; 
			    } 
			}); 
			$("#fspassw").keydown(function(){ 
				if (event.keyCode==13) { 
					submitCheck(); 
			    } 
			}); 
			$("#random").keydown(function(){ 
				if (event.keyCode==13) { 
					submitCheck(); 
			    } 
			}); 
			//dddd
		});
		//提交验证
		function submitCheck(){
			if ($("#fsname").val()==""){
				$("#fsname").focus() ; 
				document.getElementById("divFName").innerHTML = "<font size=2 color='#ff0000'><fmt:message key="system.login_name_suggest" /></font>";
				return false;
			}
			if ($("#fspassw").val()==""){
				  $("#fspassw").focus() ; 
				   document.getElementById("divFName").innerHTML = "<font size=2 color='#ff0000'><fmt:message key="system.login_pwd_suggest" /></font>";
				   return false;
			}
			if ($("#random").val()==""){
			 $("#random").focus() ; 
			  document.getElementById("divFName").innerHTML = "<font size=2 color='#ff0000'><fmt:message key="system.login_verification_suggest" /></font>";
			  return false;
			}
			if (($("#fsname").val()!="")&&($("#fspassw").val()!="")&&($("#random").val()!="")){
				//设置cookie
				if($('#chkbox_0').attr("checked")&&$("#fsname").val()!=GetCookie("fsname")){
					SetCookie("fsname",$("#fsname").val(),"y",30);
				}
		  		if($('#chkbox_1').attr("checked")&&$("#fspassw").val()!=GetCookie("fspassw")){
		  			SetCookie("fspassw",$("#fspassw").val(),"y",30);
		  		}
			    document.getElementById("divFName").innerHTML = "<font size=2 color='#ff0000'><fmt:message key="system.login_success_message" /></font>";
			    $.ajax({
				   type: "POST",
				   url: "${ctx}/loginsystem.do?method=checkStatus",
				   data: "username="+$("#fsname").val()+"&password="+$("#fspassw").val()+"&random="+$("#random").val(),
				   success: function(msg){
				   		 if(msg == "no"){      
						    location.href='login.do?errorShow=1';  
						  }else if(msg =="randomError"){
						  		$("#random").val("");     
						    	document.getElementById("divFName").innerHTML = "<font size=2 color='#ff0000'><fmt:message key="system.login__verification_error" /></font>";
						  }else  if(msg == "yes") {
						     	document.getElementById("loginSystemForm").action="${ctx}/loginsystem.do?method=login";
				  				document.getElementById("loginSystemForm").submit();
						  }else if(msg=="norole"){
						  document.getElementById("divFName").innerHTML = "<font size=2 color='#ff0000'>对不起,您无权限进入该系统!</font>";
						  }
						  else {
						     	document.getElementById("divFName").innerHTML = "<font size=2 color='#ff0000'><fmt:message key="system.login_error" /></font>";
						  }
				   }
				});
			} 
		}
		function chkbox(obj){
			//打勾确认是否保留密码
			if(obj.checked){
				if(obj.id=="chkbox_0")SetCookie("fsname",$("#fsname").val(),"y",30);
				if(obj.id=="chkbox_1")SetCookie("fspassw",$("#fspassw").val(),"y",30);
			}else{
				if(obj.id=="chkbox_0")DelCookie("fsname");
				if(obj.id=="chkbox_1")DelCookie("fspassw");
			}
		}
	</script>
</head>

<body class="login_body">
	<form id="loginSystemForm" method="post">	
		<div align="center" id="mainDiv">
			<div id="loginDiv">
				<table  cellpadding="0" cellspacing="0" align="right">
						<tr>
							<td><span class="loginFont">用户名：</span></td>
							<td colspan="2" class="inputStyle"><input  id="fsname" name="fsname" type="text" class="input_login"/></td>
						</tr>
						<tr>
							<td><span class="loginFont">密　码：</span></td>
							<td colspan="2" class="inputStyle"><input  id="fspassw" name="fspassw" type="password" class="input_login"/></td>
						</tr>	
						<tr>
							<td><span class="loginFont">验证码：</span></td>
							<td class="inputStyle" style="width:10px;"><input  id="random" name="random" type="text" class="input_pwd"/></td>
							<td class="inputStyle"><img id="img01"  src="servlet/RandomCodeServlet"  /></td>
						</tr>					
						<tr>
							<td></td>
							<td colspan="2">
								<input title="记住用户名" id="chkbox_0" name="chkbox_0" type="checkbox" value="0" onclick="chkbox(this)"/>记住用户名&nbsp;
								<input title="记住密码" id="chkbox_1" name="chkbox_1" type="checkbox" value="1" onclick="chkbox(this)"/>记住密码&nbsp;
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2">
									<img  src="${ctx}/styles/images/btn_03.jpg" onClick="submitCheck()" width="83" height="25" style="cursor:pointer" />&nbsp;&nbsp;
									<img id="resetImg" src="${ctx}/styles/images/btn_05.jpg" onClick="reset()" style="cursor:pointer" width="83" height="25"/>
							</td>
						</tr>
						<tr>
							
							<td colspan="3"><div id="divFName"></div></td>
						</tr>
					</table>
			</div>
		</div>
	</form>
</body>
</html>

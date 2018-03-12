<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>
<head></head>
<link href="<c:url value="/styles/blue.css"/>" type="text/css" rel="stylesheet">
<script language="javascript">
	var AC_FL_RunContent = 0;
	//
	function quit(){
		window.parent.parent.location.href = "sysLogin.jsp" ; 
	}
	//
	function modiPwd(){
		window.parent.frames["contentFrame"].location.href="${ctx}/sysoperatorAction.do?method=topwdedit";
	}
	//
	function myWorkPlat(){
		//window.parent.frames["contentFrame"].location.href="bizplat.do?method=myplatform";
		//window.parent.parent.location.href="bizplat.do?method=myplatform";
	}
	//
	function displayHelpWindow(){
	   // window.parent.frames["contentFrame"].location.href="bizplat.do?method=helpManager";
	}
	//
	function updatePassword(){
		window.parent.frames["contentFrame"].location.href="sysOperatorAction.do?method=topwdedit";
	}
	//
	function changeSeg(){
		window.parent.frames["contentFrame"].location.href="bizplat.do?method=changeSeg";
	}
	//
	function changePrj(){
		var url=window.parent.frames["contentFrame"].location;
		url=url.toString().replace("&","@@");
		window.parent.frames["contentFrame"].location.href="bizplat.do?method=changePrj&contentFrameUrl="+url;
	}
	//
	
	
</script>

<body>
	<table width="100%" height="76" cellpadding="0" cellspacing="0">
		<tr height="76">
			<td class="logo"></td>
			<td class="logo_cen">
				<strong>
				
				&nbsp;&nbsp;
				</strong>
			</td>
			<td width="187"><img src="${ctx}/styles/images_red/top_right.jpg" width="351" border="0" usemap="#Map" /></td>
		</tr>
	</table>
	<map name="Map" id="Map">
	<area shape="rect" coords="258,22,334,45" href="sysLogin.jsp"  target="_parent" alt="退出" >
	<area shape="rect" coords="116,21,194,44" href="#" onclick="updatePassword();" style="noFocusLine:expression(this.onFocus=this.blur());" target="" alt="修改1密码">
	<area shape="rect" coords="23,21,110,44" href="#" onclick="myWorkPlat()" style="noFocusLine:expression(this.onFocus=this.blur());" target="" alt="我的工作台">
	<area shape="rect" coords="197,21,254,46" href="#" onclick="displayHelpWindow();" target="" alt="帮助" >
	</map>
</body>
</html>

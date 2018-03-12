<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>系统管理</title>
  <%@ include file="/commons/meta.jsp" %>
<style type="text/css">
<!--

body{

}

-->
</style>
 <script language="javascript">
	//
	$(function(){
		//
		$("#t").addClass("switch_img");
		//
		$("#t").click(function() {
			if(window.top.document.getElementById("mainFrame").cols!="0,5,*"){    
		    	$("#t").removeClass('switch_img').addClass("collapse_img"); 
		        window.top.document.getElementById("mainFrame").cols="0,5,*";
		    }else{    
		    	$(this).removeClass('collapse_img').addClass("switch_img"); 
		        window.top.document.getElementById("mainFrame").cols="175,5,*";
		    }
		});
		//
	})
</script>
</head>
<body class="body_switch">
	<div id="btnCtl">
		<div alt="收缩/展开边栏" id="t"/></div>
	</div>

</body>
</html>


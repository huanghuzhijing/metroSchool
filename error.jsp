<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>错误页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<!--//增加页面跳转	-->
	<script language="javascript" type="text/javascript">　 
	var percent=0;　         //百分比进度，显示在滚动条后面
	var element="||";      //滚动条单元竖线
	var elements="||";　   //滚动条当前竖线
	count();                //开始调用循环
	
	function count(){　 
	    percent=percent+10;    //每次百分比加10
	    elements =elements + element;  //滚动条当前竖线增加一个滚动条单元竖线
	    document.getElementById("bar").value=elements;  			//设置窗体loading表单中bar元素的当前值
	    document.getElementById("percentage").value=percent+"%"; //设置窗体loading表单中percentage元素的当前值
	    //alert(document.getElementsByName("percentage").value);  
	    //document.loading.bar.value=elements;
	    //document.loading.percentage.value=percent+"%";
	    if (percent<99){    
	    //alert("111");                //percent小于99则继续循环
	        setTimeout("count()",250);        //每500ms进行一次count()
	    }　 
	    else{
	    	//alert("222"); 
	    	window.history.back(-1);  //percent达到100时跳转
	    }　 
	}
	</script>	
	

  </head>
  
  <body onload="count();" > 
   <div align="center"><div align="left"><div align="center"><strong> 系统错误,请重新登录系统或者管理员联系！</strong> <strong></strong><br></div><strong></strong></div><blockquote><div align="left"><strong> 原因:</strong> <br></div></blockquote><blockquote><div align="left"><ul><li> 
    1.用户名称或者密码或者验证码错误;</li></ul></div></blockquote><blockquote><div align="left"><ul><li> 2.存在错误数据;</li></ul></div></blockquote><blockquote><div align="left"><ul><li> 3.系统内部错误;</li></ul></div></blockquote><blockquote><div align="left"> 
    <ul><li>......</li></ul></div></blockquote></div>
    <%-- <div align="center"><a href="" onclick="history.back();">返回</a></div>--%>
    
<p align="center">正在跳转，请稍候...</p>

<p align="center">
	
<input type="text" id="bar" name="bar" style="border-style:none; background-color:#D3E8D0; font-weight:bold" readonly />
<input type="text" id="percentage"  name="percentage" color="red" style="border-style:none; background-color:#FFFFFF; max-width:30px" readonly />
</p>

<p align="center">
如果您的浏览器不支持跳转，请点击<a href="#" onclick="history.back();">这里</a>手动跳转
</p>
  </body>
</html>

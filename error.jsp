<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>����ҳ��</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<!--//����ҳ����ת	-->
	<script language="javascript" type="text/javascript">�� 
	var percent=0;��         //�ٷֱȽ��ȣ���ʾ�ڹ���������
	var element="||";      //��������Ԫ����
	var elements="||";��   //��������ǰ����
	count();                //��ʼ����ѭ��
	
	function count(){�� 
	    percent=percent+10;    //ÿ�ΰٷֱȼ�10
	    elements =elements + element;  //��������ǰ��������һ����������Ԫ����
	    document.getElementById("bar").value=elements;  			//���ô���loading����barԪ�صĵ�ǰֵ
	    document.getElementById("percentage").value=percent+"%"; //���ô���loading����percentageԪ�صĵ�ǰֵ
	    //alert(document.getElementsByName("percentage").value);  
	    //document.loading.bar.value=elements;
	    //document.loading.percentage.value=percent+"%";
	    if (percent<99){    
	    //alert("111");                //percentС��99�����ѭ��
	        setTimeout("count()",250);        //ÿ500ms����һ��count()
	    }�� 
	    else{
	    	//alert("222"); 
	    	window.history.back(-1);  //percent�ﵽ100ʱ��ת
	    }�� 
	}
	</script>	
	

  </head>
  
  <body onload="count();" > 
   <div align="center"><div align="left"><div align="center"><strong> ϵͳ����,�����µ�¼ϵͳ���߹���Ա��ϵ��</strong> <strong></strong><br></div><strong></strong></div><blockquote><div align="left"><strong> ԭ��:</strong> <br></div></blockquote><blockquote><div align="left"><ul><li> 
    1.�û����ƻ������������֤�����;</li></ul></div></blockquote><blockquote><div align="left"><ul><li> 2.���ڴ�������;</li></ul></div></blockquote><blockquote><div align="left"><ul><li> 3.ϵͳ�ڲ�����;</li></ul></div></blockquote><blockquote><div align="left"> 
    <ul><li>......</li></ul></div></blockquote></div>
    <%-- <div align="center"><a href="" onclick="history.back();">����</a></div>--%>
    
<p align="center">������ת�����Ժ�...</p>

<p align="center">
	
<input type="text" id="bar" name="bar" style="border-style:none; background-color:#D3E8D0; font-weight:bold" readonly />
<input type="text" id="percentage"  name="percentage" color="red" style="border-style:none; background-color:#FFFFFF; max-width:30px" readonly />
</p>

<p align="center">
��������������֧����ת������<a href="#" onclick="history.back();">����</a>�ֶ���ת
</p>
  </body>
</html>

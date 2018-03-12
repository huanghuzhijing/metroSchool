<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%@ include file="/commons/meta.jsp"%>
		<STYLE type="text/css">
.headlink {
	FONT-SIZE: 12px;
	COLOR: #000000;
	FONT-FAMILY: 宋体;
	TEXT-DECORATION: none
}

html {
	width: 100%;
}

.headline {
	FONT-SIZE: 12px;
	FILTER: DropShadow(Color =   #ffffff, OffX =   1, OffY =   1, Positive =   1)
		;
	COLOR: #3c3c3c;
	LINE-HEIGHT: & nbsp;
}

.tabelfull { 
	background: #f2efea;
	border-top:1px solid #d0d0d0;
}
body{
	width: 100%;
	padding: 0 0 0 0;
	margin: 0 0 0 0;
	overflow: hidden;
}
</STYLE>
<script type="text/javascript" language=javascript>
	//
	var winWidth = 0;   
	//函数：获取尺寸 
	function findDimensions(){   //获取窗口宽度  
		if (window.innerWidth)
			winWidth = window.innerWidth;
		else if ((document.body) && (document.body.clientWidth))
			winWidth = document.body.clientWidth;   //获取窗口高度
		if (window.innerHeight)
			winHeight = window.innerHeight;   
		else if ((document.body) && (document.body.clientHeight)) 
			winHeight = document.body.clientHeight;   //通过深入Document内部对body进行检测，获取窗口大小 
		if (document.documentElement  && document.documentElement.clientHeight && document.documentElement.clientWidth)   {     winHeight = document.documentElement.clientHeight;
		    winWidth = document.documentElement.clientWidth;   }  
	}
	//
	function init(){
		//getNumb();
	  	findDimensions();
	  	$("#menu").width(winWidth+'px');
	}
	//
	function myWorkPlat(){
		window.parent.frames["contentFrame"].location.href="${ctx}/bizplat.do?method=myplatform";
	}
	//
	function getNumb(){
	   	$.ajax({
		   type: "POST",
		   url: "${ctx}/bizplat.do?method=getTransactMessageCount",
		   data: "id="+"",
		   success: function(msg){
		   		msg = msg.split(";");
		   		$("#numb01").html(msg[0]);
		   		$("#numb02").html(msg[1]);
		   }
		});	
		var timeCount=parseInt('<fmt:message key="project.time.fresh"/>') ;
		settimes(timeCount);
   }
 </script>
</head>
	<body onload='init()' onresize='init()'>
		<table id='menu' class='tabelfull' border="0" cellpadding="0">
			<tr>
				<td height="30">
					<table border="0" cellspacing="0" cellpadding="0" width="100%">
						<tr>
							<td style="text-align: left;">&nbsp;&nbsp;&nbsp;
<font style='font-weight:bold;'>${userinfo.username}</font>&nbsp;&nbsp;您好，欢迎您进入本系统！
<%--									<a onclick="myWorkPlat()" href="#">待办事项(<span id="numb02"></span>)条</a>--%>
							</td>
							<td style="text-align: right;">
								<div id="jb51" style="margin-right:20px;font-color:#6C86A8;width:50%"></div>
								<script>
									setInterval("document.getElementById('jb51').innerHTML='当前时间：'+new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
								</script>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>





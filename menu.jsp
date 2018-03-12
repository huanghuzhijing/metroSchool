<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
	//
	var sysdate = new Date() ;
	var syshour = sysdate.getHours();
	var showtime ;
	
	lypmenucount=3;
	OB_Top=0;
	OB_Left=0;
	OB_Margin=10;
	OB_Width=140;
	OB_SlideSpeed=10;
	OB_BackgroundColor="#3671BD";
	OB_BackgroundInnerColor="#C6DFF7";
	OB_ButtonFontFamily="";
	OB_LabelFontFamily="";
	OB_ItemsSpacing=2;
	OB_BorderWidth=0;
	OB_BorderStyle="solid";
	OB_BorderColor="#849AB5";
	OB_IconsWidth=22;
	OB_IconsHeight=48;
	OB_ButtonFontSize=9;
	OB_ButtonFontColor="#000063";
	OB_ButtonHeight=28;
	OB_LabelFontSize=12;
	OB_LabelFontColor="#000066";
	OB_LabelMargin=0;
	OB_UpArrow="images/menu/up.png";
	OB_DownArrow="images/menu/down.png";
	OB_ArrowWidth=16;
	OB_ArrowHeight=16;
	OB_ArrowSlideSpeed=22;
	
	var winWidth = 0;   
	var winHeight = 0;
	
	if((syshour>=0 && syshour <= 4)||(syshour>=18 && syshour <= 23) ){
		showtime = "晚上好！";
	}
	else if(syshour>4 && syshour <12 ){
		showtime = "上午好！" ;
	}
	else if(syshour >= 12 && syshour < 18 ){
		showtime = "下午好！" ;
	}
	
	//
	${menudate}
	function getFFolder(){
		//解析一级菜单
		var CODELEN=4;
		var result=[];
		var temp='';
		var k=1;
		//alert(temp1);
		while(eval("window.OutBarFolder"+k)){
			var ffolder=eval("OutBarFolder"+k)[0];
			if(ffolder.treecode.length==CODELEN && ffolder.isMMenu == "false")result.push(ffolder);//长度符合一级菜单编码长度的则为一级菜单
			k++;
		}		
		return result;
	}
	//
	function showFMenu(){
	
		
		//解析出所有的一级菜单，并显示在顶部BY  WN
		var ffolder=getFFolder();//得到一级菜单数组
		
		var target=document.getElementById("tfolder_div");	
			if (!target){
				alert("显示区域不存在");//
			}else{
				//循环显示二级子菜单
				target.innerHTML="";//清空原有内容			
				for (var i=0;i<ffolder.length;i++){	
					var tmpDiv = createEl("div");
					var target_arr=ffolder[i].target.split(".");
					tmpDiv.innerHTML="<span  id='"+ffolder[i].treecode+"' align='center' onclick=cTarget('"+ffolder[i].treecode+"')>"+ffolder[i].title+"</span>";		
					if(i==${subPage}){
						$(tmpDiv).find('span').addClass('tabgroup_on');	
					}
					else{
						$(tmpDiv).find('span').addClass('tabgroup_off');
					}
					
					target.innerHTML=target.innerHTML+$(tmpDiv).html();
				}
				$(target).find('.verticleLine:last').hide();
				$(target).find('p:first').css('padding-left','15px');
				//在这里加入用户信息 logo当前用户:
				target.innerHTML="<table width='100%' height=33 cellspacing=0 cellpadding=0 ><tr><td class=td_left>"+target.innerHTML+"</td><td class=td_middle>&nbsp;</td><td class=td_right><div style='color:#ffffff;height:31px;line-height:31px;text-align:left;float:right;margin-right:10px;'></div></td></tr><tr><td colspan='3' background='${ctx}/styles/menu/images/split.jpg' height='3'></td></tr></table>";
				//
				$("#tfolder_div").find('span').click(function(){
					$("#tfolder_div").find('span').addClass('tabgroup_off');
					$(this).removeClass('tabgroup_off');
					$(this).addClass('tabgroup_on');
				});	
			}
			
			
	}
	//
	function createEl(tag) {
		return document.createElement(tag);
	}
	//
	function cTarget(code){
		top.frames['menuFrame'].location.href="bizplat.do?method=bizPlatSubMenu&hitFlag=1&nodecode="+code;
		//top.frames['contentFrame'].location.href="receiveFileAction.do?method=create";
	}
	//
	function init(){
		if(parseInt(${code})==0){//显示一级菜单
			findDimensions();
			$("#tfolder_div").css('width',winWidth+'px');
			$("#tfolder_div").css('backgroundColor','#E8E8E8');
		}
	}
	//
	function resizeinit(){
	}
	//
	function onLogin(){
		var open_page=sysdate.getTime()+'_page';
		var url="<fmt:message key='project.url'/>/loginsystem.do?method=login";
		var screenDimensions=getScreenDimensions();
		document.getElementById("loginSystemForm").action=url;
		document.getElementById("loginSystemForm").target=open_page; 
		var popupWin=window.open("about:blank",open_page,'height='+screenDimensions.y+', width='+screenDimensions.x+', top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes');
		document.getElementById("loginSystemForm").submit();
	}
	//
	//函数：获取尺寸  
	function findDimensions(){   
		//获取窗口宽度  
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
		    return {x:winWidth,y:winHeight};
	}
</script>
</head>
<body leftmargin=0  class="body_hidden" topmargin=0 onselectstart="return false;" onload='init()' onresize="resizeinit()">
<script type="text/javascript">
if(parseInt(${code})==0){
	//创建以及显示一级菜单
	document.write("<DIV class='tmenu_div' id='tfolder_div'/>");
	showFMenu();
}else{
	document.write('<script type="text/javascript" src="${ctx}/scripts/sdmenu/sdmenu.js"><\/script>');
	document.write('<script type="text/javascript" src="${ctx}/scripts/sdmenu/mtMenu.js"><\/script>');
	var myMenu;
	window.onload = function() {
		//生成菜单
		$("#my_menu").show();
		loadMenuBars();
		var o=findDimensions();	
		myMenu = new SDMenu("my_menu");
		myMenu.oneSmOnly = true;	
		myMenu.showNum=9;//默认显示多少个子菜单	
		myMenu.speed=5;//速度		
		myMenu.MaxHeight=o.y;//最大高度
		myMenu.init();		
		var firstSubmenu = myMenu.submenus[0];
		myMenu.expandMenu(firstSubmenu);      // Expand a submenu
	};
}	
</script>
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
				<div style="display:none;" id="my_menu" class="sdmenu"></div>
			</td>
		</tr>
		
	</table>
	<form action="${ctx}/loginsystem.do?method=login" id="loginSystemForm" method="post" target="_blank">
		<input type="hidden" name="fsname" value="${userinfo.username }"/>
		<input type="hidden" name="fspassw" value="${userinfo.password }"/>
	</form>
</body>
</html>
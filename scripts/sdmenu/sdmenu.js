function SDMenu(id) {
	if (!document.getElementById || !document.getElementsByTagName)
		return false;
	this.menu = document.getElementById(id);
	this.submenus = jQuery(".sdmenu_div");//this.menu.getElementsByTagName("div");
	this.remember = false;
	this.speed = 3;	
	this.markCurrent = true;
	this.oneSmOnly = true;
	this.showNum = 4;//显示多少个二级菜单
	this.tiaojie=180;//根据浏览器差异进行的调节变量
	this.MaxHeight=462;
	this.menuHeight=27;//一级菜单的高度
	this.smenuHeight=38;//二级菜单的标准高度34	
}
SDMenu.prototype.init = function() {
	var mainInstance = this;
	//界面根据浏览器进行微调
	if (!document.all){
		this.tiaojie=1;//根据浏览器差异进行的调节变量
		this.menu.style.marginTop="0px";//如果是FF的话往上调。
	}
	else{
		this.tiaojie=0;//根据浏览器差异进行的调节变量
		this.smenuHeight=28;//二级菜单的标准高度24	
	}
	for (var i = 0; i < this.submenus.length; i++)
		this.submenus[i].getElementsByTagName("span")[0].onclick = function() {
			mainInstance.toggleMenu(this.parentNode);
	};
	//加入响应事件
	var links = this.menu.getElementsByTagName("a");
	var sdMenuO=this;
	for (var i = 0; i < links.length; i++){
		links[i].onclick = function() {
		var item=this;
		
			if(jQuery(item).attr("link").indexOf("javascript")!=-1) 
			{	eval(jQuery(item).attr("link"));
			}
			else if (jQuery(item).attr("link")!="")
			{   //先显示等待信息,再转向
			    sdMenuO.showWait(item);
				eval(jQuery(item).attr("targetFrame")+".location='"+jQuery(item).attr("link")+"'");
				
			} 
		    if (sdMenuO.markCurrent) {
					for (var i = 0; i < links.length; i++){
					  	links[i].className = "";
					}
					item.className = "current";	//给当前链接加上样式			
			}
		};
	}
	if (this.remember) {
		var regex = new RegExp("sdmenu_" + encodeURIComponent(this.menu.id) + "=([01]+)");
		var match = regex.exec(document.cookie);
		if (match) {
			var states = match[1].split("");
			for (var i = 0; i < states.length; i++)
				this.submenus[i].className = (states[i] == 0 ? "collapsed" : "");
		}
	}
};
SDMenu.prototype.showWait = function(targetMenu) {
	//显示等待信息
	//获取当前显示的页面链接
	try{
		var targetFrame=parent.contentFrame;
		if(jQuery(".current")&&jQuery(".current").attr("targetFrame")){
		 targetFrame=eval(jQuery(".current").attr("targetFrame"));
		}
		var locateDiv=targetFrame.document.createElement("DIV"); //定位层
		jQuery(locateDiv).css({"position":"absolute","left":"45%","top":"40%","border":"3px solid #B2D0F7","text-align":"center","background":"white url(../widgets/loading/images/block-bg.gif) repeat-x","padding":"10px","font":"bold 14px verdana,tahoma,helvetica","color":"#003366","width":"180px","top":"40%","border":"1px solid gray","filter":"progid:DXImageTransform.Microsoft.gradient(startcolorstr=#FFffff,endcolorstr=#E6EFFB,gradientType=0)"});
		var oDiv=targetFrame.document.createElement("DIV"); 
		oDiv.style.zIndex=20000;
		jQuery(oDiv).css({"font-size":"8pt","background-image":"url(../widgets/loading/images/loading.gif)","background-repeat":"no-repeat","background-position":"top left","padding-left":"20px","height":"18px","text-align":"left"});
		oDiv.innerHTML="页面正在加载中";	
		locateDiv.appendChild(oDiv);  
	 	targetFrame.document.body.appendChild(locateDiv);
	 	var time =".";
	 	setInterval(function(){
	 		try{
	 			if(oDiv&&oDiv.innerHTML){
	 				if(time.length<5){
	 					time += "." ;
	 				}else{
	 					time="." ;
	 				}
	 				oDiv.innerHTML="页面正在加载中"+time;
	 			}
	 		}
	 		catch(er){
	 		}	
	 	},300); 
 	}
 	catch(e){
 	}
};
SDMenu.prototype.toggleMenu = function(submenu) {
	if (submenu.className == "collapsed")
		this.expandMenu(submenu);
	else
		this.collapseMenu(submenu);
};
SDMenu.prototype.getIndex = function(submenu) {//获取索引
	for(var i=0;i<this.submenus.length&&this.submenus[i]!=submenu;i++);
	if(i>this.submenus.length)return -1;
	else
	return i;
};
SDMenu.prototype.expandMenu = function(submenu) {
	var index=this.getIndex(submenu);//获取索引
	//获取二级菜单高度
	var fullHeight = submenu.getElementsByTagName("span")[0].offsetHeight;
	var tmpHeight=fullHeight;
	var links = submenu.getElementsByTagName("a");
	//获得底下DIV的ID
	var submenu_div=submenu.getElementsByTagName("div")[0];
	//在这里设置显示个数
	//先计算理论上可以显示的个数
	//计算并除去所有一级菜单所占的高度
	var spareHeight=this.MaxHeight-this.menuHeight*this.submenus.length;
	var smenuNum=Math.floor(spareHeight/this.smenuHeight);
	
	if (!document.all)smenuNum=this.showNum;
	var smenuNum1=smenuNum>links.length?links.length:smenuNum;//实际显示的最少数量二级菜单
	//得到对应的显示高度
	submenu_div.className = "submenu";//控制底下DIV样式
	for (var i = 0; i < smenuNum1; i++)
		fullHeight += links[i].offsetHeight;
	//界面根据浏览器进行微调
//	if (document.all){	
//	for (var i = smenuNum1; i < smenuNum; i++)
//		fullHeight += this.smenuHeight;
//	}			
	//fullHeight -=	this.tiaojie;
	var moveBy = Math.round(this.speed * smenuNum);
	var mainInstance = this;
	var intId = setInterval(function() {
		var curHeight = submenu.offsetHeight;
		var newHeight = curHeight + moveBy;
		
		if (newHeight < fullHeight)
			submenu.style.height = newHeight + "px";
		else {
			clearInterval(intId);
			submenu.style.height = "";
			submenu.className = "";
			//submenu_div.className = "";//控制底下DIV样式
			mainInstance.memorize();
		}
	}, 30);
	
	submenu_div.style.height = (fullHeight-tmpHeight+this.tiaojie)+"px";//控制底下DIV样式
	this.collapseOthers(submenu);
};
SDMenu.prototype.collapseMenu = function(submenu) {
	var minHeight = submenu.getElementsByTagName("span")[0].offsetHeight;
	var fullHeight = minHeight;
	var tmpHeight=fullHeight;	
	//获得底下DIV的ID
	var submenu_div=submenu.getElementsByTagName("div")[0];
	submenu_div.className = "";//控制底下DIV样式	
	//submenu_div.style.height	
	//alert(submenu_div.style.height);
	submenu_div.style.height="0px";	
	submenu.style.height=(parseInt(submenu_div.style.height)+tmpHeight)+"px";
		
	var moveBy = Math.round(this.speed * submenu.getElementsByTagName("a").length);
	var mainInstance = this;
	var intId = setInterval(function() {
		var curHeight = submenu.offsetHeight;
		var newHeight = curHeight - moveBy;
		if (newHeight > minHeight)
			submenu.style.height = newHeight + "px";
		else {
			clearInterval(intId);
			submenu.style.height = "";
			submenu.className = "collapsed";
			mainInstance.memorize();
		}
	}, 30);
};
SDMenu.prototype.collapseOthers = function(submenu) {
	if (this.oneSmOnly) {
		for (var i = 0; i < this.submenus.length; i++)
			if (this.submenus[i] != submenu && this.submenus[i].className != "collapsed")
				this.collapseMenu(this.submenus[i]);
	}
};
SDMenu.prototype.expandAll = function() {

	var oldOneSmOnly = this.oneSmOnly;
	this.oneSmOnly = false;
	for (var i = 0; i < this.submenus.length; i++)
		if (this.submenus[i].className == "collapsed")
			this.expandMenu(this.submenus[i]);
	this.oneSmOnly = oldOneSmOnly;
};
SDMenu.prototype.collapseAll = function() {
	for (var i = 0; i < this.submenus.length; i++)
		if (this.submenus[i].className != "collapsed")
			this.collapseMenu(this.submenus[i]);
};
SDMenu.prototype.memorize = function() {
	if (this.remember) {
		var states = new Array();
		for (var i = 0; i < this.submenus.length; i++)
			states.push(this.submenus[i].className == "collapsed" ? 0 : 1);
		var d = new Date();
		d.setTime(d.getTime() + (30 * 24 * 60 * 60 * 1000));
		document.cookie = "sdmenu_" + encodeURIComponent(this.menu.id) + "=" + states.join("") + "; expires=" + d.toGMTString() + "; path=/";
	}
};
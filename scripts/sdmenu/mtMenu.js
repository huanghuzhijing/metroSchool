// Initialization, you can leave this here or move this somewhere else
var CODELEN=4;	
var targetFrame ;
var url  ;		

function loadMenuBars() {
	var j=1;
	while(eval("window.OutBarFolder"+j)){		
		var menubar=createMenubar(eval("OutBarFolder"+j),j);
		jQuery('#my_menu').append(menubar);
		j++;
	}
	if(url != null && targetFrame != null){
		 //var initurl = window.parent.frames["contentFrame"].location.href ;
		 //var initArr = initurl.split("=");
		 //var init = initArr[initArr.length-1];
		 //if(init != "init"){
		 //	window.parent.frames["contentFrame"].location.href = url ;
		 //}else{
		 //	window.parent.frames["contentFrame"].location.href = initurl+"_001";
		 //}
	}
}

function createMenubar(obj,j) {
	var menubar=new Array();
	var picCount=1;
	var ran=Math.ceil(Math.random()*10);
	//生成二级菜单
	menubar.push('<div class="sdmenu_div"><span><font class="fmenu_div">'
				+obj[0].title+'</font></span><div  style="overflow-y:auto">');
	var Folder=getSFolder(obj);
	//生成三级菜单
	for(var i=0;i<Folder.length;i++)
	{ 
		if(Folder[i].link.indexOf("javascript")!=-1) 
		{	
			
			menubar.push("<a  link='"+Folder[i].link+"' href='javascript:;' onClick='"+Folder[i].link+"' >"+Folder[i].title+"</a>");
		}
		else if (Folder[i].link!="")
		{
			menubar.push("<a  link='"+getLink(Folder[i].link,"treecode="+Folder[i].treecode)+"' targetFrame='"+Folder[i].target+"' href='javascript:;'  >"+Folder[i].title+"</a>");
		}
		if(j==1 && i== 0){
			targetFrame = Folder[i].target ;
			url = Folder[i].link ;
		}
	}
	if(Folder.length==0){
		//长度为0，初始化一个无菜单选项
		//menubar.push("<a  href='javascript:;' onClick=alert('当前菜单无二级菜单') >当前无二级菜单</a>");
		return null ;
	}
	menubar.push('</div></div>');			
	return menubar.join("");
}
function getLink(url,varStr){//添加新变量到地址栏中
	if(url.indexOf("?")!=-1){
		//存在后续参数
		url+="&"+varStr;
	}
	else{
		url+="?"+varStr;
	}
	return url;
}
function getPicUrl(picCount){
	//BY wn
	var total=19;//ͼ
	var prefix="";//׺
	picCount=(picCount)%total;
	picCount=picCount==0?total:picCount;
	return prefix+picCount;
}
function getSFolder(Folder){
	var result=new Array();
	var temp='',temp1=Folder[0].treecode;
	for(var idx=1;idx<Folder.length;idx++) {
		temp=Folder[idx].treecode+'';
		if(temp.length==temp1.length+CODELEN&&temp.indexOf(temp1)==0)
		result.push(Folder[idx]);
	}
	return result;
}
			

	

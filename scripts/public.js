function DateDiff(interval,date1,date2){
	var long = date2.getTime() - date1.getTime(); //相差毫秒
	switch(interval.toLowerCase()){
		case "y": return parseInt(date2.getFullYear() - date1.getFullYear());
		case "m": return parseInt((date2.getFullYear() - date1.getFullYear())*12 + (date2.getMonth()-date1.getMonth()));
		case "d": return parseInt(long/1000/60/60/24);
		case "w": return parseInt(long/1000/60/60/24/7);
		case "h": return parseInt(long/1000/60/60);
		case "n": return parseInt(long/1000/60);
		case "s": return parseInt(long/1000);
		case "l": return parseInt(long);
	}
}
function parseDate(strDate) {
	if(typeof(strDate)=='string') {
		return new Date(strDate.replace(/-/g,"/"));
	}
	return strDate;
}
function DateAdds(startdate,dadd,oper){  	   
		startdate = startdate.valueOf();
		startdate = eval('startdate '+oper+' dadd * 24 * 60 * 60 * 1000');
		startdate = new Date(startdate);
		return startdate;       
}   
function formatDate(date,split,mode)
{
	if(date==null||date=="")
		return "";

	var splitFlag = "-";
	if(split == undefined)
	{
		splitFlag = "-";
	}
	else
	{
		splitFlag = split;
	}	
	var tmp_month = date.getMonth() + 1;
	if(tmp_month < 10)
	{
		tmp_month = "0" + tmp_month; 
	}
	var tmp_date = date.getDate();
	if(tmp_date < 10)
	{
		tmp_date = "0" + tmp_date;
	}	
	if(mode&&mode==2){
	//"yy-mm-dd hh-nn-ss"
	var splitFlag1=":";
	var hh=date.getHours();
	var nn=date.getMinutes();
	var ss=date.getSeconds();
	return date.getFullYear() + splitFlag + tmp_month + splitFlag + tmp_date+" "+ hh+ splitFlag1 + nn+ splitFlag1+ ss;
	}
	return date.getFullYear() + splitFlag + tmp_month + splitFlag + tmp_date;
}

/*工具类*/
function SHOWTIP(tip,target)
{//显示提示的公共调用函数,id为每个显示层需指定一个ID,可为空.tip:提示信息;target:要绑定的对象
return new Tooltip({tip:tip,target:target});
}
/*工具类*/
function sAlert(id,str,url,uwidth,uheight,uleft,utop){ 
	sSuc(id);//先清空已有的层

   var msgw,msgh,bordercolor; 
   id=id?id:"";//ID
   msgw=uwidth?uwidth:400;//提示窗口的宽度 
   msgh=uheight?uheight:100;//提示窗口的高度  
   uleft=uleft?uleft:"20%";
   //utop=utop?utop:"20%";
   utop = getScrollTop()+75 ;   
   titleheight=25; //提示窗口标题高度 
   bordercolor="gray";//"#336699";//提示窗口的边框颜色 
   titlecolor="#C0CDEA";//"#99CCFF";//提示窗口的标题颜色 
    
   var sWidth,sHeight; 
   sWidth=document.body.offsetWidth; 
   sHeight=screen.height; 
   var bgObj=document.createElement("div"); 
   bgObj.setAttribute('id',id+'bgDiv'); 
   bgObj.style.position="absolute"; 
   bgObj.style.top="0"; 
   bgObj.style.background="#777"; 
   bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75"; 
   bgObj.style.opacity="0.6"; 
   bgObj.style.left="0"; 
   bgObj.style.width=sWidth + "px"; 
   bgObj.style.height=sHeight + "px"; 
   bgObj.style.zIndex = "10000"; 
   if(str)document.body.appendChild(bgObj); 
    
   var msgObj=document.createElement("div") 
   msgObj.setAttribute("id",id+"msgDiv"); 
   msgObj.setAttribute("align","center"); 
   msgObj.style.background="white"; 
   msgObj.style.border="1px solid " + bordercolor; 
      msgObj.style.position = "absolute"; 
            msgObj.style.left = uleft; 
            msgObj.style.top = utop; 
            msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif"; 
            msgObj.style.marginLeft = "0px" ; 
            msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px"; 
            msgObj.style.width = msgw + "px"; 
            msgObj.style.height =msgh + "px"; 
            msgObj.style.textAlign = "center"; 
            msgObj.style.lineHeight ="25px"; 
            msgObj.style.zIndex = "100001"; 
    
     var title=document.createElement("h4"); 
     title.setAttribute("id",id+"msgTitle"); 
     title.setAttribute("align","right"); 
     title.setAttribute("valign","middle");      
     title.style.margin="0"; 
     title.style.padding="0px"; 
     title.style.width=msgw+"px"; 
     title.style.background=titlecolor;//bordercolor; 
     title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);"; 
     title.style.opacity="0.75"; 
     title.style.border="0px solid " + bordercolor; 
     title.style.height=titleheight+"px"; 
     title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif"; 
     title.style.color="black"; 
     title.style.cursor="pointer"; 
     var closetitle=document.createElement("span");     
     closetitle.innerHTML="关闭[X]";
	 closetitle.style.color="black";     
     title.appendChild(closetitle);
    // title.innerHTML="关闭[X]"; 
     closetitle.onclick=function(){ 
 
          if(str)document.body.removeChild(bgObj); 
                document.getElementById(id+"msgDiv").removeChild(title); 
                obj=document.getElementById("msgframe");
				obj.src="javascript:false";
				obj.removeNode(true); 
				obj=null  ;
				document.body.removeChild(msgObj); 
         		msgObj.removeNode(true); 
				msgObj=null  ;
                } 
    closetitle.onmouseover=function(){ 
 		closetitle.style.color="red";          
                }      
    closetitle.onmouseout=function(){ 
 		closetitle.style.color="black";          
                }   
     

            
     title.onmousedown=function(){
     dragStart(msgObj);
     }   
     document.body.appendChild(msgObj); 
     document.getElementById(id+"msgDiv").appendChild(title); 
     var txt=document.createElement("p"); 
 
     txt.style.margin="1em 0" 
     txt.setAttribute("id",id+"msgTxt"); 
     txt.innerHTML=str?str:"<iframe name='msgframe' id='msgframe' src='"+url+"' style='margin-top:-12px;width:"+msgw+"px;height:"+(msgh-titleheight)+"px;overflow:auto' ></iframe>"; 
           document.getElementById(id+"msgDiv").appendChild(txt); 
     title.setAttribute("canmove","true");   
                title.setAttribute("forid",id+"msgDiv");  

       
       
           
            } 
            
            
function dragStart(obj){
  obj.deltaX = event.clientX - obj.offsetLeft+0;
  obj.deltaY = event.clientY - obj.offsetTop-75;
  obj.onmousemove = new Function("dragMove(this)");
  obj.onmouseup = new Function("dragDone(this)");
  obj.setCapture();
}

function getScrollTop() {   
    var scrollPos = 0;    
    if (typeof window.pageYOffset != 'undefined') {    
       scrollPos = window.pageYOffset;    
    }    
    else if (typeof window.document.compatMode != 'undefined' &&    
       window.document.compatMode != 'BackCompat') {    
       scrollPos = window.document.documentElement.scrollTop;    
    }    
    else if (typeof window.document.body != 'undefined') {    
       scrollPos = window.document.body.scrollTop;    
    }    
    return scrollPos;   
}

function dragMove(obj){
	var winWidth = 0;   
	var winHeight = 0 ;  
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
	var oleft = event.clientX - obj.deltaX ;
	var lim = winWidth-(obj.style.width.replace("px","")-0) ;
	if(oleft < 0 ){
  		obj.style.left = 0 ; 
  	}else if(oleft > 0 && oleft <= lim ){
  		obj.style.left = oleft;
  	}else if(oleft > lim){
  		obj.style.left = lim;
  	}
  	var oTop = event.clientY - obj.deltaY;
  	if(oTop < 75 ){
  		obj.style.top = 75 ;
  	}
  	else{
  		obj.style.top = oTop;	
  	}
}
 
 
 

function dragDone(obj){
  obj.onmousemove = null;
  obj.onmouseup = null;
  obj.releaseCapture();
}

            
            
function sSuc(id){
//确定后关闭sAlert,需要提供id
				id=id?id:"";
				var bgObj=document.getElementById(id+"bgDiv");
				if(bgObj)document.body.removeChild(bgObj); 
				var msgObj=document.getElementById(id+"msgDiv");         
                if(msgObj)document.body.removeChild(msgObj); 
}            
function sSucR(id){
//确定后关闭sAlert,需要提供id
				//sSuc(id);
				
				window.location.reload(true);
} 
function findDimensions() //函数：获取尺寸  
{   //获取窗口宽度  
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
    var result=[];
    result.push(winWidth);
    result.push(winHeight);
    return result;
}
function ajaxFile(id){
//调用ajax上传窗口
id=id?id:'';
//alert("/widgets/swfupload/index.jsp?targetform="+targetform);
//sAlert(null,null,path+"/widgets/swfupload/index.jsp?targetform="+targetform,400,250);
var div1=$(id+"ajaxBar");//取得进度条窗口所在DIV
div1.style.display="block";//显示进度窗口
setTimeout('chooseFile('+id+')',1);
}
function chooseFile(id){
//调用ajax上传窗口
id=id?id:'';
//alert("/widgets/swfupload/index.jsp?targetform="+targetform);
//sAlert(null,null,path+"/widgets/swfupload/index.jsp?targetform="+targetform,400,250);
var msgframe=eval(id+"barframe");//取得进度条窗口

if(msgframe)msgframe.chooseFile();
}
function ajaxUpload(id){
//调用ajax上传窗口
id=id?id:'';
//alert("/widgets/swfupload/index.jsp?targetform="+targetform);
//sAlert(null,null,path+"/widgets/swfupload/index.jsp?targetform="+targetform,400,250);
var msgframe=eval(id+"barframe");//取得进度条窗口

if(msgframe)msgframe.sUpload();
}

function ajaxBar(id,path,targetform,fwidth,fheight){//JS 生成进度条

id=id?id:'';
fwidth=fwidth?fwidth:420;
fheight=fheight?fheight:160;
var url=path+"/widgets/swfupload/index.jsp?targetform="+targetform;
var output="<div id='"+id+"ajaxBar"+"' style='display:none;width:"+fwidth+"px;height:"+fheight+"px;'> <iframe name='"+id+"barframe' src='"+url+"' style='width:"+fwidth+"px;height:"+fheight+"px;overflow:auto' ></iframe></div>"; 
 document.write(output);
}

function textCounter(inputField, displayField, maxlimit){
  var inputObject = document.getElementById(inputField);
  var displayObject = document.getElementById(displayField);
  var objectLength = inputObject.value.lengthCheck();
  if(objectLength > maxlimit){
      inputObject.value = substr(inputObject.value, maxlimit);  
  }else{
      displayObject.innerText ="还能输入"+(maxlimit - inputObject.value.lengthCheck())+"个字符！";  
  }
}

function textFontCounter(inputField, displayField, maxlimit){
  var inputObject = $(inputField);
  var displayObject = $(displayField);
  var objectLength = inputObject.value.lengthCheck();
  if(objectLength > maxlimit){
      inputObject.value = substr(inputObject.value, maxlimit);  
  }else{
      displayObject.innerText =inputObject.value.lengthCheck();  
  }
}

function checkTextarea(field,maxlength){
   		var fieldValue = $F(field);
   		if(fieldValue.lengthCheck() > maxlength){
   			alert("输入的内容长度必须在"+maxlength+"个字符以内!");
   			$(field).value = "";
   			$(field).focus();
   			return false;
   		}
   		return true;
}

String.prototype.lengthCheck = function() {
    var cArr = this.match(/[^x00-xff]/ig);
    return this.length + (cArr == null ? 0 : cArr.length);
}

function upreport(ctx,objectid,turnflag){
	ret = window.confirm("上报后信息不能被编辑，是否确定上报？");
	if(ret)
		location.href=ctx+'.do?method=upreport&turnflag='+turnflag+'&objectid='+objectid;
}
function substr(str, len) {     
	if(!str || !len) { 
		return ''; 
	}      
	//预期计数：中文2字节，英文1字节     
	var a = 0;      
	//循环计数     
	var i = 0;      
	//临时字串     
	var temp = '';      
	for (i=0;i<str.length;i++)  { 
		if (str.charCodeAt(i)>255){ 
			//按照预期计数增加2 
			a+=2; 
		} else {             
			a++;         
		}
		//如果增加计数后长度大于限定长度，就直接返回临时字符串 
		if(a > len) { 
			return temp; 
		}
		//将当前内容加到临时字符串         
		temp += str.charAt(i);     
	}     
	//如果全部是单字节字符，就直接返回源字符串     
	return str; 
}
/*屏蔽F5刷新*/
//调用示例:document.onkeydown= DisableF5; //屏蔽F5刷新
function DisableF5()   
{   
  if ((window.event.keyCode==116)|| //屏蔽 F5   
      (window.event.keyCode==122)|| //屏蔽 F11   
      (window.event.shiftKey && window.event.keyCode==121) //shift+F10   
     )   
     {    
          window.event.keyCode=0;   
         // window.event.returnValue=false;   
     }    
  if ((window.event.altKey)&&(window.event.keyCode==115))   
     {    
         //屏蔽Alt+F4   
         window.showModelessDialog("about:blank","","dialogWidth:1px;dialogheight:1px");   
         return false;   
     }   
  
}
/*屏蔽右键*/  
//调用示例:
/*
if (window.Event) 
  document.captureEvents(Event.MOUSEUP); 
document.oncontextmenu = nocontextmenu; // for IE5+  
document.onmousedown = norightclick; // for all others  //屏蔽右键
*/
function nocontextmenu()   
{    
 event.cancelBubble = true    
 //event.returnValue = false;    
 return false;    
}    
function norightclick(e){    
 if (window.Event){    
  if (e.which == 2 || e.which == 3)    
  return false;    
 }    
 else if (event.button == 2 || event.button == 3){    
   event.cancelBubble = true    
  // event.returnValue = false;    
   return false;    
  }    
}    
function sys_issue(url){
	if(window.confirm("您确定此操作？"))
	{   
		location.href=url;
	}
}

/*报表获取初始化容器大小*/
function initSize(w,h) //函数：获取尺寸  
{ 
	var winWidth = 0;   
	var winHeight = 0 ;  
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
	document.getElementById("DivContainer").style.width = winWidth-w ;
	document.getElementById("DivContainer").style.height = winHeight*h ;
	
	
}

/**num表示要四舍五入的数，保留v小数*/
function decimal(num,v){
    var vv = Math.pow(10,v);
    var f_x=Math.round(num*vv)/vv;
    var s_x = f_x.toString();
    var pos_decimal = s_x.indexOf('.');
    if (pos_decimal < 0)
    {
      pos_decimal = s_x.length;
      s_x += '.';
    }
    while (s_x.length <= pos_decimal + v)
    {
      s_x += '0';
    }
    return s_x;
}
/**num表示要四舍五入的数，保留两位小数*/
function decimal2(num){
    var vv = Math.pow(10,2);
    var f_x=Math.round(num*vv)/vv;
    var s_x = f_x.toString();
    var pos_decimal = s_x.indexOf('.');
    if (pos_decimal < 0)
    {
      pos_decimal = s_x.length;
      s_x += '.';
    }
    while (s_x.length <= pos_decimal + 2)
    {
      s_x += '0';
    }
    return s_x;
}
/**num表示要四舍五入的数，保留四位小数*/
function decimal4(num){
    var vv = Math.pow(10,4);
    var f_x=Math.round(num*vv)/vv;
    var s_x = f_x.toString();
    var pos_decimal = s_x.indexOf('.');
    if (pos_decimal < 0)
    {
      pos_decimal = s_x.length;
      s_x += '.';
    }
    while (s_x.length <= pos_decimal + 4)
    {
      s_x += '0';
    }
    return s_x;
}



function validateData(obj){
      value = obj.value;
      if(value != null){
         if(isNaN(value)){
             obj.value = "";
             obj.focus();
             return false;
         }
      }
      return true;
}

/**验证日期格式YYYY-MM-DD HH:mm **/
function  CheckDateTime(dataTime){ 
	var  reg  =  /^(\d{4})-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2})$/;    
	var  str_= dataTime;
	var str = str_.substring(0,16);
	var  r  =  str.match(reg);
	
	if(r==null){
		 alert("输入日期格式不正确，请重新输入！");
		 return  false;
	}
	r[2]=r[2]-1;    
	var  d=  new  Date(r[1],  r[2],r[3],  r[4],r[5]);    
	if(d.getFullYear()!=r[1]){
		 alert("输入日期格式不正确，请重新输入！");
		 return  false;
	}  
	if(d.getMonth()!=r[2]){
		 alert("输入日期格式不正确，请重新输入！");
		 return  false;
	}   
	if(d.getDate()!=r[3]){
		 alert("输入日期格式不正确，请重新输入！");
		 return  false;
	}   
	if(d.getHours()!=r[4]){
		 alert("输入日期格式不正确，请重新输入！");
		 return  false;
	}    
	if(d.getMinutes()!=r[5]){
		 alert("输入日期格式不正确，请重新输入！");
		 return  false;
	}   
	return  true;  
}

//截取显示字符obj:jQuery对象,showsize:显示长度
function initContent(obj,showsize){
	obj.each(function(){
		var temp = $(this) ;
		this.attr("title",this.html()) ;
		if(this.html().length > showsize ){
			this.html(substr(this.html(),showsize)+"...") ;
		}
	});
} 
String.prototype.replaceAll  = function(s1,s2){   
return this.replace(new RegExp(s1,"gm"),s2);   
}  

String.prototype.trim = function()
{
return this.replace(/(^s*)|(s*$)/g, "");
}
String.prototype.lTrim = function()
{
return this.replace(/(^s*)/g, "");
}
String.prototype.rtrim = function()
{
return this.replace(/(s*$)/g, "");
} 



//判断字符是否为空
function validate_required(value,alerttxt){
	if (value==null||value=="")
    {
    	alert(alerttxt+"不能为空!");
    	return true ;
    }else {
  		return false ;
  	}
}
function checkChangeRuleCode(ctx){//验证自增编码重复性
 			$.ajax({
				   type: "POST",
				   url: ctx+"/sysCodeRuleAction.do?method=checkCode&codeValue="+$("#codeChange").val()+"&tableName="+$("#codeChange").attr("tableName")+"&fieldValue="+$("#codeChange").attr("fieldValue"),		
				   success: function(msg){
					    if(msg=="yes"){
					   		$("#saveButton").attr("disabled","");
					    }
						if(msg=="no"){
							alert("您的编号重复,请重新填写！");
							$("#codeChange").focus();
							$("#saveButton").attr("disabled","disabled");
						}
				   }
				}); 	
}
function checkBlurRuleCode(ctx){//验证自增编码重复性 响应 change事件
 			$.ajax({
				   type: "POST",
				   url: ctx+"/sysCodeRuleAction.do?method=checkCode&codeValue="+$("#codeBlur").val()+"&tableName="+$("#codeBlur").attr("tableName")+"&fieldValue="+$("#codeBlur").attr("fieldValue"),		
				   success: function(msg){
					    if(msg=="yes"){
					   		$("#saveButton").attr("disabled","");
					    }
						if(msg=="no"){
							alert("您的编号重复,请重新填写！");
							$("#codeBlur").focus();
							$("#saveButton").attr("disabled","disabled");
						}
				   }
				}); 	
}

/***********************************************qm begin****************************************************************/
//加载时控制
$(document).ready(function(){
    //textarea框字数控制
    $('textarea').keyup(function(e){   
       if(this.value.length>999){
       		alert("文本框最多只能输入1000个字");
       	 	$(this).val(this.value.substring(0,999));
       }   
    });  
    //
});
//保存非空验证
function saveValidateRequired(btn,validatePropertyies,formName){
	var errors = "";
	var focus= "";
	for(var i in validatePropertyies){
		if($("[name='"+validatePropertyies[i][0]+"']").val()==""){
			errors+=validatePropertyies[i][1]+" 为必填项!\n";
			focus+=validatePropertyies[i][0]+",";
		}
	}
	if(errors != ""){
		alert(errors);
		var focusStr = focus.substring(0,focus.indexOf(","));
		$("input[name='"+focusStr+"']").focus();
		return false;
	}
	$(btn).addClass("z-btn-dsb");
	$(btn).attr("disabled","disabled");
	document.forms[formName].submit();
}
//保空验证 是否成功
function isValidateRequired(btn,validatePropertyies,formName){
	var errors = "";
	var focus= "";
	for(var i in validatePropertyies){
		if($("[name='"+validatePropertyies[i][0]+"']").val()==""){
			errors+=validatePropertyies[i][1]+" 为必填项!\n";
		}
	}
	if(errors != ""){
		return false;
	}
	return true;
}
//
function showPageWait(){
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
}



//plug 设值
function setParamValue(){
		
}
//form方式提交
function commonUrl(url){
	document.forms[0].action=url;   
    document.forms[0].submit();   
}
//地址跳转
function commonLocationUrl(url){
	location.href=url;
}
//页面加载
function pullValue(mutil_id,mutil_auditStatus){
	$("#btn_edit").hide();
	$("#btn_delete").hide();
	$("#btn_view").hide();
	$("#btn_submit").hide();
	var common_oper_id="";
	var select_count=0;
	$("input[name='select_id']").attr("checked","");
	$("input[name='select_id']").each(function(){
		if($(this).val()==mutil_id){
			select_count++;
			common_oper_id=mutil_id;
			$("input[name='select_id'][value='"+mutil_id+"']").attr("checked","checked");
		}
	});
	if(select_count!=0){
		if(common_oper_id!=""){
			if(typeof(mutil_auditStatus)=='undefined'){
				$("#btn_view").show();
				$("#btn_edit").show();
				$("#btn_submit").show();
				$("#btn_delete").show();
			}else{
				if(mutil_auditStatus==0){
					$("#btn_view").show();
					$("#btn_edit").show();
					$("#btn_submit").show();
					$("#btn_delete").show();
				}else if(mutil_auditStatus==-1){
					$("#btn_view").show();
					$("#btn_edit").hide();
					$("#btn_submit").hide();
					$("#btn_delete").hide();
				}else if(mutil_auditStatus==-2){
					$("#btn_view").show();
					$("#btn_edit").show();
					$("#btn_submit").show();
					$("#btn_delete").hide();
				}else{
					$("#btn_view").show();
					$("#btn_edit").hide();
					$("#btn_submit").hide();
					$("#btn_delete").hide();
				}
			}
		}else{
			$("#btn_view").hide();
			$("#btn_edit").hide();
			$("#btn_submit").hide();
			$("#btn_delete").hide();
		}
	}
	setPullValue(common_oper_id,mutil_auditStatus,select_count);
	checkCmd();
}
//设置list页面id
function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		
}
//指令码判断
function checkCmd(){
		
}
//浮点数加法运算   
function floatAdd(arg1,arg2){   
   var r1,r2,m;   
   try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}   
   try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}   
   m=Math.pow(10,Math.max(r1,r2))   
   return (arg1*m+arg2*m)/m   
}   
  
//浮点数减法运算   
function floatSub(arg1,arg2){   
	var r1,r2,m,n;   
	try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}   
	try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}   
	m=Math.pow(10,Math.max(r1,r2));   
	//动态控制精度长度   
	n=(r1>=r2)?r1:r2;   
	return ((arg1*m-arg2*m)/m).toFixed(n);   
}   
    
//浮点数乘法运算   
function floatMul(arg1,arg2){    
	var m=0,s1=arg1.toString(),s2=arg2.toString();    
	try{m+=s1.split(".")[1].length}catch(e){}    
	try{m+=s2.split(".")[1].length}catch(e){}    
	return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)    
}    
  
//浮点数除法运算   
function floatDiv(arg1,arg2){    
	var t1=0,t2=0,r1,r2;    
	try{t1=arg1.toString().split(".")[1].length}catch(e){}    
	try{t2=arg2.toString().split(".")[1].length}catch(e){}    
	with(Math){    
		r1=Number(arg1.toString().replace(".",""))    
		r2=Number(arg2.toString().replace(".",""))    
		return (r1/r2)*pow(10,t2-t1);    
	}    
}

//浮点数 比较 是否大于  
function floatGtCompare(arg1,arg2){    
	if(parseFloat(arg1)>parseFloat(arg2)){
		return true;
	}else{
		return false;
	}
}
//浮点数 比较 是否小于  
function floatLtCompare(arg1,arg2){    
	if(parseFloat(arg1)<parseFloat(arg2)){
		return true;
	}else{
		return false;
	}
}

//浮点数 比较 是否等于 
function floateEqCompare(arg1,arg2){    
	if(parseFloat(arg1)==parseFloat(arg2)){
		return true;
	}else{
		return false;
	}
}

//两日前比较（大于）	格式必须为为2010-10-08
function dateGtCompare(arg1,arg2){
	var d1Arr=arg1.split('-');
	var d2Arr=arg2.split('-');
	v1=new Date(d1Arr[0],d1Arr[1],d1Arr[2]);
	v2=new Date(d2Arr[0],d2Arr[1],d2Arr[2]);
	if(v1>v2){
		 return true;
	}else{
		return false;
	}
}

//两日前比较（小于）	格式必须为为2010-10-08
function dateLtCompare(arg1,arg2){
	var d1Arr=arg1.split('-');
	var d2Arr=arg2.split('-');
	v1=new Date(d1Arr[0],d1Arr[1],d1Arr[2]);
	v2=new Date(d2Arr[0],d2Arr[1],d2Arr[2]);
	if(v1<v2){
		 return true;
	}else{
		return false;
	}
}

//两日前比较（等于）	格式必须为为2010-10-08
function dateEqCompare(arg1,arg2){
	var d1Arr=arg1.split('-');
	var d2Arr=arg2.split('-');
	v1=new Date(d1Arr[0],d1Arr[1],d1Arr[2]);
	v2=new Date(d2Arr[0],d2Arr[1],d2Arr[2]);
	if(v1==v2){
		 return true;
	}else{
		return false;
	}
}
//判断字符包含
function isContains(arg1,arg2){
	if(arg1.indexOf(arg2)>=0){
		return true;
	}else{
		return false;
	}
}

//
function display(){
	rtime=etime-ctime;
	if (rtime>60)
		m=parseInt(rtime/60);
	else{
		m=0;
	}
	s=parseInt(rtime-m*60);
	if(s<10)
		s="0"+s
	window.setTimeout("checktime()",1000)
}
//
function settimes(waitTimeSeconds){
	var time= new Date();
	hours= time.getHours();
	mins= time.getMinutes();
	secs= time.getSeconds();
	etime=hours*3600+mins*60+secs;
	etime+=waitTimeSeconds;  
	checktime();
}
//
function checktime(){
	var time= new Date();
	hours= time.getHours();
	mins= time.getMinutes();
	secs= time.getSeconds();
	ctime=hours*3600+mins*60+secs
	if(ctime>=etime){
		getNumb();
	}
	else
		display();
}
//
function getNumb(){		
}
//
function formatStringComma(str){
	if(str.length>1){
		return str.substring(1,(str.length-1));
	}
	return "";
}

//获取当前窗口尺寸  
function getDimensions(){   
	if(window.innerWidth){
		winWidth=window.innerWidth;
	}else if((document.body)&&(document.body.clientWidth)){
		winWidth=document.body.clientWidth;   
	}
	if(window.innerHeight){
		winHeight=window.innerHeight; 
	}else if((document.body)&&(document.body.clientHeight)){
		winHeight=document.body.clientHeight;    
	}
	if(document.documentElement&&document.documentElement.clientHeight&&document.documentElement.clientWidth){     
		winHeight = document.documentElement.clientHeight;
	    winWidth = document.documentElement.clientWidth;   
	}  
	return {x:winWidth,y:winHeight};
}

//获取屏幕尺寸  
function getScreenDimensions(){ 
	var screenWidth=screen.availWidth;
	var screenHeight=screen.availHeight;
	return {x:screenWidth,y:screenHeight};
}
/*COOKIE操作工具类*/
//GetCookie(name) 获取Cookies方法 ，name为名字
//SetCookie(name,value,interval,number,[path],[domain],[secure]) 设置cookies方法
//name 名称，value cookies值，interval（"y" 年,"q"季,"m"月,"d"日,"h"时,"M"分,"s"秒，默认：日），number：数量级
//[path],[domain],[secure] 可缺省。
//DelCookie(name) 删除设置过期cookies ， name：cookies名称
//
function GetCookieVal(offset){
	var endstr = document.cookie.indexOf (";", offset);
	if (endstr == -1)
	endstr = document.cookie.length;
	return unescape(document.cookie.substring(offset, endstr));
}
//设置cookie
function SetCookie(name,value,interval,number){
	if(interval=="0"){
		return false;
	} 
	var expdate = new Date();
	var argv = SetCookie.arguments;
	var argc = SetCookie.arguments.length;
	var expires=DateAdd(interval,number,expdate);
	var path = (argc > 4) ? argv[4] : null;
	var domain = (argc > 5) ? argv[5] : null;
	var secure = (argc > 6) ? argv[6] : false;
	document.cookie = name + "=" + escape (value) +((expires == null) ? "" : ("; expires="+ expires.toGMTString()))
	+((path == null) ? "" : ("; path=" + path)) +((domain == null) ? "" : ("; domain=" + domain))
	+((secure == true) ? "; secure" : "");
}
//获取cookie
function GetCookie(name){
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while (i < clen){
	var j = i + alen;
	if (document.cookie.substring(i, j) == arg)
	return GetCookieVal (j);
	i = document.cookie.indexOf(" ", i) + 1;
	if (i == 0) break;
	}
	return null;
}
//删除cookie
function DelCookie(name){
	var exp = new Date();
	exp.setTime (exp.getTime() - 1);
	var cval = GetCookie (name);
	document.cookie = name + "=" + cval + "; expires="+ exp.toGMTString();
}
//日期计算
function DateAdd(interval,number,date){
	switch(interval){
		case "y":{
					date.setFullYear(date.getFullYear()+number); 
					return date; 
					break; 
					}
		case "q":{
					date.setMonth(date.getMonth()+number*3); 
					return date; 
					break; 
					}
		case "m":{
					date.setMonth(date.getMonth()+number); 
					return date; 
					break; 
					}
		case "w":{
					date.setDate(date.getDate()+number*7); 
					return date; 
					break; 
					}
		case "d":{
					date.setDate(date.getDate()+number); 
					return date; 
					break; 
					}
		case "h":{
					date.setHours(date.getHours()+number); 
					return date; 
					break; 
					}
		case "M":{
					date.setMinutes(date.getMinutes()+number); 
					return date; 
					break; 
					}
		case "s":{
					date.setSeconds(date.getSeconds()+number); 
					return date; 
					break; 
					}
		case "0":{ 
					return date; 
					break; 
					}
	} 
}
/**整数*/
 function regInput0(obj,inputStr){
	  var reg= /^\d*$/;
	  var docSel = document.selection.createRange();
	  if (docSel.parentElement().tagName != "INPUT") {
	  	return false;
	  }
	  oSel = docSel.duplicate();
	  oSel.text = "";
	  var srcRange = obj.createTextRange();
	  oSel.setEndPoint("StartToStart", srcRange);
	  var str = oSel.text + inputStr+ srcRange.text.substr(oSel.text.length);
	  return reg.test(str);
 }
/**金额为两位小数*/
 function regInput(obj,inputStr)
 {
  var reg= /^\d*\.?\d{0,2}$/;
  var docSel = document.selection.createRange()
  if (docSel.parentElement().tagName != "INPUT") return false
  oSel = docSel.duplicate()
  oSel.text = ""
  var srcRange = obj.createTextRange()
  oSel.setEndPoint("StartToStart", srcRange)
  var str = oSel.text + inputStr+ srcRange.text.substr(oSel.text.length)
  return reg.test(str)
 }
/**金额为一位小数*/
  function regInput1(obj,inputStr)
 {
  var reg= /^\d*\.?\d{0,1}$/;
  var docSel = document.selection.createRange()
  if (docSel.parentElement().tagName != "INPUT") return false
  oSel = docSel.duplicate()
  oSel.text = ""
  var srcRange = obj.createTextRange()
  oSel.setEndPoint("StartToStart", srcRange)
  var str = oSel.text + inputStr+ srcRange.text.substr(oSel.text.length)
  return reg.test(str)
 }
 /**金额为4位小数*/
  function regInput4(obj,inputStr)
 {
  var reg= /^\d*\.?\d{0,4}$/;
  var docSel = document.selection.createRange()
  if (docSel.parentElement().tagName != "INPUT") return false
  oSel = docSel.duplicate()
  oSel.text = ""
  var srcRange = obj.createTextRange()
  oSel.setEndPoint("StartToStart", srcRange)
  var str = oSel.text + inputStr+ srcRange.text.substr(oSel.text.length)
  return reg.test(str)
 }
 /***/
 function regChar(obj,pname){
   		var value = obj.value;
      if(value != null){
         if(isNaN(value)){
             alert(pname+" 必须为数字类型！");
             obj.value = "";
             obj.focus();
         }
      }
   }
   
//取年	格式必须为为2010-10-08
function dateToYear(arg1){
	var d1Arr=arg1.split('-');
	var d1=new Date(d1Arr[0],d1Arr[1],d1Arr[2]);
	return d1.getFullYear();
}
//取月	格式必须为为2010-10-08
function dateToMonth(arg1){
	var d1Arr=arg1.split('-');
	var d1=new Date(d1Arr[0],d1Arr[1],d1Arr[2]);
	return d1.getMonth();
}
//取日	格式必须为为2010-10-08
function dateToDay(arg1){
	var d1Arr=arg1.split('-');
	var d1=new Date(d1Arr[0],d1Arr[1],d1Arr[2]);
	return d1.getDate();
}
//时间格式化	格式必须为时间格式 如：2010-11-12 00:00:00.0、
function formatDateBy(arg1){
	var arr=arg1.split("-");
	return arr[0]+"-"+arr[1]+"-"+arr[2].substring(0, 2);
}
//string类型转化为int类型
function stringParseInt(arg1){
	return parseInt(arg1);
}

/**
 *  Select初始化
 *  showNull 当showNull为空时,下拉选项中存在"--请选择--",当showNull为false时，下拉框不存在"--请选择--"
 **/
function initSelect(selectObj,showNull){
	
	var flag = true ;
	if(showNull == null || showNull == "false"){
		
		flag = false ;
	}
	selectObj.find("option").remove();
	//if(flag){
		
		selectObj.append("<option value=''>--请选择--</option>") ;
	//}
	return selectObj ;
}

//初始化下拉框
function initSelect1(selectObj){
	selectObj.find("option").remove();
	selectObj.append("<option value=''>请选择</option>") ;
	return selectObj ;
}

/**
 * Select下拉框填充
 * obj:下拉框jQuery对象
 * objContent:填充内容
 * curVal:当前值
 * splitStr:分隔符,默认为","
 * showNull:是否显示空值
 **/
function fillSelect(obj,objContent,curVal,splitStr,showNull){
	var selectObj = initSelect(obj,showNull) ;

	if(splitStr == null || splitStr == ""){
		splitStr = "," ;
	}
	var selarr = objContent.split(splitStr);
	var subarr;
	var index = 0;
	for(i = 0;i<selarr.length;i++){
		subarr = selarr[i].split(";");
		selectObj.append("<option value='"+subarr[0]+"'>"+subarr[1]+"</option>") ;
	}
	selectObj.val(curVal); 
}

//创建下拉框选项1
function fillSelect1(obj,objContent,curVal,splitStr){
	var selectObj = initSelect1(obj) ;
	if(splitStr == null || splitStr == ""){
		splitStr = "," ;
	}
	var selarr = objContent.split(splitStr);
	var subarr;
	var index = 0;
	for(i = 0;i<selarr.length;i++){
		subarr = selarr[i].split(";");
		selectObj.append("<option value='"+subarr[0]+"'>"+subarr[1]+"</option>") ;
	}
	selectObj.val(curVal); 
}

/**
 * Select下拉框填充
 * obj:下拉框jQuery对象
 * objContent:填充内容
 * curVal:当前值
 * splitStr:jSon数组   [{'id':0,'name':'测试'}]
 * showNull:是否显示空值
 **/
function fillJsonSelect(obj,jSonStr,setOb){
		var selectObj = initSelect(obj,true) ;
		if(jSonStr != null && jSonStr != ""){
			var jSobj = JSON.parse(jSonStr);
			var count=jSobj.length;
			for(var i=0; i<count; i++){  
				var setStr="";
				if(jSobj[i].id==$.trim(setOb)){
				    setStr="selected";
				}
				selectObj.append("<option value='"+jSobj[i].id+"' "+setStr+">"+jSobj[i].name+"</option>") ;
			} 
		}
	}

/**
 * Select下拉框填充
 * obj:下拉框jQuery对象
 * objContent:填充内容
 * curVal:当前值
 * splitStr:jSon数组   [{'id':0,'name':'测试'}]
 * showNull:是否显示空值
 **/
function fillJsonNoSelect(obj,jSonStr,setOb,type,section){
	var selectObj ;
		if(jSonStr != null && jSonStr != ""){
			
			var jSobj = JSON.parse(jSonStr);
			var count=jSobj.length;
			
			if(count==1){
				
				selectObj = initSelect(obj,"false") ;
			}else{
				
				selectObj = initSelect(obj,true) ;
			}
			var seleteId='';
			for(var i=0; i<count; i++){
				
				var setStr="";
				seleteId=jSobj[i].id;
				if(jSobj[i].id==$.trim(setOb)){
				    setStr="selected";
				}
				selectObj.append("<option value='"+jSobj[i].id+"' "+setStr+">"+jSobj[i].name+"</option>") ;
			} 
			if(count==1){
				if(type==1){
					getSections(seleteId,section);
				}else if(type==2){
					//getWokPoints(seleteId,'');
				}
			}
		}
	}
//
function openWebOfficeWin(url){
	window.open (url, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no");
}
//字符转整数
function StringToInteger(arg1){ 
	return parseInt(arg1);
}

//	1亩=666.67平方米	1平方米=0.0015亩
function LandSupplyParcelIncome_getSum1(supplyPrice,plotRatio){
	return (parseFloat(supplyPrice)*parseFloat(plotRatio))/(15);
}
//
function LandSupplyParcelIncome_getSum2(sum1,parcelArea){
	return parseFloat(sum1)*parseFloat(parcelArea)*0.0015;
}
//
function LandSupplyParcelIncome_getSum3(costPrice,parcelArea){
	return parseFloat(costPrice)*parseFloat(parcelArea)*0.0015;
}
//
function LandSupplyParcelIncome_getFinanceDeduction(sum2,sum3){
	return (sum2-sum3)*0.35;
}

/***********************************************qm end****************************************************************/
/**
*
*加载showhelp	
***/
function addshowhelp(pname,id){
	var urlArr = window.location.href.split("/");
	var urlInput = "http://"+urlArr[2]+"/"+urlArr[3] ;
	//document.getElementById("showhelp").innerHTML = "<img  width='23px' height='23' src='"+urlInput+"/images/help.gif' title='帮助' onclick=openHelp('"+pname+"','"+id+"','"+urlInput+"') style='cursor:pointer;'/>" ;
}
/***********************************************ht end****************************************************************/


//加载遮罩层    
function loadMessage(message){
	art.dialog({mouse:true, id:'loadMessageDiv', content:message,width:'200px', height:'100px',fixed:true,lock:true});
	var time =".";
	setInterval(function(){
		try{
			var ui_content = jQuery(".ui_content") ;
			if(ui_content.length > 0 ){
				if(time.length<5){
					time += "." ;
				}else{
					time="." ;
				}
				jQuery(".ui_content").html(message+time) ;
			}
		}
		catch(er){
		}	
	},300);
}
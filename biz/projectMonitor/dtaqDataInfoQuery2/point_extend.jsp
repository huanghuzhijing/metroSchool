<%@ page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">



//更新坐标信息
function updateXY(xformName,yformName,endXformName,endYformName,position)
{
	try{
		var xform_=$(xformName);
		var yform_=$(yformName);
		var endXform_="";
		var endYform_="";
		if(endXformName!=""){
			endXform_=$(endXformName);
			endYform_=$(endYformName);	
		}
		if(position){
		    if(xform_&&position.x1)xform_.value=position.x1;
			if(yform_&&position.y1)yform_.value=position.y1;
			if(endXform_&&position.x2)endXform_.value=position.x2;
			if(endYform_&&position.y2)endYform_.value=position.y2;
		}
	}
	catch(e){
	 	alert("updateXY."+e);
	}
}

function addAndShowData(xyList){
	try{
		thisMovie("picnav").addAndShowData(xyList);
	}
	catch(e){
		alert("addAndShowData"+e.description);
	}
} 

function thisMovie(movieName) {
    if (navigator.appName.indexOf("Microsoft") != -1) {
        return window[movieName];
    } else {
        return document[movieName];
    }
}

function doAddAndShowData(){
	 var xyList="${xyList}";
	 addAndShowData(xyList);//加载并显示数据	
}
</script>
<c:set var="mrandom" value="<%=Math.random()%>" />
<div id="flashObj" align="center" style="border: 1px solid;">


	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
		id="picnav" width="550" height="350"
		codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
		<param name="movie" value="${ctx}/flex_swf/picnav/picnav.swf" />
		<param name="flashVars"
			value="dataCallWay=1&station_id=${station_id}&viewPoint=1&isthird=${isthird}&ctx=${ctx}&flexrnd=${mrandom}&allowSelected=0&radius=5&VIEWMODE=2&xformName=pointx&yformName=pointy&graphUrl=${graphUrl1}" />
		<param name="quality" value="high" />
		<param name="bgcolor" value="#869ca7" />
		<param name="allowScriptAccess" value="sameDomain" />
		<param name="wmode" value="transparent">
		<embed src="picnav.swf" quality="high" bgcolor="#869ca7" width="100%"
			height="100%" name="picNav" swLiveConnect="true" align="middle" play="true" loop="false"
			quality="high" allowScriptAccess="sameDomain"
			type="application/x-shockwave-flash"
			pluginspage="http://www.adobe.com/go/getflashplayer">
		</embed>
	</object>
</div>
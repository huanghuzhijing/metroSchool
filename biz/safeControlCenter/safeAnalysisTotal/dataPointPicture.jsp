<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title>测点布置图</title>
<script src="${ctx}/scripts/prototype.js" type="text/javascript"></script>
<script src="${ctx}/scripts/installFlex.js" type="text/javascript"></script>
<script src="${ctx}/scripts/flex_pub.js" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<link href="<c:url value="/styles/def_table.css"/>" type="text/css" rel="stylesheet">
<script type="text/javascript">
function windowClose(){
	if(parent.sSuc){
		parent.sSuc("b1");
	}
}

</script>
<style type="text/css">
* {margin:0;padding:0;}
html {background:#FFFFFF;}
body {background-color:#ffffff;text-align:left;font:normal 12px/1.6em simsun, Verdana, Lucida, Arial, Helvetica, sans-serif;color:#353535;}
input.button{
	/*用于普通button*/
	
border-right: 1px solid;
	border-top: 1px solid;
	font-size: 9pt;
	border-left: 1px solid;
	color: dimgray;
	border-bottom: 1px solid;
	font-family: "verdana", "arial", "锟斤拷锟斤拷";
	background-color: transparent;
	event: expression(onmouseover =   function() { 
 this . style . background = '#D1D8DD', this . style . color = '#1679AA'
}	
ol,ul {list-style:none;}
a {text-decoration:none;color:#353535;}
a:hover {color:#CD0102;}
#contain {width:970px;overflow:hidden;_zoom:1;margin:0 auto;display:inline; white-space:nowrap}

.mainBox {float:left;width:100%;height:auto;overflow:hidden;_zoom:1;}
.smallBox{
position:relative;
padding:10px;

width:459px;background-color:#ffffff;float:left;border:0px solid #B6CAE3;

}

.smallBox .submenu{text-align:center;font-weight:bold;font-size:14px;left:0px; background:#F2F6FB;top:0px;width:100%;z-index:1;height:26px;border:1px solid #B6CAE3;}

.smallBox .content{left:0px; background:#ffffff;top:0px;z-index:1;border:1px solid #B6CAE3;border-top:0px solid #B6CAE3;overflow:auto;}

.smallBox .submenu,.smallBox .content{width:100%;}

.smallBox h4 {float:left;width:152px;height:26px;margin:-1px -1px 0;line-height:26px;text-align:center;font-size:12px;font-weight:normal;border:1px solid #B6CAE3;border-right:0;background:#F2F6FB;cursor:pointer;}

#contain .more{ text-align:right;padding-right:30px}

#mycontain {border:1px solid #B6CAE3;height:auto;background-color:#fff;}
#mycontain .menu{font-size:15px;font-weight:bold;text-align:center;background:#F1F5F8;border-bottom:1px solid #B6CAE3;height:30px}
#mycontain .footer	{background:#F1F5F3;text-align:center;}	
#nav_div{
	background:#BBB;
	border:2px double #000000;
	position:fixed;
	right:0px;
	bottom:0px;
	height:200px;
	width:200px;                            
 }
</style>
</head>
<body onload="init()">
<!--<div id="wp_chartBody" class='wp_chartBodyDiv' align="center"></div>-->

<div>
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="790" height="390">
  <param name="movie" value="${ctx}/flex_swf/picshow/picShow.swf" />
  <param name="flashVars" value="ctx=${ctx}&picname=${picname}&organ_type=${organ_type}&station_id=${station_id}" />
  <param name="quality" value="high" />
  <embed src="main.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="800" height="600"></embed>
</object>
</div>
      
<div class="sb_div" align="center">
	<input type="button" value="关 闭" class="backButton" onclick="windowClose()"/>
</div>
</body>
</html:html>
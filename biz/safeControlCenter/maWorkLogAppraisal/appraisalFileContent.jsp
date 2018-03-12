<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>

<content tag="heading">工点安全评估建议</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<style type="text/css">
* {margin:0;padding:0;}
html {background:#FFFFFF;}
body {background-color:#ffffff;text-align:left;font:normal 12px/1.6em simsun, Verdana, Lucida, Arial, Helvetica, sans-serif;color:#353535;}
input.button{
	/*用于普通button*/
	
	BORDER-RIGHT: #2C59AA 1px solid;
	PADDING-RIGHT: 2px; 
	BORDER-TOP: #2C59AA 1px solid; 
	PADDING-LEFT: 2px; 
	FONT-SIZE: 12px;
	FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#D7E7FA); 
	BORDER-LEFT: #2C59AA 1px solid; 
	CURSOR: hand; 
	COLOR: black; 
	PADDING-TOP: 2px; 
	BORDER-BOTTOM: #2C59AA 1px solid;
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
.showcontent {
	color: #4A4949;
}
.tmpRow {
	background-color: #F8F5F4;
}

.smallBox .submenu{text-align:left;font-weight:bold;font-size:14px;left:0px; background:#F2F6FB;top:0px;width:100%;z-index:1;height:26px;line-height:26px;border:1px solid #B6CAE3;}

.smallBox .content{left:0px; background:#ffffff;top:0px;z-index:1;border:1px solid #B6CAE3;border-top:0px solid #B6CAE3;}

.smallBox .submenu{
		font-weight: bold;
	font-size: 13px;
	background: #E1F0F8;
	line-height: 26px;
	width: 100%;
	height: 26px;
	border: 1px solid #B6CAE3;
}

.smallBox .content{width:100%;}

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
<script type="text/javascript">
function windowClose(){
		parent.art.dialog({id:'dialog1'}).close();

}
</script>
</head>
<body>
	<div class="smallBox" style="width: 100%">
		<div class="submenu">
			<span style="margin-left: 20px"><font color="#0B273C"><strong>${station_name}安全分析评估及综合建议
				</strong>
			</font></span>
		</div>
		<div class="content" align="center">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<c:if test="${situationSuggest.fileContent != null}">
					<tr>
						<td><br><c:out value='${situationSuggest.fileContent}' escapeXml="false"></c:out></td>
					</tr>
				</c:if>
				<c:if test="${situationAnalyse.situation_discription != null}">
					<tr>
						<td><br>${situationAnalyse.situation_discription}</td>
					</tr>
				</c:if>
				<c:if test="${situationAnalyse.suggestion != null}">
					<tr>
						<td><br><br>${situationAnalyse.suggestion}</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
	<div align="center">
  		<input type="button" value=" 关 闭 " class="backButton" onclick="windowClose()" icon="icon_delete"/>
  	<div>
</body>
</html:html>
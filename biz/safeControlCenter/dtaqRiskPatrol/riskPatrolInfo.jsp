<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title>现场视频</title>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<style type="text/css">
* {margin:0;padding:0;}
html {background:#FFFFFF;}
body {background-color:#ffffff;text-align:left;font:normal 12px/1.6em simsun, Verdana, Lucida, Arial, Helvetica, sans-serif;color:#353535;}
/*用于普通button*/
input.button{border-right: #2C59AA 1px solid;padding-right: 2px;border-top: #2C59AA 1px solid;padding-left: 2px;font-size: 12px;
	filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#D7E7FA); 
	border-left: #2C59AA 1px solid;cursor: hand;color: black;padding-top: 2px;border-bottom: #2C59AA 1px solid;
}	
ol,ul {list-style:none;}
a {text-decoration:none;color:#353535;}
a:hover {color:#CD0102;}
#contain {width:970px;overflow:hidden;_zoom:1;margin:0 auto;display:inline; white-space:nowrap}
.mainBox {float:left;width:100%;height:auto;overflow:hidden;_zoom:1;}
.smallBox{position:relative;padding:10px;width:459px;background-color:#ffffff;float:left;border:0px solid #B6CAE3;}
.smallBox .submenu{text-align:center;font-weight:bold;font-size:14px;left:0px; background:#F2F6FB;top:0px;width:100%;z-index:1;height:26px;border:1px solid #B6CAE3;}
.smallBox .content{left:0px; background:#ffffff;top:0px;z-index:1;border:1px solid #B6CAE3;border-top:0px solid #B6CAE3;}
.smallBox .submenu,.smallBox .content{width:100%;}
.smallBox h4 {float:left;width:152px;height:26px;margin:-1px -1px 0;line-height:26px;text-align:center;font-size:12px;font-weight:normal;border:1px solid #B6CAE3;border-right:0;background:#F2F6FB;cursor:pointer;}
#contain .more{ text-align:right;padding-right:30px}
#mycontain {border:1px solid #B6CAE3;height:auto;background-color:#fff;}
#mycontain .menu{font-size:15px;font-weight:bold;text-align:center;background:#F1F5F8;border-bottom:1px solid #B6CAE3;height:30px}
#mycontain .footer	{background:#F1F5F3;text-align:center;}	
#nav_div{background:#BBB;border:2px double #000000;position:fixed;right:0px;bottom:0px;height:200px;width:200px;}
.main_div{width:98%;}
</style>
</head>
<body>
 		<c:if test="${liveVideo != null}">
	 		<c:if test="${liveVideo.attach_name != null}">
	  			<div class="main_div" align="center">
					<fieldset>
						<legend>
							<div class="title_div">${station_name}<fmt:formatDate pattern="yyyy-MM-dd" value="${liveVideo.recoder_date}"/>现场视频</div>
						</legend>
						<div class="content_div">
						<c:if test="${liveVideo.oldOrNew != 1}">
							<a href="#" target="_blank"><img id="ownerMap"  style="width:100%" alt="现场视频图片" src="${ctx}/liveVideoAction.do?method=viewMap&id=${liveVideo.id}&__skip__" border="0"></a>
						</c:if>
						<c:if test="${liveVideo.oldOrNew == 1}">
							<img id="ownerMap"  style="width:100%" alt="现场视频图片" src="${address}" border="0"></a>
						</c:if>
					</div>
					</fieldset>
				</div>
			</c:if>
			<c:if test="${liveVideo.memo != null}">
				<div class="main_div" align="center">
					
					<fieldset>
					<legend><div class="title_div">现场视频摘要</div></legend>
					<div align="left" class="content_div">
						${liveVideo.memo}
					</div>
					</fieldset>
				</div>
			</c:if>
		</c:if>
		
		<c:if test="${riskPatrol != null}">
			<c:if test="${riskPatrol.attach_name != null}">
				<div align="right">
				 	<a href="${ctx}/riskPatrolAction.do?method=download&id=${riskPatrol.id}">[${riskPatrol.attach_name}]</a>
				</div>
			</c:if>
		</c:if>
	    <c:if test="${liveVideo == null}">
	    	<div class="main_div" align="center" style="width:100%">
				<div class="title_div"><font color="orange">消息提示</font></div>
				<div class="content_div">
					<font color="red" size="4"><strong>该车站区间没有对应的工程安全报告信息,请返回!</strong></font>
				</div>
			</div>
	    </c:if>
</body>
</html:html>
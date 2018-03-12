<%@ page contentType="text/html;charset=UTF-8"%>
<script src="${ctx}/scripts/flex_extend/picnav.js"></script>
<c:set var="mrandom" value="<%=Math.random()%>" />
<div id="flashObj" align="center" style="width:100%;height:480px;">
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
		id="picNav" width="100%" height="100%"
		codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
		<param name="movie" value="${ctx}/flex_swf/picnav/picnav.swf" />
		<param name="flashVars"
			value="id=${station_id}&enable=true&isCurrent=true&flexrnd=${mrandom}&ctx=${ctx}&allowSelected=false&radius=0&VIEWMODE=1&xformName=pointx&yformName=pointy&endXformName=end_left&endYformName=end_top&graphUrl=${ctx}/images/gis/stationgis.jpg" />
		<param name="quality" value="high" />
		<param name="bgcolor" value="#869ca7" />
		<param name="allowScriptAccess" value="sameDomain" />
		<param name="wmode" value="transparent">
		<embed src="picnav.swf" quality="high" bgcolor="#869ca7" width="100%"
			height="100%" name="picnav" align="middle" play="true" loop="false"
			quality="high" allowScriptAccess="sameDomain"
			type="application/x-shockwave-flash"
			pluginspage="http://www.adobe.com/go/getflashplayer">
		</embed>
	</object>
</div>
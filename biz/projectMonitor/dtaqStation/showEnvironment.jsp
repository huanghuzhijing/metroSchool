<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<style>
	.showTable{margin-top:10px}
	.showTable td a{font-size:12px;}
	.showTable td span{font-size:12px; font-weight:bold;cursor:pointer;color:#024280;}
</style>
<script src="/safemanager/scripts/jquery-1.2.6.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery.noConflict();
jQuery(document).ready(function(){
	jQuery(".templetTable").css("width","99%").css("height",jQuery(document).height()-2) ;
})
</script>
</head>
<body style="background-color: #F3F8FE; padding: 0px; margin: 0px;">
	<table class="templetTable" cellpadding="0" cellspacing="0" height="100%" width="80%" style="margin-left:0px;margin-right:0px;min-height:500px;min-top:5px;height:99%;width:99%;">
		<tr height="5">
			<td width="5" height="5"
				style="background: url(${ctx}/images/menu/c_lefttop.jpg); background-repeat: no-repeat"></td>
			<td width="1" height="5"
				style="background: url(${ctx}/images/menu/bg_top.jpg)"></td>
			<td style="background: url(${ctx}/images/menu/bg_top.jpg)"></td>
			<td width="5" height="5"
				style="background: url(${ctx}/images/menu/c_righttop.jpg); background-repeat: no-repeat"></td>
		</tr>
		<tr>
			<td width="5"
				style="background: url(${ctx}/images/menu/bg_mleft.jpg)"></td>
			<td align="center" valign="top" colspan="2">
				<table class="showTable" style="margin-top: 10px;">
					<c:if test="${station.station_type eq 'S'}">
					<tr height="40">
						<td>
							<c:if test="${mode == null}">
								<a style="color: #024280" href="${ctx}/localStructureAction.do?method=edit&station_id=${station.station_id}&structure_id=${localStructure.structure_id}" target="mainFrame">结构主体</a>
							</c:if>
							<c:if test="${mode != null}">
								<a style="color: #024280" href="${ctx}/localStructureAction.do?method=view&station_id=${station.station_id}&structure_id=${localStructure.structure_id}" target="mainFrame">结构主体</a>
							</c:if>
						</td>
					</tr>
					</c:if>
					<tr height="40">
						<td>
							<a style="color: #024280" href="${ctx}/dtaqKimoliteAction.do?method=edit&station_id=${station.station_id}&mode=${mode}" target="mainFrame">水土</a>
						</td>
					</tr>
					<tr height="40">
						<td>
							<a style="color: #024280" href="${ctx}/dtaqLaunchingMethodAction.do?method=list&station_id=${station.station_id}&mode=${mode}" target="mainFrame">工法</a>
						</td>
					</tr>
					<tr height="40">
						<td>
							<a style="color: #024280" href="${ctx}/dtaqConstructionMethodAction.do?method=list&station_id=${station.station_id}&mode=${mode}" target="mainFrame">辅助工法</a>
						</td>
					</tr>
					
					<tr height="40">
						<td>
							<a style="color: #024280" href="${ctx}/dtaqBuildingAction.do?method=list&station_id=${station.station_id}&mode=${mode}" target="mainFrame">建筑物</a>
						</td>
					</tr>
					<tr height="40">
						<td>
							<a style="color: #024280" href="${ctx}/dtaqPipeAction.do?method=list&station_id=${station.station_id}&mode=${mode}" target="mainFrame">管线</a>
						</td>
					</tr>
					<c:if test="${mode == null}">
						<tr height="40">
							<td><span onclick="javascript:parent.document.location.href='${ctx}/dtaqLineAction.do?method=index&ec_p=${param.ec_p}&ec_id=${station.station_id}&ec_crd=${param.ec_crd}&flagPage=3&qsegmentId=${station.segment_id.segment_id}';">返回上一层</span></td>
						</tr>
					</c:if>
				</table>
			</td>
			<td width="5"
				style="background: url(${ctx}/styles/main/images/bg_midright.jpg)"></td>
		</tr>
		<tr height="5">
			<td width="5" height="5"
				style="background: url(${ctx}/images/menu/c_leftbot.jpg); background-repeat: no-repeat"></td>
			<td width="1" height="5"
				style="background: url(${ctx}/images/menu/bg_bot.jpg)"></td>
			<td style="background: url(${ctx}/images/menu/bg_bot.jpg)"></td>
			<td width="5" height="5"
				style="background: url(${ctx}/images/menu/c_rightbot.jpg); background-repeat: no-repeat"></td>
		</tr>
	</table>



</body>

</html:html>

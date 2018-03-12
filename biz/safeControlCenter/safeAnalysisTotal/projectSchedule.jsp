<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/artDialog2.1.1/artDialog.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/jquery-1.2.6.js"/>" type="text/javascript"></script>
<script language="javascript" src="${ctx}/scripts/jquery-1.4.2.min.js"></script>
<script language="javascript" src="${ctx}/scripts/jquery.easyui.min_1.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/scripts/themes/default/easyui.css"/>
<style type="text/css">
.btnWrap{margin: 20px auto;text-align: center;}
.box_img{width: 680px;height: 400px;margin: 0 auto;border: 1px solid #333;overflow: auto;}
.picWrap{position: relative;}
.picWrap img{position: absolute;z-index: 98;left: 0;top: 0;}
</style>
</head>
<body>
<div id="prjSchedulePage" class="easyui-layout" fit='true'>
	<div data-options="region:'center',border:false" style="overflow: auto">
			<c:if test="${stationSchedule.plane_jpeg_name != null&&param.index=='0'}">
				<div class="btnWrap"><input id="Button1" type="button" value="放大" class=" button1" onclick="changeSize('b','#img1')" />&nbsp;&nbsp;&nbsp;<input id="Button2" type="button" class="button1"  value="缩小"  onclick="changeSize('s','#img1')" />  </div>
				<div class="box_img">
				<div  id="img1" class="picWrap">
				<img width="680px" height="400px" class="drawing"  src="data:image/png;base64,${stationSchedule.plane_pictureBase}" /> 
				</div>
				</div>
			 </c:if>
			<c:if test="${stationSchedule.section_jpeg_name != null&&param.index=='1'}">
					<div class="btnWrap"><input id="Button3" type="button" value="放大" class=" button1"  onclick="changeSize('b','#img2')" />&nbsp;&nbsp;&nbsp;<input id="Button4" type="button" value="缩小"  class=" button1" onclick="changeSize('s','#img2')"/>  </div>
					<div class="box_img">
					<div  id="img2" class="picWrap">
					<img  width="680px" height="400px" class="drawing"   src="data:image/png;base64,${stationSchedule.section_pictureBase}" /> 
					</div>
					</div>
			</c:if>
			<c:if test="${stationSchedule.schematic_jpeg_name != null}">
					<div align="center"><input id="Button5" type="button" value="放大"  class=" button1"  onclick="changeSize('b','#img3')" />&nbsp;&nbsp;&nbsp;<input id="Button6" type="button" class=" button1"  value="缩小"  onclick="changeSize('s','#img3')"/>  </div>
					<div class="box_img">
					<div  id="img3" class="picWrap">
					<img width="680px" height="400px" class="drawing"  src="data:image/png;base64,${stationSchedule.schematic_pictureBase}" /> 
					</div>
					</div>
			</c:if>
	</div>
	<div data-options="region:'south',title:'形象进度说明',height:100">
			<c:if test="${stationSchedule.sector_memo != null}">
						${stationSchedule.sector_memo}
			</c:if>
	</div>
</div>
<script type="text/javascript">
function changeSize(type,imgId){
	if(type=='b'){
		var img=$(imgId).find("img");
		img.width(img.width() * 1.1);
		img.height(img.height() * 1.1);
	}
	if(type=='s'){
		var img=$(imgId).find("img");
		img.width(img.width() * 0.9);
		img.height(img.height() * 0.9);
	}
}
</script>
</body>
</html:html>
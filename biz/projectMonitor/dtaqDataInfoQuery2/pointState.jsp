<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<title><fmt:message key="dtaq.safeState.title"/></title>
<script src="${ctx}/scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/artDialog2.1.1/artDialog.js"/>" type="text/javascript"></script>
<link href="<c:url value="/scripts/artDialog2.1.1/skin/default.css"/>" type="text/css" rel="stylesheet" />
<style> 
.button1{
	font-size: 8pt;
	font-weight: bold;
	color:  #3777B4;
	
	border:1px ridge #FFAF69;
	background:url(img/bottom1.jpg);
	
	text-align:center;
	text-decoration:blink;
	height:20px ;
	line-height:18px ;
	padding:0px; 
	
}  
.btnWrap{
	width: 800px;
	margin: 20px auto;
}
#box{
	width: 800px;
	height: 400px;
	margin: 0 auto;
	border: 1px solid #333;
	overflow: auto;
}
#picWrap{
	position: relative;
}
#divCover{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 99;
}
#picWrap img{
	position: absolute;
	z-index: 98;
	left: 0;
	top: 0;
}
.point{
	display: none;
	width: 16px;
	height: 16px;
	cursor: pointer;
	position: absolute;
	z-index: 999;
	background: url(${ctx}/image/icon-point.gif) 0 0 no-repeat;
}
#selectPoint{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9999;
	border: 1px solid #0f0;
	background-color: rgba(0,255,0,.5);
}
#tablePoint{
	width: 96%;
	margin: 20px auto;
	border-collapse: collapse;
}
#tablePoint th, #tablePoint td{
	padding: 5px;
	border: 1px solid #ccc;
}
#tablePoint .code{
	text-align: center;
	width: 50px;
}
</style> 
</head>
<body>
<div id="viewPointPage">
<div class="btnWrap">
<input type="button" id="btnBig" class="button1" value="放大图纸"> 
<input type="button" id="btnSmall" class="button1" value="缩小图纸"> 
</div>
<div id="box">
	<c:if test="${param.organ_type=='T'}">
	<div id="picWrap">
		<img id="drawing" width="100%" height="400px" src="${ctx}/dtaqStationAction.do?method=download&station_id=${param.station_id}&download_type=build_plane" alt="" />
	</div>
	</c:if  >
	<c:if test="${param.organ_type=='O'}">
	<div id="picWrap">
		<img id="drawing" width="100%" height="400px" src="${ctx}/dtaqStationAction.do?method=download&station_id=${param.station_id}&download_type=third_plane" alt="" />
	</div>
	</c:if>
</div>
</div>
<script test="text/javascript">
	jQuery("#viewPointPage").find('#drawing').load(function(){
		var _thisPage=$('#viewPointPage');
		var actualImgW = _thisPage.find('#drawing').width();
		var actualImgH = _thisPage.find('#drawing').height();
	
		var boxW = _thisPage.find('#box').width();
		_thisPage.find('#picWrap').css({
			width: actualImgW,
			height: actualImgH,
			backgroundImage: 'url(' + _thisPage.find('#drawing').attr("src") + ')',
			backgroundPosition: '0 0',
			backgroundSize: '100% 100%'
		});
		_thisPage.find('#drawing').hide();
	
		var pointCoordsArr = []; //存放监测点的坐标
		var pointStr='${ponitStr}';
		if(pointStr!=''){
			pointCoordsArr=[${ponitStr}];
		}
		var isSelect = false; //定义是否可以拖拽和绘制
		var isGetData = false;
		var iX = 0, iY = 0; //点坐标
		var scale = 1; //比例尺
		var iL = 0, iT = 0;
		var pointLength = pointCoordsArr.length;
	
	
		//在地图上显示监测点
		if(pointLength > 0){
			for(var i = 0; i < pointLength; i++){
				_thisPage.find('#picWrap').append('<div class="point"></div>');
				_thisPage.find('.point').eq(i).show().css({
					left: pointCoordsArr[i][0] - 8,
					top: pointCoordsArr[i][1] - 8
				});
			}
		}
	
	
		//放大按钮事件
		_thisPage.find('#btnBig').click(function(){
			_thisPage.find('#picWrap').width(_thisPage.find('#picWrap').width() * 1.1);
			_thisPage.find('#picWrap').height(_thisPage.find('#picWrap').height() * 1.1);
			//_thisPage.find('#picWrap').height(_thisPage.find('#drawing').height());
			scale = _thisPage.find('#picWrap').width() / actualImgW;
			for(var i = 0; i < pointLength; i++){
				_thisPage.find('.point').eq(i).css({
					left: (pointCoordsArr[i][0] - 8) * scale,
					top: (pointCoordsArr[i][1] - 8) * scale
				});
			}
			_thisPage.find('#selectPoint').css({
				left: parseInt(_thisPage.find('#selectPoint').css('left')) * scale,
				top: parseInt(_thisPage.find('#selectPoint').css('top')) * scale
			})
		});
		//缩小按钮事件
		_thisPage.find('#btnSmall').click(function(){
		//	if(_thisPage.find('#picWrap').width() <= boxW){
		//		return false;
		//	}
			_thisPage.find('#picWrap').width(_thisPage.find('#picWrap').width() * 0.9);
			_thisPage.find('#picWrap').height(_thisPage.find('#picWrap').height() * 0.9);
			if(_thisPage.find('#picWrap').width() <= boxW){
				_thisPage.find('#picWrap').width(boxW);
				_thisPage.find('#picWrap').height(actualImgH * (boxW / actualImgW));
			}
			scale = _thisPage.find('#picWrap').width() / actualImgW;
			for(var i = 0; i < pointLength; i++){
				_thisPage.find('.point').eq(i).css({
					left: (pointCoordsArr[i][0] - 8) * scale,
					top: (pointCoordsArr[i][1] - 8) * scale
				});
			}
		});
	
		_thisPage.find('#picWrap').mousedown(function(e){
			isSelect = true;
			isGetData = true;
			_thisPage.find('#selectPoint').remove();
			_thisPage.find('#picWrap').prepend('<div id="selectPoint"></div>');
			drawPoint(e);
			_thisPage.find('#selectPoint').css({
				left: iX,
				top: iY
			});
			iL = iX;
			iT = iY;
			jQuery(document).mousemove(function(e){		
				if(isSelect){
					drawPoint(e);
					_thisPage.find('#selectPoint').css({
						width: iX - iL,
						height: iY - iT
					});
				}
			});
		});
		jQuery(document).mouseup(function(e){
			isSelect = false;
			if(isGetData){
				var allP= '';
				for(var i = 0; i < pointLength; i++){				
					var _thisPoint = _thisPage.find('.point').eq(i);
					var _thisL = parseFloat(_thisPoint.css('left'));
					var _thisT = parseFloat(_thisPoint.css('top'));
					if(_thisL>=iL && _thisL<=iX && _thisT>=iT && _thisT<=iY){
						allP += pointCoordsArr[i][2]+',';
					}
				}
				_thisPage.find('#selectPoint').remove();
				if(allP!=''){
					var url = '${ctx}/dtaq/dataInfoQuery2.do?method=forwardWarnCount&pointids='+allP ;
					art.dialog({id:'warncount',title:'监测信息', iframe:url, width:'700', height:'400',top:'10'});
				}
			}
			isGetData = false;
			return false;
		});
	
		//坐标位置
		function drawPoint(e){
			var pageL = e.pageX;
			var pageT = e.pageY;
			var divOffsetL = _thisPage.find('#box').offset().left;
			var divOffsetT = _thisPage.find('#box').offset().top;
			var divScrollL = _thisPage.find('#box').scrollLeft();
			var divScrollT = _thisPage.find('#box').scrollTop();
			iX = pageL - divOffsetL + divScrollL;
			iY = pageT - divOffsetT + divScrollT;
		}
	})
</script>
</body>
</html>
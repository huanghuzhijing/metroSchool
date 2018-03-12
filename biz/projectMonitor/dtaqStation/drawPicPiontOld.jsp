<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<head>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript" src="${ctx}/scripts/validator.jsp"></script>
	<script src="${ctx}/scripts/newWatchpoint.js"></script>
	<script language="javascript" src="${ctx}/scripts/jquery-1.2.6.pack.js"></script>
	
	<style type="text/css">
		#allmap {width: 555px;;height:375px;overflow: hidden;margin:0;text-align: center;vertical-align: middle;}
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}
	</style>
<title>
	<content tag="heading"> 地铁线路基本信息</content>  
</title>
</head>

<fieldset>
	<legend>原系统描点</legend>
<table class="formTable">
	<COLGROUP >
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
	</COLGROUP>
	
	<tr>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td colspan="3" >
				<div id="allmap">
					<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<img src='${ctx}/styles/img/press.gif'>
				</div>
			</td>
		</tr>
</table>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	<script type="text/javascript">
			//
			var line_tile="line_2";
			if('${dtaqLine.line_code}'=='01'){
				line_tile="line_1";
			}else if('${dtaqLine.line_code}'=='02'){
				line_tile="line_2";
			}else if('${dtaqLine.line_code}'=='03'){
				line_tile="line_3";
			}else if('${dtaqLine.line_code}'=='04'){
				line_tile="line_4";
			}else if('${dtaqLine.line_code}'=='05'){
				line_tile="line_4_2";
			}else if('${dtaqLine.line_code}'=='06'){
				line_tile="line_6";
			}else if('${dtaqLine.line_code}'=='07'){
				line_tile="line_7";
			}else if('${dtaqLine.line_code}'=='08'){
				line_tile="line_8";
			}else if('${dtaqLine.line_code}'=='11'){
				line_tile="line_11";
			}else if('${dtaqLine.line_code}'=='21'){
				line_tile="line_21";
			}else if('${dtaqLine.line_code}'=='27'){
				line_tile="line_27";
			}else if('${dtaqLine.line_code}'=='12'){
				line_tile="line_2_2";
			}else if('${dtaqLine.line_code}'=='82'){
				line_tile="line_8_2";
			}else if('${dtaqLine.line_code}'=='24'){
				line_tile="line_24";
			}
			//
			var tileLayer = new BMap.TileLayer({isTransparentPng: true});
			tileLayer.getTilesUrl = function(tileCoord, zoom) {
			    var x = tileCoord.x;
			    var y = tileCoord.y;
			    return '${ctx}/biz/projectMonitor/dtaqAnalyse/tiles/'+line_tile+'/' + zoom + '/tile' + x + '_' + y + '.png';
			}
			var map = new BMap.Map("allmap");
			map.addTileLayer(tileLayer);
			//map.addControl(new BMap.NavigationControl());
			map.centerAndZoom(new BMap.Point(114.240024, 30.615153), 13);
			map.disableDragging();
			map.disableDoubleClickZoom();
			map.setDefaultCursor("pointer");
			//section
			var localArr=[${localArr}];
			var subwayLine_wh = [${subwayLine_wh}];
			createMarker(subwayLine_wh);
			//
			function createMarker(subwayLine_wh) {
				map.clearOverlays();
				jQuery(subwayLine_wh).each(function(){
					if(this.type=='station'){
						var point = new BMap.Point(this.local.longitude, this.local.latitude);
						var safeStateFillColor = "black";
						var safeStateFillOpacity = "0.3";
						safeStateFillColor=this.safeState;
						safeStateFillOpacity = "1";
						var circle = new BMap.Circle(point,150, {fillColor:safeStateFillColor, strokeWeight:1, fillOpacity:safeStateFillOpacity});
						map.addOverlay(circle);
						//
						var int=self.setInterval(function(){ twinkle(circle); },500);
					}else{
						var polylineData=[];
						jQuery(this.local).each(function(){
							polylineData.push(new BMap.Point(this.longitude, this.latitude));
						});
						var polyline = new BMap.Polyline(polylineData, {strokeColor:"red", strokeWeight:4, strokeOpacity:1});
						map.addOverlay(polyline);
						//
						var int=self.setInterval(function(){ twinkle1(polyline); },600);
					}
				});
				//
				
				
			}
			//
			map.addEventListener("click",function(e){
				setLngLat(e.point.lat,e.point.lng);
			});
			//
			function twinkle(overlay)
			  {
				  if(overlay.getFillOpacity()==1){
					 // circle1.setFillColor("green")
					  overlay.setFillOpacity(0.5)
				  }else{
					 // circle1.setFillColor("green")
					  overlay.setFillOpacity(1)
				  }
			  }
			//  
			function twinkle1(overlay)
			{
				  if(overlay.getStrokeOpacity()==1){
					 // circle1.setFillColor("green")
					  overlay.setStrokeOpacity(0.5)
				  }else{
					 // circle1.setFillColor("green")
					  overlay.setStrokeOpacity(1)
				  }
			 }
			 //
			 function setLngLat(lat,lng){
			 	if(jQuery("[name='station_type']").val()=='S'){
			 		jQuery("[name='latLongItude']").val(lat+','+lng+';');
			 		subwayLine_wh = [
						{'id':'100','name':'','belong':'','type':'station','local':{'latitude':lat,'longitude':lng},'safeState':'red','progressState':'1'}
					];
					createMarker(subwayLine_wh);
			 	}else{
			 		jQuery("[name='latLongItude']").val(jQuery("[name='latLongItude']").val()+lat+','+lng+';');
			 		localArr.push({'latitude':lat,'longitude':lng});
			 		subwayLine_wh = [
			 			{'id':'100','name':'','belong':'','type':'section','local':localArr,'safeState':'red','progressState':'1'}
			 		];
			 		createMarker(subwayLine_wh);
			 	}
			 }
			 //
			 function itudeClear(){
			 	jQuery("[name='latLongItude']").val("");
			 	localArr= [];
			 	subwayLine_wh = [];
				createMarker(subwayLine_wh);
			 }
			</script>
			</fieldset>

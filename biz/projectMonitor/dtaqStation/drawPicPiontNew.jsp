<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/publicFunction.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yw2ioERsttS2u8Sz7d6KqF1R"></script>
<title>
	<content tag="heading"> 地铁线路基本信息</content>  
</title>
</head>
<fieldset>
<legend>新系统描点</legend>

<table width="100%" height="500px">
 	 	<tr height="500px">
			<td colspan="4" >
				<div id="editMap" style="width:100%;height:500px">
					<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<img src='${ctx}/styles/img/press.gif'>
				</div>
			</td>
		</tr>
 	 </table>
	<script type="text/javascript">
	$(function() {
		var map ; 
		var polyline ;
		var circle ;
		var point ;
		var points = [];
		var gray = "gray";
		var pointX='${pointX}';
		var pointY='${pointY}';
		map = new BMap.Map("editMap",{enableMapClick:false}); 
		map.setDefaultCursor('default'); 
		map.centerAndZoom(new BMap.Point(pointX, pointY),14);// 设置中心点坐标，地图级别
		map.enableScrollWheelZoom(); // 启用滚轮放大缩小
		map.disableDoubleClickZoom();//禁止用鼠标双击放大，默认启用(可不写)
		/*****添加比例尺******/
		var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
		var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
		/*缩放控件type有四种类型:
		BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
		map.addControl(top_left_control);        
		map.addControl(top_left_navigation);     

		/*****添加卫星图*****/
		var mapType1 = new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]});
		map.addControl(mapType1);
		
		//添加地图类型和缩略图	
		var overView = new BMap.OverviewMapControl();
		var overViewOpen = new BMap.OverviewMapControl({isOpen:true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT});
		map.setCurrentCity("武汉");        //由于有3D图，需要设置城市哦
		map.addControl(overView);          //添加默认缩略地图控件
		map.addControl(overViewOpen);      //右下角，打开
		map.setMinZoom(12);
		map.setMaxZoom(33);
		
		/********给地图添加右键菜单*****/
		var menu = new BMap.ContextMenu();
		var txtMenuItem = [
			{
				text:'放大',
				callback:function(){map.zoomIn()}
			},
			{
				text:'缩小',
				callback:function(){map.zoomOut()}
			}
		];
		for(var i=0; i < txtMenuItem.length; i++){
			menu.addItem(new BMap.MenuItem(txtMenuItem[i].text,txtMenuItem[i].callback,100));
		}
		map.addContextMenu(menu);

		//复杂的自定义覆盖物(标签)
	    function ComplexCustomOverlay(point, text){
	      this._point = point;
	      this._text = text;
	    }
	    ComplexCustomOverlay.prototype = new BMap.Overlay();
	    ComplexCustomOverlay.prototype.initialize = function(map){
	      this._map = map;
	      var div = this._div = document.createElement("div");
	      div.style.position = "absolute";
	      div.style.backgroundColor = "#EE5D5B";
	      div.style.border = "1px solid #BC3B3A";
	      div.style.color = "white";
	      div.style.height = "18px";
	      div.style.padding = "2px";
	      div.style.lineHeight = "18px";
	      div.style.whiteSpace = "nowrap";
	      div.style.MozUserSelect = "none";
	      div.style.fontSize = "12px"
	      var span = this._span = document.createElement("span");
	      div.appendChild(span);
	      span.appendChild(document.createTextNode(this._text));      
	      var that = this;
	      map.getPanes().labelPane.appendChild(div);
	      return div;
	    }
	    ComplexCustomOverlay.prototype.draw = function(){
	      var map = this._map;
	      var pixel = map.pointToOverlayPixel(this._point);
	      this._div.style.left = pixel.x  + "px";
	      this._div.style.top  = pixel.y  + "px";
	    }
		
		
		var type="${dtaqLine.line_code}";
		showLine_(type,'','','');
		initMarker_();
		creteLebel();

		//刷新位置
	 	$("#btn_refresh").click(function(){
	 		map.clearOverlays(); 
			var type="${dtaqLine.line_code}";
			showLine_(type,'','','');
			initMarker_();
	 		creteLebel();
		});

	 	map.addEventListener("click", setWPLabel);
		//地图上点击事件，设置工点名称的label到地图上
		function setWPLabel(e) {
			map.clearOverlays(); 
			var type="${dtaqLine.line_code}";
			showLine_(type,'','','');
			initMarker_();
			$("[name='pointsInfo']").val(e.point.lng + ", " + e.point.lat);
			creteLebel();
		}
		
		
		// 根据线路编号显示相应线路
		function showLine_(type,linecolor,stacolor,qjcolor) {
			makeline_(linecolor,stacolor,qjcolor);
		}
		// 创建线路
		function makeline_(lineColor,staColor,qjColor) {		
			var data_info =[];
			var pointLines='${dtaqLine.pointLine}';
			if(pointLines!=''){
				var arr1=pointLines.split('@');
				for(var j=0;j<arr1.length;j++){
					data_info=[];
					var arr2 = arr1[j].split('|');
					for(var i = 0; i < arr2.length; i++){
						data_info.push(arr2[i].split(','));
					}
				    drawMap_(data_info,lineColor,staColor,qjColor);
				}
				
				
				
				
			
			/**
				var arr2 = pointLines.split('|');
				for(var i = 0; i < arr2.length; i++){
					data_info.push(arr2[i].split(','));
				}
			    drawMap_(data_info,lineColor,staColor,qjColor);
			  */  
			    
			    
			    
			    
			}
		}
		//地图动态画线路站点图
		var points1 = [];
		function drawMap_(data_info,lineColor,staColor,qjColor){
			points1 = [];
			
			var qjDatas="";//获取所有的点的坐标集合
			for(var i=0;i<data_info.length;i++){
				qjDatas+=data_info[i][0]+","+data_info[i][1]+";";
			}
			
			for(var i=0;i<data_info.length;i++){
				point = new BMap.Point(data_info[i][0],data_info[i][1]);
				points1.push(point);
				if(data_info[i][2]){
					circle = new BMap.Circle(point, 60, {strokeColor:"gray", strokeWeight:8, strokeOpacity:0.7});
					map.addOverlay(circle);               // 将标注添加到地图中
						if(data_info[i][2]!='特殊站点'){
							var content = data_info[i][2];
							drawInfo_(content,point);
							addClickHandler_(circle,data_info[i][0],data_info[i][1],qjColor,qjDatas);
					}else{
					
						addClickHandler_(circle,data_info[i][0],data_info[i][1],qjColor,qjDatas);
					}
				}
//				addClickHandler_(circle,data_info[i][0],data_info[i][1],qjColor);
			}
			polyline = new BMap.Polyline(points1, {strokeColor:lineColor, strokeWeight:4, strokeOpacity:0.8});   //创建折线
			map.addOverlay(polyline); //增加折线
		}
		
		//点击描点
		var flag=0;
		var firstLng;
		var firstLat;
		var orderNum;
		var secondLat;
		var qjDatasbef="";
		
		//function addClickHandler_(marker,lng,lat,qjcolor){
		function addClickHandler_(marker,lng,lat,qjcolor,qjDatas){
			marker.addEventListener("click",function(e){
				var station_type = jQuery("[name='station_type']").val();
				if(station_type=='S')
					addMarker(lng,lat);
				if(station_type=='P'){
						//points=[];
						//addQJMarker(lng,lat);
						//var point = new BMap.Point(lng,lat);
						//points.push(point);
					//	flag=1;
					//	polyline = new BMap.Polyline(points, {strokeColor:qjcolor, strokeWeight:20, strokeOpacity:0.9});  // 创建标注
						//map.addOverlay(polyline); 
				
				
				
				
				
					if(flag==0){
						firstLng=lng;
						firstLat=lat;
						qjDatasbef=qjDatas;
						orderNum=qjDatas.indexOf(lng+","+lat);
						points=[];
						addQJMarker(lng,lat);
						flag=1;
					}else if(flag==1){
						var orderNum3=qjDatasbef.indexOf(lng+","+lat);
						if(orderNum3=='-1'){
							alert("请选择同一线路上的点！");
						}else{
							var orderNum2=qjDatas.indexOf(lng+","+lat);
							var qjDatasTemp;
							if(orderNum<orderNum2){//如果第一次选择的点在第二次选择的点之前
								qjDatasTemp=qjDatas.substring(orderNum,orderNum2)+lng+","+lat+";";
							}else if(orderNum>orderNum2){
								qjDatasTemp=qjDatas.substring(orderNum2,orderNum)+firstLng+","+firstLat+";";
							}
							if(qjDatasTemp!=''){
								var qjDatasArr=qjDatasTemp.split(';');
								for(var i=0;i<qjDatasArr.length;i++){
									if(qjDatasArr[i]!=''){
										var qjDatasArr1=qjDatasArr[i].split(',');
										var point2 = new BMap.Point(qjDatasArr1[0],qjDatasArr1[1]);
										points.push(point2);
										polyline = new BMap.Polyline(points, {strokeColor:qjcolor, strokeWeight:20, strokeOpacity:0.9});  // 创建标注
										map.addOverlay(polyline);               // 将标注添加到地图中
									}
								}
							}
							jQuery("[name='coordinates']").val('');
							jQuery("[name='coordinates']").val(qjDatasTemp);
							addQJMarker(lng,lat);
							flag=0;
						
						}
						
						
						
					}
				
				
				
				
				
					//if(flag==0){
					//	points=[];
					//	addQJMarker(lng,lat);
					//	point1 = new BMap.Point(lng,lat);
					//	points.push(point1);
					//	flag=1;
					//}else if(flag==1){
					//	addQJMarker(lng,lat);
					//	point2 = new BMap.Point(lng,lat);
					//	points.push(point2);
					//	polyline = new BMap.Polyline(points, {strokeColor:qjcolor, strokeWeight:20, strokeOpacity:0.9});  // 创建标注
					//	map.addOverlay(polyline);               // 将标注添加到地图中
					//	flag=0;
					//}
				}
			});
		}
		function drawInfo_(content,pointMsg){
			var opts = {
			  position: pointMsg,
			  offset: new BMap.Size(10, -30) // 设置偏移量
			}
			var label = new BMap.Label(content, opts);
			label.setStyle({
				 color : "#0123a3",
				 fontSize : "12px",
				 height : "",
				 lineHeight : "20px",
				 padding : "1px 3px",
				 border :"1px solid #0123a3",
				 fontFamily:"微软雅黑"
			 });
			map.addOverlay(label); 
		}


		function creteLebel(){
			var infos=$("[name='pointsInfo']").val();
			if(infos!=null&&infos!=''){
				var  pointEs= $("[name='pointsInfo']").val().split(",");
				var point = new BMap.Point(pointEs[0],pointEs[1]);
				var myCompOverlay = new ComplexCustomOverlay(point, $("[name='station_name']").val());
				map.addOverlay(myCompOverlay);
			}
		}
		
		// 站点创建标注
		function addMarker(lng,lat){
			deletePoint();
			var pointMsg= new BMap.Point(lng,lat);
			var stcolor='';
			circle = new BMap.Circle(pointMsg, 60, {strokeColor:stcolor, strokeWeight:8, strokeOpacity:0.7});
			map.addOverlay(circle);               // 将标注添加到地图中
			var marker = new BMap.Marker(pointMsg);
			map.addOverlay(marker);
		    jQuery("[name='coordinates']").val(lng+','+lat+';');
		    jQuery("[name='pointsInfo']").val(lng+','+lat);
		}
		// 区间创建标注
		function addQJMarker(lng,lat){
			if(flag==0)
				deletePoint();
			var pointMsg= new BMap.Point(lng,lat);
			var marker = new BMap.Marker(pointMsg);
			map.addOverlay(marker);
			//var temp=jQuery("[name='coordinates']").val();
			if(flag==0){
		    	jQuery("[name='coordinates']").val(lng+','+lat+';');
			}
		}
		//删除按钮
		$("#btn_clear_station").click(function(){
			deletePoint();
		});
		// 清除指定标注
		function deletePoint(){
			map.clearOverlays(); 
			jQuery("[name='coordinates']").val('');
			var type="${dtaqLine.line_code}";
			flag=0;
			
			showLine_(type,'','','');
		}
		// 初始化标注
		function initMarker_(){
			var latLongItude=$("[name='coordinates']").val();
			if(latLongItude!=''){
			var type=jQuery("[name='station_type']").val();
				if(type=='S'){
					var pts=latLongItude.split(";");
					var point=pts[0].trim();
					var pt=point.split(",");
					var lng=pt[0].trim();
					var lat=pt[1].trim();
					var pointMsg= new BMap.Point(Number(lng),Number(lat));
					var marker = new BMap.Marker(pointMsg);
					map.addOverlay(marker);

					var stcolor='blue';
					circle = new BMap.Circle(pointMsg, 60, {strokeColor:stcolor, strokeWeight:8, strokeOpacity:0.7});
					map.addOverlay(circle);               // 将标注添加到地图中
				}else if(type=='P'){
					var pts=latLongItude.split(";");
					var initponint=[];
					for(var i = 0; i <pts.length; i++){
						if(pts[i]!=''){
							var point1=pts[i];
							var pt1=point1.split(",");
							var lng1=pt1[0];
							var lat1=pt1[1];
							var pointMsg1= new BMap.Point(Number(lng1),Number(lat1));
							var marker = new BMap.Marker(pointMsg1);
							if(i==0||i==pts.length-2){
								map.addOverlay(marker);
							}
							initponint.push(pointMsg1);
						}
					}

					var qjcolor='blue';
					polyline = new BMap.Polyline(initponint, {strokeColor:qjcolor, strokeWeight:20, strokeOpacity:0.9});  // 创建标注
					map.addOverlay(polyline);  
				}
			}
		}
	});
	</script>
</fieldset>
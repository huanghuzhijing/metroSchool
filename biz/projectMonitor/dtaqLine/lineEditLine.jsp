<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/publicFunction.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yw2ioERsttS2u8Sz7d6KqF1R"></script>
 <content tag="heading">${metroLine.shortLineName}地图线路编辑</content>  
</head>
<body>
<html:form action="dtaqLineAction.do" styleClass="form" method="POST" styleId="dtaqLineForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save" />
<html:hidden property="line_id" value="${dtaqLine.line_id}"/>
<html:hidden property="line_code" value="${dtaqLine.line_code}"/>
<html:hidden property="line_name" value="${dtaqLine.line_name}"/>
<html:hidden property="pointLine" value="${dtaqLine.pointLine}"/>
<html:hidden property="lineNameInfo" value="${dtaqLine.lineNameInfo}"/>
<div class="listButtonDiv">
<input type="button" id="startEdit"     icon="icon_edit"  value="开启路线编辑功能"  />&nbsp;
<input type="button" id="endEdit"       icon="icon_edit"  value="关闭路线编辑功能" />&nbsp;
<input type="button" id="clearOverlay"  icon="icon_edit"  value="线路图重新绘制"  />&nbsp;
<input type="button" id="auxiliary"     icon="icon_edit"  value="开启辅路编辑功能"  />&nbsp;
<input type="button" id="btn_save"      icon="icon_save"  value="保  存" />&nbsp;
<input type="button" id="btn_back"      icon="icon_back" value="返  回">
</div>
<table width="100%">
<tr>
<td width="85%">
<div id="lineMap" style="width:100%;height:653px"></div>
</td>
<td  width="15%" valign="top">
<div id="control">
	   <div id="longitudeLatitude"></div>
	   <font color="red" style="font-weight:bold;">绘图技巧说明:</font>
	   <br/> <br/>
	   <font color="blue">
	   	 <B>1.</B>首次绘图时，需点击“开启线路编辑功能”按钮，后鼠标左键任意点击地图两点，出现红线后，点击鼠标右键，出现能拖拽的线后，进行拖拽绘线。 <br/> <br/>
	   	 <B>2.</B>拖拽完成线路图后，点击“关闭。。”按钮，生成线路图，如果需要修改可再次点击“开启。。”按钮。 <br/> <br/>
	   	 <B> 3.</B>点击“关闭。。”按钮后，点击红色圈圈，即可输入站点名称。 <br/> <br/>
	   	 <B> 4.</B>当输入站点名称为“<font color="red">特殊站点</font>”，即为描点辅助站点。 <font color="red">此点信息在展示地图中将不显示。</font> <br/>
	   	</font>
</td>
</tr>
</table>
</html:form>
<script type="text/javascript">
$(function(){
	$('#lineMap').height($(window).height()*0.85);
	
	var myMap = new BMap.Map('lineMap', {enableMapClick:false});
	myMap.setDefaultCursor("default");
	var point = new BMap.Point(114.313895, 30.595929);
	myMap.centerAndZoom(point, 13);
	myMap.enableScrollWheelZoom();
	myMap.disableDoubleClickZoom();//禁止用鼠标双击放大，默认启用(可不写)
	/*****添加比例尺******/
	var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
	/*缩放控件type有四种类型:
	BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
	myMap.addControl(top_left_control);        
	myMap.addControl(top_left_navigation);     

	/*****添加卫星图*****/
	var mapType1 = new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP]});
	myMap.addControl(mapType1);
	
	//添加地图类型和缩略图	
	var overView = new BMap.OverviewMapControl();
	var overViewOpen = new BMap.OverviewMapControl({isOpen:true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT});
	myMap.setCurrentCity("武汉");        //由于有3D图，需要设置城市哦
	myMap.addControl(overView);          //添加默认缩略地图控件
	myMap.addControl(overViewOpen);      //右下角，打开



	//复杂的自定义覆盖物(标签)
    function ComplexCustomOverlay(point, text){
      this._point = point;
      this._text = text;
    }
    ComplexCustomOverlay.prototype = new BMap.Overlay();
    ComplexCustomOverlay.prototype.initialize = function(myMap){
      this._map = myMap;
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
      myMap.getPanes().labelPane.appendChild(div);
      return div;
    }
    ComplexCustomOverlay.prototype.draw = function(){
      var map = this._map;
      var pixel = map.pointToOverlayPixel(this._point);
      this._div.style.left = pixel.x  + "px";
      this._div.style.top  = pixel.y  + "px";
    }
	var complexLabel=new BMap.Overlay();
	creteLebel();
	myMap.addEventListener("click", setWPLabel);
  //地图上点击事件，设置线路名称的label到地图上
	function setWPLabel(e) {
		$("[name='lineNameInfo']").val(e.point.lng + ", " + e.point.lat);
		creteLebel();
	}
	function creteLebel(){
		myMap.removeOverlay(complexLabel);
		var infos=$("[name='lineNameInfo']").val();
		if(infos!=null&&infos!=''){
			var  pointEs= $("[name='lineNameInfo']").val().split(",");
			var point = new BMap.Point(pointEs[0],pointEs[1]);
			complexLabel= new ComplexCustomOverlay(point, $("[name='line_name']").val());
			myMap.addOverlay(complexLabel);
		}
	}
	/**********初始化数据Start**********/
	var _polylineAttribute = { //绘制线条的属性
		strokeColor: 'red',
		strokeWeight: 2,
		strokeOpacity: .8
	};
	var _circleAttribute = { //绘制圆的属性
		strokeColor: 'red',
		strokeWeight: 5,
		strokeOpacity: .8
	};
	var _labelStyle = {
		color : 'red',
		fontSize : "12px",
		padding: '3px',
		fontFamily:"微软雅黑",
		borderRadius: '3px',
		border: '1px solid red'
	};
	
	var _allPointArr2 = [];
	var _allPointArr = [], //包含所有点和站点的集合 例如: [[1,2], [3,4,"光谷广场站"], [5,6], [7,8,"中南路站"]]
	_allPointArrAll = [], //包含所有点和站点的集合 例如: [[1,2], [3,4,"光谷广场站"], [5,6], [7,8,"中南路站"]]
	
	pointLines='${dtaqLine.pointLine}',
	_polylinePointArr = [], //提取所有点的集合转化为地图坐标 例如: new BMap.Point(1, 2)
	_polylinePointArrAll = [], //提取所有点的集合转化为地图坐标 例如: new BMap.Point(1, 2)
	_stationPointArr = [], //只包含带有站点的所有点的集合 例如: [[3,4,"光谷广场站"], [7,8,"中南路站"]]
	_createPolyline = null, //绘制的线条名称
	_createPolylineOld = [], //绘制的线条名称的集合
	_createCircleArr = [], //存储创建的圆集合
	_createLabelArr = []; //存储创建的Label集合

	if(pointLines!=''){
	
		var arr1=pointLines.split('@')
		for(var j=0;j<arr1.length;j++){
			var arr2 = arr1[j].split('|');
			_polylinePointArr=[];
			for(var i = 0; i < arr2.length; i++){
			
				var arr2Temp=arr2[i].split(',');
				if(arr2Temp.length==3){
					_stationPointArr.push([arr2Temp[0],arr2Temp[1],arr2Temp[2]])
					_allPointArr.push([arr2Temp[0],arr2Temp[1],arr2Temp[2]]);
				}else if(arr2Temp.length==2){
					_allPointArr.push([arr2Temp[0],arr2Temp[1]]);
				
				
				
				}
				
				_polylinePointArr.push(new BMap.Point(arr2Temp[0], arr2Temp[1]));
				_polylinePointArrAll.push(new BMap.Point(arr2Temp[0], arr2Temp[1]));
				
				
			}
			_createPolyline = new BMap.Polyline(_polylinePointArr, _polylineAttribute);
			myMap.addOverlay(_createPolyline);
		}
		
		
		
		
	}


	//在地图上绘制圆
		for(var i = 0; i < _polylinePointArrAll.length; i++){
			var createCircle0 = new BMap.Circle(_polylinePointArrAll[i], 50, _circleAttribute);
			myMap.addOverlay(createCircle0);
			var temp= _stationPointArr.indexTest([_polylinePointArrAll[i].lng,_polylinePointArrAll[i].lat]);
			if(temp != -1){
				createCircle0.setStrokeColor('blue');
			}
		}

	/**	
	//从数组里提取分离数据
	if(_allPointArr.length > 0){ 
		for(var i = 0; i < _allPointArr.length; i++){
			_polylinePointArr.push(new BMap.Point(_allPointArr[i][0], _allPointArr[i][1]));
			if(_allPointArr[i][2]){
					_stationPointArr.push(_allPointArr[i]);
			}
		};	
	}
	
	if(_polylinePointArr.length > 1){
		//在地图上绘制折线
		_createPolyline = new BMap.Polyline(_polylinePointArr, _polylineAttribute);
		myMap.addOverlay(_createPolyline);
		
		//在地图上绘制圆
		for(var i = 0; i < _polylinePointArr.length; i++){
			var createCircle0 = new BMap.Circle(_polylinePointArr[i], 50, _circleAttribute);
			myMap.addOverlay(createCircle0);
			var temp= _stationPointArr.indexTest([_polylinePointArr[i].lng,_polylinePointArr[i].lat]);
			if(temp != -1){
				createCircle0.setStrokeColor('blue');
			}
		}
	}
	*/
	
	//在地图上创建Label标签
	if(_stationPointArr.length > 0){
		for(var i = 0; i < _stationPointArr.length; i++){
				var opts = {
						position: new BMap.Point(_stationPointArr[i][0], _stationPointArr[i][1]),
						offset  : new BMap.Size(8, -20)
					};
			var createLabel = new BMap.Label(_stationPointArr[i][2], opts);
			createLabel.setStyle(_labelStyle);			
			createLabel.disableMassClear();
			_createLabelArr.push(createLabel);
			myMap.addOverlay(createLabel);
		}
	}
	
	/**********初始化数据End**********/
	
	
			
	
	function drawPoint(e){
		_polylinePointArr.push(new BMap.Point(e.point.lng, e.point.lat));
		
		if(_polylinePointArr.length > 1){
			myMap.removeOverlay(_createPolyline);
			drawPolylineOld();//画出当前地图上已有的线路
			_createPolyline = new BMap.Polyline(_polylinePointArr, _polylineAttribute);
			myMap.addOverlay(_createPolyline);
			
		}
	}
	function drawPointStart(e){
		_createPolyline.enableEditing();
		myMap.removeEventListener('click', drawPoint);
	}
	
	function pushPolylineOld(){//获取当前地图上已有的线路
		_createPolylineOld=[];
		var overlayAll=myMap.getOverlays();//获取所有的覆盖物
			for(var i=0;i<overlayAll.length;i++){
				var overlayLine=overlayAll[i];
				if(overlayLine instanceof BMap.Polyline){
					_createPolylineOld.push(overlayLine);//将线路放入全局变量集合
				}
			}
	
	}
	function drawPolylineOld(){//画出当前地图上已有的线路
		for(var i=0;i<_createPolylineOld.length;i++){//将之前的线路绘制出来
				myMap.addOverlay(_createPolylineOld[i]);	
		}
	
	}
	
	

	/*****点击开启按钮开启路线编辑功能*****/
	jQuery('#startEdit').click(function(){
		pushPolylineOld();
		
		if(_createPolylineOld.length>0){
			
		
			//如果地图上存在线条就直接开启编辑模式
			myMap.clearOverlays();
			for(var i=0;i<_createPolylineOld.length;i++){//将之前的线路绘制出来
				myMap.addOverlay(_createPolylineOld[i]);	
				_createPolylineOld[i].enableEditing();
			}
			
		//	myMap.addOverlay(_createPolyline);
		//	_createPolyline.enableEditing();
			myMap.removeEventListener('click', drawPoint);
			myMap.removeEventListener('rightclick', drawPointStart);
		}else{
			//如果地图上不存在线条就先点击地图创建线条
			myMap.addEventListener('click', drawPoint);
			myMap.addEventListener('rightclick', drawPointStart);
		}
	});
	
	/*****点击开启按钮开启辅助路线编辑功能*****/
	jQuery('#auxiliary').click(function(){
			_polylinePointArr=[];//讲当前的线路点置空
			pushPolylineOld();//获取当前地图上已有的线路
			
			myMap.addEventListener('click', drawPoint);
			myMap.addEventListener('rightclick', drawPointStart);
	});

	/*****点击关闭按钮关闭路线编辑功能*****/
	jQuery('#endEdit').click(function(){
		myMap.removeEventListener('click', drawPoint);
		myMap.removeEventListener('rightclick', drawPointStart);
		
		pushPolylineOld();//获取当前地图上已有的线路
		myMap.clearOverlays();//清除所有的覆盖物
		creteLebel();//创建线路信息
		_allPointArr=[];
		for(var j=0;j<_createPolylineOld.length;j++){//将之前的线路循环出来
			_createPolyline=_createPolylineOld[j];
			drawPolylineOld();//重新生成线路线路
			if(_createPolyline){
				_createPolyline.disableEditing();//取消编辑功能
				_polylinePointArr = _createPolyline.getPath();	//获取编辑后线上的点坐标
				for (var i = 0; i < _polylinePointArr.length; i++) {//循环线路上的坐标
						_allPointArr.push([_polylinePointArr[i].lng, _polylinePointArr[i].lat]);//获取所有的点
						var createCircle = new BMap.Circle(_polylinePointArr[i], 50, _circleAttribute);
						_createCircleArr.push(createCircle);
						myMap.addOverlay(createCircle); //添加绘制圆点到地图上
						
						var temp= _stationPointArr.indexTest([_polylinePointArr[i].lng,_polylinePointArr[i].lat]);
						if(temp != -1){
							createCircle.setStrokeColor('blue');
						}
				}
			}
		}
		
			//得到最新的_allPointArr数组集合
			for (var i = 0; i < _stationPointArr.length; i++) {
				var stationPoint = '' + _stationPointArr[i][0] + _stationPointArr[i][1];
				for (var j = 0; j < _allPointArr.length; j++) {
					var thisPoint = '' + _allPointArr[j][0] + _allPointArr[j][1];
					if(stationPoint == thisPoint){
						_allPointArr.splice(j,1,_stationPointArr[i]);
					}
				}
			}
			
			//得到最新的站点数组集合
			_stationPointArr = [];
			for(var i = 0; i < _allPointArr.length; i++){
				if(_allPointArr[i][2]){
					_stationPointArr.push(_allPointArr[i]);
				}
			};
		
		//当站点信息不在路线上时，删除这个站点
		for (var i = 0; i < _createLabelArr.length; i++){
			var testLabel = [_createLabelArr[i].point.lng, _createLabelArr[i].point.lat];
			var hasData = _allPointArr.indexTest(testLabel);
			
			if(hasData == -1){
				myMap.removeOverlay(_createLabelArr[i]); //删除label文本标签
				_createLabelArr.splice(i,1);
			}
		}
		
		//圆点点击事件
		for(var i = 0; i < _createCircleArr.length; i++){
			_createCircleArr[i].addEventListener('click', function(){
				var _this = this;
				var thisPoint = '' + _this.point.lng + _this.point.lat;
				for(var j = 0; j < _allPointArr.length; j++){
					var matchPoint = '' + _allPointArr[j][0] + _allPointArr[j][1];
					if(thisPoint == matchPoint){
						if(_allPointArr[j][2]){
							var maintenanceStation =  prompt('维护站点信息', _allPointArr[j][2]);
							for(var k = 0; k < _allPointArr.length; k++){
								if(maintenanceStation != null && maintenanceStation != ""&&maintenanceStation!="特殊站点"&& maintenanceStation == _allPointArr[k][2]){
									alert('此站点已经存在，请重新输入！');
									return false;
								}
							}
						}else{
							var maintenanceStation =  prompt('维护站点信息', '');
							for(var k = 0; k < _allPointArr.length; k++){
								if(maintenanceStation != null && maintenanceStation != ""&&maintenanceStation!="特殊站点"&& maintenanceStation == _allPointArr[k][2]){
									alert('此站点已经存在，请重新输入！');
									return false;
								}
							}
						}
					};
					if(maintenanceStation != null && maintenanceStation != ""){
						var thisPoint = '' + _this.point.lng + _this.point.lat;
						for(var k = 0; k < _allPointArr.length; k++){
							var matchPoint = '' + _allPointArr[k][0] + _allPointArr[k][1];
							if(thisPoint == matchPoint){
								if(_allPointArr[k][2]){
									if(_allPointArr[k][2]!='特殊站点'){
										var labelText = _allPointArr[k][2];
										_allPointArr[k].splice(2,1);
										for (var l = 0; l < _createLabelArr.length; l++){
											if(_createLabelArr[l].content == labelText){
												myMap.removeOverlay(_createLabelArr[l]); //删除label文本标签
												_createLabelArr.splice(l,1);
											}
										}
									}
									if(_allPointArr[k][2]=='特殊站点'){
									}
								}
								_allPointArr[k].splice(2,0,maintenanceStation); //修改点击的点在数组中的信息--在后面添加站点信息
								//得到最新的站点数组集合
								_stationPointArr = [];
								for(var l = 0; l < _allPointArr.length; l++){
									if(_allPointArr[l][2]){
										_stationPointArr.push(_allPointArr[l]);
									}
								};
							};
						}
						var opts = {
							position: _this.point,
							offset: new BMap.Size(8, -20)
						};
						var createLabel = new BMap.Label(maintenanceStation, opts);
						createLabel.setStyle(_labelStyle);
						createLabel.disableMassClear();
						myMap.addOverlay(createLabel);
						_createLabelArr.push(createLabel);
						_this.setStrokeColor('blue');
					}
					if(maintenanceStation == ""){
						var thisPoint = '' + _this.point.lng + _this.point.lat;
						for(var k = 0; k < _allPointArr.length; k++){
							var matchPoint = '' + _allPointArr[k][0] + _allPointArr[k][1];
							if(thisPoint == matchPoint){
								var labelText = _allPointArr[k][2];
								_allPointArr[k].splice(2,1);  //修改点击的点在数组中的信息--删除站点信息
								for (var l = 0; l < _createLabelArr.length; l++){
									if(_createLabelArr[l].content == labelText){
										myMap.removeOverlay(_createLabelArr[l]); //删除label文本标签
										_createLabelArr.splice(l,1);
									}
								}
							};
						}
						_this.setStrokeColor('red');
					}
				}
				return false;
			});
		}
		
		
		
		
		
		
		
		
		

		
		
	})
	
	/*****点击保存按钮发送数据*****/
	jQuery('#btn_save').click(function(){
		pushPolylineOld();//获取当前地图上已有的线路
		
		var newArrAllTemp="";
		for(var j=0;j<_createPolylineOld.length;j++){//将之前的线路循环出来
			_createPolyline=_createPolylineOld[j];
			_polylinePointArr = _createPolyline.getPath();	//获取编辑后线上的点坐标
			var newArrTemp="";
			for (var i = 0; i < _polylinePointArr.length; i++) {
			
				var newArrTemp1=_polylinePointArr[i].lng+","+_polylinePointArr[i].lat;
				
				for(var k = 0; k < _allPointArr.length; k++){
					if(_allPointArr[k][2]){
						var matchPoint = _allPointArr[k][0]+","+_allPointArr[k][1];
						if(newArrTemp1 == matchPoint){
							newArrTemp1=newArrTemp1+","+_allPointArr[k][2]
						}
					}
				}
				if(i<_polylinePointArr.length-1){
					newArrTemp+=newArrTemp1+"|";
				}else{
					newArrTemp+=newArrTemp1;
				}
			}
			if(j==_createPolylineOld.length-1){
					newArrAllTemp+=newArrTemp;
			}else{
					newArrAllTemp+=newArrTemp+"@";
			}
		}
	
		//alert(newArrAllTemp);

		jQuery("[name='pointLine']").val(newArrAllTemp);

		var properties=new Array(); 
		saveValidateRequired("#btn_save",properties,"dtaqLineForm");
		
	})
	
	/****返回*****/
	jQuery('#btn_back').click(function(){
		document.forms[0].action='dtaqLineAction.do?method=index&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&flagPage=1'; 
    	document.forms[0].submit();
	})
	
	
	/*****点击重置按钮清楚覆盖层*****/
	jQuery('#clearOverlay').click(function(){
		if (confirm("当前编辑线路所有信息将在地图上清除！是否确认重绘")){
			myMap.removeEventListener('click', drawPoint);
			myMap.removeEventListener('rightclick', drawPointStart);
			for(var i = 0; i < _createLabelArr.length; i++){
				myMap.removeOverlay(_createLabelArr[i]);
			}
			myMap.clearOverlays();
			_allPointArr = [],
			_createPolylineOld = [], //绘制的线条名称的集合
			_polylinePointArr = [],
			_stationPointArr = [],
			_createPolyline = null,
			_createCircleArr = [],
			_createLabelArr = [];
		}
	})
})

</script>
</body>
</html:html>
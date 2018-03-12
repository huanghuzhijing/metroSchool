
//通过序列化表单值来创建对象数组（名称name和值value），然后转化为对象
function serializeObject(objForm) {
	var obj = {};
	$.each(objForm.serializeArray(), function(index, value) {
		obj[this['name']] = this['value'];
	});
	return obj;
};


//自定义数组删除方法
Array.prototype.indexOf = function(value) {//找到元素在数组中的索引
	for (var i = 0; i < this.length; i++) {
		if (this[i] == value){
			return i;
		}
	}
	return -1;
};
Array.prototype.remove = function(value){//根据元素在数组中的索引，删除元素
	var index = this.indexOf(value);
	if(index > -1){
		this.splice(index, 1);
	}
};

//找到一维数组在二维数组中的索引(地图线路绘制使用)
Array.prototype.indexTest = function(arr) {
	for (var i = 0; i < this.length; i++) {
		if ('' + this[i][0] + this[i][1] == '' + arr[0] + arr[1]){
			return i;
		}
	}
	return -1;
};


/****************************************百度地图Start****************************************/
//提取坐标
function pointArr(arr){
	var pointArr = [];
	for(var i=0; i<arr.length; i++){
		var point = new BMap.Point(arr[i][0], arr[i][1]);
		pointArr.push(point);
	};
	return pointArr;
}

//在地图上绘制折线
function  drawPolyline(myMap, point, settingObj){
	var defaultObj = {	//设置默认线条属性
		strokeColor: 'red',
		strokeWeight: 3,
		strokeOpacity: .8
	};
	var newObj = $.extend({}, defaultObj, settingObj);
	var polyline = new BMap.Polyline(point, newObj);	//绘制折线
	myMap.addOverlay(polyline);
}

//在地图上绘制圆和文本标签
function drawCircle(myMap, arr, settingCircleObj, settingLabelObj){
	for(var i=0; i<arr.length; i++){
		if(arr[i][2]){
			var defaultCircleObj = {	//设置默认线条属性
				strokeColor: 'red',
				strokeWeight: 3,
				strokeOpacity: .8
			};
			var newCircleObj = $.extend({}, defaultCircleObj, settingCircleObj);
			var point = new BMap.Point(arr[i][0], arr[i][1]);
			var circle = new BMap.Circle(point, 50, newCircleObj);	//绘制圆
			myMap.addOverlay(circle);

			var opts = {
				position: point,
				offset  : new BMap.Size(8, -20)
			};
			var label = new BMap.Label(arr[i][2], opts);
			var defaultLabelObj = {	//设置默认Label文本标签属性
				color : 'red',
				fontSize : "12px",
				padding: '3px',
				fontFamily:"微软雅黑",
				borderRadius: '3px',
				border: '1px solid red'
			};
			var newLabelObj = $.extend({}, defaultLabelObj, settingLabelObj);
			label.setStyle(newLabelObj);
			myMap.addOverlay(label);
		}
	};
}
/****************************************百度地图End****************************************/
/**********GIS平台 绘图************/

//地图动态描点
function drawMap(map,data_info,belong,safeState,lineColor,staColor,qjColor,child){
	var points1 = [];
	for(var i=0;i<data_info.length;i++){
		point = new BMap.Point(data_info[i][0],data_info[i][1]);
		points1.push(point);
		if(data_info[i][2]&&data_info[i][2]!='特殊站点'){
			circle = new BMap.Circle(point, 60, {strokeColor:"gray", strokeWeight:8, strokeOpacity:0.7});
			map.addOverlay(circle);               // 将标注添加到地图中
			var content = data_info[i][2];
			drawInfo(map,content,point);
		}
	}
	
	polyline = new BMap.Polyline(points1, {strokeColor:lineColor, strokeWeight:4, strokeOpacity:0.8});   //创建折线
	map.addOverlay(polyline);   //增加折线
	
	jQuery(child).each(function(){
		var locals=this.local;
		if(locals!=''&& typeof(locals)!='undefined'){
			var temps=locals.split(";");
			if(this.type=='S'){
				var statemp=temps[0].split(",");
				point = new BMap.Point(statemp[0],statemp[1]);
				circle = new BMap.Circle(point, 100, {strokeColor:staColor, strokeWeight:10, strokeOpacity:0.7});
				map.addOverlay(circle);               // 将标注添加到地图中
				addClickHandler(map,circle,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
			}else if(this.type=='P'){
				var initponint=[];
				for(var i = 0; i <temps.length; i++){
					if(temps[i]!=''){
						var point1=temps[i];
						var pt1=point1.split(",");
						var lng1=pt1[0];
						var lat1=pt1[1];
						var pointMsg1= new BMap.Point(Number(lng1),Number(lat1));
						initponint.push(pointMsg1);
					}
				}
				polyline = new BMap.Polyline(initponint, {strokeColor:qjColor, strokeWeight:20, strokeOpacity:0.9});  // 创建标注
				map.addOverlay(polyline);  

				addClickHandler(map,polyline,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
			}
	    }
	});
}

//点击站点
function addClickHandler(map,marker,belong,qlineId,qsectionId,qworkPointId,count){
	marker.addEventListener("click",function(e){
		openWindow(map,belong,e,qlineId,qsectionId,qworkPointId,count);
	});
	//marker.addEventListener("mouseover",function(e){
	//});
}

function drawInfo(map,content,pointMsg){
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

function openWindow(map,remark ,e,qlineId,qsectionId,qworkPointId,count){
	var msg = {
		width : 300,     // 信息窗口宽度
		title : "" , // 信息窗口标题
		enableMessage:false//设置允许信息窗发送短息
	};
	var pointMsg = new BMap.Point(e.point.lng, e.point.lat);
	remark+="隐患个数：<a href='javascript:void(0)' onclick=\"overReturnTarget('3', 'hcSolutionAction.do?method=queryList1&qlineId="+qlineId+"&qsectionId="+qsectionId+"&qworkPointId="+qworkPointId+"')\";><font color='black'>"+count+"</font></a></font>";
	var infoWindow = new BMap.InfoWindow(remark,msg);  // 创建信息窗口对象 
	map.openInfoWindow(infoWindow,pointMsg); //开启信息窗口
}
/**********GIS平台 绘图 end************/

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<ex:bundle/>
<html:html>
<head>
<title>武汉地铁质量安全大数据管理平台</title>
<!--<link rel="stylesheet" type="text/css" href="${ctx}/styles/mainIndex/css/style.css" />-->
<%@ include file="/commons/easyui-1.4.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/publicFunction.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=yw2ioERsttS2u8Sz7d6KqF1R"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
<style type="text/css">
#allmap {width: 100%;height: 600px;overflow: hidden;margin:0;}
.ggHeader{font: bold 16px Verdana, Arial, Helvetica, sans-serif;letter-spacing: 2px;text-transform: uppercase;text-align: center;padding: 6px 6px 6px 6px;background: #f1f1f1;vertical-align: middle;}
.title {color: #516897;font-size: 12px;font-weight:bold;background: url(${ctx}/image/note.gif) no-repeat left;padding-left:15px;}
.content{padding-left:30px;}
</style>
<script language="javascript">
		function overReturnTarget(flag,arg){
			location.href=arg;
		}

		$(document).ready(function(){
			var table1=$("#tablescrop1");
			var item1=$(".item1");
			if(table1.height()>item1.height()){
				var speed = 2000;  
	            function Marquee() {  
	            	var $self = table1; 
	            	var lineHeight = $self.find("tr:first").height(); 
	            	$self.animate({ 
	            		"marginTop": -lineHeight + "px" 
	            	}, 600, function() { 
		            	$self.css({ 
		            		marginTop: 0 
		            	}).find("tr:first").appendTo($self); 
	            	}) 
	            }  
	            var MyMar = setInterval(Marquee, speed);  
	            table1.mouseover(function(){
	            	 clearInterval(MyMar);  
	            });
	            table1.mouseout(function(){
	            	 MyMar = setInterval(Marquee, speed);  
	            });
			}
		})
		</script>
	</head>
	<body>

		<!-- map start -->
			<div class="content" >
				<div class="link">
<!--						<div class="link_top">-->
<!--								<font color="blue"><b>所选线路：${dtaqLine.line_name}</b></font>-->
<!--						</div>-->
							<div class="link_center">
							<table style="width:100%;height:680px">
								<tr>
<!--									<td valign="top" style="width:165px">-->
<!--									 	 <ul id="lines" class="easyui-tree" data-options="url:'${ctx}/dtaqLineAction.do?method=getLines',method:'post',animate:true,checkbox:true"></ul>-->
<!--									</td>-->
									<td valign="top">
									 	<div id="allmap">地图无法显示</div>
									<div style="width: 100%;font-size: 9pt;color:  #787773;">
										<strong style="color: green;font-size:30px;">●</strong>一般风险
										<strong style="color: yellow;font-size:30px;">●</strong>显著风险
										<strong style="color: orange;font-size:30px;">●</strong>高风险
										<strong style="color: red;font-size:30px;">●</strong>严重风险
									</div>
									</td>
									<td valign="top" style="width:165px">
										<div class="easyui-accordion" fit="true" style="height:300px;" >
										
											<div title="${dtaqLine.shortName}隐患信息" icon="index_record" >

												<div class="easyui-accordion" fit="true">
													<div title="<img src='${ctx}/image/note.gif'>&nbsp;<font color='red'>特大隐患</font>" icon="index_record" >
													</div>
													<div title="<img src='${ctx}/image/note.gif'>&nbsp;<font color='orange'>重大隐患</font>" icon="index_record" >
													</div>
													<div title="<img src='${ctx}/image/note.gif'>&nbsp;<font color='red'>较大隐患</font>" icon="index_record" >
													</div>
													<div title="<img src='${ctx}/image/note.gif'>&nbsp;<font color='orange'>一般隐患</font>" icon="index_record" >
													</div>
												</div>
													
											</div>
											
										
										
										
										
										
										
										
											<div title="特别关注(${totalStations})"  icon="index_message" >
													<table class="noteTable">
														<tr>
														<td class="title" style="color:#3e5c99"><b>今日高风险工点(${hightRiskCount})</b></td></tr>
														<c:if test="${hightRiskCount > 0}">
														<c:forEach items="${hightRiskStations}" var="station">
															<tr>
																<td class="content">
															<a href="${ctx}/safeAnalysisTotalAction.do?method=showAnalyseInfo&t=total&station_id=${station.station_id}">
																		${station.station_name}
																</a>
																</td>
															</tr>
														</c:forEach>
														</c:if>
													</table>
													<table class="noteTable">
														<tr>
															<td class="title"  style="color:#3e5c99"><b>今日严重风险工点(${seriousRiskCount})</b></td>
														</tr>
														<c:if test="${seriousRiskCount > 0}">
														<c:forEach items="${seriousRiskStations}" var="station">
															<tr>
																<td class="content">
															<a href="${ctx}/safeAnalysisTotalAction.do?method=showAnalyseInfo&t=total&station_id=${station.station_id}">
																		${station.station_name}
														</a>
																</td>
															</tr>
														</c:forEach>
														</c:if>
													</table>
													<table class="noteTable">
														<tr>
															<td class="title"  style="color:#3e5c99"><b>重点关注工点(${mainStationCount})</b></td>
														</tr>
														<c:if test="${mainStationCount > 0}">
														 <c:forEach items="${mainStations}" var="station">
															<tr><td class="content">
															<a href="${ctx}/safeAnalysisTotalAction.do?method=showAnalyseInfo&t=total&station_id=${station.station_id}">
																	${station.station_name}
															</a>
															</td></tr>
														</c:forEach>
														</c:if>
													</table>
											</div>
											<div title="我的站内消息(${receiveCount})"  icon="index_message" >
												<table>
												 	<c:forEach items="${mailboxReceives}" var="mailboxReceive">
												 		<tr>
												 			<td>
<!--												 				<a href="${ctx}/mailboxReceiveAction.do?method=view&receive_id=${mailboxReceive.receive_id}&flag=4&receivestatus=0&analyseView=Y">-->
												 					<span class="cspan">【<ex:employeeName id="${mailboxReceive.mailboxSend.sendperson}"/>】${mailboxReceive.mailboxSend.title}</span>
												 					<br/>
												 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----<fmt:formatDate value="${mailboxReceive.ts}" pattern="yyyy-MM-dd"/>
													 				
<!--												 				</a>-->
												 			</td>
												 			<td>
												 			</td>
												 		</tr>
												 	</c:forEach>
												 </table>
											</div>
											<div title="批阅情况(${historyCount})"  icon="index_message" >
												<table>
													<c:forEach items="${historys}" var="history">
														<tr>
															<td>
															<a href="${ctx}/dtaqLineAction.do?method=stationSuggestView&station_id=${history.station_id.station_id}">
																<span class="cspan">【${history.sendPerson}-${history.sendDept}】${history.station_name}:${history.opinion}</span>
																<br/> 
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----${history.check_date}<c:if test="${history.check_date eq currentDate}"><span class="cur_editdate"></span></c:if>
															</a>
															</td>
														</tr>
													</c:forEach>
												</table>
											
											</div>
											<div title="安全周报/月报(${patrolCount})"  icon="index_message" >
												<table>
													<c:forEach items="${patrols}" var="patrol">
														<tr>
															<td><a href="${ctx}/dtaqRiskPatrolAction.do?method=download&id=${patrol.id}"><span class="cspan">${patrol.name}</span></a></td>
														</tr>
													</c:forEach>
												</table>
											</div>
											<div title="今日访问记录(${logCount})"  icon="index_message" >
											<table>
												<c:forEach items="${sysLogTempInfos}" var="sysLogTempInfo">
													<tr>
														<td>${sysLogTempInfo.sendPerson}【${sysLogTempInfo.sendDept}】(${sysLogTempInfo.count}次)
														<br/>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----<fmt:formatDate value="${sysLogTempInfo.logtime}" pattern="yyyy-MM-dd"/>
														</td>
													</tr>
												</c:forEach>		
											</table>
											</div>
											<div title="系统公告信息(${announcementCount})"  icon="index_message" >
											<table>
											<c:forEach items="${announcements}" var="announcement">
												<tr>
													<td>
													<a href="${ctx}/dtaqLineAction.do?method=sysAnnouncementView&sysAnnouncementId=${announcement.id}">
														${announcement.title}
														<br/>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----<fmt:formatDate value="${announcement.createDate}" pattern="yyyy-mm-dd"/>
													</a>
													</td>
												</tr>
											</c:forEach>
											</table>
											</div>
										</div>
									
									</td>					
								</tr>
							</table>
						</div>
						
			</div>
			<!-- map end -->
		</div>
		<script type="text/javascript">
	var map ; 
	var polyline ;
	//var circle ;
	var point ;
	var points = [];
	
	$(function() {
		var pointX='${pointX}';
		var pointY='${pointY}';
		var mapFix='${dtaqLine.mapFix}';
		if(mapFix==''||mapFix==null){
			mapFix=13;
		}
		map =  new BMap.Map("allmap",{enableMapClick:false}); // 创建Map实例
		map.setDefaultCursor('default'); 
		map.centerAndZoom(new BMap.Point(pointX,pointY),mapFix);// 设置中心点坐标，地图级别
		map.enableScrollWheelZoom(); // 启用滚轮放大缩小
		map.disableDoubleClickZoom();	//禁用双击放大。
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
		map.setMaxZoom(15);
		
		//在建工点图标
		//var myIcon = new BMap.Icon("${ctx}/image/green.png", new BMap.Size(16,16));
		//var myIcon = new BMap.Icon("${ctx}/image/icon-point.gif", new BMap.Size(16,16));
		//完工图标
		//var myIcon2 = new BMap.Icon("${ctx}/image/yuan.png", new BMap.Size(12,12));
		
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
	    function ComplexCustomOverlay(point,text,zcolor,bgcolor,borderColor,stationid){
	      this._point = point;
	      this._text = text;
	      this._zcolor=zcolor;
	      this._bgcolor=bgcolor;
	      this._borderColor = borderColor;
	      this._stationid=stationid;
	    }
	    ComplexCustomOverlay.prototype = new BMap.Overlay();
	    ComplexCustomOverlay.prototype.initialize = function(map){
	      this._map = map;
	      var div = this._div = document.createElement("div");
	      div.style.position = "absolute";
	      div.style.backgroundColor = this._bgcolor;
	      div.style.border = "1px solid "+this._borderColor;
	      div.style.color = this._zcolor;
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


		
		var isChange=12;
		setStyle(map,isChange);
		
	    var subwayLine_wh=eval('(${subwayLine_whs})');//地铁线数据
	    showLine(subwayLine_wh,'',isChange);
		// 树选中事件
		/*$('#lines').tree({
			onCheck: function(node){
				map.clearOverlays(); // 清除所有覆盖物
				var nodes = $('#lines').tree('getChecked');
				// 遍历选中树节点，依次添加覆盖物
				for(var i = 0; i < nodes.length; i++){
					 showLine(subwayLine_wh,nodes[i].code,isChange);
				}
			}
		});*/

		/*map.addEventListener("zoomend", function(e){
			isChange=e.target.getZoom();
			setStyle(map,isChange);
			//map.clearOverlays(); // 清除所有覆盖物
			var nodes = $('#lines').tree('getChecked');
			// 遍历选中树节点，依次添加覆盖物
			for(var i = 0; i < nodes.length; i++){
				 showLine(subwayLine_wh,nodes[i].code,isChange);
			}
		});*/
		// 根据类型决定显示哪条线路
		function showLine(subwayLine_wh,linecode,isChange){
			jQuery(subwayLine_wh).each(function(){
				var code=this.code;
				var lineNameInfo=this.lineNameInfo;
				var lineName=this.lineName;
				
				if(linecode==''||(linecode!=''&&linecode==code)){
					var id=this.id;
					var belong=this.belong;
					var safeState='gray';
					var lineColor=this.lineColor;
					var staColor=this.staColor;
					var qjColor='gray';
					var pointLines=this.pointLine;
					var lineStatus=this.lineStatus;
					if(lineStatus=='2'){
						lineColor='gray';
					}
					if(lineColor==''){
						lineColor='gray';
					}
					//if(lineNameInfo!=''&&lineStatus=='1'){
					if(lineNameInfo!=''){
						var lab=lineNameInfo.split(",");
						point = new BMap.Point(lab[0],lab[1]);
						var myCompOverlay = new ComplexCustomOverlay(point,lineName,"white",lineColor,'','');
						map.addOverlay(myCompOverlay); 
					}
					
					var data_info =[];
			//		alert(pointLines);
					if(pointLines!=''){
						var arr1=pointLines.split('@');
						for(var j=0;j<arr1.length;j++){
							data_info=[];
							var arr2 = arr1[j].split('|');
							for(var i = 0; i < arr2.length; i++){
								data_info.push(arr2[i].split(','));
							}
							drawMap2(map,data_info,belong,isChange,lineColor,staColor,qjColor,this.child,lineStatus);
						}
					
					
						//var arr2 = pointLines.split('|');
						//for(var i = 0; i < arr2.length; i++){
						//	data_info.push(arr2[i].split(','));
						//}
					}
					//lineColor='#7A0099';
					//drawMap2(map,data_info,belong,isChange,lineColor,staColor,qjColor,this.child,lineStatus);
					
				}
			});
		}
		//地图动态描点
		function drawMap2(map,data_info,belong,isChange,lineColor,staColor,qjColor,child,lineStatus){
				var points1 = [];
				for(var i=0;i<data_info.length;i++){
					point = new BMap.Point(data_info[i][0],data_info[i][1]);
					points1.push(point);
					if(data_info[i][2]&&data_info[i][2]!='特殊站点'){
						circle = new BMap.Circle(point, 60, {strokeColor:"gray", strokeWeight:8, strokeOpacity:0.5});
						map.addOverlay(circle);               // 将标注添加到地图中
						var content = data_info[i][2];
						//drawInfo(map,content,point);
					}
				}
				polyline = new BMap.Polyline(points1, {strokeColor:lineColor, strokeWeight:4, strokeOpacity:0.5});   //创建折线
				map.addOverlay(polyline);   //增加折线
				jQuery(child).each(function(){
					var id=this.id; 
					var locals=this.local;
					var monitorStatus=this.monitorStatus;
					var workpointName=this.workpointName;
					var pointsInfo=this.pointsInfo;
					var count=this.count;
					var stationColor=this.stationColor;
					var belong=this.belong;
					if(locals!=''&& typeof(locals)!='undefined'){
						var temps=locals.split(";");
						if(this.type=='S'){
							var statemp=temps[0].split(",");
							point = new BMap.Point(statemp[0],statemp[1]);
						//	alert(point);
							//circle = new BMap.Circle(point, 100, {strokeColor:'yellow', strokeWeight:1,fillOpacity:"1"});
							var circle = new BMap.Circle(point,200, {fillColor:stationColor, strokeWeight:1, fillOpacity:"1"});
							map.addOverlay(circle);               // 将标注添加到地图中
							
							circle.addEventListener("mouseover", function (e){
								var opts = {
								  title : ""  
								}
								var infoWindow = new BMap.InfoWindow(belong, opts);
								infoWindow.disableAutoPan();
								infoWindow.disableCloseOnClick();
								map.openInfoWindow(infoWindow, new BMap.Point((e.point.lng),(e.point.lat+0.01)) ); 
							});
						
						circle.addEventListener("mouseout", function (e){
							map.closeInfoWindow();
						});
							
						circle.addEventListener("onclick", function (e){
								 var url="safeAnalysisTotalAction.do?method=showAnalyseInfo&t=total&safeTotal=Y&station_id="+id;
				                    location.href=url;	
								
						
						/**
										var lab=pointsInfo.split(",");
							//	debugger;
								$.ajax({
							   type: "POST",
							   url: "${ctx}/dtaqStationAction.do?method=queryStationId",
							   data: "lab="+lab,
							   success: function(msg){
					             //alert(typeof(msg)) 
					            //alert(typeof(Number(msg))) ;
					             	         
								   var url="safeAnalysisTotalAction.do?method=showAnalyseInfo&safeTotal=Y&station_id="+msg;
				                    location.href=url;	 
							   }
							});
							
							*/
							
							
						});	
							
							
							
							/*var markerIcon ='';
								markerIcon = new BMap.Marker(point,{icon:myIcon});  
							if(lineStatus=='1'){
								markerIcon = new BMap.Marker(point,{icon:myIcon});  
							}
							if(lineStatus=='2'){
								markerIcon = new BMap.Marker(point,{icon:myIcon2});  
							}
						//	markerIcon.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
							map.addOverlay(markerIcon);*/
							//if(pointsInfo!=''&lineStatus=='1'){
							if(pointsInfo!=''){
								if(isChange==12 && count!='0'){
									//addClickHandler(map,circle,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
									var lab=pointsInfo.split(",");
									point = new BMap.Point(lab[0],lab[1]);
									//drawInfo2(map,workpointName,point,staColor,this.id);
									drawInfo3(map,workpointName,point,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
								}
								if(isChange!=12){
									//addClickHandler(map,circle,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
									var lab=pointsInfo.split(",");
									point = new BMap.Point(lab[0],lab[1]);
									//drawInfo2(map,workpointName,point,staColor,this.id);
									drawInfo3(map,workpointName,point,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
								}
							}else{
								//addClickHandler(map,circle,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
							}
							
							var int=self.setInterval(function(){ twinkleCircle(circle); },500);
						}else if(this.type=='P'){
							var initponint=[];
							var pointMsg1='';
							for(var i = 0; i <temps.length; i++){
								if(temps[i]!=''){
									var point1=temps[i];
									var pt1=point1.split(",");
									var lng1=pt1[0];
									var lat1=pt1[1];
									pointMsg1= new BMap.Point(Number(lng1),Number(lat1));
									initponint.push(pointMsg1);
								}
							}
							var polylineTemp = new BMap.Polyline(initponint, {strokeColor:stationColor, strokeWeight:4, strokeOpacity:1});  // 创建标注
							map.addOverlay(polylineTemp);  
						//	addClickHandler(map,polylineTemp,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
							polylineTemp.addEventListener("mouseover", function (e){
								var opts = {
								  title : ""  
								}
								var infoWindow = new BMap.InfoWindow(belong, opts);  
								infoWindow.disableAutoPan();
								infoWindow.disableCloseOnClick();
								map.openInfoWindow(infoWindow, new BMap.Point((e.point.lng),(e.point.lat+0.01)) ); 
							});	
							polylineTemp.addEventListener("mouseout", function (e){
								map.closeInfoWindow(); 
							});	
							polylineTemp.addEventListener("onclick", function (e){
								 var url="safeAnalysisTotalAction.do?method=showAnalyseInfo&t=total&safeTotal=Y&station_id="+id;
				                    location.href=url;	
							});	
							
							
							//if(pointsInfo!=''&lineStatus=='1'){
							if(pointsInfo!=''){
								if(isChange==12 && count!='0'){
									var lab=pointsInfo.split(",");
									point = new BMap.Point(lab[0],lab[1]);
									drawInfo3(map,workpointName,point,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
								}
								if(isChange!=12){
									var lab=pointsInfo.split(",");
									point = new BMap.Point(lab[0],lab[1]);
									drawInfo3(map,workpointName,point,this.belong,this.qlineId,this.qsectionId,this.id,this.count);
								}
							}
							var int=self.setInterval(function(){ twinklePolyline(polylineTemp); },500);
						}
				    }
				});
		}
		function drawInfo3(map,workpointName,point,belong,qlineId,qsectionId,qworkPointId,count){
			var opts = {
			  position: point,
			}
			var label = new BMap.Label(workpointName, opts);  // 创建文本标注对象
			label.setStyle({
				color : "white",
				fontSize : "12px",
				backgroundColor :"red",
				height : "",
				lineHeight : "20px",
				padding : "1px 3px",
				border :"1px solid red",
				fontFamily:"微软雅黑"
			});
			label.setZIndex(999);
			map.addOverlay(label); 
			//label.addEventListener("click",function(e){
			//	openWindow(map,belong,e,qlineId,qsectionId,qworkPointId,count);
			//});
		}
			
		function drawInfo2(map,content,point,colorLabel,stationId){
			var myCompOverlay = new ComplexCustomOverlay(point,content,'#0123a3','white','#0123a3',stationId);
			map.addOverlay(myCompOverlay); 
		}
		
		 function setStyle(map,level){
				switch(level){
					case 12: 
					
					
						map.setMapStyle({
			                styleJson: [
			                            {
			                                "featureType": "arterial",
			                                "elementType": "all",
			                                "stylers": {
			                                    "visibility": "off",
			                                    "lightness": 51
			                                }
			                            },
			                     		 {
			                               "featureType": "railway",
			                               "elementType": "all",
			                               "stylers": {
			                                         "visibility": "off"
			                               }
			                     		},
			                     	 	{
			                              "featureType": "subway",
			                              "elementType": "all",
			                              "stylers": {
			                                        "visibility": "off"
			                              }
			                   	   },
			                   	  {
			                             "featureType": "poi",
			                             "elementType": "all",
			                             "stylers": {
			                                       "visibility": "off"
			                             }
			                   	 },
			                   	 {
			                           "featureType": "highway",
			                           "elementType": "all",
			                           "stylers": {
			                                     "visibility": "off"
			                           }
			                 		}
			                  ]
		         		});
		  		 	break;
					case 13:
						 map.setMapStyle({
				                styleJson: [
				                          {
				                              "featureType": "arterial",
				                              "elementType": "all",
				                              "stylers": {
				                                  "visibility": "off",
				                                  "lightness": 51
				                              }
				                          },
				                   		 {
				                             "featureType": "railway",
				                             "elementType": "all",
				                             "stylers": {
				                                       "visibility": "off"
				                             }
				                   		},
				                   	 	{
				                            "featureType": "subway",
				                            "elementType": "all",
				                            "stylers": {
				                                      "visibility": "off"
				                            }
				                 	   },
				                 	  {
				                           "featureType": "poi",
				                           "elementType": "all",
				                           "stylers": {
				                                     "visibility": "off"
				                           }
				                 	 },
				                 	 {
				                         "featureType": "highway",
				                         "elementType": "all",
				                         "stylers": {
				                                   "visibility": "on"
				                         }
				               		}
				                ]
				       });
					break;
					case 14:
						 map.setMapStyle({
				                styleJson: [
				                          {
				                              "featureType": "arterial",
				                              "elementType": "all",
				                              "stylers": {
				                                  "visibility": "on",
				                                  "lightness": 51
				                              }
				                          },
				                   		 {
				                             "featureType": "railway",
				                             "elementType": "all",
				                             "stylers": {
				                                       "visibility": "off"
				                             }
				                   		},
				                   	 	{
				                            "featureType": "subway",
				                            "elementType": "all",
				                            "stylers": {
				                                      "visibility": "off"
				                            }
				                 	   },
				                 	  {
				                           "featureType": "poi",
				                           "elementType": "all",
				                           "stylers": {
				                                     "visibility": "off"
				                           }
				                 	 },
				                 	 {
				                         "featureType": "highway",
				                         "elementType": "all",
				                         "stylers": {
				                                   "visibility": "on"
				                         }
				               		}
				                ]
				       });
					break;
					case 15:
						 map.setMapStyle({
				                styleJson: [
				                          {
				                              "featureType": "arterial",
				                              "elementType": "all",
				                              "stylers": {
				                                  "visibility": "on",
				                                  "lightness": 51
				                              }
				                          },
				                   		 {
				                             "featureType": "railway",
				                             "elementType": "all",
				                             "stylers": {
				                                       "visibility": "off"
				                             }
				                   		},
				                   	 	{
				                            "featureType": "subway",
				                            "elementType": "all",
				                            "stylers": {
				                                      "visibility": "off"
				                            }
				                 	   },
				                 	  {
				                           "featureType": "poi",
				                           "elementType": "all",
				                           "stylers": {
				                                     "visibility": "on"
				                           }
				                 	 },
				                 	 {
				                         "featureType": "highway",
				                         "elementType": "all",
				                         "stylers": {
				                                   "visibility": "on"
				                         }
				               		}
				                ]
				       });
					break;
				}
		    }
	});
	
	
			function twinkleCircle(overlay){
				if(overlay.getFillOpacity()==1){
					overlay.setFillOpacity(0.1)
				}else{
					overlay.setFillOpacity(1)
				}
			}
			function twinklePolyline(overlay){
				  if(overlay.getStrokeOpacity()==1){
					  overlay.setStrokeOpacity(0.1)
				  }else{
					  overlay.setStrokeOpacity(1)
				  }
			 }
	</script>
			
			
	</body>
</html:html>


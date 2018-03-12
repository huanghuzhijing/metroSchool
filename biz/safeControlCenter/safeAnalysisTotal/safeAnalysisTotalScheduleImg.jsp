<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<head>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/artDialog2.1.1/artDialog.js"/>" type="text/javascript"></script>
<script language="javascript" src="${ctx}/scripts/jquery-1.4.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/scripts/themes/default/easyui.css"/>
<style type="text/css">
/*轮播图*/
.fl{float:left}
.f-14{font-size:14px}
.Pic{border-style:none;}
.imgbox ul{list-style-type:none;margin:0px;padding:0px;}
.imgbox ul li{display:none;}
.lb_title_bg{z-index:1;background-color:#000;filter:alpha(opacity=30);-moz-opacity:0.3;opacity:0.3;}
.lb_title{z-index:2;color:#FFF;text-indent:10px;font-size:14px;line-height:40px;}
.lb_pager{z-index:3;}
.lb_common{position:relative;height:40px;margin-top:-43px;}
.lb_pager ul{margin-top:5px;}
.lb_pager ul li{float:right;color:#FFF;font-size:15px;display:block;border:2px solid #e5eaff;height:25px;margin-right:4px;margin-top:5px;text-align:center;line-height:25px;background-color:#6f4f67;cursor:pointer;}
</style>
</head>
	<body style="width:100%;height: 100%" >
	<c:choose>
		<c:when test="${fn:length(vwsegPics)>0}">
		<!--整体容器-->
		<div class="imgbox fl" style="width:480px">
			<!--图片列表，除第一张显示外，其余隐藏-->
			<ul>
				<c:forEach items="${vwsegPics}" var="imgurl" varStatus="status">
					<li <c:if test="${status.index==0}"> style="display: block;"</c:if>>
						<img class="Pic"  width="480px" height="340px" 
							onclick="javascript:viewProjectSchedule(${status.index});"
							src="data:image/png;base64,${imgurl.attach_address}"
							title="点击查看大图" />
					</li>
				</c:forEach>
			</ul>
			<div class="lb_title_bg lb_common">
				<!--图片标题背景-->
			</div>
			<!--图片显示标题-->
			<div class="lb_title lb_common"></div>
			<!--图片序号-->
			<div class="lb_pager lb_common">
				<ul>
					<c:forEach items="${vwsegPics}" var="imgurl" varStatus="status">
						<li
							<c:if test="${fn:length(vwsegPics)-status.count==0}"> style="background: #FF70Ad;"</c:if>>
							&nbsp;&nbsp;${fn:length(vwsegPics)-status.count+1}&nbsp;&nbsp;
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div align="left" class="f-14">
			<strong class="c-orange" >工程形象进度说明：</strong>
			<div style="text-indent: 2em">
			<c:if test="${stationType=='P'}">
			<c:if test="${empty sectionImage_memo}">该区间没有任何形象进度信息！</c:if>
			<c:if test="${not empty sectionImage_memo}">${sectionImage_memo}</c:if>
			</c:if>
			
			<c:if test="${stationType=='S'}">
			<c:if test="${empty projectImage_memo}">该车站没有任何形象进度信息！</c:if>
			<c:if test="${not empty projectImage_memo}">${projectImage_memo}</c:if>
			</c:if>
			</div>
		</div>
		</c:when>
		<c:otherwise>
			<br/>
			<strong class="c-orange" >当前没有形象进度图</strong>
			<br/>
		</c:otherwise>
		</c:choose>
		<script type="text/javascript">
		$(function(){
			var len='${vwsegPics}';
			//轮播图 
			if(len!=''){
			(new CenterImgPlay(".imgbox")).Start();
			}
		})
		function viewProjectSchedule(index){
			var _url ="${ctx}/securityAnalyseAction.do?method=viewProjectSchedule&station_id=${param.station_id}&index="+index;
			parent.openJd(_url);
		}


		/**********************轮播图  star***********/
		function CenterImgPlay(img_div) {
			var _thisImageDiv=jQuery(img_div);
		    this.list = _thisImageDiv.children(":first").children();
		    this.indexs = [];
		    this.length = this.list.length;
		    //图片显示时间
		    this.timer = 3000;
		    this.showTitle = _thisImageDiv.find(".lb_title");

		    var index = 0, self = this, pre = 0, handid, isPlay = false, isPagerClick = false;

		    this.Start = function () {
		        this.Init();
		        //计时器，用于定时轮播图片
		        handid = setInterval(self.Play, this.timer);
		    };
		    //初始化
		    this.Init = function () {
		        var o = _thisImageDiv.find(".lb_pager ul li"), _i;

		        for (var i = o.length - 1, n = 0; i >= 0; i--, n++) {
		            this.indexs[n] = o.eq(i).click(self.PagerClick);
		        }
		    };
		    this.Play = function () {
		        isPlay = true;
		        index++;
		        if (index == self.length) {
		            index = 0;
		        }
		        //先淡出，在回调函数中执行下一张淡入
		        self.list.eq(pre).fadeOut(300, function () {
		            var info = self.list.eq(index).fadeIn(500,function () {
		                isPlay = false;
		                if (isPagerClick) { handid = setInterval(self.Play, self.timer); isPagerClick = false; }
		            }).attr("title");
		            //显示标题
		           // self.showTitle.text(info);
		            //图片序号背景更换
		            self.indexs[index].css("background-color", "#FF70Ad");
		            self.indexs[pre].css("background-color", "#6f4f67");

		            pre = index;
		        });
		    };
		    //图片序号点击
		    this.PagerClick = function () {
		        if (isPlay) { return; }
		        isPagerClick = true;

		        clearInterval(handid);

		        var oPager = jQuery(this);
		        var _tempIndex=oPager.text();
		        
		        if(isNaN(_tempIndex)){
		        	_tempIndex=oPager.children(":first").val();
		        }
		        var i = parseInt(_tempIndex) - 1;

		        if (i != pre) {
		            index = i - 1;
		            self.Play();
		        }
		    };
		};
		/**********************轮播图  star***********/
		
		</script>
	</body>
</html>
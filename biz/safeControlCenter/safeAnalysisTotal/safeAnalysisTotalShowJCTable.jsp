<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<head>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script language="javascript" src="${ctx}/scripts/jquery-1.4.2.min.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<link rel="StyleSheet" href="${ctx}/styles/main.css" type="text/css" />
<link rel="StyleSheet" href="${ctx}/styles/def_table.css" type="text/css" />
<style type="text/css">
/*轮播图*/
.Pic{border-style:none;}
.imgbox ul{list-style-type:none;margin:0px;padding:0px;}
.imgbox ul li{display:none;}
.lb_title_bg{z-index:1;background-color:#000;filter:alpha(opacity=30);-moz-opacity:0.3;opacity:0.3;}
.lb_title{z-index:2;color:#FFF;text-indent:10px;font-size:14px;line-height:40px;}
.lb_pager{z-index:3;}
.lb_common{position:relative;height:30px;margin-top:-33px;}
.lb_pager ul{margin-top:5px;}
.lb_pager ul li{float:right;color:#FFF;font-size:12px;display:block;border:2px solid #e5eaff;height:20px;margin-right:4px;margin-top:5px;text-align:center;line-height:20px;background-color:#6f4f67;cursor:pointer;}
</style>
</head>
	<body style="width:100%;height: 100%" >
		<table class="form_table" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  height="100%" border="1" align="center" cellpadding="3" cellspacing="0" >
					<tr  height="30">
						<td width="15%" class="tr03">
							施工单位
						</td>
						<td width="20%" class="tr02">
							${vwProjectInfo.erogsg}
						</td>
						<td width="15%" class="tr03">
							监理单位
						</td>
						<td width="20%" class="tr02">
							${vwProjectInfo.erogjl}
						</td>
						<td width="30%" rowspan="6">
						<div style="height: 310px;overflow:hidden ">
							<!--整体容器-->
						    <div class="imgbox">
						        <!--图片列表，除第一张显示外，其余隐藏-->
						        <ul>
						        	<c:forEach items="${vwLiveVideos}" var="imgurl"  varStatus="status">
										<li <c:if test="${status.index==0}"> style="display: block;"</c:if>   title="${imgurl.attach_name}"  >
										<c:if test="${oldOrNewTemp != 1}">
											<img class="Pic" width="280px" height="300px"  src="${ctx}/liveVideoAction.do?method=download&id=${videoId}&fileType=${imgurl.attach_address}" onclick="javascript:goTo('${ctx}/riskPatrolAction.do?method=riskInfo&station_id=${param.station_id}');"   title="${videoId}" />
										</c:if>
										<c:if test="${oldOrNewTemp == 1}">
											<img class="Pic" width="280px" height="300px"  src="${imgurl.attach_address}" onclick="showPicture('${param.station_id}')"   title="${videoId}" />
										</c:if>
										</li>
									</c:forEach>
						        </ul>
						        <div class="lb_title_bg lb_common"><!--图片标题背景-->
						        </div>
						        <!--图片显示标题-->
						        <div class="lb_title lb_common"></div>
						        <!--图片序号-->
						        <div class="lb_pager lb_common">
						            <ul>
										<c:forEach items="${vwLiveVideos}" var="imgurl" varStatus="status">
										<li  <c:if test="${fn:length(vwLiveVideos)-status.count==0}"> style="background: #FF70Ad;"</c:if>>&nbsp;${fn:length(vwLiveVideos)-status.count+1}&nbsp;</li>
										 </c:forEach>
						            </ul>
						        </div>
						    </div>
						    </div>
					</td>
					</tr>
					<tr  height="30">
						<td  class="tr03">
							第三方监测单位
						</td>
						<td class="tr02">
							${vwProjectInfo.eorgjc}
						</td>
						<td  class="tr03">
							甲方业主代表
						</td>
						<td class="tr02">
							${vwProjectInfo.yzcost}
						</td>
					</tr>
					<tr  height="30">
						<td  class="tr03">
							总监/总代
						</td>
						<td class="tr02">
							${vwProjectInfo.zjcost}
						</td>
						<td width="15%" class="tr03">
							项目经理
						</td>
						<td class="tr02">
							${vwProjectInfo.construct_men}
						</td>
					</tr>
					<tr  height="30">
						<td  class="tr03">
							计划工期
						</td>
						<td  class="tr02">
							${vwProjectInfo.work_days}
						</td>
						<td class="tr03">
							造价
						</td>
						<td  class="tr02">
							${vwProjectInfo.cost_memory}
						</td>
					</tr>
					<tr  height="30">
						<td class="tr03">
							安全风险状态
						</td>
						<td  colspan="3" class="tr02">
							<c:if test="${vwProjectInfo.safe_state=='4'}">
								<img src="images/red.png" />
								<fmt:message key="security.analyse.tablist.warn.red" />
							</c:if>
							<c:if test="${vwProjectInfo.safe_state=='3'}">
								<img src="images/orange.png" />
								<span class="orange"><fmt:message
										key="security.analyse.tablist.warn.orange" />
								</span>
							</c:if>
							<c:if test="${vwProjectInfo.safe_state=='2'}">
								<img src="images/yellow.png" />
								<span class="yellow"><fmt:message
										key="security.analyse.tablist.warn.yellow" />
								</span>
							</c:if>
							<c:if test="${vwProjectInfo.safe_state=='1'}">
								<img src="images/green.png" />
								<span class="green"><fmt:message
										key="security.analyse.tablist.warn.gree" />
								</span>
							</c:if>
						</td>
					</tr>
					<tr  height="30">
						<td  class="tr03">
							工程概述
						</td>
						<td colspan="3" class="tr02">
							<div style="height: 150px;overflow-y: scroll">
							${vwProjectInfo.project_moment}
							</div>
						</td>
					</tr>
				</table>
		<script type="text/javascript">
		jQuery(document).ready(function(){
			//轮播图
			(new CenterImgPlay(".imgbox")).Start();
		});
		function goTo(url){
			parent.goTo(url);
		}
		function showPicture(id){
			var url="dtaqRiskPatrolAction.do?method=riskInfo&station_id="+id;
			parent.art.dialog({title:'现场视频', iframe:url, width:'800', height:'450'});
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
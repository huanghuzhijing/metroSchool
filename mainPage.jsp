<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>综合信息系统</title>
<link href='${ctx}/scripts/plugins/fullcalendar_2/fullcalendar.css' rel='stylesheet' />
<link rel="stylesheet" type="text/css" href="${ctx}/styles/mainIndex/css/style.css" />
<link href="${ctx}/styles/mainpage/css/goodnav.css" rel="stylesheet" />
<%-- <link href="${ctx}/styles/mainpage/css/index.css" rel="stylesheet" />--%>

<link href='${ctx}/scripts/plugins/fullcalendar_2/fullcalendar.print.css'rel='stylesheet' media='print' />
<script src='${ctx}/scripts/plugins/fullcalendar_2/lib/jquery.min.js'></script>
<script src='${ctx}/scripts/plugins/fullcalendar_2/lib/jquery-ui.custom.min.js'></script>
<script src='${ctx}/scripts/plugins/fullcalendar_2/lib/moment.min.js'></script>
<script src='${ctx}/scripts/plugins/fullcalendar_2/fullcalendar.js'></script>
<script src='${ctx}/scripts/plugins/fullcalendar_2/zh-cn.js'></script>
<script src='${ctx}/scripts/plugins/layer/layer.js'></script>
<script src="${ctx}/scripts/jquery.litenav.js" type="text/javascript"></script>
<style type="">
.logo_cen {
	background: url(${ctx}/styles/img/top_middle.jpg);
}
#layerBox {
	display: none;
	width: 560px;
	height: 290px;
	padding: 10px;
	margin: 20px auto 0;
	color: #333;
	font-size: 14px;
	font-family: "微软雅黑", Helvetica, Arial, Verdana, sans-serif;
	border: 1px solid #D5D5D5;
	resize: none;
}

.fc-state-hover {
	background-color: #EBF8FB;
}
</style>
<script language="javascript">
		$(function() {
			var myDate = new Date();
			var month=myDate.getMonth()+1>9?(myDate.getMonth()+1):("0"+(myDate.getMonth()+1));
			var day=myDate.getDate()>9?myDate.getDate():("0"+myDate.getDate());
			var currentDateStr=myDate.getFullYear()+"-"+month+"-"+day;
			var fullCalendar = $('#box').fullCalendar({
				header: { //表头信息
					left: 'prevYear,prev,today,next,nextYear',
					center: 'title',
					right: ''
				},
				defaultDate: currentDateStr,
				//editable: true,
				//selectable: true,
				events: function(start, end, timezone, callback) {
					$.ajax({
						type: "POST",
						url: '${ctx}/oaAgebdaAction.do?method=getList&queryFlag=1',
						dataType: 'json',
						success: function(data) {
							callback(data);
						},
						error:function(msg){
							callback(msg);
						}
					});
				},
				dayClick: function(date, allDay, jsEvent, view) {
					$('#layerBox').css('display', 'block');
					var thisDate = date._i;
					layer.open({
						type: 1,
						title: ['新建事件', 'font-size:14px;'],
						area: ['600px', '400px'],
						content: $('#layerBox'),
						btn: ['添加', '取消'],
						yes: function(index, layero){
							var content = $.trim($('#content').val());
							var remark = $.trim($('#remark').val());
							if(content != ''){
								//此处为后台接口，与数据库的交互：添加此条事件
								//相关代码...
								$.post('${ctx}/oaAgebdaAction.do?method=saveOaAgebda',{content:content,remark:remark,beginDate:thisDate},function(data){
									alert('保存成功！');
									layer.close(index);
									$('#box').fullCalendar('refetchEvents');
								});
							}else{
								layer.alert('事件内容不能为空！', {icon: 7}, function(index2){
									layer.close(index2);
									$('#content').focus();
								});
							}
						},
						success: function(){
							$('#content').val("");
							$('#remark').val("");
							$('#content').focus();
						}
					});
				},
				eventClick: function(calEvent, jsEvent, view) {
					var startDate=calEvent.start._i;
					overReturnTarget('1','oaAgebdaAction.do?method=list&currentDateStr='+startDate);
				},
				eventMouseover: function(event, jsEvent, view) {
					$(this).css('background-color', '#13597A');
				},
				eventMouseout: function(event, jsEvent, view) {
					$(this).css('background-color', '#3a87ad');
				}
			});
			
			$('#box').on('mouseover', '.fc-widget-content', function(){
				$(this).addClass('fc-state-hover');
			});
			$('#box').on('mouseout', '.fc-widget-content', function(){
				$(this).removeClass('fc-state-hover');
			});
		});

		function returnTarget(url){
				//alert("${ctx}"+url+"--"); 
				var f = document.createElement("form");
				 
				document.body.appendChild(f);
				var i = document.createElement("input");
				i.type = "hidden";
				f.appendChild(i);
				i.value = "${userinfo.username}";
				i.name = "fsname";
				var j = document.createElement("input");
				j.type = "hidden";
				f.appendChild(j);
				j.value = "${userinfo.username}";
				j.name = "fspassw";
				f.method="POST";
				f.action = "${ctx}"+url;
				 
				f.submit();
		}
		function ovReturnTarget(url,flag,arg){
			var f = document.createElement("form");
				document.body.appendChild(f);
				var i = document.createElement("input");
				i.type = "hidden";
				f.appendChild(i);
				i.value = "${userinfo.username}";
				i.name = "fsname";
				var j = document.createElement("input");
				j.type = "hidden";
				f.appendChild(j);
				j.value = "${userinfo.username}";
				j.name = "fspassw";
				
				var k = document.createElement("input");
				k.type = "hidden";
				f.appendChild(k);
				k.value = arg;
				k.name = "target";
				
				
				var m = document.createElement("input");
				m.type = "hidden";
				f.appendChild(m);
				m.value = "00010002";
				if('1'==flag){
					m.value= "00010001";
				}
				if('16'==flag){
					m.value= "00010001";
				}
				if('20'==flag){
					m.value= "00010003";
				}
				if('26'==flag){
					m.value= "00010102";
				}
				m.name = "ctarget";
				
				var n = document.createElement("input");
				n.type = "hidden";
				f.appendChild(n);
				n.value = "1";
				if('1'==flag){
					n.value= "0";
				}
				if('16'==flag){
					n.value= "0";
				}
				if('20'==flag){
					n.value= "2";
				}
				if('26'==flag){
					n.value= "3";
				}
				n.name = "subPage";
				
				f.method="POST";
				f.action = "${ctx}"+url;
				f.submit();
		
		}

		function overReturnTarget(flag,arg){
			var url="/loginsystem.do?method=traditionLogin";
			ovReturnTarget(url,flag,arg);
		}

		//
		function quit(){
			location.href = "sysLogin.jsp" ; 
		}
		//
		function modiPwd(){
			location.href="${ctx}/sysoperatorAction.do?method=topwdedit";
		}
		//
		function myWorkPlat(){
			//window.parent.frames["contentFrame"].location.href="bizplat.do?method=myplatform";
			window.parent.parent.location.href="bizplat.do?method=myplatform";
		}
		//
		function displayHelpWindow(){
		   location.href="bizplat.do?method=helpManager";
		}
		//
		function updatePassword(){
			location.href="personalInfoAction.do?method=list&flag=2";
		}
		</script>
	</head>
	<body>
		<div class="container">
			<div class="top">
				<div class="w_1200">
					<div class="right">
						<img src="${ctx}/styles/mainIndex/images/user.png"
							class="user_img" />
						<span>${userinfo.empName},欢迎访问该系统。</span>
					</div>
				</div>
			</div>

			<div class="menu_box w_1200">
				<div class="logo">
					<ul class="menu right">
						<li>
							<a href="#" onclick="myWorkPlat()">首页</a>
						</li>
						<li>
							<a href="#" onclick="quit();">退出</a>
						</li>
					</ul>
				</div>
			</div>
			<!--content-->
			<div class="content">
				<!--item_icon-->
				<div class="item_icon left">
					<ul>
						<li class="item_1">
							<a
								href="javascript:returnTarget('/loginsystem.do?method=traditionLogin');">
								<img src="${ctx}/styles/mainIndex/images/main_03.png" /> 菜单导航</a>
						</li>
						<li class="item_2">
							<a href="#"
								onclick="overReturnTarget('1','personMailboxSendAction.do?method=index&readflag=noread');">
								<img src="${ctx}/styles/mainIndex/images/main_07.png" />
								收件箱(${mailCount})</a>
						</li>
						<li class="item_3">
							<a href="#"> <img
									src="${ctx}/styles/mainIndex/images/main_09.jpg" /> 外网门户</a>
						</li>
					</ul>
				</div>
				<!--item_icon-->

				<!--new-->
				<div class="new left">
					<div class="new_top">
						<img src="${ctx}/styles/mainIndex/images/yuan_08.png"
							class="right" />
						<img src="${ctx}/styles/mainIndex/images/yuan_06.png" class="left" />
						<div class="new_topbg">
						</div>
					</div>
					<div class="new_center">
						<!--new_pic-->
						<div class="new_pic left">
							<div id="hotpic">
								<div id="NewsPic">
									<a style="visibility: visible; display: block;"  target="_blank" href="${ctx}/image/01.jpg" ><img  width="336px" height="240px" class="Picture" src="${ctx}/image/01.jpg"   title="国企实力出品   铸就精端品质"/></a>
									<a  target="_blank" href="${ctx}/image/02.jpg"><img  width="336px" height="240px" class="Picture" src="${ctx}/image/02.jpg"  title="雄踞后湖心  掌控新商务"/></a>
									<a  target="_blank" href="${ctx}/image/03.jpg"><img  width="336px" height="240px" class="Picture" src="${ctx}/image/03.jpg"  title="大武汉生态办公先河  从此启幕"/></a>
									<a  target="_blank" href="${ctx}/image/04.jpg"><img  width="336px" height="240px" class="Picture" src="${ctx}/image/04.jpg"  title="精挑一线品牌  同步国际标准"/></a>
									<a  target="_blank" href="${ctx}/image/05.jpg"><img  width="336px" height="240px" class="Picture" src="${ctx}/image/05.jpg"  title="星级排场的商务配套  全面提升企业竞争力"/></a>
									<a  target="_blank" href="${ctx}/image/06.jpg"><img  width="336px" height="240px" class="Picture" src="${ctx}/image/06.jpg"  title="中国物业领军者  鼎力服务您的企业"/></a>
									<div class="Nav">
										<span class="Normal">6</span>
	                                    <span class="Normal">5</span>
										<span class="Normal">4</span>
	                                    <span class="Normal">3</span>
	                                    <span class="Normal">2</span>
	                                    <span class="Cur">1</span>
									</div>
								</div>
								<div id="NewsPicTxt" style="width: 336px; height: 240px; overflow: hidden"><a target="_blank" href="${ctx}/image/01.jpg">国企实力出品   铸就精端品质</a></div>
							</div>
						</div>
						<script type="text/javascript">
				        $('#hotpic').liteNav(3000);
				   		 </script>
						<!--new_pic-->

						<!--article-->
						<div class="article right">
							<div class="article_title">
								<a href="#" onclick="overReturnTarget('5','oaInformAfficheAction.do?method=list&staticOaInformCoteId=2');" class="more">
								<img src="${ctx}/styles/mainIndex/images/more.png" />
								</a>
								通知公告
							</div>
							<ul>
								<c:forEach items="${oaInformAffiches}" var="oaInformAffiche">
									<li>
										<a  href="#"  onclick="overReturnTarget('10','oaInformAfficheAction.do?method=view&id=${oaInformAffiche.id}&flagView=1')"
											title="${oaInformAffiche.title}"> 
											<span><fmt:formatDate value="${oaInformAffiche.issueDate}" pattern="yyyy-MM-dd" /></span> 
											<c:if test="${fn:length(oaInformAffiche.subTitle)>27}">${fn:substring(oaInformAffiche.subTitle,0,27)}...</c:if>
											<c:if test="${fn:length(oaInformAffiche.subTitle)<28}">${oaInformAffiche.subTitle}</c:if>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!--article-->
					</div>
					<div class="new_bottom">
						<img src="${ctx}/styles/mainIndex/images/yuan_13.png"
							class="right" />
						<img src="${ctx}/styles/mainIndex/images/yuan_12.png" class="left" />
						<div class="new_botbg">
						</div>
					</div>
				</div>
				<!--new-->

				<!--date-->
	            <div class="date right">
	                <div class="mess_top">
	                    <img src="${ctx}/styles/mainIndex/images/yuan_08.png"  class="right"/>
	                    <img src="${ctx}/styles/mainIndex/images/yuan_06.png" class="left"/>
	                    <div class="mess_topbg">　　</div> 
	                </div>
	                <div class="mess_center">
	                   <div id='box' style="width:100%;height:100%"></div>
						<div id="layerBox">
						<table>
							<tr><td>事件：<font color="red">*</font></td><td><textarea id="content" style="margin: 0px; width: 477px; height: 97px;"></textarea></td></tr>
								<tr><td>备注：</td><td><textarea id="remark" style="margin: 0px; width: 477px; height: 97px;"></textarea></td></tr>
						</table>
					   </div>
	                </div>
	                <div class="mess_bottom">
	                    <img src="${ctx}/styles/mainIndex/images/yuan_13.png"  class="right"/>
	                    <img src="${ctx}/styles/mainIndex/images/yuan_12.png" class="left"/>
	                    <div class="mess_botbg">　　</div> 
	                </div>
	            </div>
            <!--date-->
			</div>
			<!--content-->

			<!--content 1-->
			<div class="content">
				<div class="w_560 left">
					<!--db-->
					<div class="db">
						<div class="db_top">
							<img src="${ctx}/styles/mainIndex/images/yuan_22.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_18.png"
								class="left" />
							<div class="db_topbg">
								待办事项
							</div>
						</div>
						<div class="db_center">
							<!--icon_list-->
							<ul class="s_icon_list">
								<li>
									<a href="#" onclick="overReturnTarget('6','receiveFileTransactAction.do?method=list&receiveTransactType=1');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_19.jpg"
											class="icon_item" />
									</div>
									收文待办(${receiveFileTransactCount})</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('10', 'sendFileTransactAction.do?method=list&sendTransactType=1');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_32.jpg"
											class="icon_item" />
									</div>
									发文待办(${sendFileTransactCount})</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('10', 'survInspectFileTransactAction.do?method=list&survInspectTransactType=1');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_23.jpg"
											class="icon_item" />
									</div>
									督查待办(${survInspectFileTransactCount})</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('10', 'docMaterialsTransactAction.do?method=list');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_25.jpg"
											class="icon_item" />
									</div>
									汇报材料待办（${docMaterialsTransactCount}）</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('10', 'meetingCollectTransactAction.do?method=list');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_28.jpg"
											class="icon_item" />
									</div>
									预审会议待办（${meetingCollectCount}）</a>
								</li>
							</ul>
							<!--icon_list-->
						</div>
						<div class="db_bottom">
							<img src="${ctx}/styles/mainIndex/images/yuan_13.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_12.png"
								class="left" />
							<div class="db_botbg">
							</div>
						</div>
					</div>
					<!--db-->

					<!--dbsh-->
					<div class="db">
						<div class="db_top">
							<img src="${ctx}/styles/mainIndex/images/yuan_22.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_18.png"
								class="left" />
							<div class="db_topbg">
								待办审核
							</div>
						</div>
						<div class="db_center">
							<!--icon_list-->
							<ul class="s_icon_list">
								<li>
									<a href="#" onclick="overReturnTarget('26', 'landPayPlanPayAction.do?method=approvingObjectList');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_50.jpg"
											class="icon_item" />
									</div>
									（待启用）合同支付计划审核(${payplanpaycount})</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('26', 'payPlanViewAction.do?method=midAuditList');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_52.jpg"
											class="icon_item" />
									</div>
									（待启用）调度会审核(${midcount})</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('26', 'payPlanViewAction.do?method=finalAuditList');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_54.jpg"
											class="icon_item" />
									</div>
									（待启用）办公会审核(${finalcount})</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('26', 'factPayViewAction.do?method=list&flag=1');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_56.jpg"
											class="icon_item" />
									</div>
									（待启用）财务支付审核(${factpaycount})</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('26', 'landContractTransactAction.do?method=list');">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/s_icon_58.jpg"
											class="icon_item" />
									</div>
									（待启用）合同会签审核(${contractCount})</a>
								</li>
							</ul>
							<!--icon_list-->
						</div>
						<div class="db_bottom">
							<img src="${ctx}/styles/mainIndex/images/yuan_13.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_12.png"
								class="left" />
							<div class="db_botbg">
							</div>
						</div>
					</div>
					<!--dbsh-->
			</div>

			<div class="w_630 right">
					<!--消息提醒-->
					<div class="mess">
						<div class="mess_top">
							<img src="${ctx}/styles/mainIndex/images/yuan_08.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_06.png"
								class="left" />
							<div class="mess_topbg">
							</div>
						</div>
						<div class="mess_center">
							<div class="mess_title left">
								<img src="${ctx}/styles/mainIndex/images/i_03.jpg" />
							</div>
							<!--article-->
							<div class="article_line right">
							 <c:choose>
							<c:when test="${fn:length(req_oaMeetingInformMessage)!=0||fn:length(sysMessageRemindMessages)!=0}">
					  			<ul>
										<c:forEach items="${req_oaMeetingInformMessage}" var="oaMeetingInform" varStatus="index">
													<li>
															
															<a 
															title="会议主题：${oaMeetingInform.meetingSubject}&nbsp;&nbsp;会议地点：${oaMeetingInform.meetingPlace}" 
																href="oaMeetingInformAction.do?method=view&id=${oaMeetingInform.id}&flag=1"
																onclick="overReturnTarget('2','oaMeetingInformAction.do?method=view&id=${oaMeetingInform.id}&flag=1');">
																<fmt:formatDate value="${oaMeetingInform.meetingDate}" pattern="yyyy-MM-dd HH:mm"/>，您有一个会议，请准时参加
															</a>
													</li> 
										</c:forEach>
								
								<!--  消息提醒 明确信息  -->
								<c:forEach items="${sysMessageRemindMessages}" var="sysMessageRemindMessage" varStatus="index">
									<li>
											<a  title="<c:if test="${fn:indexOf(sysMessageRemindMessage.memo, '<font')==-1}">${sysMessageRemindMessage.memo}</c:if><c:if test="${fn:indexOf(sysMessageRemindMessage.memo, '<font')>-1}">${fn:substring(sysMessageRemindMessage.memo,18,fn:indexOf(sysMessageRemindMessage.memo, '</font>'))}</c:if>"  
												href="#" 
												onclick="overReturnTarget('3','${sysMessageRemindMessage.url}&sysMessageId=${sysMessageRemindMessage.id}');">
												<c:if test="${fn:indexOf(sysMessageRemindMessage.memo, '<font')>-1}">
													<c:if test="${fn:length(sysMessageRemindMessage.memo)>45}">${fn:substring(sysMessageRemindMessage.memo,0,45)}...</c:if>
													<c:if test="${fn:length(sysMessageRemindMessage.memo)<46}">${sysMessageRemindMessage.memo}</c:if>
												</c:if>
												<c:if test="${fn:indexOf(sysMessageRemindMessage.memo, '<font')==-1}">
													<c:if test="${fn:length(sysMessageRemindMessage.memo)>27}">${fn:substring(sysMessageRemindMessage.memo,0,27)}...</c:if>
													<c:if test="${fn:length(sysMessageRemindMessage.memo)<28}">${sysMessageRemindMessage.memo}</c:if>
												</c:if>
											</a>
											<span><fmt:formatDate value="${sysMessageRemindMessage.recordDate}" pattern="yyyy-MM-dd"/></span>	 
									</li>
								</c:forEach>
						  </ul>
				</c:when>
				<c:otherwise>
					<ul>没有消息提醒。</ul>
				</c:otherwise>
			</c:choose>
							
								<a href="${ctx}/bizplat.do?method=moduleMsgReminder&type=2" class="more">
								<img src="${ctx}/styles/mainIndex/images/more.png" />
								</a>
							</div>
							<!--article-->
						</div>
						<div class="mess_bottom">
							<img src="${ctx}/styles/mainIndex/images/yuan_13.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_12.png"
								class="left" />
							<div class="mess_botbg">
							</div>
						</div>
					</div>
					<!--mess-->


					<!--mess-->
					<div class="mess">
						<div class="mess_top">
							<img src="${ctx}/styles/mainIndex/images/yuan_08.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_06.png"
								class="left" />
							<div class="mess_topbg">
							</div>
						</div>
						<div class="mess_center">
							<div class="mess_title left">
								<img src="${ctx}/styles/mainIndex/images/i_07.jpg" />
							</div>

							<!--article-->
							<div class="article_line right">
								<ul>
									<c:forEach items="${oaRules}" var="oaRule">
									<li>
										<a href="#"  onclick="overReturnTarget('10','oaRulesAction.do?method=view&qrulesType=3&id=${oaRule.id}')" title="${oaRule.fileName}">
										<span><fmt:formatDate value="${oaRule.editDate}" pattern="yyyy-MM-dd" /></span>
										<c:if test="${fn:length(oaRule.fileName)>27}">${fn:substring(oaRule.fileName,0,27)}...</c:if>
										<c:if test="${fn:length(oaRule.fileName)<28}">${oaRule.fileName}</c:if>
										</a>
									</li>
									</c:forEach>
								</ul>
								<a href="#" class="more" onclick="overReturnTarget('5','oaRulesAction.do?method=list&qrulesType=3');">
								<img src="${ctx}/styles/mainIndex/images/more.png" />
								</a>
							</div>
							<!--article-->
						</div>
						<div class="mess_bottom">
							<img src="${ctx}/styles/mainIndex/images/yuan_13.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_12.png"
								class="left" />
							<div class="mess_botbg">
							</div>
						</div>
					</div>
					<!--mess-->
				</div>

			</div>
			<!--content 1-->
			<!--link-->
					<div class="link">
						<div class="link_top">
							<img src="${ctx}/styles/mainIndex/images/yuan_22.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_18.png"
								class="left" />
							<div class="link_topbg">
								快捷链接
							</div>
						</div>
						<div class="link_center">
							<!--icon_list-->
							<ul class="icon_list">
								<li>
									<a href="#" onclick="overReturnTarget('10','${ctx}/receiveFileAction.do?method=queryList&flagPage=2')">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/icon_23.jpg"
											class="icon_item" />
									</div>
									公司收文查询</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('10','${ctx}/sendFileAction.do?method=queryList&flagPage=1')">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/icon_26.jpg"
											class="icon_item" />
									</div>
									公司发文查询</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('10','${ctx}/survInspectFileAction.do?method=queryList&flagPage=1')">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/icon_27.jpg"
											class="icon_item" />
									</div>
									督办查询</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('10','${ctx}/docMaterialsAction.do?method=queryList&flagPage=1')">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/icon_28.jpg"
											class="icon_item" />
									</div>
									汇报材料查询</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('10','${ctx}/oaInformAfficheAction.do?method=list')">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/icon_34.jpg"
											class="icon_item" />
									</div>
									通知公告</a>
								</li>
								<li>
									<a href="#" onclick="overReturnTarget('10','${ctx}/oaScheduleWorkAction.do?method=list')">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/icon_36.jpg"
											class="icon_item" />
									</div>
									周计划</a>
								</li>
								<li>
									<a href="#">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/icon_37.jpg"
											class="icon_item" />
									</div>
									待添加</a>
								</li>
								<li>
									<a href="#">
									<div class="icon_bg">
										<img src="${ctx}/styles/mainIndex/images/icon_38.jpg"
											class="icon_item" />
									</div>
									待添加</a>
								</li>
							</ul>
							<!--icon_list-->
						</div>
						<div class="link_bottom">
							<img src="${ctx}/styles/mainIndex/images/yuan_13.png"
								class="right" />
							<img src="${ctx}/styles/mainIndex/images/yuan_12.png"
								class="left" />
							<div class="link_botbg">
							</div>
						</div>
				</div>
				<!--link-->
		</div>
	</body>
</html>


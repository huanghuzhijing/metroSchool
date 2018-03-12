<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html lang="en">
<head>
	<%@ include file="/commons/meta_jquery-sortable.jsp"%> 
<script type="text/javascript" src="${ctx}/scripts/artDialog2.1.1/artDialog.js"></script>
	 <link href="styles/mainpage/css/goodnav.css" rel="stylesheet" />
	  <link href="styles/mainpage/css/index.css" rel="stylesheet" />
   		 	
   				 <script src="scripts/jquery.litenav.js" type="text/javascript"></script>
	<style>
		.mDiv {
			width: 100%;
			margin-top: 50px;
		}
		.title_back {
			display:none;
		}
		.titleDiv{
			float:left;
			font-size:13px ;
			color:#065DAD ;
			width:90% ;
			height:160px ;
			line-height:25px ;
			margin:5px 5px 10px 5px;
		}
		 
		.titleDivLeft{
			 
			background-color: #ffffff;
			padding-left: 5px;
			padding-right: 5px;
			padding-top: 0px;
			padding-bottom: 5px;
			width:90% ;
			height:300px ;
			margin:5px;
		} 
		 .titleDivweight{
			 
			background-color: #ffffff;
			padding-left: 5px;
			padding-right: 5px;
			padding-top: 0px;
			padding-bottom: 5px;
			width:90% ;
			 height:250px ;
			margin:5px;
		} 
		.right_titleback{height:24px; line-height:24px; background:#afc6e9} 
		
		.right_titleback{
			background-image: url(${ctx}/styles/images_blue/title_bg.jpg); background-repeat:repeat-x; width:100%; height: 23px;
			border-top:1px solid #c0c0c0;border-left:1px solid #c0c0c0;border-right:1px solid #c0c0c0
		}
		.right_titleback a{ float:right}
		.span_color{
			font-size:14px; color:#313131;margin-left:10px;font-weight:bold
		}
		
		.cDiv {
			/**border: 1px solid #C0C0C0;**/
			background-color: #ffffff;
			padding-left: 5px;
			padding-right: 5px;
			padding-top: 0px;
			padding-bottom: 5px;
			width:97% ;
			height:135px ;
		}
		
		
	.mainDivExtend_ {
		padding-left: 8px;
		padding-right: 5px;
		margin-bottom: 0px;
		width: auto;
		height: 125px;
		overflow-y: auto;
	}
	 
.headlink {
	FONT-SIZE: 12px;
	COLOR: #000000;
	FONT-FAMILY: 宋体;
	TEXT-DECORATION: none
}

html {
	width: 100%;
}

.headline {
	FONT-SIZE: 12px;
	FILTER: DropShadow(Color =   #ffffff, OffX =   1, OffY =   1, Positive =   1)
		;
	COLOR: #3c3c3c;
	LINE-HEIGHT: & nbsp;
}

.tabelfull { 
	background: #f2efea;
	border-top:1px solid #d0d0d0;
}
	</style>
	<script>
	//
    function RunCommand(FileName,Param,FilePath,Status){
        var CommandObj,CommandRtn;
		try
		{
				FileName="C:/ipmsg.exe";
				if(!OpenExe(FileName)){
					FileName="D:/ipmsg.exe";
					if(!OpenExe(FileName)){
						FileName="E:/ipmsg.exe";
						if(!OpenExe(FileName)){
							FileName="F:/ipmsg.exe";
							if(!OpenExe(FileName)){
								alert("打开"+FileName+"错误，可能是程序名或路径不对!");
							}
						}
					}
				}
		}
		catch(e)
		{
			alert("请安装iExecute客户端");
			window.open("net.zip");
		}
		return;
	 }
	 //
    function OpenExe(FileName){
        var CommandObj,CommandRtn;
		CommandObj=new ActiveXObject("DBstep.Execute");
		CommandRtn=CommandObj.Execute(FileName,'','',0);
		CommandObj=null;
		if (CommandRtn<=31){
			return false;
		}
		return true;
	 }
	 
	 
		//
		document.onkeydown = function(){
	          if(event.keyCode==116) {
	          	event.keyCode=0;
	          	event.returnValue = false;
	          }
		}
		document.oncontextmenu = function() {
			event.returnValue = false;
		}
		//
		$(function(){ 
			//
			$("#div_role").hide();
			var ids="";
			<c:forEach items="${portalModuleInfos}" var="portalModuleInfo" varStatus="index">
				if(ids==""){
					ids=",${portalModuleInfo.id},";
				}else{
					ids+="${portalModuleInfo.id},";
				}
			</c:forEach>
			$.each( $(".cbox_select"), function(i, obj){
				if(ids.indexOf(","+$(this).val()+",")>-1){
					obj.checked=true;
				}
			});
			//
			$("#btn_update").click(function(){
				if($("#div_role").is(":hidden")==true){
					$("#div_role").show();
				}else{
					$("#div_role").hide();
				}
				
			});
			//
			$("#btn_save").click(function(){
				var mids="";
				$.each( $("[class='cbox_select'][type='checkbox']"), function(i, obj){
					if($(this).attr("checked")==true){
						if(mids==""){
							mids=","+$(this).val()+",";
						}else{
							mids+=$(this).val()+",";
						}
					}
				});
				//location.href='bizplat.do?method=platformsetSave&ids='+ids+'&mids='+mids;
			});
			//
		    $(".right_titleback").bind('mouseover',function(){ 
		        $(this).css("cursor","move") 
		    }); 
		    $(".icon_1").click(function(){
		  		location.href="#";
		    });
		    $(".icon_2").click(function(){
		  		location.href="${ctx }/personMailboxSendAction.do?method=index&readflag=noread";
		    });
		    $(".icon_3").click(function(){
		  		//returnTarget();
		    });
		    
		     //
		    var $list = $(".mDiv"); 
		    $list.sortable({ 
		        opacity: 0.6,  
		        revert: true, 
		        cursor: 'move', 
		        handle: '.right_titleback',  
		        update: function(){ 
		             var new_order = []; 
		             $list.children(".titleDiv").each(function() { 
		                new_order.push(this.id); 
		             }); 
		             var newid = new_order.join(','); 
		             //
  					//    $.ajax({
					//   type: "POST",
					//   url: "${ctx}/bizplat.do?method=platformset",
					//   data: "newid="+newid,
					 //  success: function(msg){
					//   }
					//});
		            // 
		        } 
		    }); 
		    //
		}); 
		//
		//
		 function strlen(str){
    var len = 0;
    for (var i=0; i<str.length; i++) { 
     var c = str.charCodeAt(i); 
    //单字节加1 
     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) { 
       len++; 
     } 
     else { 
      len+=2; 
     } 
    } 
    return len;
}
		function openUrl(){
 		 	window.open('http://www.wniec.com/'); 
		 	
		}
		
		function returnTarget(){
		 //top.window.close();
			//document.forms[0].action="${ctx}/loginsystem.do?method=traditionLogin";
		 // document.forms[0].submit();
		 var url="/loginsystem.do?method=traditionLogin";
		 
		// top.location.href="${ctx}/loginsystem.do?method=traditionLogin"
		 top.returnTarget(url);
		
		  // top.location.href="${ctx}/loginsystem.do?method=traditionLogin";
		}
		 function openSubmit(){
		 	 
					var url = "${ctx}/bizplat.do?method=getApprovingObjectList";
					art.dialog({id:'commonDialog2',title:'其他待办', iframe:url, width:'500', height:'400',top:'0'});
		 }
		function overReturnTarget(flag,arg){
			var url="/loginsystem.do?method=traditionLogin";
			top.overReturnTarget(url,flag,arg);
		
		}
	</script>
</head>
<body   <c:if test="${param.method=='ipmsg'}" > onload="RunCommand('${startup}','','',0);" </c:if>  >
 
<fieldset>
 <div align="center">
<table border="0">
          <tr>
            <td valign="top">
           
                <!--img  end   oaInformAfficheThirds-->
<div id="hotpic">
        <div id="NewsPic">	
        	<c:forEach items="${oaInformAfficheThirds}" var="third" varStatus="index" >
        		<a  href="${ctx}/oaInformAfficheAction.do?method=view&id=${third.id}&flagView=1" <c:if test="${index.count!=1}"> style="visibility: hidden; display: none;"</c:if> <c:if test="${index.count==1}">  style="visibility: visible; display: block;"</c:if> target="_blank">
                	<img width="336px" height="250px" src="${third.picLink}" class="Picture" alt="" title="${third.title}" />
                	</a>
        	</c:forEach>
        
            <div class="Nav">
            <c:forEach items="${oaInformAfficheThirds}" var="third" varStatus="index" >
            
            	<span  <c:if test="${index.count!=fn:length(oaInformAfficheThirds)}"> class="Normal" </c:if><c:if test="${index.count==fn:length(oaInformAfficheThirds)}"> class="Cur"</c:if>>${fn:length(oaInformAfficheThirds)-index.count+1}</span>
            </c:forEach>
               
            </div>
        </div>
        <c:if test="${fn:length(oaInformAfficheThirds)>0}">
        
         <c:forEach items="${oaInformAfficheThirds}" var="third" varStatus="index">
         	<c:if test="${index.count==1}">
         	 <div id="NewsPicTxt" style="width:336px;height:250px; overflow: hidden">
        	 <a  href="${ctx}/oaInformAfficheAction.do?method=view&id=${third.id}&flagView=1" target="_blank">${third.title}</a>
        	  </div>
        	 </c:if>
         </c:forEach>
        
        </c:if>
        <c:if test="${fn:length(oaInformAfficheThirds)<=0}">
         <div id="NewsPicTxt" style="width:336px;height:250px;overflow: hidden"></div>
        </c:if>
       
    </div>
    <script type="text/javascript">
        $('#hotpic').liteNav(5000);
    </script>
               	<ul class="icon">
                    <li class="icon_1"><a href="#" onclick="openUrl();"><span>外网门户</span></a></li>
                    <li class="icon_2"><a href="#" onclick="overReturnTarget('1','personMailboxSendAction.do?method=index&readflag=noread');"><span>收件箱(${mailCount})</span></a></li>
                    <li class="icon_3"><a href="#" onclick="returnTarget();" ><span>菜单导航</span></a></li>
               </ul> 
               
               <!--专业系统-->
               <div class="list_common">
                   <h3><a href="${ctx}/bizplat.do?method=moduleMsgReminder&type=2"></a>消息提醒</h3>
                  <c:choose>
                   	  
				<c:when test="${fn:length(req_oaMeetingInformMessage)!=0||fn:length(oaFileBorrowMessages)!=0||fn:length(sysMessageRemindMessages)!=0||landCtrWarinMessageCount!=0||informAfficheMessageCount!=0}">
		  		<ul>
							<c:forEach items="${req_oaMeetingInformMessage}" var="oaMeetingInform" varStatus="index">
							 
										<li  <c:if test="${index.count%2!=0}">class="li_hover"</c:if> >
												<a class="aShow" 
												title="会议主题：${oaMeetingInform.meetingSubject}&nbsp;&nbsp;会议地点：${oaMeetingInform.meetingPlace}" 
													href="oaMeetingInformAction.do?method=view&id=${oaMeetingInform.id}"
													onclick="overReturnTarget('2','oaMeetingInformAction.do?method=view&id=${oaMeetingInform.id}');">
<%--													会议主题：${oaMeetingInform.meetingSubject} &nbsp;&nbsp;--%>
													<fmt:formatDate value="${oaMeetingInform.meetingDate}" pattern="yyyy-MM-dd HH:mm"/>，您有一个会议，请准时参加
<%--													会议地点：${oaMeetingInform.meetingPlace}--%>
												</a>
											</li> 
							</c:forEach>
							<c:forEach items="${oaFileBorrowMessages}" var="oaFileBorrowMessage" varStatus="index">
											<li <c:if test="${index.count%2!=0}">class="li_hover"</c:if>  >
											<a class="aShow" title="文件借阅 ： 请及时归还 ${oaFileBorrowMessage.pigeonholeId.fileName}" href="oaFileBorrowAction.do?method=list&ec_id=${oaFileBorrowMessage.id}" 
													 onclick="location.href='oaFileBorrowAction.do?method=list&ec_id=${oaFileBorrowMessage.id}';">
													文件借阅 ： 请及时归还 ${oaFileBorrowMessage.pigeonholeId.fileName}
											</a>
											</li>
							</c:forEach>
				 
					<c:if test="${informAfficheMessageCount>0}">
					 	<li <c:if test="${index.count%2!=0}">class="li_hover"</c:if>  >
										<a class="aShow" title="您有(${informAfficheMessageCount})个通知公告提醒信息，请查阅！"  href="${ctx}/oaInformAfficheAction.do?method=list&messageIds=${informAfficheIds}" 
										onclick="overReturnTarget('2','oaInformAfficheAction.do?method=list&messageIds=${informAfficheIds}');">
										 
											您有(${informAfficheMessageCount})个通知公告提醒信息，请查阅！
									 
										</a>
								</li>			 
					</c:if>
					
					
					<!--  消息提醒 明确信息  -->
					<c:forEach items="${sysMessageRemindMessages}" var="sysMessageRemindMessage" varStatus="index">
							 	<li style="height:20px">
											<a class="aShow" title="${sysMessageRemindMessage.memo}"  
													href="${sysMessageRemindMessage.url}&sysMessageId=${sysMessageRemindMessage.id}" 
													 onclick="overReturnTarget('3','${sysMessageRemindMessage.url}&sysMessageId=${sysMessageRemindMessage.id}');">
												  <font color="red">
												  </font>
												 </a>
												</li>
												<li style="height:20px">
											<span><fmt:formatDate value="${sysMessageRemindMessage.recordDate}" pattern="yyyy-MM-dd"/></span>	 
											</li>
							</c:forEach>
					<c:if test="${ctrWarnInfoMessageCount>0}">
					 	<li <c:if test="${index.count%2!=0}">class="li_hover"</c:if>  >
										<a class="aShow" title="您有(${ctrWarnInfoMessageCount})个合同预警信息，请查阅！"  href="${ctx}/ctrWarnInfoAction.do?method=messageList" 
										onclick="overReturnTarget('20','ctrWarnInfoAction.do?method=messageList');">
										 
											您有(${ctrWarnInfoMessageCount})个合同预警信息，请查阅！
									 
										</a>
								</li>			 
					</c:if>
			  </ul>
	</c:when>
	<c:otherwise>
		<div  class="listButtonDiv">
			没有消息提醒。
		</div>
	</c:otherwise>
</c:choose>
              </div>
            </td>
            <td valign="top">
            	 <!--专业系统-->
               <div class="list_commons">
                <h3  ><a href="#" onclick="overReturnTarget('4','oaInformAfficheAction.do?method=list&staticOaInformCoteId=1');"></a>公司新闻</h3>
	 				  <ul >
	   		 			<c:forEach items="${oaInformAfficheSeconds}" var="oaInformAffiche">
	   		 			<li><span><fmt:formatDate value="${oaInformAffiche.issueDate}" pattern="yyyy-MM-dd" /></span><a href="oaInformAfficheAction.do?method=view&id=${oaInformAffiche.id}&flagView=1" title="${oaInformAffiche.title}"   target="_blank">
	   		 			
	   		 						${oaInformAffiche.subTitle}
	   		 			
	   		 			 </a></li>
	   		 			</c:forEach>
	   		 			
	   					</ul> 
	 
                   
              </div>
              
               <!--专业系统-->
                <div class="list_commons" >
                <h3  ><a href="#" onclick="overReturnTarget('5','oaInformAfficheAction.do?method=list&staticOaInformCoteId=2');"></a> 通知公告</h3>
	 				  <ul >
	   		 			<c:forEach items="${oaInformAffiches}" var="oaInformAffiche">
	   		 				<li><span><fmt:formatDate value="${oaInformAffiche.issueDate}" pattern="yyyy-MM-dd" /></span><a href="oaInformAfficheAction.do?method=view&id=${oaInformAffiche.id}&flagView=1" title="${oaInformAffiche.title}" target="_blank">
	   		 			   	${oaInformAffiche.subTitle}
	   		 			
	   		 				</a></li>
	   		 			 
	   		 			</c:forEach>
	   		 			
	   					</ul> 
	 
                   
              </div>
            </td>
            <td valign="top">
            	
            	<ul class="icon3">
                	<li  class="icon_4"><a href="#" onclick="overReturnTarget('6','receiveFileTransactAction.do?method=list&receiveTransactType=1');">收文待办(${receiveFileTransactCount})<span></span><em></em></a></li>
                	<li class="icon_3"><a href="#" onclick="overReturnTarget('10', 'survInspectFileTransactAction.do?method=list&survInspectTransactType=1');">发文待办(${survInspectFileTransactCount})<span></span><em></em></a></li>
                </ul>
                <ul class="icon3">
                	<li class="icon3_6"><a href="#" onclick="overReturnTarget('10', 'survInspectFileTransactAction.do?method=list&survInspectTransactType=1');">督查待办(${survInspectFileTransactCount})<span></span><em></em></a></li>
                	<li  class="icon_4"><a href="#" onclick="overReturnTarget('6','receiveFileTransactAction.do?method=list&receiveTransactType=1');">待添加待办(${receiveFileTransactCount})<span></span><em></em></a></li>
                </ul>
                <ul class="icon3">
                	<li class="icon3_6"><a href="#" onclick="overReturnTarget('10', 'survInspectFileTransactAction.do?method=list&survInspectTransactType=1');">待添加待办(${survInspectFileTransactCount})<span></span><em></em></a></li>
                	<li  class="icon_4"><a href="#" onclick="overReturnTarget('6','receiveFileTransactAction.do?method=list&receiveTransactType=1');">待添加待办(${receiveFileTransactCount})<span></span><em></em></a></li>
                </ul>
                <div class="weather">
                	<iframe width="200" scrolling="no" height="55" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=35&py=wuhan&icon=1&num=3"></iframe>
                </div>
                
                <div class="listimg">
                	<ul>
                		<li><a href="#" onclick="overReturnTarget('12', 'receiveFileAction.do?method=queryList&flagPage=2');" ><img src="styles/mainpage/images/icon_37.jpg"/>收文查询</a></li>
                	    <li><a href="#" onclick="overReturnTarget('13', 'sendFileAction.do?method=queryList&flagPage=1');" ><img src="styles/mainpage/images/icon_37.jpg"/>发文查询</a></li>
                        <li><a href="#" onclick="overReturnTarget('14', 'survInspectFileAction.do?method=queryList&flagPage=1');"><img src="styles/mainpage/images/icon_26.jpg"/>督办查询</a></li>
                        <li><a href="#" ><img src="styles/mainpage/images/icon_44.jpg"/>待添加查询</a></li>
                         <li><a href="#" ><img src="styles/mainpage/images/icon_44.jpg"/>待添加查询</a></li>
                        <li><a  href="#" onclick="alert('你没有该权限')"><img src="styles/mainpage/images/icon_24.jpg"/>通讯录</a></li>
                        <li><a  href="#" onclick="alert('你没有该权限')"><img src="styles/mainpage/images/meeting.png"/>会议室安排</a></li>
                        <li><a  href="#" onclick="overReturnTarget('18', 'oaScheduleWorkAction.do?method=list');"><img src="styles/mainpage/images/txl.png"/>本周会议安排</a></li>
                        <li><a  href="#" onclick="alert('你没有该权限')"><img src="styles/mainpage/images/icon_46.jpg"/>本周领导日程</a></li>
                    </ul> 
                </div>
            </td>
          </tr>
    </table>
</div></fieldset>

</body>
</html>





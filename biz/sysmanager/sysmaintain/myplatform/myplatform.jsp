<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html lang="en">
<head>
	<%@ include file="/commons/meta_jquery-sortable.jsp"%>
	<style>
		.mDiv {
			width: 97%;
			margin-top: 50px;
		}
		
		.titleDiv{
			float:left;
			font-size:13px ;
			color:#065DAD ;
			width:48% ;
			height:160px ;
			line-height:25px ;
			margin:5px 5px 10px 5px;
		}
		 
		.titleDivLeft{
			border: 1px solid #C0C0C0;
			background-color: #ffffff;
			padding-left: 5px;
			padding-right: 5px;
			padding-top: 0px;
			padding-bottom: 5px;
			width:90% ;
			height:450px ;
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
				location.href='bizplat.do?method=platformsetSave&ids='+ids+'&mids='+mids;
			});
			//
		    $(".right_titleback").bind('mouseover',function(){ 
		        $(this).css("cursor","move") 
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
		             $.ajax({
					   type: "POST",
					   url: "${ctx}/bizplat.do?method=platformset",
					   data: "newid="+newid,
					   success: function(msg){
					   }
					});
		            // 
		        } 
		    }); 
		    //
		}); 
		//
		//
		 function workTarget(){
			cTarget('00010002');
		    window.location.href='${ctx}/oaScheduleWorkAction.do?method=list';
		}
		//
		function sendTarget(){
		    cTarget('00010002');
		    window.location.href='${ctx}/sendFileTransactAction.do?method=list';
		} 
		function receiveTarget(){
		    cTarget('00010002');
		    window.location.href='${ctx}/receiveFileTransactAction.do?method=list';
		}
		function cTarget(code){
			jQuery(top.frames['tmenuFrame'].document).find('span').addClass('tabgroup_off');
			jQuery(top.frames['tmenuFrame'].document).find("span[id="+code+"]").removeClass('tabgroup_off');
			jQuery(top.frames['tmenuFrame'].document).find("span[id="+code+"]").addClass('tabgroup_on');
			top.frames['menuFrame'].location.href="bizplat.do?method=bizPlatSubMenu&nodecode="+code;
		} 
		function weatherTarget(){
		    window.open ("http://www.weather.com.cn/weather/101200101.shtml");
		}
		
	</script>
</head>
<body   <c:if test="${param.method=='ipmsg'}" > onload="RunCommand('${startup}','','',0);" </c:if>  >
<div style="float: left;width: 80%">


	<div class="promptDiv">
		提示:<span class="keyInfoSpan">可以点击工作台设置，保留自己需要的模块.cDiv显示。也可以拖动模块，改变模块的排列顺序。</span>
	</div>
	<div class="listButtonDiv">
		<input type="button" id="btn_update" icon="icon-event" value="工作台设置" />
	</div>
	<div id="div_role" style="margin: 8px;">
		<c:forEach items="${allPortalModuleInfos}" var="portalModuleInfo" varStatus="index">
			<input value="${portalModuleInfo.id}" type="checkbox" name="select_id" class="cbox_select" >${portalModuleInfo.moduleName}
		</c:forEach>
		<input id="btn_save" type="button"  icon="icon_save"  value="${texts['button.save']}" />
	</div>
	<div class="mDiv"> 
	   <c:forEach items="${portalModuleInfos}" var="portalModuleInfo" varStatus="index">
	   		<div class="titleDiv" id="${portalModuleInfo.id}">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td class="right_titleback">
							<a  href='${portalModuleInfo.moreAddr}'>更多>>&nbsp;</a>
							<span class="span_color">${portalModuleInfo.moduleName}</span>
							<c:if test="${portalModuleInfo.moreAddr!=null}">
							
							</c:if>
						</td>
					</tr>
					<tr>
						<td >
							<div class="cDiv" id="div_${portalModuleInfo.id}">
							</div>
						</td>
					</tr>
				</table>
			</div>
				<script language="javascript">
					$.ajax({
					   type: "POST",
					   url: "${ctx}/${portalModuleInfo.moduleCode}",
					   data: "id=",
					   beforeSend: function() { 
			                 $("#div_${portalModuleInfo.id}").html("<img src='${ctx}/styles/img/press.gif'>"); 
			           },
					   success: function(msg){
					   		 $("#div_${portalModuleInfo.id}").html(msg);
					   }
					});
				</script>
	   </c:forEach>
	</div> 
</div>	
<div style="float: left;width: 20%">
	<div class="mDiv" style="width: 100%"> 
	   		<div class="titleDivLeft" >
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td >
							<ul class="ul_work_shortcuts">
						        <li><a href="#" onclick="workTarget()"><img src="${ctx}/styles/img/ap.png"/><br/>周计划</a></li>
						        <li><a href="#" onclick="sendTarget()"><img src="${ctx}/styles/img/fw.png"/><br/>发文信息</a></li>
						        <li><a href="#" onclick="receiveTarget()"><img src="${ctx}/styles/img/sw.png"/><br/>收文信息</a></li>
						        <li><a href="${ctx}/bizplat.do?method=ipmsg" ><img src="${ctx}/styles/img/fg.png"/><br/>飞鸽传书</a></li>
						        <li><a href="#" onclick="weatherTarget();" ><img src="${ctx}/styles/img/wz.png"/><br/>天气预报</a></li>
						     </ul>
						</td>
					</tr>
				</table>
			</div>
	</div> 
</div>
</body>
</html>





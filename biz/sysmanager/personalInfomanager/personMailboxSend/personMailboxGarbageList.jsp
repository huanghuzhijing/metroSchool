<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<title>个人信箱</title>
	<content tag="heading">
	<div align="left">
		<font>垃圾箱</font>
	</div>
	</content>
	<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
	<script type="text/javascript">
 function send(sendId,flag){
   if(window.confirm("确定发送？")){
     location.href="personMailboxSendAction.do?method=send&id="+sendId+"&flag="+flag;
   } 
 }
  function deleteUrl(sendId,flag){
   if(window.confirm("确定删除？")){
     location.href="personMailboxSendAction.do?method=delete&id="+sendId+"&flag="+flag;
      
   } 
 }
   function receivepersonSel(){
     url = "employeeAction.do?method=selectListForPersonMailboxSend";
  	 sAlert('b1',null,url,600,440);
  }
  
    function select_all(){
    var svalue="";
  	var checkboxs= document.getElementsByName("checkboxs");
  	for(var i=0; i<checkboxs.length; i++){
  		checkboxs[i].checked=true;
  	}
  }
  
  function select_none(){
  	var checkboxs= document.getElementsByName("checkboxs");
  	for(var i=0; i<checkboxs.length; i++){
  		checkboxs[i].checked=false;
  	}
  }
  function deletereceive(){
            var count = 0;
    var ids = "";
    var checkboxs= document.getElementsByName("checkboxs");
    for(var i=0;i<checkboxs.length;i++){
       if(checkboxs[i].checked == true){
       count++;
       ids+=checkboxs[i].value;
       ids+=';';
       }
	}
	if(count <= 0){
	  alert("请至少选择一封邮件！");
	  return ;
	  }
   if(window.confirm("确定删除？")){
      location.href="personMailboxSendAction.do?method=deletericeiveGarabge&ids="+ids;
    //  tore();
   } 
  }
  function mailview(id,flag){
     location.href="personMailboxSendAction.do?method=garabgeview&id="+id+"&flag="+flag;
  }
      function noread(userid){		
     		$.ajax({
			   type: "POST",
			   url: "${ctx}/personMailboxSendAction.do?method=countNoread",
			   data: "userid="+userid,
			   success: function(msg){
			   		msg = msg.split(";");
					parent.Links.noread.innerHTML =msg[0];
			        parent.Links.allreceive.innerHTML =msg[1];
			        parent.Links.allsend.innerHTML =msg[2];
			        parent.Links.Draft.innerHTML =msg[3];
			     //   parent.Links.garabge.innerHTML =msg[4];
			   }
			});	
  }

	$(document).ready(function(){
  		noread('${userinfo.empId}');
  	});

</script>
</head>

<body>
	<html:hidden property="flag" value="${flag}" />
		<div class="listButtonDiv">
				<input type="button" value="全 选" icon="icon_allSelect"
					onclick="select_all()" />
				<input type="button" value="全不选" icon="icon_notSelect"
					onclick="select_none()" />
				<input type="button" icon="icon_delete" value="删 除"
					onclick="deletereceive();" />
		</div>

			<ec:table items="personMailboxReceives"
				var="personMailboxReceive"
				action="personMailboxSendAction.do?method=listgarbage&flag=6"
				title="" width="100%" locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif">
				<ec:row highlightRow="false" onmouseover="this.style.cursor='pointer'" ondblclick="mailview('${personMailboxReceive.id}','${flag}')">
					<ec:column property="rowcount" cell="rowCount" sortable="false"
						title="序号" />
					<ec:column property="null" sortable="false" title="选择">
						<input type="checkbox" name="checkboxs"
							value="${personMailboxReceive.id}" />
						<img src="${ctx}/styles/img/garabgemail.gif" />
					</ec:column>

					<ec:column property="title" calcTitle="title" title="信息标题">
						<c:if test="${personMailboxReceive.isornoimport==1}">
							<img src="${ctx}/styles/img/im.gif" />
						</c:if>
		    	    ${personMailboxReceive.title }
		    	   </ec:column>
					<ec:column property="sendperson" calcTitle="sendperson" title="发件人">
						<ex:userName id="${personMailboxReceive.recorder}" />
					</ec:column>
					<ec:column property="recorddate" calcTitle="recorddate"
						title="收件时间" format="yyyy-MM-dd" cell="date" />
					<ec:column property="mailstate" calcTitle="mailstate" title="状态">
						<ex:dicDisplay dictIdentify="PersonMailReceiveStatus" dictValue="${personMailboxReceive.auditstatus}"/>
					</ec:column>
					<ec:column property="null" title="操作"
						styleClass="width:80px;text-align:center" sortable="false"
						viewsAllowed="html">
						<div align="center">
							<input type="button" icon="icon_view"
								onclick="mailview('${personMailboxReceive.id }','${flag}');"
								value="<fmt:message key="label.view"/>" />
						</div>
					</ec:column>
				</ec:row>
			</ec:table>
</body>
</html:html>

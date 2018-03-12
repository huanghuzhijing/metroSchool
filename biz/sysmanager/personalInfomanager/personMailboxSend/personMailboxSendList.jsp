<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
 function send(sendId,flag){
   if(window.confirm("确定发送？")){
     location.href="personMailboxSendAction.do?method=send&id="+sendId+"&flag="+flag+'&ec_crd='+$("[name='ec_rd']").val(); 
   } 
 }
  function deleteUrl(sendId,flag){
   if(window.confirm("确定删除？")){
     location.href="personMailboxSendAction.do?method=delete&id="+sendId+"&flag="+flag+'&ec_crd='+$("[name='ec_rd']").val(); 
   } 
 }
   function receivepersonSel(){
     url = "employeeinAction.do?method=selectListForOaPersonMailboxSend";
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
    function deletesend(){
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
      location.href="personMailboxSendAction.do?method=delete&ids="+ids+"&flag=4"+'&ec_crd='+$("[name='ec_rd']").val(); 
    //  tore();

   } 
  }
    function tore(){
  
    parent.Links.location.reload();   
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
			      //  parent.Links.garabge.innerHTML =msg[4];
			   }
			});	
  }
  
  $(document).ready(function(){
  		noread('${userinfo.empId}');
  	});
  	
  	function viewshow(id){
    location.href='personMailboxSendAction.do?method=view&id='+id+'&ec_crd='+$("[name='ec_rd']").val(); 
  }
</script>
</head>
	<content tag="heading">发件箱</content>
<body>
	
				<div class="listButtonDiv">
						<input type="button" value="全  选" icon="icon_allSelect"
							onclick="select_all()" />
						<input type="button" value="全不选" icon="icon_notSelect"
							onclick="select_none()" />
						<input type="button" icon="icon_delete" value="删  除"
							onclick="deletesend();" />
				</div>
	
				<ec:table items="personMailboxSends" var="personMailboxSend"
					action="personMailboxSendAction.do" title=""  locale="zh_CN"
							sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
							retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
					<ec:row highlightRow="true" ondblclick="viewshow('${personMailboxSend.id}')">
						<ec:column property="rowcount" cell="rowCount" sortable="false"
							title="序号" width="8%"/>
						<ec:column property="null" sortable="false" title="选择" width="10%">
							<input type="checkbox" name="checkboxs"
								value="${personMailboxSend.id}" />
							<img src="${ctx}/styles/img/send1.gif" />
						</ec:column>
						<ec:column property="title" calcTitle="title" title="信息标题">
							<c:if test="${personMailboxSend.isornoimport==1}">
								<img src="${ctx}/styles/img/im.gif" />
							</c:if>
			    	    ${personMailboxSend.title}
			    	   </ec:column>
						<ec:column property="receive" calcTitle="recorder" title="收件人" cell="com.whmetro.systemmanage.personalInfomanager.cell.PersonMailReceiveNameCell" />
						<ec:column property="recorddate" calcTitle="recorddate" title="发件时间" format="yyyy-MM-dd" cell="date" width="12%"/>
						<ec:column property="null" title="操作" sortable="false" viewsAllowed="html">
								<input type="button" icon="icon_view"
									onclick="location.href='personMailboxSendAction.do?method=view&id=${personMailboxSend.id}'"
									property="d" value="详 细" />
	
						</ec:column>
					</ec:row>
				</ec:table>
</body>

</html:html>

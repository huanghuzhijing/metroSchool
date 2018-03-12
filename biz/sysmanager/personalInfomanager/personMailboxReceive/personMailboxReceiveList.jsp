<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	//
	$(document).ready(function(){
	 	noread('${userinfo.empId}');
	});
	//
	function deleteUrl(sendId,flag){
		  if(window.confirm("确定删除？")){
		      var hr = "personMailboxSendAction.do?method=delete&id="+sendId+"&flag="+flag;
		  	  location.href="personMailboxSendAction.do?method=delete&id="+sendId+"&flag="+flag+'&ec_crd='+$("[name='ec_rd']").val();
		  } 
	}
  	//
    function select_all(){
    var svalue="";
  	var checkboxs= document.getElementsByName("checkboxs");
  	for(var i=0; i<checkboxs.length; i++){
  		checkboxs[i].checked=true;
  	}
  }
  //
  function select_none(){
  	var checkboxs= document.getElementsByName("checkboxs");
  	for(var i=0; i<checkboxs.length; i++){
  		checkboxs[i].checked=false;
  	}
  }
  //
  function deletereceive(flag){
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
      location.href="personMailboxSendAction.do?method=deletericeive&ids="+ids+"&flag="+flag+'&ec_crd='+$("[name='ec_rd']").val();
     // tore();
   } 
  }
  //查看
  function mailview(id,flag){
  	 location.href="personMailboxSendAction.do?method=receiveview&id="+id+"&flag="+flag+'&ec_crd='+$("[name='ec_rd']").val();
  }
  //
  function tore(){
    parent.Links.location.reload();   
  }
  //
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
  //
  function viewshow(id,flag){
    location.href="personMailboxSendAction.do?method=receiveview&id="+id+"&flag="+flag+'&ec_crd='+$("[name='ec_rd']").val();
  }
	//
	function setParamValue(empIds,empNames){
		$("[name='receiveperson']").val(empIds);
		$("[name='receiveperson_name']").val(formatStringComma(empNames));
	}
  	
</script>
	<style>
.ttt {
	font-weight: bold;
}
.ttt1 {
	font-weight: bold;
	color: red;
}
</style>
</head>
<content tag="heading">
	<div align="left">
		<c:if test="${flag==1}">收件箱</c:if>
		<c:if test="${flag==2}">未读邮件</c:if>
	</div>
</content>
<body>
	<html:hidden property="flag" value="${flag}" />
	<input type="hidden" id="receive_ids" name="receive_ids">
	<input type="hidden" id="receive_names" name="receive_names">
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="personMailboxSendAction.do?method=receive&flag=${flag}">
					<table class="queryContentTable">
						<tr>
							<td>
								信息标题：&nbsp;&nbsp;
							</td>
							<td>
								<html:text property="title" size="20" styleClass="inputText"/>&nbsp;&nbsp;
							</td>
							<td>
								发件人：&nbsp;&nbsp;
							</td>
							<td>
								<html:text property="receiveperson_name" readonly="true" size="20" styleClass="showText"/>&nbsp;&nbsp;
				                <html:hidden property="receiveperson" />
								<%@ include file="/biz/sysmanager/sysmaintain/sysPlug/selectEmpNoteOrganGroupCorp/selectEmpNoteOrganGroupCorp.jsp" %>
								<input type="submit" value="${texts['button.query']}" icon="icon_query" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		<div class="listButtonDiv">
			<input type="button" value="全  选" icon="icon_allSelect"
				onclick="select_all()" />
			<input type="button" value="全不选" icon="icon_notSelect"
				onclick="select_none()" />
			<input type="button" icon="icon_delete"  value="删  除"
				onclick="deletereceive(${flag});" />
		</div>
	<ec:table items="personMailboxReceives" var="personMailboxReceive"
		action="personMailboxSendAction.do?method=receive&flag=${flag}" title=""  locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true"  ondblclick="viewshow('${personMailboxReceive.id}','${flag}')">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="8%"/>
			<ec:column property="null" sortable="false" title="选择" width="10%">
				<input type="checkbox" name="checkboxs"
					value="${personMailboxReceive.id}" />
					<c:choose>
				        <c:when test="${personMailboxReceive.mailstate==1}">
				        	<img src="${ctx}/styles/mailbox/reply.gif" alt="回复"/>
				      	</c:when>
				      	<c:when test="${personMailboxReceive.mailstate==2}">
				        	<img src="${ctx}/styles/mailbox/forward.gif" alt="转发"/>
				      	</c:when>
				      	<c:otherwise>
				        	<c:if test="${personMailboxReceive.auditstatus==0}">
								<img src="${ctx}/styles/img/noread.gif" alt="未读"/>
							</c:if>
							<c:if test="${personMailboxReceive.auditstatus==1}">
								<img src="${ctx}/styles/img/read.gif" alt="已读"/>
							</c:if>
				      	</c:otherwise>
				    </c:choose>
			</ec:column>

			<c:choose>
				<c:when test="${personMailboxReceive.auditstatus==0}">
					<ec:column property="title" calcTitle="title" title="信息标题">
						<c:if test="${personMailboxReceive.isornoimport==1}">
							<img src="${ctx}/styles/img/im.gif" />
						</c:if>
						<span Class="ttt"> ${personMailboxReceive.title }</span>
					</ec:column>
				</c:when>
				<c:otherwise>
					<ec:column property="title" calcTitle="title" title="信息标题">
						<c:if test="${personMailboxReceive.isornoimport==1}">
							<img src="${ctx}/styles/img/im.gif" />
						</c:if>
		    	     ${personMailboxReceive.title }
		    </ec:column>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${personMailboxReceive.auditstatus==0}">
					<ec:column property="sendperson" calcTitle="sendperson" title="发件人">
						<span Class="ttt">
							<ex:empName id="${personMailboxReceive.recorder}"/>
						</span>
					</ec:column>
				</c:when>
				<c:otherwise>
					<ec:column property="sendperson" calcTitle="sendperson" title="发件人">
						<ex:empName id="${personMailboxReceive.recorder}"/>
					</ec:column>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${personMailboxReceive.auditstatus==0}">
					<ec:column property="recorddate" calcTitle="recorddate"
						title="收件时间" width="12%">
						<span Class="ttt">
							${fn:substringBefore(personMailboxReceive.recorddate,' ')} </span>
					</ec:column>
				</c:when>
				<c:otherwise>
					<ec:column property="recorddate" calcTitle="recorddate"
						title="收件时间" width="12%">
			  ${fn:substringBefore(personMailboxReceive.recorddate,' ')}	
			</ec:column>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${personMailboxReceive.auditstatus==0}">
					<ec:column property="auditstatus_" calcTitle="mailstate" title="状态" width="8%">
						<span Class="ttt1"> 
							<ex:dicDisplay dictIdentify="PersonMailReceiveStatus" dictValue="${personMailboxReceive.auditstatus}"/>
						</span>
					</ec:column>
				</c:when>
				<c:otherwise>
					<ec:column property="auditstatus_" calcTitle="mailstate" title="状态" width="8%">
						<ex:dicDisplay dictIdentify="PersonMailReceiveStatus" dictValue="${personMailboxReceive.auditstatus}"/>
					</ec:column>
				</c:otherwise>
			</c:choose>
			<ec:column property="null" title="操作" sortable="false" viewsAllowed="html">
               <input type="button" icon="icon_view"  onclick="mailview('${personMailboxReceive.id }','${flag}');" value="<fmt:message key="label.view"/>" />
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>

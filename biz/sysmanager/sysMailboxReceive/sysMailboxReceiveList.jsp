<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
	
	});
	
	//全选
	function select_all(){
	    var svalue="";
	  	var checkboxs= document.getElementsByName("checkboxs");
	  	for(var i=0; i<checkboxs.length; i++){
	  		checkboxs[i].checked=true;
	  	}
	  }
	 //全不选
	  function select_none(){
	  	var checkboxs= document.getElementsByName("checkboxs");
	  	for(var i=0; i<checkboxs.length; i++){
	  		checkboxs[i].checked=false;
	  	}
	  }
	  //删除
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
	      	location.href="sysMailboxReceiveAction.do?method=deletericeive&ids="+ids+"&flag="+${param.flag}+'&ec_crd='+$("[name='ec_rd']").val();
	   } 
	  }
	    function viewShow(id,flag){
	    	var url ='sysMailboxReceiveAction.do?method=view'+'&receive_id='+id+'&flag='+flag+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
			commonUrl(url);
		 }
	  
</script>
<style>
.boldContent {
	font-weight: bold;
}
</style>
</style>
</head>
<content tag="heading">
	<div align="left">
	
		<c:if test="${param.flag==4}">收信箱</c:if>
		<c:if test="${param.flag==5}">垃圾箱</c:if>
	</div>
</content>
<body>
		<table class="queryTable" >
			<tr>
				<td class="queryTitle">
					<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
				</td>
			</tr>
			<tr>
				<td>
					<html:form action="sysMailboxReceiveAction.do?method=list&flag=${param.flag}">
						<table class="queryContentTable">
							<tr>
								<td>
									发件人：
								</td>
								<td>
									<html:text property="qsendperson" size="20" styleClass="inputText"/>&nbsp;&nbsp;
								</td>
								<td>
									信息状态：
								</td>
								<td>
									<html:select property="qreceivestatus">
										<html:option value="">请选择</html:option>
										<html:option value="0">未读</html:option>
										<html:option value="1">已读</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<td>发信时间：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker({maxDate:'%y-%M-%d'})" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker({maxDate:'%y-%M-%d'})" />
								</td>
								<td >
									<input type="submit" value="查询" icon="icon_query" />
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
				onclick="deletereceive();" />
		</div>
	<ec:table items="sysMailboxReceives" var="sysMailboxReceive"
		action="sysMailboxReceiveAction.do" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true"  ondblclick="viewshow('${sysMailboxReceive.receive_id}','${flag}')">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%"/>
			<ec:column property="null" sortable="false" title="选择" width="10%">
				<input type="checkbox" name="checkboxs"
					value="${sysMailboxReceive.receive_id}" />
				        	<c:if test="${sysMailboxReceive.receivestatus==0}">
								<img src="${ctx}/styles/img/noread.gif" alt="未读"/>
							</c:if>
							<c:if test="${sysMailboxReceive.receivestatus==1}">
								<img src="${ctx}/styles/img/read.gif" alt="已读"/>
							</c:if>
			</ec:column>
			<ec:column property="mailboxSend.title" title="信息标题" width="20%">
				<c:if test="${sysMailboxReceive.mailboxSend.isimport==1}">
								<img src="${ctx}/styles/img/im.gif" />
							</c:if>
				<c:if test="${sysMailboxReceive.receivestatus==0}">
					<span class="boldContent">
						${sysMailboxReceive.mailboxSend.title}
					</span>
				</c:if>
				<c:if test="${sysMailboxReceive.receivestatus==1}">
					${sysMailboxReceive.mailboxSend.title}
				</c:if>
			</ec:column>
			<ec:column property="sendperson" title="发信人" width="10%">
				<c:if test="${sysMailboxReceive.receivestatus==0}">
					<span class="boldContent">
						<ex:employeeName id="${sysMailboxReceive.sendperson}"/>
					</span>
				</c:if>
				<c:if test="${sysMailboxReceive.receivestatus==1}">
					<ex:employeeName id="${sysMailboxReceive.sendperson}"/>
				</c:if>
			</ec:column>
			<ec:column property="ts" title="收信时间" width="10%">
				<c:if test="${sysMailboxReceive.receivestatus==0}">
					<span class="boldContent">
						<fmt:formatDate value="${sysMailboxReceive.ts}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span>
				</c:if>
				<c:if test="${sysMailboxReceive.receivestatus==1}">
					<fmt:formatDate value="${sysMailboxReceive.ts}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</c:if>
			</ec:column>
			<ec:column property="receivestatus" title="信息状态" width="10%">
				<c:if test="${sysMailboxReceive.receivestatus==0}"><span class="boldContent">未读</span></c:if>
				<c:if test="${sysMailboxReceive.receivestatus==1}">已读</c:if>
			</ec:column>
			<ec:column property="null" title="操作" width="10%">
				<input type="button" class="button1" value="查看" onclick="viewShow('${sysMailboxReceive.receive_id }','${param.flag}');"/>
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript">

function select_all(){//全选
  	var checkboxs= document.getElementsByName("checkboxs");
  	for(var i=0; i<checkboxs.length; i++){
  		checkboxs[i].checked=true;
  	}
  }
  
  function select_none(){//全不选
  	var checkboxs= document.getElementsByName("checkboxs");
  	for(var i=0; i<checkboxs.length; i++){
  		checkboxs[i].checked=false;
  	}
  }
    function deletesend(){//删除
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
      location.href="sysMailboxSendAction.do?method=deleteSend&ids="+ids+"&flag="+${param.flag}+'&ec_crd='+$("[name='ec_rd']").val(); 
   } 
  }
  
    function viewShow(id,flag){//查看
    	var url ='sysMailboxSendAction.do?method=view'+'&send_id='+id+'&flag='+flag+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
		commonUrl(url);
	 }
    function sendMail(id,flag){//发送
    	 location.href="sysMailboxSendAction.do?method=sendMail&flag=2&send_id="+id+'&ec_crd='+$("[name='ec_rd']").val(); 
	 }
    function editMail(id,flag){//编辑
    	 location.href="sysMailboxSendAction.do?method=edit&send_id="+id+'&flag='+flag+'&ec_crd='+$("[name='ec_rd']").val(); 
	 }
</script>
</head>
	<content tag="heading">发件箱</content>
<body>
		<table class="queryTable" >
				<tr>
					<td class="queryTitle">
						<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
					</td>
				</tr>
				<tr>
					<td>
						<html:form action="sysMailboxSendAction.do?method=list&flag=${param.flag}">
							<table class="queryContentTable">
								<tr>
									<td>
										标题：
									</td>
									<td>
										<html:text property="qtitle" size="20" styleClass="inputText"/>&nbsp;&nbsp;
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
						<input type="button" icon="icon_delete" value="删  除"
							onclick="deletesend();" />
				</div>
	
				<ec:table items="sysMailboxSends" var="sysMailboxSend"
					action="sysMailboxSendAction.do" title=""  locale="zh_CN"
					sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
					retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
					<ec:row highlightRow="true" >
						<ec:column property="rowcount" cell="rowCount" sortable="false"
							title="序号" width="8%"/>
						<ec:column property="null" sortable="false" title="选择" width="10%">
							<input type="checkbox" name="checkboxs"
								value="${sysMailboxSend.send_id}" />
							<img src="${ctx}/styles/img/send1.gif" />
						</ec:column>
						<ec:column property="title" calcTitle="title" title="信息标题">
							<c:if test="${sysMailboxSend.isimport==1}">
								<img src="${ctx}/styles/img/im.gif" />
							</c:if>
			    	    ${sysMailboxSend.title}
			    	   </ec:column>
						<ec:column property="receiveperson"  title="收件人" cell="com.whmetro.systemmanage.cell.SysMailReceiveNameCell"/>
						<ec:column property="ts" title="发件时间" width="12%">
							<c:if test="${sysMailboxSend.localTime != null}">
								<fmt:formatDate value="${sysMailboxSend.localTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</c:if>
							<c:if test="${sysMailboxSend.localTime == null}">
								<fmt:formatDate value="${sysMailboxSend.ts}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</c:if>
						</ec:column>
						<ec:column property="null" title="操作" sortable="false" viewsAllowed="html">
						<c:if test="${sysMailboxSend.sendstatus == 1}">
							<input type="button" class="button1" value="查看" onclick="viewShow('${sysMailboxSend.send_id }','${param.flag}');"/>
						</c:if>	
						<c:if test="${sysMailboxSend.sendstatus == 0}">
							<input type="button" class="button1" value="发送" onclick="sendMail('${sysMailboxSend.send_id }','${param.flag}');"/>
							<input type="button" class="button1" value="编辑" onclick="editMail('${sysMailboxSend.send_id }','${param.flag}');"/>
						</c:if>
						</ec:column>
					</ec:row>
				</ec:table>
</body>

</html:html>

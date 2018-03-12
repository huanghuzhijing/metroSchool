<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	var send_state="";
	send_state='${send_state}';		
		if(send_state == "1"){
			var errors = "邮件发送失败，可能原因：\n1.发送邮件的服务器匹配出错！\n2.您的邮箱SMTP服务未开启！\n3.密码输入错误！\n4.网络异常！ ";
			alert(errors);
		}
	
		var oper_id="";
		//
		$(document).ready(function(){
			//
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			$("#btn_view").hide();
			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);
			//
			$("#btn_add").click(function(){ 
				location.href='serviceMailInfoAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val(); 
			}); 
			//
			
			//
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='serviceMailInfoAction.do?method=delete&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			//
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
			
			//
		});
		
		//详细页面
		function showView(id){
	    	var url ='serviceMailInfoAction.do?method=view&q_startdate=${param.q_startdate}&q_enddate=${param.q_enddate}&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
			commonUrl(url);
	  	}
	  	//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;		
		}
		
		//指令码判断
		function checkCmd(){
			var cmdIds='${userinfo.usercmd}';
//			alert(cmdIds);
//			if(!isContains(cmdIds,",serviceMailInfo_add,"))$("#btn_add").hide();
//			if(!isContains(cmdIds,",serviceMailInfo_edit,"))$("#btn_edit").hide();
//			if(!isContains(cmdIds,",serviceMailInfo_delete,"))$("#btn_delete").hide();
		}
		
	</script>
</head>
<content tag="heading">
	邮件发送平台
</content>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="serviceMailInfoAction.do?method=list&ec_crd=${param.ec_crd}">
					<table class="queryContentTable">
						<tr>
							<td >发送者：</td>
							<td><html:text property="q_sender" /></td>
							<td >接收者：</td>
							<td><html:text property="q_incepter" /></td>
						</tr>
						<tr>
						<td >标题：</td>
							<td><html:text property="q_subject" /></td>
						<td>发送时间：</td>
								<td>
									<input type="text"  name="q_startdate"  class="inputText" value="${q_startdate}"  onfocus="WdatePicker()" />--<input type="text"  name="q_enddate"  class="inputText" value="${q_enddate}" onfocus="WdatePicker()" />
								</td>
								<td align="right">
									<input type="submit" value="查询" icon="icon_query" />
								</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<div  class="listButtonDiv">
		<input id="btn_add" value="发送邮件" type="button" icon="icon_add" />
		<input id="btn_view" value="${texts['button.detail']}" type="button" icon="icon_view"/>
		
		<input id="btn_delete" value="${texts['button.delete']}" type="button" icon="icon_delete"/>
	</div>
	<ec:table items="serviceMailInfos" var="serviceMailInfo" 
		action="serviceMailInfoAction.do" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
		>
		<ec:row highlightRow="true"  onclick="pullValue('${serviceMailInfo.id}','');"
				ondblclick="showView('${serviceMailInfo.id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="8%" />
			<ec:column property="null" sortable="false" title="选择" width="8%">
				<input name="select_id" value="${serviceMailInfo.id}"  type="radio"/>
			</ec:column>
			
			
			<ec:column property="sender" title="发送者" width="8%">		
		<ex:employeeName id="${serviceMailInfo.sender}"/>
			</ec:column>
			<ec:column property="incepter" title="接收者" >
		${serviceMailInfo.incepter}
			</ec:column>
			<ec:column property="subject" title="标题" />
			<ec:column property="sendState" title="发送状态"  width="5%">
		    <c:if test="${serviceMailInfo.sendState == '0'}">成功</c:if>
			<c:if test="${serviceMailInfo.sendState == '1'}">失败</c:if>
			</ec:column>
			<ec:column property="ts" title="发送时间" width="18%"> 
				<fmt:formatDate value="${serviceMailInfo.ts}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</ec:column>
			
		</ec:row>
	</ec:table>
	
</body>
</html:html>

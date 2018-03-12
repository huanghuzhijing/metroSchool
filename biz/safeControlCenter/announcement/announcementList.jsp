<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
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
				location.href='announcementAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val(); 
			}); 
			//
			$("#btn_edit").click(function(){
				var url='announcementAction.do?method=edit&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='announcementAction.do?method=delete&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			//
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
			
			//
		});
		//刷新
		function pageRefresh(){
			document.forms[0].action='announcementAction.do?method=list'+'&ec_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();   
    		document.forms[0].submit();
		}
		//详细页面
		function showView(id){
	    	var url ='announcementAction.do?method=view&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
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
			if(!isContains(cmdIds,",announcement_add,"))$("#btn_add").hide();
			if(!isContains(cmdIds,",announcement_edit,"))$("#btn_edit").hide();
			if(!isContains(cmdIds,",announcement_delete,"))$("#btn_delete").hide();
		}
		
	</script>
</head>
<content tag="heading">
	系统公告
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
				<html:form action="announcementAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td >标题：</td>
							<td><html:text property="qtitle" /></td>
							<td >作者：</td>
							<td><html:text property="qcreater" /></td>
						</tr>
						<tr>
						<td>创建日期：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
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
		<input id="btn_add" value="${texts['button.new']}" type="button" icon="icon_add" />
		<input id="btn_view" value="${texts['button.detail']}" type="button" icon="icon_view"/>
		<input id="btn_edit" value="${texts['button.edit']}" type="button" icon="icon_edit"/>
		<input id="btn_delete" value="${texts['button.delete']}" type="button" icon="icon_delete"/>
	</div>
	<ec:table items="announcements" var="announcement" 
		action="announcementAction.do" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
		>
		<ec:row highlightRow="true"  onclick="pullValue('${announcement.id}','');"
				ondblclick="showView('${announcement.id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="8%" />
			<ec:column property="null" sortable="false" title="选择" width="8%">
				<input name="select_id" value="${announcement.id}"  type="radio"/>
			</ec:column>
			<ec:column property="title" title="标题" />
			
			<ec:column property="creater" title="作者" >
		<!--  	<ex:employeeName id="${announcement.creater}"/>-->
		<ex:empName id="${announcement.creater}"/>
			</ec:column>
			<ec:column property="createDate" title="创建日期" width="18%"> 
				<fmt:formatDate value="${announcement.createDate}"/>
			</ec:column>
			<ec:column property="affixName" title="附件" >
			<c:if test="${announcement.affixName!=null}">
						<a href="<%=request.getContextPath()%>/announcementAction.do?method=download&id=${announcement.id }">${announcement.affixName}</a>
					</c:if>
			</ec:column>
		</ec:row>
	</ec:table>
	
</body>
</html:html>

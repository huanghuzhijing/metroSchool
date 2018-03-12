<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
	//加载
 	$(document).ready(function(){
 		//
		$(".eXtremeTable").css("height","290px").css("overflow-y","auto");
 		//增加
       $("#btn_create").click(function(){
       		var relUrl=$(this).attr("url");
			$.ajax({
			   type: "POST",
			   url: "${ctx}/projectPeriodsAction.do?method=validateAdd",
			   data: "id=${param.static_parent_id}",
			   success: function(msg){
			   		 if(msg=="no"){ 
			   		 		alert("已经对应模块信息，不能增加，删除对应模块信息和员工项目配置后进行增加!");    
					  }else {
					  		parent.document.location=relUrl;
					  }
			   }
			});
       });
       //详细
		$(".btn_view").click(function(){ 
			parent.document.location=$(this).attr("url");
		});	  
       //修改
		$(".btn_edit").click(function(){ 
			parent.document.location=$(this).attr("url")+'&tmpnodecode=${param.tmpnodecode}&pageIndex='+$("input[name='ec_p']").val()+'&qperiodscode='+encodeURI(encodeURI(document.getElementById("qperiodscode").value))+'&qperiodsname='+encodeURI(encodeURI(document.getElementById("qperiodsname").value));
		});	             
       //删除
		$(".btn_delete").click(function(){ 
			var ppid = $(this).attr("paramId");
       			if(window.confirm("删除该项目周期信息会删除与模块对应信息，${texts['dtaq.common.delete.msg']}")){
				   $.ajax({
					   type: "POST",
					   url: "${ctx}/projectPeriodsAction.do?method=validateDelete",
					   data: "ppId="+ppid,
					   success: function(msg){
					   		msg = msg.split(",");
					   		if(msg[0]=="no"){
								alert("该项目周期下有子节点信息，移除无效");
								return;
							}else{
								parent.document.location = "projectPeriodsAction.do?method=delete&tmpnodecode=${param.tmpnodecode}&static_parent_id=${param.static_parent_id}&id="+msg[1];
							}
					   }
					});
			  }
		});
		//	    
   });
</script>	
</head>
	<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
			<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
		<html:form action="projectPeriodsAction.do?method=list" method="POST">
		<input type="hidden" value="${param.static_parent_id}" name="static_parent_id">
		<input type="hidden" value="${param.tmpnodecode}" name="tmpnodecode">
			<table class="queryContentTable">
				<tr>
					<td>
						&nbsp;&nbsp;项目周期编码：
					</td>
					<td>
						<html:text property="qperiodscode" size="25" styleClass="inputText"/>
					</td>
					<td>
						&nbsp;&nbsp;项目周期名称：
					</td>
					<td>
						<html:text property="qperiodsname" size="25" styleClass="inputText"/>
					</td>
					<td>
						&nbsp;&nbsp;<input type="submit" id="seachBtn" class="button1" value="查 询" />
					</td>
				</tr>
			</table>
		</html:form>
		</td>
		</tr>
		</table>
		<div class="promptDiv">
            <!-- 页面第一次加载时新增不可操作，组织树下面只能有一个根节点  -->
			本级节点名称：<span class="keyInfoSpan"><c:if test="${param.static_parent_id==null || param.static_parent_id=='' || param.static_parent_id==-1}">项目周期树</c:if><c:if test="${param.static_parent_id!=null && param.static_parent_id!='' && param.static_parent_id!=-1}">${obj.periodsname}</c:if></span>
		</div>
					<div  class="promptDiv">
								<c:if test="${param.static_parent_id == null || param.static_parent_id == ''}">
									<span  class="keyInfoSpan">点击左边树节点才能增加</span>
								</c:if>
								<c:if test="${param.static_parent_id!=null && param.static_parent_id!=''}">
									  <input type="button" id="btn_create"  class="button1 "  url="projectPeriodsAction.do?method=create&tmpnodecode=${param.tmpnodecode}&static_parent_id=${param.static_parent_id}"  value="${texts['button.new']}" icon="icon_add"/>
								</c:if>
					</div>
	
					<ec:table items="projectPeriodss" var="projectPeriods"
						action="" title=""  locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
						<ec:row highlightRow="true" 
							ondblclick="parent.document.location='projectPeriodsAction.do?method=view&id=${projectPeriods.id}'">
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
							<ec:column property="periodscode" title="项目周期编号" />
							<ec:column property="periodsname" title="项目周期名称" />
							<ec:column property="validstate" title="有效状态" >
								<c:if test="${projectPeriods.validstate==0}">有效</c:if>
								<c:if test="${projectPeriods.validstate==1}">无效</c:if>
							</ec:column>
							<ec:column property="recorddate" title="创建日期" >
								<fmt:formatDate value="${projectPeriods.recorddate}" pattern="yyyy-MM-dd"/>
							</ec:column>
							<ec:column property="null" title="操作" >
								<input type="button" class="button1 btn_view"    url="projectPeriodsAction.do?method=view&id=${projectPeriods.id}"  value="${texts['button.detail']}" icon="icon_view"/>
					            <input type="button" class="button1 btn_edit"    url="projectPeriodsAction.do?method=edit&id=${projectPeriods.id}&static_parent_id=${param.static_parent_id}"  value="${texts['button.edit']}" icon="icon_edit"/>
					            <input type="button" class="button1 btn_delete"    url="projectPeriodsAction.do?method=delete&id=${projectPeriods.id}" paramId="${projectPeriods.id}" value="${texts['button.delete']}" icon="icon_delete"/>
							</ec:column>	
						</ec:row>
					</ec:table>	
	</body>
</html>

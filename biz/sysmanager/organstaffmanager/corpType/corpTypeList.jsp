<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
 $(document).ready(function(){
 		//增加
       $("#btn_add").click(function(){
       		parent.document.location=$(this).attr("url");
       });
       //详细
		$(".btn_view").click(function(){ 
			parent.document.location=$(this).attr("url");
		}); 	   
       //修改
		$(".btn_edit").click(function(){ 
			parent.document.location=$(this).attr("url")+'&tmpnodecode=${param.tmpnodecode}&pageIndex='+$("input[name='ec_p']").val()+'&qtypecode='+encodeURI(encodeURI(document.getElementById("qtypecode").value))+'&qtypename='+encodeURI(encodeURI(document.getElementById("qtypename").value));
		});	            
       //删除
       $(".btn_delete").click(function(){ 
			var ctid = $(this).attr("paramId");
        			if(window.confirm("${texts['dtaq.common.delete.msg']}"))
					{
					   $.ajax({
					   type: "POST",
					   url: "${ctx}/corpTypeAction.do?method=validateDelete",
					   data: "ctId="+ctid,
					   success: function(msg){
					   		msg = msg.split(",");
					   		if(msg[0]=="no"){
								alert("该参建单位类型下有子节点信息，移除无效");
								return;
							}
							if(msg[0]=="haveCorps"){
								alert("该参建单位类型下有参建单位信息，移除无效");
								return;
							}
							else{
								parent.document.location = "corpTypeAction.do?method=delete&id="+msg[1];
							}
					   }
					});
				  }
		});
       				
		//	   
   });
</script>
<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
			<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
		<html:form action="corpTypeAction.do?method=list" method="POST">
		<input type="hidden" value="${param.static_parent_id}" name="static_parent_id">
		<input type="hidden" value="${param.tmpnodecode}" name="tmpnodecode">
			<table class="queryContentTable">
				<tr>
					<td>
						&nbsp;&nbsp;类型编码：
					</td>
					<td>
						<html:text property="qtypecode" styleClass="inputText" size="25" />
					</td>
					<td>
						&nbsp;&nbsp;类型名称：
					</td>
					<td>
						<html:text property="qtypename" styleClass="inputText" size="25" />
					</td>
					<td>
						&nbsp;&nbsp;<input type="submit" id="btn_query" icon="icon_query" value="查 询" />
					</td>
				</tr>
			</table>
		</html:form>
		</td>
		</tr>
		</table>
		<div class="promptDiv">
            <!-- 页面第一次加载时新增不可操作，组织树下面只能有一个根节点  -->
			本级节点名称：<span class="keyInfoSpan"><c:if test="${param.static_parent_id==null || param.static_parent_id=='' || param.static_parent_id==-1}">参建单位类型树</c:if><c:if test="${param.static_parent_id!=null && param.static_parent_id!='' && param.static_parent_id!=-1}">${obj.typename}</c:if></span>
		</div>
					<div  class="promptDiv">
								<c:if test="${param.static_parent_id == null || param.static_parent_id == ''}">
									<span  class="keyInfoSpan">点击左边参建单位类型树节点才能增加</span>
								</c:if>
								<c:if test="${param.static_parent_id!=null && param.static_parent_id!=''}">
									  <input type="button" id="btn_add"  icon="icon_add"  url="corpTypeAction.do?method=create&tmpnodecode=${param.tmpnodecode}&static_parent_id=${param.static_parent_id}" value="${texts['button.new']}"/>
								</c:if>
								
					</div>
					<ec:table items="corpTypes" var="corpType"
						action="" title=""  locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
						<ec:row highlightRow="true" ondblclick="parent.document.location='corpTypeAction.do?method=view&id=${corpType.id}'">
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
							<ec:column property="orderno" title="排序号" />
							<ec:column property="typecode" title="参建单位类型编码" />
							<ec:column property="typename" title="参建单位类型名称" />
							<ec:column property="corptype" title="参建单位类型标识" />
							<ec:column property="recorddate" title="创建日期" >
								<fmt:formatDate value="${corpType.recorddate}" pattern="yyyy-MM-dd"/>
							</ec:column>
							<ec:column property="null" title="操作" >
								<input type="button" icon="icon_view"  class="btn_view"    url="corpTypeAction.do?method=view&id=${corpType.id}"        value="${texts['button.detail']}"/>
					            <input type="button" icon="icon_edit" class="btn_edit"    url="corpTypeAction.do?method=edit&id=${corpType.id}&static_parent_id=${param.static_parent_id}"  value="${texts['button.edit']}"/>
					            <input type="button" icon="icon_delete" class="btn_delete"    url="corpTypeAction.do?method=delete&id=${corpType.id}"  paramId="${corpType.id}"  value="${texts['button.delete']}"/>
							</ec:column>	
						</ec:row>
					</ec:table>
	</body>
</html>

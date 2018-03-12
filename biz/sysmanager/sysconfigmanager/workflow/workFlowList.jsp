<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
    var static_id="";
	var oper_id="";
	//页面加载
	$(document).ready(function(){
		//控制按钮
		var ec_id='${param.ec_id}';
		var ec_auditStatus='0';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			ec_auditStatus='0';
		}
		pullValue(ec_id,ec_auditStatus);
        //
       //增加
       $("#btn_add").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		location.href=$(this).attr("url");
       });
        //详细
       $("#btn_view").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		var oper_id = operObj.val();
       		showView(oper_id);
       });
       //修改
       $("#btn_edit").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		var id = operObj.val();
       		var url=$(this).attr("url")+"&id="+id+'&ec_p='+$("input[name='ec_p']").val();
       		commonUrl(url);
       });   
       //绑定业务类
       $("#btn_bind").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		var id = operObj.val();
       		var url=$(this).attr("url")+"&id="+id+'&ec_p='+$("input[name='ec_p']").val();
       		commonUrl(url);
       });       
       //删除
       $("#btn_delete").click(function(){
         var operObj = $("input[type=radio][name='select_id'][checked]");
       	 var id = operObj.val();
		   if(window.confirm("${texts['dtaq.common.delete.msg']}"))
			{
			   	var url=$(this).attr("url")+"&id="+id+'&ec_p='+$("input[name='ec_p']").val();
       			commonUrl(url);
			}
       });
       //修改执行者
       $("#btn_actor_edit").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		var id = operObj.val();
       		var url=$(this).attr("url")+"&id="+id+'&ec_p='+$("input[name='ec_p']").val();
       		commonUrl(url);
       });
       //
     });
 	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
        if(select_count>0){
       		 $("#btn_bind").show();
        }else{
       		 $("#btn_bind").hide();
        }
	}
	//详细页面
	function showView(id){
    		var url ='workFlowAction.do?method=view'+'&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&viewFlag=true';
			commonUrl(url);
  	}
</script>
</head>
	<content tag="heading">工作流管理</content>
<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
		<td>
		<html:form action="workFlowAction.do?method=list" method="POST">
			<table class="queryContentTable">
				<tr>
					<td>工作流名称：</td>
					<td>
						<html:text property="qworkFlowName" size="30" styleClass="inputText"/>
					</td>
					<td>
						<input type="submit" icon="icon_query"  value="${texts['button.query']}" />
					</td>
				</tr>
			</table>
		</html:form>
		</td>
		</tr>
</table>
			<div  class="listButtonDiv">
				<input type="button" id="btn_add"   icon="icon_add"         url="workFlowAction.do?method=create"      value="${texts['button.new']}"/>
	            <input type="button" id="btn_view"     icon="icon_view"     url="workFlowAction.do?method=view"        value="${texts['button.detail']}"/>
	            <input type="button" id="btn_edit"     icon="icon_edit"     url="workFlowAction.do?method=edit"        value="${texts['button.edit']}"/>
	            <input type="button" id="btn_delete"   icon="icon_delete"     url="workFlowAction.do?method=delete"      value="${texts['button.delete']}"/>
	             <input type="button" id="btn_bind"   icon="icon-event"     url="workFlowAction.do?method=bind"      value="绑定业务类"/>
			</div>
			  <ec:table items="workFlows" var="workFlow" action="workFlowAction.do"
	 			title=""    sortable="false"  rowsDisplayed="10"
	 			imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
				retrieveRowsCallback="limit"
			   	filterRowsCallback="limit"
			   	sortRowsCallback="limit">
		    	<ec:row highlightRow="true" ondblclick="showView('${workFlow.id}');"
					onclick="pullValue('${workFlow.id}','0');" >
		    	 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
		    	 <ec:column property="null" sortable="false" title="选择" width="5%">
		    	 	 <input type="radio" name="select_id"   value="${workFlow.id}"/>
		    	 </ec:column>
		    	  <ec:column property="workFlowName" calcTitle="workFlowName" title="流程名称"/>
		    	  <ec:column property="entityName" calcTitle="entityName" title="业务类名"/>
		    	  <ec:column property="tableName" calcTitle="tableName" title="表名称"/>
					</ec:row>
		    	</ec:table>
</body>
</html:html>
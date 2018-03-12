<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title>监测控制标准管理</title>
<content tag="heading">监测控制标准管理</content>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script  type="text/javascript" language=javascript>
	function del(type_id,type_kind){
	$.ajax({
					type: "POST",
					url : "dtaqCheckpointTypeAction.do?method=validateDelete",
					data: "type_id="+type_id+"&type_kind="+type_kind,
					success: function(msg){
						checkResponse(msg);
					}
				});
	//	var url = "dtaqCheckpointTypeAction.do?method=validateDelete";
		//var checkAjax = new Ajax.Request(url, {method:"post", parameters:, onComplete:checkResponse});
	}
	
	function checkResponse(checkResponse){
		var resText = checkResponse;
		if(resText != null && resText !=""){
			var splitStr = resText.split(",");
			if(splitStr[0]=="no"){
				alert("该类型已启用！");
			}else if(splitStr[0]=="yes"){
				if(confirm("${texts['warning.delconfirm']}")){
					location.href = "dtaqCheckpointTypeAction.do?method=delete&type_id="+splitStr[1]+"&type_kind="+splitStr[2]+"&dtaqCheckpointTypeList_page=${dtaqCheckpointTypeList_page}";
				}
			}
		}
	}
	
	function createPointType(){
		var type_kind = '${type_kind}';
		if(type_kind != ""){
			location.href="dtaqCheckpointTypeAction.do?method=edit&dtaqCheckpointTypeList_page=${dtaqCheckpointTypeList_page}&type_kind=${type_kind}&typeName=${typeName}";
		}else{
			alert("请您先选择检测类型，再进行新增！");
		}
	}
	function view(id,kind){
	var url='dtaqCheckpointTypeAction.do?method=edit&type_kind='+kind+'&type_id='+id+'&dtaqCheckpointTypeList_page=${dtaqCheckpointTypeList_page}'
	commonUrl(url);
	}
</script>
</head>
<body onload="addshowhelp('0','jckzbzgl')">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td align="left" class="treeTd">
<%@include file="checkpointTypePointTree.jsp" %>
</td>
<td valign="top">
<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
			<html:form action="dtaqCheckpointTypeAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td align="right">
								类型名称：&nbsp;&nbsp;
							</td>
							<td>
								<html:text property="typeName" size="20" styleClass="inputText" />
							</td>
							<html:hidden property="type_kind" value="${type_kind}"/>
							<td colspan="2">
								<input type="submit" id="btn_query" icon="icon_query" value="查 询" />
							</td>
						</tr>
					</table>
				</html:form>	
  	
  	</td>
  	</tr>
  	</table>
</fieldset>
<fieldset style="margin:10">
  <legend><strong>列表信息</strong></legend>
<table class="listTable" width="100%" border="0" cellspacing="0" cellpadding="0">
   	<tr>
   		<td align="left">
   			${mianTypeName}
   		</td>
   		<td>
   		<div align="right">
			<input type="button" value="新增" onclick="createPointType()" class="addButton">
   		</div>
   		</td>
	</tr>
</table>

<!-- 

 -->
 
 <ec:table items="dtaqCheckpointTypes" var="dtaqCheckpointType"  action="dtaqCheckpointTypeAction.do?method=list" 
title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
	<ec:row highlightRow="true"  >
	<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
	  <ec:column property="type_name" title="类型名称" width="160px" />
	  <c:if test="${type_kind != '5'}">
		  <ec:column property="abs_critical_value" title="绝对临界值" width="160px">
		  </ec:column>
		  <ec:column property="abs_warning_value" title="绝对警戒值" width="160px">
		  </ec:column>
		  <ec:column property="negative_abs_critical_value" title="负绝对临界值" width="160px">
		  </ec:column>
		  <ec:column property="negative_abs_warning_value" title="负绝对警戒值" width="160px">
		  </ec:column>
		  <ec:column property="rel_critical_value" title="相对临界值" width="160px">
		  </ec:column>
		  <ec:column property="rel_warning_value" title="相对警戒值" width="160px">
		  </ec:column>
	  </c:if>
	  <c:if test="${type_kind == '5'}">
	  	<ec:column property="abs_warning_value" title="最大值" width="300px">
		  	<fmt:formatNumber value="${dtaqCheckpointType.abs_warning_value}"/>
		 </ec:column>
	  </c:if>
	  <ec:column property="null" title="操作" sortable="false" width="160px">
	  	<div align="center">
		  	<input type="button" class="button1" value="${texts['label.modify']}" onclick="view('${dtaqCheckpointType.type_id}','${dtaqCheckpointType.type_kind}')">
			<input type="button" class="button1" value="${texts['label.delete']}" onclick="del('${dtaqCheckpointType.type_id}','${dtaqCheckpointType.type_kind}')">
		</div>
	  </ec:column>
	 </ec:row>
</ec:table>
 
 <!-- 
  <ec:table items="dtaqCheckpointTypes" var="dtaqCheckpointType" action="dtaqCheckpointTypeAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
		<ec:column property="type_name"  title="线路" width="10%"/>
		
	</ec:row>
</ec:table>
  -->
</fieldset>
</td>
</tr>
</table>
</body>
</html:html>
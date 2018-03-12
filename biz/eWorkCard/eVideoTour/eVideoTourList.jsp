<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	var oper_id="";
		$(document).ready(function(){
		
	
		
		var ec_id='${param.ec_id}';
		var ec_auditStatus='${param.ec_auditStatus}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			ec_auditStatus='${ec_auditStatus}';
		}
		pullValue(ec_id,ec_auditStatus);
			//
			$("#btn_add").click(function(){
			 var url ="eVideoTourAction.do?method=create&flagPage=${param.flagPage}";
		     art.dialog({id:'commonDialog1',title:'新增', iframe:url, width:'600', height:'400',top:'30'});
			});
			$("#btn_delete1").click(function(){ 
					ret = window.confirm('${texts['dtaq.common.delete.msg']}');
					if(ret){
					location.href='eVideoTourAction.do?method=delete&flagPage=${param.flagPage}&id='+oper_id+"&ec_p="+$("input[name='ec_p']").val();
				}
			});
			$("#btn_edit1").click(function(){ 
			var url="eVideoTourAction.do?method=create&flagPage=${param.flagPage}&id="+oper_id+"&ec_p="+$("input[name='ec_p']").val()+'&qvideoTourDate='+$("input[name='qvideoTourDate']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			 art.dialog({id:'commonDialog1',title:'编辑', iframe:url, width:'600', height:'400',top:'30'});
		});	
		});
		//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
		 $.ajax({
					   type: "POST",
					   url: "${ctx}/eVideoTourAction.do?method=test",
					   data: "id="+oper_id,
					   success: function(msg){
					   var list=new Array();
					   list=msg.split(",");
	                          if(list[0]=='no'){
	                               $("#btn_add").hide();
	                            }else{
	                               $("#btn_add").show();
	                            }
				             if(list[1]=='no'){
	                               $("#btn_edit1").hide();
	                               $("#btn_delete1").hide();
	                            }else{
	                               $("#btn_edit1").show();
	                               $("#btn_delete1").show();
	                            }
					   }
					});
	}
		
	function pageRefresh(){
		location.href='eVideoTourAction.do?method=list';   
     }
	</script>
</head>
<content tag="heading">
	视频巡查计划
</content>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
			<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="eVideoTourAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td >巡查日期：</td>
							<td><html:text styleClass="inputText" property="qvideoTourDate1" maxlength="25" onfocus="WdatePicker()"></html:text>
							-&nbsp;<html:text styleClass="inputText" property="qvideoTourDate2" maxlength="25" onfocus="WdatePicker()"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		<div align="right" class="listButtonDiv">
			<input id="btn_add"  value="${texts['button.new']}" type="button" icon="icon_add"/>
			<input type="button"  icon="icon_edit"  id="btn_edit1"  value="${texts['button.edit']}"/>
			<input id="btn_delete1" value="${texts['button.delete']}" type="button" icon="icon_delete" />
		</div>
	<ec:table items="eVideoTours" var="eVideoTour" 
			action="eVideoTourAction.do?method=list" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
			<ec:row highlightRow="true" ondblclick="showView('${eVideoTour.id}');"
					onclick="pullValue('${eVideoTour.id}');">
				<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
				<ec:column property="null" sortable="false" title="选择" width="6%">
								<input name="select_id" value="${eVideoTour.id}" type="radio"/>
							</ec:column>
				<ec:column property="videoTourEngineer" title="视频监控巡视工程师" />
				<ec:column property="videoTourDate" title="巡查日期" >
				<fmt:formatDate value="${eVideoTour.videoTourDate}" pattern="yyyy-MM-dd"/>
				</ec:column>
				<ec:column property="registerDate" title="填报日期 " >
				<fmt:formatDate value="${eVideoTour.registerDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</ec:column>
			</ec:row>
		</ec:table> 
</body>
</html:html>

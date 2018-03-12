<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	
	<script type="text/javascript">
	var send_ids = ",";
           var oper_id="";
		jQuery(document).ready(function(){
		
		//控制按钮状态
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			$("#btn_view").hide();
			$("#btn_submit").hide();
			$("#btn_submitNew").hide();

			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);	
				//新增
			$("#btn_add").click(function(){ 
			   
				location.href='maGeneralWorkAction.do?method=create&ec_crd='+$("[name='ec_rd']").val()+'';
			}); 
			//编辑
			$("#btn_edit").click(function(){		  
				var url='maGeneralWorkAction.do?method=edit&general_id='+oper_id+'&qgeneralType=${param.qgeneralType}&qgeneralRank=${param.qgeneralRank}&qgeneralStatus=${param.qgeneralStatus}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='maGeneralWorkAction.do?method=delete&general_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			
			//发布
			$("#btn_submit").click(function(){ 
				ret = window.confirm('是否确认发布');
				if(ret){
					var url='maGeneralWorkAction.do?method=submitList&general_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			
			//重新发布
			$("#btn_submitNew").click(function(){ 
				ret = window.confirm('是否确认重新发布');
				if(ret){
					var url='maGeneralWorkAction.do?method=submitList&general_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			
			//详情
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
							
		});
		
		//详细页面
		function showView(id){
		   
	    	var url ='maGeneralWorkAction.do?method=view&general_id='+id+'&qgeneralType=${param.qgeneralType}&qgeneralRank=${param.qgeneralRank}&qgeneralStatus=${param.qgeneralStatus}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			commonUrl(url);
	  	}
		
		
		
		//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;	
			
			var operObj = $("input[type=radio][name='select_id'][checked]");
			if(operObj.attr("state")==0){
			$("#btn_edit").show();
			$("#btn_delete").show();		
			$("#btn_submit").show();
			$("#btn_submitNew").hide();
			
			}
			if(operObj.attr("state")==1){
			$("#btn_edit").hide();
			$("#btn_delete").hide();		
			$("#btn_submit").hide();
			$("#btn_submitNew").hide();
			
			}
			if(operObj.attr("state")==3){
			$("#btn_edit").hide();
			$("#btn_delete").hide();		
			$("#btn_submitNew").show();
			$("#btn_submit").hide();
			}
			
			
		}
		
		//指令码判断
		function checkCmd(){
			var cmdIds='${userinfo.usercmd}';
		}
		
		function initContent(){
	var receivepersons = jQuery("[name='receivepersons']");
	var presons = "";
	receivepersons.each(function(){
		presons += jQuery(this).val() + "@" ;
	}) ;
	if(presons != ""){
		presons = presons.substring(0,presons.length-1);
		
//		var url = "${ctx}/sysMailboxSendAction.do?method=findSendPersonName";
//       	var myajax = new Ajax.Request(url, {method:"post", parameters:"presons="+presons, onComplete:showSendPersonResponse});//实现ajax请求
	$.ajax({
					type: "POST",
					url: "${ctx}/sysMailboxSendAction.do?method=findSendPersonName",
					data: "presons="+presons,
					success: function(msg){
					
						showSendPersonResponse(msg);
					}
				});
	
	}
}

function showSendPersonResponse(selResponse){
	var text = selResponse;
	
	if(text != null && text != ""){
		var textList = text.split("@");
		for(var i=0; i<textList.length; i++){
			jQuery(".lengthContent:eq("+i+")").html(textList[i]) ;
		}
	}
}
		
</script>
</head>
<content tag="heading">
	一般工作管理
</content>
<body onload="initContent()">
	<table class="queryTable">

		<tr>
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form
					action="maGeneralWorkAction.do?method=list">
					<table align="left">
						
						<tr>
							
							<td>
								任务名称：
							</td>
							<td>
								<html:text property="qgeneralName" styleClass="text"/>
							</td>
							<td>
								任务类型：
							</td>
							<td>
								<ex:dictSelect type="GeneralWorkType" property="qgeneralType"/>
							</td>
						</tr>
						<tr>
						<td>
								关注等级：
							</td>
							<td>
								<ex:dictSelect type="TaskWorkRank" property="qgeneralRank"/>
							</td>
							<td>
								任务状态：
							</td>
							<td>
								<ex:dictSelect type="TaskWorkStatus" property="qgeneralStatus"/>
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
	<div class="listButtonDiv">
		<input id="btn_add" value="${texts['button.new']}" type="button"
			icon="icon_add" />
		<input id="btn_view" value="${texts['button.detail']}" type="button"
			icon="icon_view" />
		<input id="btn_edit" value="${texts['button.edit']}" type="button"
			icon="icon_edit" />
		<input id="btn_delete" value="${texts['button.delete']}" type="button"
			icon="icon_delete" />
			<input type="button" id="btn_submit" icon="icon-reload"
					class="button1 hidden " value="发布" />
					<input type="button" id="btn_submitNew" icon="icon-reload"
					class="button1 hidden " value="重新发布" />
	</div>
	<ec:table items="maGeneralWorks"
		var="maGeneralWork"
		action="maGeneralWorkAction.do?method=list" title=""
		width="100%" sortable="false" rowsDisplayed="10"
		imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		locale="zh_CN" retrieveRowsCallback="limit" filterRowsCallback="limit"
		sortRowsCallback="limit">
		<ec:row highlightRow="true"
			onclick="pullValue('${maGeneralWork.general_id}','');"
			ondblclick="showView('${maGeneralWork.general_id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%" />
			<ec:column property="null" sortable="false" title="选择" width="5%">
				<input name="select_id" value="${maGeneralWork.general_id}"
					type="radio"  state="${maGeneralWork.general_status}"/>
			</ec:column>
			
			<ec:column property="general_name" title="任务名称" width="8%">
				${maGeneralWork.general_name}
				<html:hidden property="receivepersons" value="${maGeneralWork.allot_empids}"/>
			</ec:column>
			<ec:column property="allot_empids" title="指定人员" width="5%">
			<div id="itemDiv" class="lengthContent"></div>	
			</ec:column>
			<ec:column property="general_rank" title="关注等级" width="5%">
			<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maGeneralWork.general_rank}"/>		
			</ec:column>
			<ec:column property="general_status" title="任务状态" width="5%">
			<ex:dicDisplay dictIdentify="TaskWorkStatus" dictValue="${maGeneralWork.general_status}"/>		
			</ec:column>
			<ec:column property="creater" title="创建人" width="5%">
			<ex:employeeName id="${maGeneralWork.creater}"/>	

			</ec:column>
			<ec:column property="creat_date" title="创建时间" width="9%">
				
					<fmt:formatDate value="${maGeneralWork.creat_date}"
						pattern="yyyy-MM-dd" />
			

			</ec:column>

		</ec:row>
	</ec:table>
</body>

</html:html>
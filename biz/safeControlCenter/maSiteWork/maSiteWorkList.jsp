<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>		
	<script type="text/javascript">
           var oper_id="";
		jQuery(document).ready(function(){
		     if('${qworkNameTemp}'!=''){
		     $("[name='qworkName']").val('${qworkNameTemp}');
		     }
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
			   
				location.href='maSiteWorkAction.do?method=create&station_id=${param.station_id}&ec_crd='+$("[name='ec_rd']").val()+'';
			}); 
			//编辑
			$("#btn_edit").click(function(){		  
				var url='maSiteWorkAction.do?method=edit&work_id='+oper_id+'&station_id=${param.station_id}&qworkType=${param.qworkType}&qworkRank=${param.qworkRank}&qworkStatus=${param.qworkStatus}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='maSiteWorkAction.do?method=delete&station_id=${param.station_id}&work_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			
			//发布
			$("#btn_submit").click(function(){ 
				ret = window.confirm('是否确认发布');
				if(ret){
					var url='maSiteWorkAction.do?method=submitList&station_id=${param.station_id}&work_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			
			//重新发布
			$("#btn_submitNew").click(function(){ 
				ret = window.confirm('是否确认重新发布');
				if(ret){
					var url='maSiteWorkAction.do?method=submitList&station_id=${param.station_id}&work_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
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
		   
	    	var url ='maSiteWorkAction.do?method=view&work_id='+id+'&station_id=${param.station_id}&qworkType=${param.qworkType}&qworkRank=${param.qworkRank}&qworkStatus=${param.qworkStatus}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
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
		
</script>
</head>
<body>
	<table class="queryTable">

		<tr>
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form
					action="maSiteWorkAction.do?method=list&station_id=${param.station_id}">
					<table align="left">
						<tr>
							<td align="right">
								线路：
							</td>
							<td>
								${dtaqStation.segment_id.line_id.line_name}
							</td>
							<td align="right">
								标段：
							</td>
							<td>
								${dtaqStation.segment_id.segment_name}
							</td>
							<td align="right">
								车站/区间：
							</td>
							<td>
								${dtaqStation.station_name}
							</td>
						</tr>
						<tr>
							
							<td>
								任务名称：
							</td>
							<td>
								<html:text property="qworkName"  styleClass="text"/>
							</td>
							<td>
								任务类型：
							</td>
							<td>
								<ex:dictSelect type="TaskWorkType" property="qworkType"/>
							</td>
						</tr>
						<tr>
						<td>
								关注等级：
							</td>
							<td>
								<ex:dictSelect type="TaskWorkRank" property="qworkRank"/>
							</td>
							<td>
								任务状态：
							</td>
							<td>
								<ex:dictSelect type="TaskWorkStatus" property="qworkStatus"/>
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
	<ec:table items="maSiteWorks"
		var="maSiteWork"
		action="maSiteWorkAction.do?method=list" title=""
		width="100%" sortable="false" rowsDisplayed="10"
		imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		locale="zh_CN" retrieveRowsCallback="limit" filterRowsCallback="limit"
		sortRowsCallback="limit">
		<ec:row highlightRow="true"
			onclick="pullValue('${maSiteWork.work_id}','');"
			ondblclick="showView('${maSiteWork.work_id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%" />
			<ec:column property="null" sortable="false" title="选择" width="5%">
				<input name="select_id" value="${maSiteWork.work_id}"
					type="radio"  state="${maSiteWork.work_status}"/>
			</ec:column>
			
			<ec:column property="work_name" title="任务名称" width="8%">
				${maSiteWork.work_name}
			</ec:column>
			<ec:column property="work_type" title="任务类型" width="5%">
			<ex:dicDisplay dictIdentify="TaskWorkType" dictValue="${maSiteWork.work_type}"/>	
			</ec:column>
			<ec:column property="work_rank" title="关注等级" width="5%">
			<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maSiteWork.work_rank}"/>		
			</ec:column>
			<ec:column property="work_status" title="任务状态" width="5%">
			<ex:dicDisplay dictIdentify="TaskWorkStatus" dictValue="${maSiteWork.work_status}"/>		
			</ec:column>
			<ec:column property="creater" title="创建人" width="5%">
			<ex:employeeName id="${maSiteWork.creater}"/>	

			</ec:column>
			<ec:column property="creat_date" title="创建时间" width="9%">
				
					<fmt:formatDate value="${maSiteWork.creat_date}"
						pattern="yyyy-MM-dd" />
			

			</ec:column>

		</ec:row>
	</ec:table>
</body>

</html:html>
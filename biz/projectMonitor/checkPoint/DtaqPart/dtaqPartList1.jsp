<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript">
   var oper_id=""; 
	 $(document).ready(function(){
	 //获取线路标段工点
     	//
	    //控制按钮
		var ec_id='${param.ec_id}';
		//var ec_auditStatus='${param.ec_auditStatus}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			//ec_auditStatus='${ec_auditStatus}';
		}
		pullValue(ec_id);
       //增加
       $("#btn_add").click(function(){
       		location.href='dtaqPartAction.do?method=create&organ_type=${param.organ_type}&qlineId=${qlineId}&qsectionId=${qsectionId}&qstation_id=${qstation_id}&type_id=${type_id}&station_state=${station_state}';
       });
       //
		$("#btn_edit").click(function(){
			var url='dtaqPartAction.do?method=edit&part_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val();
			commonUrl(url);
		}); 
		//
		$("#btn_delete").click(function(){
				   $.ajax({
				   type: "POST",
				   url: "${ctx}/dtaqPartAction.do?method=validateDelete",	
				   data:"organ_type=${param.organ_type}&part_id="+oper_id,	
				   success: function(msg){
						 if(msg=="yes"){
						ret = window.confirm('${texts['dtaq.common.delete.msg']}');
			             if(ret){
			             var url='dtaqPartAction.do?method=delete&organ_type=${param.organ_type}&part_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val();
				         commonUrl(url);
		                    	}
						 }else{
							 alert('该部位下存在节点，禁止删除');
						 }
					}
				}); 
		});
	
		});
     

  	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}

  	//指令码判断
	function checkCmd(){
		var cmdIds='${userinfo.cmdIds}';
	}
</script>
<div class="promptDiv">
        测点类型：<span class="redSpan"><ex:typeId id="${type_id}"/></span>
</div>

	<div class="listButtonDiv">
	<c:if test="${station_state=='1'}">
		<input id="btn_add" value="${texts['button.new']}" type="button" icon="icon_add" />
		 <input id="btn_edit" value="${texts['button.edit']}" type="button" icon="icon_edit" />
	    <input id="btn_delete" value="${texts['button.delete']}" type="button" icon="icon_delete"/>
	  </c:if>
	</div>
	
		<ec:table items="dtaqParts" var="dtaqPart"
			action="dtaqPartAction.do" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
				<ec:row highlightRow="true" ondblclick="showView('${dtaqPart.part_id}');"
							onclick="pullValue('${dtaqPart.part_id}');">
		
					<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
					<ec:column property="null" sortable="false" title="选择" >
						<input type="radio" name="select_id" value="${dtaqPart.part_id}" />
					</ec:column>
					 <ec:column property="part_name" title="监测部位名称"  width="15%"/>
				    <ec:column property="checkpoints" title="测点数量"  width="8%">
				        <bean:size collection="${dtaqPart.checkpoints}" id="pointCount"/>
		                 <bean:write name="pointCount"/>
				    </ec:column>		   
					<ec:column property="type_id" title="测点类型" >
					    <ex:typeId id="${type_id}"/>
					</ec:column>
					<ec:column property="check_state" title="是否正在检测" >
					      <ex:dicDisplay dictIdentify="Yesorno" dictValue="${dtaqPart.check_state}"/>
					</ec:column>	
				</ec:row>
		     </ec:table>
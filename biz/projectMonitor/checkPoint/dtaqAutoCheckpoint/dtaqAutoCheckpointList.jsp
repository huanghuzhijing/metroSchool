<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript">
   var oper_id=""; 
	 $(document).ready(function(){
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
       		location.href='dtaqAutoCheckpointAction.do?method=create&organ_type=${organ_type}&qlineId=${qlineId}&qsectionId=${qsectionId}&station_id=${station_id}&type_id=${type_id}&part_id=${part_id}&station_state=${station_state}';
       });
       //
		$("#btn_edit").click(function(){
			var url='dtaqAutoCheckpointAction.do?method=edit&point_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val();
			commonUrl(url);
		}); 
		//
		
		
		$("#btn_delete").click(function(){ 
			ret = window.confirm('${texts['dtaq.common.delete.msg']}');
			if(ret){
				var url='dtaqAutoCheckpointAction.do?method=delete&organ_type=${param.organ_type}&point_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val();
				commonUrl(url);
			}
		});
		//
     });
  	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
   ///删除验证
	function deleteInfo(point_id) {
			var url = "${ctx}/dtaq/dtaqCheckpoint.do?method=validateDelete";
			var checkAjax = new Ajax.Request(url, {method:"post", parameters:"point_id="+point_id, onComplete:checkResponse});
			
	}




  	//指令码判断
	function checkCmd(){
		var cmdIds='${userinfo.cmdIds}';
	}
</script>
<div class="promptDiv">
测点类型：<span class="redSpan"><ex:typeId id="${type_id}"/></span>
所属部位：<span class="redSpan"><ex:partId id="${part_id}"/></span>
</div>
		
	<div class="listButtonDiv">
	<c:if test="${station_state=='1'}">
		<input id="btn_add" value="${texts['button.new']}" type="button" icon="icon_add" />
		 <input id="btn_edit" value="${texts['button.edit']}" type="button" icon="icon_edit" />
	    <input id="btn_delete" value="${texts['button.delete']}" type="button" icon="icon_delete" />
	</c:if>
	</div>

	
		<ec:table items="dtaqAutoCheckpoints" var="dtaqCheckpoint"
			action="dtaqAutoCheckpointAction.do" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
	  <ec:row highlightRow="true" ondblclick="showView('${dtaqCheckpoint.point_id}');"
							onclick="pullValue('${dtaqCheckpoint.point_id}');">
          <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
					<ec:column property="null" sortable="false" title="选择" >
						<input type="radio" name="select_id" value="${dtaqCheckpoint.point_id}" />
					</ec:column>	
							
	 <c:choose>
	 <c:when test="${typeKindId==3}">
	   <ec:column property="point_code" title="深度" width="120px"/>
	 </c:when>
	 <c:otherwise>
	  <ec:column property="point_code" title="测点编码" width="120px"/>
	   </c:otherwise>
	 </c:choose>
	  <ec:column property="point_mechine" title="测量仪器" width="100px"/>
	  
	  <c:choose>
	  <c:when test="${typeKindId==4}">
	   <ec:column property="abs_critical_value" title="绝对临界值(kn)" width="140px"/>
	  <ec:column property="abs_warning_value" title="绝对警戒值(kn)" width="140px"/>
	  <ec:column property="negative_abs_critical_value" title="负绝对临界值(kn)" width="140px"/>
	  <ec:column property="negative_abs_warning_value" title="负绝对警戒值(kn)" width="140px"/>
	  <ec:column property="rel_critical_value" title="相对临界值(kn/d)" width="140px"/>
	  <ec:column property="rel_warning_value" title="相对警戒值(kn/d)" width="140px"/>
	  </c:when>
	  <c:otherwise>
	  <ec:column property="abs_critical_value" title="绝对临界值(mm)" width="140px"/>
	  <ec:column property="abs_warning_value" title="绝对警戒值(mm)" width="140px"/>
	  <ec:column property="negative_abs_critical_value" title="负绝对临界值(mm)" width="140px"/>
	  <ec:column property="negative_abs_warning_value" title="负绝对警戒值(mm)" width="140px"/>
	  <ec:column property="rel_critical_value" title="相对临界值(mm/d)" width="140px"/>
	  <ec:column property="rel_warning_value" title="相对警戒值(mm/d)" width="140px"/>
	  </c:otherwise>
	  </c:choose>
	  
	  <ec:column property="check_state" title="是否正在检测" width="120px">
	  <ex:dicDisplay dictIdentify="TestResult" dictValue="${dtaqCheckpoint.check_state}"/>
     </ec:column>
	  <ec:column property="project_direction" title="工程方向" width="100px"/>
	
	  
    </ec:row>
	</ec:table>
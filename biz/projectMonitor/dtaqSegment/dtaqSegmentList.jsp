<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
var oper_id="";
		$(document).ready(function(){
			//新增
			$("#btn_add").click(function(){ 
				parent.document.location='dtaqSegmentAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val()+'&qlineId='+${param.qlineId}; 
			}); 
		//	window.parent.frames["Links"].location.href="metroLineAction.do?method=listLeft";
		});
		
		//编辑
		function btn_edit(oper_id){
			parent.document.location='dtaqSegmentAction.do?method=edit&segment_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qlineId='+${param.qlineId}; 
		}
		//删除
		function btn_delete(oper_id){
			ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
						$.ajax({
					   type: "POST",
					   url: "${ctx}/dtaqSegmentAction.do?method=checkdelete",
					   data: "segment_id="+oper_id,
					   success: function(msg){
					   		 if(msg=="no"){ 
					   		 		alert("此节点下有子节点，不能删除");     
							  }else {
							  		parent.document.location='dtaqSegmentAction.do?method=delete&segment_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qlineId='+${param.qlineId}; 
							  }
					   }
					});
				}
		}
		//刷新
		function pageRefresh(){
			parent.document.forms[0].action='metroLineAction.do?method=index'+'&ec_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qlineId='+${param.qlineId}+'&flagPage=2';   
    		parent.document.forms[0].submit();
		}
	  	//设置list页面id
		//function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		//	oper_id=common_oper_id;
		//}
	</script>
</head>
<body > 

			</table><div class="promptDiv">
						所属线路：<span class="keyInfoSpan">${lineNames}</span>
					</div>
<div class="listButtonDiv">
	<input type="button" id="btn_add" icon="icon_add" value="新增标段"/>
</div>
<ec:table items="dtaqSegments" var="dtaqSegment" action="dtaqSegmentAction.do?method=list"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
	
  	<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
		<ec:column property="segment_code" calcTitle="segment_code" title="标段编码"/>
		<ec:column property="segment_name" calcTitle="segment_name" title="标段名称"/>
		<ec:column property="monitoring_status"  title="监控状态">
			<ex:dicDisplay dictIdentify="MonitorStatus" dictValue="${dtaqSegment.monitoring_status}"/>
		</ec:column>
		
		<ec:column property="temp" title="操作"  >
			<input type="button"   id="btn_edit"    icon="icon_edit"  onclick="btn_edit('${dtaqSegment.segment_id}')"     value="编辑"/>
			<input type="button"   id="btn_delete"    icon="icon_delete"  onclick="btn_delete('${dtaqSegment.segment_id}')"     value="删除"/>
		</ec:column> 
		
	</ec:row>
</ec:table>
</body>

</html:html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	//加载
 	$(document).ready(function(){
 		//
 		var ec_id = '${param.ec_id}';
 		if((ec_id==null || ec_id == '') ){
	 		pullValue('${ec_id}');
	 	}else{
	 		pullValue('${param.ec_id}');
	 	}
 
 		$("[name='select_id']").click(function(){
        var operid = $("input[type=radio][name='select_id'][checked]").val();
        var sels = $("[name='select_id']");
        
       
        });
       //增加
       $("#btn_add").click(function(){
          location.href="projectMaterialsAction.do?method=edit&stationId=${station.station_id}&segmentId=${station.segment_id.segment_id}&lineId=${station.segment_id.line_id.line_id}";
       
       })
       
       $("#btn_edit").click(function(){
        var operid = $("input[type=radio][name='select_id'][checked]").val();
          location.href="projectMaterialsAction.do?method=edit&qstartDate="+$("[name='qstartDate']").val()+"&qendDate="+$("[name='qendDate']").val()+"&stationId=${station.station_id}&segmentId=${station.segment_id.segment_id}&lineId=${station.segment_id.line_id.line_id}&station_state=${station_state}&station_type=${station_type}&materials_id="+operid+'&ec_p='+$("input[name='ec_p']").val()+"&ec_id="+operid+"&ec_crd="+$("input[name='ec_crd']").val();
       
       })
       $("#btn_view").click(function(){
          var operid = $("input[type=radio][name='select_id'][checked]").val();
	   location.href='projectMaterialsAction.do?method=view&materials_id='+operid+'&lineId=${station.segment_id.line_id.line_id}&segmentId=${station.segment_id.segment_id}&stationId=${station.station_id}&station_state=${station_state}&station_type=${station.station_type}&startDate=${startDate}&endDate=${endDate}&ec_p='+$("input[name='ec_p']").val()+"&ec_id="+operid+"&ec_crd="+$("input[name='ec_crd']").val();
       })
       $("#btn_delete").click(function(){
        if(window.confirm("${texts['dtaq.common.delete.msg']}")){
        var operid = $("input[type=radio][name='select_id'][checked]").val();
      location.href='projectMaterialsAction.do?method=delete&station_id=${station.station_id}&materials_id='+operid;
        }
        
       
       })
 	});
	//
	function pullValue(mutil_id){ 
			var select_count=0;
			var sels=$("input[name='select_id']");
			for(i=0;i<sels.length;i++){
				if(sels[i].value==mutil_id){
					select_count++;
					oper_id=mutil_id;
					//sels[i].checked=true;
					$("input[name='select_id'][value='"+mutil_id+"']").attr("checked","checked");
					break;
				}
			}
			
		}
		//
		function commonUrl(url){
			document.forms[0].action=url;   
		    document.forms[0].submit();   
		}
		//
		
		//详细页面
		function showView(){
		 	
			}
	</script>
</head>

<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="projectMaterialsAction.do?method=list">
					<table class="queryContentTable">
					<input name="station_id" type="hidden" value="${station.station_id}"/>
						<tr>
							<td>编制日期&nbsp</td>&nbsp
							
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								
							<td colspan="2">
								<input type="submit" id="btn_query" icon="icon_query" value="查 询" />
							</td>
						</tr>
					</table>
				</html:form>
		</td></tr></table>
			<div class="listButtonDiv">
				<input type="button" id="btn_add"   icon="icon_add"             value="${texts['button.new']}"/>
	            <input type="button" id="btn_view"    icon="icon_view"           value="${texts['button.detail']}"/>
	            <input type="button" id="btn_edit"     icon="icon_edit"          value="${texts['button.edit']}"/>
	            <input type="button" id="btn_delete"   icon="icon_delete"       value="${texts['button.delete']}"/>
			</div>
			&nbsp线路:&nbsp&nbsp
			<span class="redSpan">${station.segment_id.line_id.line_name }</span>
				<ec:table items="projectMaterialss" var="projectMaterials"
						action="projectMaterialsAction.do?method=list" title=""  locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
						<input name="station_id" type="hidden" value="${station.station_id}"/>
					
						<ec:row highlightRow="true" onclick="pullValue('${projectMaterials.materials_id}');"
								ondblclick="showView('${projectMaterials.materials_id}');"
						>
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="4%"/>
							<ec:column property="null" sortable="false" title="选择" width="4%">
								<input type="radio" name="select_id" value="${projectMaterials.materials_id}" />
							</ec:column>
							 <ec:column property="segment_id" title="标段" width="150px">
							 	<c:if test="${station != null}">${station.segment_id.segment_name}</c:if>
							 </ec:column>
							 <ec:column property="station_id" title="站点" width="150px">
							 	<c:if test="${station != null}">${station.station_name}</c:if>
							 </ec:column>
							 <ec:column property="materials_type" title="工程资料类型" width="180px">
							 <ex:dicDisplay dictIdentify="MaterialsType" dictValue="${projectMaterials.materials_type}"/>
							 </ec:column>
							
							 <ec:column property="creator" title="编制人" width="120px">
							 	<ex:userName id="${projectMaterials.creator}"/>
							 </ec:column>
							 <ec:column property="updateMan" title="修改人" width="120px">
							 	<ex:userName id="${projectMaterials.updateMan}"/>
							 </ec:column>
						</ec:row>
					</ec:table>
</body>
</html:html>

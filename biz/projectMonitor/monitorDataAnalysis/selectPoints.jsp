<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
		var selectPoints = ",";
		jQuery(document).ready(function(){
			init();
		})
		//选择线路联动标段
		function lineChanged() {
			$.ajax({
				type: "POST",
				url: "${ctx}/checkpointPictureAction.do?method=querySegment",
				data: "line_id="+jQuery("[name='line_id']").val(),
				success: function(msg){
					responseList(msg);
				}
			});
		}
		
		function lineInitChanged() {
		   	var line_id = '${line_id}';
			$.ajax({
			   type: "POST",
			   url: "${ctx}/checkpointPictureAction.do?method=querySegment",
			   data: "line_id="+line_id,
			   success: function(msg){
			   		   var segment_id = jQuery("[name='segment_id']");
					   var station_id = jQuery("[name='station_id']") ;
					   var type_id = jQuery("[name='type_id']") ;
					   var part_id = jQuery("[name='part_id']") ;
					  
						//initSelect(station_id) ;
						//initSelect(type_id) ;
						//initSelect(part_id) ;
					    
						var resulttext = msg;
					  	if(resulttext==null || resulttext==""){
					  		initSelect1(segment_id) ;
							return false;
						}
						else{
						    fillSelect1(segment_id,resulttext,"${segment_id}") ;
						}
			   }
			});
		}
		//得到联动项目信息并构建options
		function responseList(selRequest){
		   	var segment_id = jQuery("[name='segment_id']");
		   	var station_id = jQuery("[name='station_id']") ;
		   	var group_id = jQuery("[name='group_id']") ;
		   	var type_id = jQuery("[name='type_id']") ;
		   	var part_id = jQuery("[name='part_id']") ;
		   	var point_id = jQuery("[name='point_id']") ;
		   	
		   	initSelect1(station_id) ;
			initSelect1(group_id) ;
			initSelect1(type_id) ;
			initSelect1(part_id) ;
			initSelect1(point_id) ;
		   	
		  	if(selRequest==null || selRequest==""){
		  		initSelect1(segment_id) ;
				return false;
			}
			else{
				fillSelect1(segment_id,selRequest,"${segment_id}") ;
			}
		}
		
		//选择标段联动工点
		function segmentChanged() {
			$.ajax({
				type: "POST",
				url: "${ctx}/checkpointPictureAction.do?method=queryStation",
				data: "segment_id="+jQuery("[name='segment_id']").val(),
				success: function(msg){
					responseStationList(msg);
				}
			});
		}
		
		function segmentInitChanged() {
			  	var segment_id = '${segment_id}';
				jQuery.ajax({
				   type: "POST",
				   url: "${ctx}/checkpointPictureAction.do?method=queryStation",
				   data: "segment_id="+segment_id,
				   success: function(msg){
				   		    var station_id = jQuery("[name='station_id']") ;
							var type_id = jQuery("[name='type_id']") ;
							var part_id = jQuery("[name='part_id']") ;
						   	
						   	//initSelect(type_id) ;
							//initSelect(part_id) ;
						   	
							var resulttext = msg;
						  	if(resulttext==null || resulttext==""){
						  		initSelect1(station_id) ;
								return false;
							}
							else{
							    fillSelect1(station_id,resulttext,"${station_id}") ;
							}
				   }
				});
		}
		//得到联动项目信息并构建options
		function responseStationList(selRequest){
		   	var station_id = jQuery("[name='station_id']") ;
		   	var group_id = jQuery("[name='group_id']") ;
		   	var type_id = jQuery("[name='type_id']") ;
		   	var part_id = jQuery("[name='part_id']") ;
		   	var point_id = jQuery("[name='point_id']") ;
		   	
		   	initSelect1(group_id) ;
			initSelect1(type_id) ;
			initSelect1(part_id) ;
			initSelect1(point_id) ;
		   	
		  	if(selRequest==null || selRequest==""){
		  		initSelect1(station_id) ;
				return false;
			}
			else{
				fillSelect1(station_id,selRequest,"${station_id}") ;
			}
		}
		//选择工点联动类型和测点组
		function stationChanage(){
			$.ajax({
				type: "POST",
				url: "${ctx}/checkpointPictureAction.do?method=queryType",
				data: "station_id="+jQuery("[name='station_id']").val(),
				success: function(msg){
					responseTypeList(msg);
				}
			});
		}
		function stationInitChanage(){
			var station_id = '${station_id}';
			jQuery.ajax({
			   type: "POST",
			   url: "${ctx}/checkpointPictureAction.do?method=queryType",
			   data: "station_id="+station_id,
			   success: function(msg){
			   		var type_id = jQuery("[name='type_id']") ;
					var part_id = jQuery("[name='part_id']") ;
					
					//initSelect(part_id) ;
					
					var resulttext = msg;
				  	if(resulttext==null || resulttext==""){
						initSelect1(type_id) ;
						return false;
					}
					else{
					    fillSelect1(type_id,resulttext,"${type_id}") ;
					}
			   }
			});
		}
		//得到联动项目信息并构建options
		function responseTypeList(selRequest){
		   	var type_id = jQuery("[name='type_id']") ;
		   	var part_id = jQuery("[name='part_id']") ;
		   	
			initSelect1(part_id) ;
		   	
		  	if(selRequest==null || selRequest==""){
		  		initSelect1(type_id) ;
				return false;
			}
			else{
				fillSelect1(type_id,selRequest,"${type_id}") ;
				var seg_id = '${type_id}';
			}
		}
		
			//第三方或者施工方联动
			function organTypeChanage(){
				typeChanage();
			}
			//测点类型联动获取监测部位
			function typeChanage(){
				$.ajax({
					type: "POST",
					url: "${ctx}/checkpointPictureAction.do?method=queryPart",
					data: "type_id="+jQuery("[name='type_id']").val()+"&station_id="+jQuery("[name='station_id']").val()+"&organ_type="+jQuery("[name='organ_type']").val()+"&picturePart=Y",
					success: function(msg){
						responsePartList(msg);
					}
				});
			}
			function typeInitChanage(){
				var type_id = '${type_id}';
				var station_id = '${station_id}';
				var organ_type = '${organ_type}';
				
				$.ajax({
					type: "POST",
					url: "${ctx}/checkpointPictureAction.do?method=queryPart",
					data: "type_id="+type_id+"&station_id="+station_id+"&organ_type="+organ_type+"&picturePart=Y",
					success: function(msg){
						responsePartList(msg);
					}
				});
				
				
				
				//var url = "${ctx}/dtaq/dataLinkage.do?method=queryPart";
				//var myajax = new Ajax.Request(url, {method:"post", parameters:"type_id="+type_id+"&station_id="+station_id+"&organ_type="+organ_type+"&picturePart=Y", onComplete:responsePartList});
			}
			//得到联动项目信息并构建options
			function responsePartList(selRequest){
			   	var part_id = jQuery("[name='part_id']") ;
			  	if(selRequest==null || selRequest==""){
			  		initSelect1(part_id) ;
					return false;
				}
				else{
					fillSelect1(part_id,selRequest,"${part_id}") ;
					var seg_id = '${part_id}';
				}
			}
			//关闭窗口
			function windowClose(){
				parent.art.dialog({id:"commonDialog1"}).close();
			}
			
			function save() {
				var station_id = jQuery("[name='station_id']").val();
				if(station_id != ""){
					jQuery("#stationId",parent.document).val(station_id) ;
				}
				if(selectPoints.length > 1){
					pointids = selectPoints.substring(1,selectPoints.length-1);
					jQuery("#pointids",parent.document).val(pointids) ;
					parent.queryPointInfo();
					windowClose();
				}else{
					alert("没有选择任何测点信息，保存无效！");
				}
			}
			//查询按钮
			function selectType(){
				var type_id = jQuery("[name='type_id']").val();
				if(type_id == ""){
					alert("请您先选择监测类型！");
					return false;
				}else{
					return true;
				}
			}
			//点击复选框
			function selectPoint(obj){
			var value = obj.value;
			if(obj.checked == true){
				if(selectPoints.indexOf(","+value+",") <= -1){
					selectPoints += obj.value +",";
				}
			}else{
				if(selectPoints.indexOf(","+value+",") > -1){
					selectPoints = selectPoints.replace(","+value+",",",");
				}
			}
		}
		//全选或者全不选
		function selectCheck(type){
			var checkPoints = jQuery("[name='checkPoints']");
			selectPoints = ",";
			selectTypes = ",";
			if(type == "all"){
				checkPoints.each(function(){
					jQuery(this).attr("checked","checked") ;
					var value = jQuery(this).val().split(",");
					selectPoints += value[0] + ",";
					selectTypes += value[1] + ",";
				}) ;
			}else if(type == "none"){
				checkPoints.each(function(){
					jQuery(this).attr("checked","") ;
				}) ;
			}
		}
		
		function init(){
			lineInitChanged();
			segmentInitChanged();
			stationInitChanage();
			typeInitChanage();
		}
	</script>
</head>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="checkpointPictureAction.do?method=selectPoints">
					<table class="queryContentTable">
						<tr>
								<td>线路：</td>
							    <td >
									<html:select property="line_id" onchange="lineChanged()" name="checkpointPictureForm">
									 <html:option value="">请选择</html:option>
									 <html:optionsCollection name="lines" value="line_id" label="line_name"/>
									</html:select>
							   </td>
							     <td>标段：</td>
							    <td>
							    	<html:select property="segment_id" onchange="segmentChanged()" name="checkpointPictureForm">
								    <html:option value="">请选择</html:option>
								  	</html:select>
							    </td>
					 	</tr>
						<tr>
							     <td>车站/区间：</td>
							    <td>
									 <html:select property="station_id"  onchange="stationChanage()" name="checkpointPictureForm">
								     	<html:option value="">请选择</html:option>
								     </html:select>
								 </td>
						
							
							<td>监测类型：</td>
							<td>
								 <html:select property="type_id"  onchange="typeChanage()" name="checkpointPictureForm">
								   	<html:option value="">请选择</html:option>
								 </html:select>
							  </td>
						</tr>
					 	<tr>
							  <td>是否第三方：</td>
							  <td>
								  <html:select property="organ_type"  onchange="organTypeChanage()" name="checkpointPictureForm">
								    <html:option value="T">第三方</html:option>
								    <html:option value="O">施工方</html:option>
								  </html:select>
							  </td>
						
							<td >监测部位：</td>
							<td>
								<html:select property="part_id"  value="${part_id}" name="checkpointPictureForm">
									<html:option value="">请选择</html:option>
								</html:select>
							</td>
						</tr>
						<tr>
							<td align="right">
								<input type="submit"  value="查询" icon="icon_add" onclick="return selectType()"/>
							</td>
						</tr>
					
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	 <table class="commonTable" width="100%" border="0" cellspacing="0" cellpadding="0">
 	<tr><td>
	   <div align="right" class="listButtonDiv">
	   		<input type="button" class="button1" icon="icon-checked" value="全选" onclick="selectCheck('all')">
	  	 	<input type="button" class="button1"  icon="icon-unchecked" value="全不选" onclick="selectCheck('none')">
	        <input type="button" class="button1" value="保存" onclick="save()" icon="icon_save">
	  	    <input type="button" class="button1" value="关闭" onclick="windowClose()" icon="icon_back">
	   </div>
   </td></tr>
   </table>
<fieldset>
<legend>添加测点列表</legend>   
   <table id="fileTable" class="listTable" >
		<thead>
		 <tr align="center"  height="25">
		 	 <th>选择</th>
		 	 <th>测点编码</th>
		 	 <th>监测单位</th>
		 	 <th>监测类型</th>
		 	 <th>监测部位</th>
		 	 <th>是否正在监测</th>
		 </tr>
		</thead>
		<c:forEach items="${dtaqCheckpoints}" var="point">
			<tr align="center" height="20" >
				<td>
					<input type="checkbox" id="checkPoints" onclick="selectPoint(this)" name="checkPoints" value="${point.point_id}">
				</td>
				<td>${point.point_code }</td>
				<td>${point.organ_type == 'T'?"第三方":"施工方" }</td>
				<td>
				
					<c:forEach items="${types}" var="type">
						<c:if test="${type.type_id == point.type_id}">
							<c:out value="${type.type_name}"></c:out>
						</c:if>
					</c:forEach>
				</td>
				<td>${point.partId.part_name}</td>
				<td>${point.check_state == 'Y'?"是":"否"}</td>
			</tr>
		</c:forEach>
	</table>
</fieldset>
	
   		<div align="center">
	  	 <input type="button" class="button1" value="保存" onclick="save()" icon="icon_save">
	  	 <input type="button" class="button1" value="关闭" onclick="windowClose()" icon="icon_back">
	   </div>
   
</body>

</html:html>

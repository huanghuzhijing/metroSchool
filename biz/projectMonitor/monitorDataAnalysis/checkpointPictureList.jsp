<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<link href="<c:url value="/styles/default.css"/>" type="text/css" rel="stylesheet">
<script type="text/javascript">
		var selectPoints = ",";
		var selectTypes = ",";

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
		
		//	var url = "${ctx}/checkpointPictureAction.do?method=querySegment";
		//   	var myajax = new Ajax.Request(url, {method:"post", parameters:"line_id="+jQuery("[name='line_id']").val(), onComplete:responseList});
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
	//		  var url = "${ctx}/checkpointPictureAction.do?method=queryStation";
	//		  var myajax = new Ajax.Request(url, {method:"post", parameters:"segment_id="+jQuery("[name='segment_id']").val(), onComplete:responseStationList});
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
			$.ajax({
				type: "POST",
				url: "${ctx}/checkpointPictureAction.do?method=queryPointGroup",
				data: "station_id="+jQuery("[name='station_id']").val(),
				success: function(msg){
					responseGroupList(msg);
				}
			});
		//	var url = "${ctx}/checkpointPictureAction.do?method=queryType";
		//	var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id="+jQuery("[name='station_id']").val(), onComplete:responseTypeList});
		//	var url = "${ctx}/checkpointPictureAction.do?method=queryPointGroup";
		//	var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id="+jQuery("[name='station_id']").val(), onComplete:responseGroupList});
		}
		//得到联动项目信息并构建options
		function responseTypeList(selRequest){
		   	var group_id = jQuery("[name='group_id']") ;
		   	var type_id = jQuery("[name='type_id']") ;
		   	var part_id = jQuery("[name='part_id']") ;
		   	var point_id = jQuery("[name='point_id']") ;
		   	
		   	initSelect1(group_id) ;
			initSelect1(part_id) ;
			initSelect1(point_id) ;
		   	
		  	if(selRequest==null || selRequest==""){
		  		initSelect1(type_id) ;
				return false;
			}
			else{
				fillSelect1(type_id,selRequest,"${type_id}") ;
				var seg_id = '${type_id}';
			}
		}
		//得到联动项目信息并构建options
		function responseGroupList(selRequest){
		   	var group_id = jQuery("[name='group_id']") ;
		  	if(selRequest==null || selRequest==""){
		  		initSelect1(group_id) ;
				return false;
			}
			else{
			   	fillSelect1(group_id,selRequest,"${group_id}","@") ;
			}
		}
		
		//根据选择类型显示不同的填报项 
		function picturyeType(){
		var radios = jQuery("[name='radioType']");
			if(radios.get(1).checked){
				jQuery("#groupTitle").show() ;
				jQuery("#groupContent").show();
				jQuery("[name='group_id']").show();
				
				jQuery("[name='type_id']").val("") ;
				jQuery("[name='organ_type']").val("T") ;
				jQuery("[name='part_id']").val("") ;
				jQuery("[name='point_id']").val("") ;
				
				jQuery("#typeTitle").hide();
				jQuery("#typeContent").hide();
				jQuery("[name='type_id']").hide();
				
				jQuery("#organTitle").hide();
				jQuery("#organContent").hide();
				jQuery("[name='organ_type']").hide();
				
				jQuery("#partTr").hide();
				jQuery("[name='part_id']").hide();
				jQuery("[name='point_id']").hide();
			}else if(radios.get(0).checked){
				jQuery("[name='group_id']").val("");
				jQuery("#groupTitle").hide() ;
				jQuery("#groupContent").hide();
				jQuery("[name='group_id']").hide();
				
				jQuery("#typeTitle").show();
				jQuery("#typeContent").show();
				jQuery("[name='type_id']").show();
				
				jQuery("#organTitle").show();
				jQuery("#organContent").show();
				jQuery("[name='organ_type']").show();
				
				jQuery("#partTr").show();
				jQuery("[name='part_id']").show();
				jQuery("[name='point_id']").show();
				}
			}
			//选择测点组
			function groupPointsChanage(groupPoints){
				jQuery("#pointids").val(groupPoints)
				queryPointInfo();
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
				//var url = "${ctx}/checkpointPictureAction.do?method=queryPart";
				//var myajax = new Ajax.Request(url, {method:"post", parameters:"type_id="+jQuery("[name='type_id']").val()+"&station_id="+jQuery("[name='station_id']").val()+"&organ_type="+jQuery("[name='organ_type']").val()+"&picturePart=Y", onComplete:responsePartList});
			}
			//得到联动项目信息并构建options
			function responsePartList(selRequest){
			   	var part_id = jQuery("[name='part_id']") ;
			   	var point_id = jQuery("[name='point_id']") ;
			   	
				initSelect1(point_id) ;
			   	
			  	if(selRequest==null || selRequest==""){
				   	initSelect1(part_id) ;
					return false;
				}
				else{
					fillSelect1(part_id,selRequest,"${part_id}") ;
				}
			}
			//监测部位联动获取测点编码
			function partChanage(){
				$.ajax({
					type: "POST",
					url: "${ctx}/checkpointPictureAction.do?method=queryPoint",
					data: "part_id="+jQuery("[name='part_id']").val()+"&organ_type="+jQuery("[name='organ_type']").val(),
					success: function(msg){
						responsePointList(msg);
					}
				});
			//	var url = "${ctx}/checkpointPictureAction.do?method=queryPoint";
			//	var myajax = new Ajax.Request(url, {method:"post", parameters:"part_id="+jQuery("[name='part_id']").val()+"&organ_type="+jQuery("[name='organ_type']").val(), onComplete:responsePointList});
			}
			//得到联动项目信息并构建options
			function responsePointList(selRequest){
			   	var point_id = jQuery("[name='point_id']") ;
			  	if(selRequest==null || selRequest==""){
			  		initSelect1(point_id) ;
					return false;
				}
				else{
					fillSelect1(point_id,selRequest,"${point_id}")
				}
			}
			//点击添加按钮
			function addPoint(){
				var point_id = jQuery("[name='point_id']").val();
				if(point_id==""){
					alert("请选择测点再进行添加！");
				}else{
					jQuery("#pointids").val(point_id) ;
					queryPointInfo();
				}
			}
			//查询按钮页面的加载
			function queryPointInfo(){
				var tableObj = jQuery("#fileTable tr") ;
				var point_ids = ",";
				tableObj.each(function(){
					point_ids += jQuery(this).find("td:eq(11)").html()+",";
				}) ;
				var pointids = jQuery("#pointids").val();
				$.ajax({
					type: "POST",
					url: "${ctx}/checkpointPictureAction.do?method=queryPointInfo",
					data: "pointids="+jQuery("#pointids").val()+"&existPoints="+point_ids,
					success: function(msg){
						resInsertPointList(msg);
					}
				});
				
				
		//		var url = "${ctx}/checkpointPictureAction.do?method=queryPointInfo";
		//		var myajax = new Ajax.Request(url, {method:"post", parameters:"pointids="+jQuery("#pointids").val()+"&existPoints="+point_ids, onComplete:resInsertPointList});
			}
			//页面加载
			function resInsertPointList(selRequest){
		//	var textList = selRequest.responseText;
			if(selRequest != null && selRequest != ""){
				
				var tableObj = jQuery("#fileTable");
				var rowlen = tableObj.find("tr").length;
				if(rowlen == 1){
					var stationId = jQuery("#stationId").val();
					if(stationId == ""){
						var station_id = jQuery("[name='station_id']").val();
						jQuery("#stationId").val(station_id);
					}
				}
				var text = selRequest.split("@");
				for(var i=0; i<text.length; i++){
					var pointInfo = text[i].split(";");
					var currentRow = jQuery("<tr align='center' class='tr07'></tr>") ;
					currentRow.append("<td>"+pointInfo[0]+"</td>") ;
					currentRow.append("<td>"+pointInfo[1]+"</td>") ;
					currentRow.append("<td>"+pointInfo[2]+"</td>") ;
					currentRow.append("<td>"+pointInfo[3]+"</td>") ;
					currentRow.append("<td>"+pointInfo[4]+"</td>") ;
					currentRow.append("<td>"+pointInfo[5]+"</td>") ;
					currentRow.append("<td>"+pointInfo[6]+"</td>") ;
					currentRow.append("<td>"+pointInfo[7]+"</td>") ;
					currentRow.append("<td>"+pointInfo[8]+"</td>") ;
					currentRow.append("<td>"+pointInfo[9]+"</td>") ;
					currentRow.append("<td>"+"<input type='checkbox' name='checkpoint' onclick='selectPoint(this)' value='"+pointInfo[10]+","+pointInfo[11]+"'>"+"</td>") ;
					currentRow.append("<td style='display:none;'>"+pointInfo[10]+"</td>") ;
					currentRow.append("<td style='display:none;'>"+pointInfo[11]+"</td>") ;
					tableObj.append(currentRow) ;
				}
			}
		}
		//批量添加
		function selectPointList(){
			var	param = "&line_id="+jQuery("[name='line_id']").val()+"&segment_id="+jQuery("[name='segment_id']").val()+"&station_id="+jQuery("[name='station_id']").val()+"&type_id="+jQuery("[name='type_id']").val()+"&organ_type="+jQuery("[name='organ_type']").val()+"&part_id="+jQuery("[name='part_id']").val();
			var url ="${ctx}/checkpointPictureAction.do?method=selectPoints&initQuery=Y"+param;
		  	art.dialog({id:'commonDialog1',title:'批量选择添加', iframe:url, width:'800', height:'400',top:'30'});
		  	
	//	  	var url = "contentSelectAction.do?method=list&flag=1&type=2";
	//		art.dialog({id:'commonDialog1',title:'来文单位', iframe:url, width:'600', height:'350',top:'0'});
		}
		//批量删除
		function deletePoints(){
			var fileTable = jQuery("#fileTable"); 
			var checkboxs = jQuery("[name='checkpoint']");
			
			for(var i=checkboxs.length-1;i>=0;i--){
				if(checkboxs[i].checked == true){
					var value = checkboxs[i].value.split(",");
					if(selectPoints.indexOf(","+value[0]+",") > -1){
						selectPoints = selectPoints.replace(","+value[0]+",",",");
						selectTypes = selectTypes.replace(","+value[1]+",",",");
					}
					
					jQuery(checkboxs[i]).parent().parent().remove();
				}
			}
		}
		//全选或者全不选
		function selectCheck(type){
			var checkboxs = jQuery("[name='checkpoint']");
			selectPoints = ",";
			selectTypes = ",";
			if(type == "all"){
				checkboxs.each(function(){
					jQuery(this).attr("checked","checked") ;
					var value = jQuery(this).val().split(",");
					selectPoints += value[0] + ",";
					selectTypes += value[1] + ",";
				}) ;
			}else if(type == "none"){
				checkboxs.each(function(){
					jQuery(this).attr("checked","") ;
				}) ;
			}
		}
		//点击复选框的操作
		function selectPoint(obj){
			var value = obj.value.split(",");
			if(obj.checked == true){
				if(selectPoints.indexOf(","+value[0]+",") <= -1){
					selectPoints += value[0] + ",";
					selectTypes += value[1] + ",";
				}
			}else if(obj.checked == false){
				if(selectPoints.indexOf(","+value[0]+",") > -1){
					selectPoints = selectPoints.replace(","+value[0]+",",",");
					selectTypes = selectTypes.replace(","+value[1]+",",",");
				}
			}
		}
		//添加测点组
		function addPointGroup(){
			if(selectTypes.length > 1 && selectPoints.length > 1){
				var point_ids = selectPoints.substring(1,selectPoints.length-1);
				var type_ids = selectTypes.substring(1,selectTypes.length-1);
				var url ="${ctx}/checkpointPictureAction.do?method=addPointGroup&point_ids="+point_ids+"&type_ids="+type_ids+"&station_id="+jQuery("#stationId").val();
			  	art.dialog({id:'commonDialog1',title:'添加测点组', iframe:url, width:'800', height:'400',top:'30'});
			}else{
				alert("请您先选择测点!");
			}
		}
		//删除测点组
		function deletePointGroup(){
			var param = "&line_id="+jQuery("[name='line_id']").val()+"&segment_id="+jQuery("[name='segment_id']").val()+"&station_id="+jQuery("[name='station_id']").val()
				+"&type_id="+jQuery("[name='type_id']").val()+"&organ_type="+jQuery("[name='organ_type']").val()+"&part_id="+jQuery("[name='part_id']").val()+"&point_id="+jQuery("[name='point_id']").val();
			var url ="${ctx}/checkpointPictureAction.do?method=deletePointGroup"+param;
			art.dialog({id:'commonDialog1',title:'删除测点组', iframe:url, width:'800', height:'400',top:'30'});
		}
		//测点组改变
		function stationGroupChanage(station_id){
			$.ajax({
				type: "POST",
				url: "${ctx}/checkpointPictureAction.do?method=queryPointGroup",
				data: "station_id="+station_id,
				success: function(msg){
					responseGroupList(msg);
				}
			});
		//	var url = "${ctx}/dtaq/dataLinkage.do?method=queryPointGroup";
		//	var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id="+station_id, onComplete:responseGroupList});
		}
		
		//曲线
		function showCurvePicture(curveType){
			var point_type = "";
			var type_id = "";
 			var widthTemp =  Math.round($(window).width()*0.6);
			var heightTemp = Math.round($(window).height()*0.8);
			if(curveType == "showRealtimeCurve"){//实时曲线
			
				if(selectTypes.length > 1 && selectPoints.length > 1){
					var pointids = selectPoints.substring(1,selectPoints.length-1).split(",");
					var typeids = selectTypes.substring(1,selectTypes.length-1).split(",");
					for(var m=0; m<pointids.length;m++){
						point_type += "@"+pointids[m]+","+typeids[m];
					}
					type_id = typeids[0];
					point_type = point_type.substring(1);
					var url ="${ctx}/checkpointPictureAction.do?method="+curveType+"&point_type="+point_type+"&type_id="+type_id;
					art.dialog({id:'commonDialog1',title:'实时曲线', iframe:url, width:widthTemp, height:heightTemp,top:'10',lock:false});
				}else{
					alert("选择测点");
				}
			}else if(curveType == "showSuccessionCurve"){//时序曲线
				var fileTableTr = jQuery("#fileTable tr");
				if(fileTableTr.length > 1){
					var checkboxs = jQuery("[name='checkpoint']");
					checkboxs.each(function(){
						if(jQuery(this).attr("checked")){
							point_type += jQuery(this).val() + "@" ;
						}
					}) ;
					if(point_type != ""){
						var index_0 = point_type.indexOf(",");
						var index_1 = point_type.indexOf("@");
						type_id = point_type.substring(index_0+1,index_1);
						point_type = point_type.substring(0,point_type.length-1);
						var url ="${ctx}/checkpointPictureAction.do?method="+curveType+"&point_type="+point_type+"&type_id="+type_id;
						art.dialog({id:'commonDialog1',title:'时序曲线', iframe:url, width:widthTemp, height:heightTemp,top:'10',lock:true});
					}else{
						alert("请您先选择列表中的测点！");
					}
				}else{
					alert("选择测点");
				}
			}
		}	
	</script>

</head>
<content tag="heading">
	监测数据跟踪分析
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
				<html:form action="checkpointPictureAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table align="left">
						<tr>
								<td align="right">线路：</td>
							    <td >
									<html:select property="line_id" onchange="lineChanged()" name="checkpointPictureForm">
									 <html:option value="">请选择</html:option>
									 <html:optionsCollection name="lines" value="line_id" label="line_name"/>
									</html:select>
							   </td>
							     <td align="right">标段：</td>
							    <td>
							    	<html:select property="segment_id" onchange="segmentChanged()" name="checkpointPictureForm">
								    <html:option value="">请选择</html:option>
								  	</html:select>
							    
<!--							    <select id="qsectionId" name="qsectionId" onchange="getWokPoints(this.value,'')"></select>-->
							    </td>
					 	
							     <td align="right">车站/区间：</td>
							    <td>
									 <html:select property="station_id"  onchange="stationChanage()" name="checkpointPictureForm">
								     	<html:option value="">请选择</html:option>
								     </html:select>
								 </td>
						</tr>
						<tr>
							 <td>选择类型：</td>
							<td>
								<html:radio property="radioType" value="1" onclick="picturyeType()">按测点</html:radio>
						 		<html:radio property="radioType" value="2" onclick="picturyeType()">按测点组</html:radio>
						 	</td>
						 	<td id="groupTitle" style="display:none" >测点组：</td>
							<td id="groupContent" style="display:none" colspan="3">
								<html:select property="group_id" style="display:none" onchange="groupPointsChanage(this.value)" name="checkpointPictureForm">
									<html:option value="">请选择</html:option>
								</html:select>
							</td>
							<td id="typeTitle" style="display:none" >监测类型：</td>
							<td id="typeContent" style="display:none">
								 <html:select property="type_id" style="display:none" onchange="typeChanage()" name="checkpointPictureForm">
								   	<html:option value="">请选择</html:option>
								 </html:select>
							  </td>
							  <td id="organTitle" style="display:none"  >是否第三方：</td>
							  <td id="organContent" style="display:none">
								  <html:select property="organ_type" style="display:none" onchange="organTypeChanage()" name="checkpointPictureForm">
								    <html:option value="T">第三方</html:option>
								    <html:option value="O">施工方</html:option>
								  </html:select>
							  </td>
						</tr>
						
					 	<tr id="partTr" style="display:none">
							<td >监测部位：</td>
							<td>
								<html:select property="part_id" style="display:none" onchange="partChanage()" name="checkpointPictureForm">
									<html:option value="">请选择</html:option>
								</html:select>
							</td>
							<td  >测点编码：</td>
							<td colspan="3">
								<html:select property="point_id" style="display:none"  value="${point_id}" name="checkpointPictureForm">
									<html:option value="">请选择</html:option>
								</html:select>
							</td>
							<td align="right">
								<input type="button"  value="添加" icon="icon_add" onclick="addPoint()"></td>
<!--								<input type="submit" value="查询" icon="icon_query" />-->
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
<fieldset>
<legend>添加测点列表</legend>
	 <table class="commonTable" width="100%" border="0" cellspacing="0" cellpadding="0">
 	<tr><td>
	   <div align="right" class="listButtonDiv">
	   	 <input type="hidden" id="stationId">
	   	 <input type="hidden" id="groupIds">
	   	 <input type="hidden" id="pointids">
	   	 <input type="hidden" id="picturePoints">
	   	 
	  	 <input type="button" class="button1" value="批量添加" onclick="selectPointList()" icon="icon_add">
	  	 <input type="button" class="button1" value="批量删除" onclick="deletePoints()" icon="icon_delete">
	  	 <input type="button" class="button1" value="添加测点组" onclick="addPointGroup()" icon="icon_add">
	  	 <input type="button" class="button1" value="删除测点组" onclick="deletePointGroup()" icon="icon_delete">
	  	 <input type="button" class="button1" value="时序曲线" onclick="showCurvePicture('showSuccessionCurve')" icon="icon-pkg">
	  	 <input type="button" class="button1" value="实时曲线" onclick="showCurvePicture('showRealtimeCurve')" icon="icon-cmp">
	  	 <input type="button" class="button1" value="全选" onclick="selectCheck('all')" icon="icon-checked">
	  	 <input type="button" class="button1" value="全不选" onclick="selectCheck('none')" icon="icon-unchecked">
	   </div>
   </td></tr>
   </table>
   
  <table id="fileTable" class="listTable"  >
		<thead>
		<tr align="center" height="25" id="trSite" >
		  <th width="8%">测点编码</th>
		  <th width="10%">监测部位</thd>
		  <th width="10%">监测类型</th>
		  <th width="7%">初始值</th>
		  <th width="10%">绝对临界值</th>
		  <th width="10%">绝对警戒值</th>
		  <th width="10%">负绝对临界值</th>
		  <th width="10%">负绝对警戒值</th>
		  <th width="9%">相对临界值</th>
		  <th width="9%">相对警戒值</th>
		  <th width="7%">选择</th>
		</tr>
		</thead>
	</table>
   
 </fieldset> 
</body>

</html:html>

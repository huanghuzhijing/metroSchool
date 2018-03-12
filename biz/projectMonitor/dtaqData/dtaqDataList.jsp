<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script src="${ctx}/scripts/commons.js" type="text/javascript"></script>
<style>
thead th{background-color:#DFF0F9;border:1px solid #CDDDE6;color:#1F4A65;height:20px;font-weight:normal ;}
.grid td{border: 1px solid #D9E8FB;cursor:pointer}
.stateDiv{float: left;display:block ;height:15px;width:40px;}
.stateMemo{float:left;display:block;height:15px; width:80px;}
.stateTitle{float:left;display:block;height:15px;width:100px;margin-left:455px;}


</style>
<script type="text/javascript">
	 $(document).ready(function(){
	 
	 
		//返回		
		 $("#btn_back").click(function(){ 
		//	location.href = '${ctx}/dtaqDataInfoAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qorganType=${param.qorganType}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}';
	    }); 
	}); 
	function backToList() {//返回
	//	<c:if test="${from==null || from!='query'}">
		  location.href="${ctx}/dtaqDataInfoAction.do?method=list&qorganType=${isthird}&isthird=${isthird}&line_id=${info.line_id.line_id}&segment_id=${info.segment_id.segment_id}";
//		</c:if>
	//	<c:if test="${from=='query'}">
	//	  location.href="${ctx}/dtaq/dataInfoQuery.do?isthird=${isthird}&line_id=${info.line_id}&segment_id=${info.segment.segment_id}";
	//	</c:if>
		}
	
	function loadPartData(part_id,info_id){//获取部位填报数据
		loadMessage("数据正在加载，请稍后");
		location.href="${ctx}/dtaqDataAction.do?method=list&part_id="+part_id+"&info_id="+info_id;
	}
	
	function loadNoPartData(info_id){//获取未填报部位
		loadMessage("数据正在加载，请稍后");
		location.href="${ctx}/dtaqDataAction.do?method=list&info_id="+info_id+"&noPart=Y";
	}
	

	//测点布置图
	function displayGeographicPicture(station_id,organ_type,part_id){
		var url ="${ctx}/dtaqDataAction.do?method=geographicPicture&station_id="+station_id+"&organ_type="+organ_type+"&part_id="+part_id+"&random="+Math.random();
		art.dialog({id:'commonDialog1',title:'数据明细', iframe:url, width:'800', height:'350',top:'30'});
	}
	
	//导出填报模板
	function modelDownLoad(){
		var part_id = jQuery("[name='part_id']").val();
		var noPart = '${noPart}';
		if(part_id == "" && noPart == ""){
			alert("请您先选择树形结构的部位信息！");
		}else{
			location.href="${ctx}/dtaqDataAction.do?method=modelDownLoad&info_id=${info.info_id}&type_kind=${info.type_id.type_kind}&part_id="+part_id+"&noPart="+noPart;
		}
	}
	//数据导入
	function dataImport(){
		 location.href="${ctx}/dtaqDataAction.do?method=showExcelImport&info_id=${info.info_id}&type_kind=${info.type_id.type_kind}&part_id="+jQuery("[name='part_id']").val()+"&noPart=${noPart}";
	}
	
	function init(){
		var operate_mode = jQuery("[name='operate_mode']").val();
		var tableOjbTr = jQuery("#contractInfoList tbody tr");
		var type_kind = "${info.type_id.type_kind}";
		var importData = "${importData}";
		if(operate_mode != "create"){
			tableOjbTr.each(function(i){
				var import_value = importData != ""?jQuery("#import_value_"+i).val():"1";
				if(import_value == "1"){
					var change_rate = parseFloat(jQuery("#change_rate_"+i).val());
					var total_change = parseFloat(jQuery("#total_change_"+i).val());
					var warn_state = jQuery("#warn_state_"+i).val();
					jQuery("#tr_"+i).attr("title",jQuery("#warn_memo_"+i).val()) ;
					jQuery("#v_warn_state_"+i).addClass("state"+warn_state) ;
			    	
			    	if((type_kind == "1" || type_kind == "2")){
			    		var curr_value = parseFloat(jQuery("#curr_value_"+i).val());
			    		var curr_change = parseFloat(jQuery("#load_curr_change_"+i).val());
				    	jQuery("#v_curr_value_"+i).html(curr_value);
				    	jQuery("#v_prev_value_"+i).html((curr_value-curr_change/1000).toFixed(5));
				    	jQuery("#curr_change_"+i).val(curr_change);
				    	jQuery("#v_change_rate_"+i).html(change_rate);
				    	jQuery("#v_total_change_"+i).html(total_change) ;
				    	jQuery("#total_change_"+i).val(total_change);
				    	jQuery("#prev_total_change_"+i).val(total_change-curr_change) ;
			    	}else if(type_kind == "3"){
			    		var curr_value = parseFloat(jQuery("#load_curr_value_"+i).val());
			    		jQuery("#curr_value_"+i).val(curr_value);
			    		jQuery("#curr_change_"+i).val("0.0");
			    		jQuery("#v_change_rate_"+i).html(change_rate);
			    		jQuery("#v_total_change_"+i).html(total_change);
			    		jQuery("#total_change_"+i).val(total_change);
			    		jQuery("#prev_total_change_"+i).val(total_change-curr_value) ;
			    	}else if(type_kind == "4"||type_kind == "6"){
			    		var curr_change = parseFloat(jQuery("#curr_change_"+i).val());
			    		var curr_value = parseFloat(jQuery("#load_curr_value_"+i).val());
			    		jQuery("#curr_value_"+i).val(curr_value);
			    		jQuery("#prev_value_"+i).val((curr_value-curr_change).toFixed(2));
			    		jQuery("#v_prev_value_"+i).html((curr_value-curr_change).toFixed(2));
			    		jQuery("#v_curr_change_"+i).html(curr_change);
			    		jQuery("#v_change_rate_"+i).html(change_rate);
			    	}
				}
			}) ;	
		}
	}
	
	//测点部位的时序曲线
	function showPartTimes(type_kind,part_id) {
		  var widthTemp =  Math.round($(window).width()*0.6);
		  var heightTemp = Math.round($(window).height()*0.8);
		  var url ="${ctx}/dtaqDataInfoQuery3Action.do?method=showPartTimes&part_id="+part_id+"&type_kind="+type_kind+"&qstartDate=${startDate}&qendDate=${endDate}";
		  if(type_kind == "3"){
		  		url ="${ctx}/dtaqDataInfoQuery3Action.do?method=showPartTimes3&part_id="+part_id+"&type_kind="+type_kind+"&qstartedDate=${beginWeekDate}&qendedDate=${endDate}";
		  }
		  art.dialog({id:'commonDialog1',title:'时序曲线', iframe:url, width:widthTemp, height:heightTemp,top:'10'});
	}
	
	//时序曲线
	function showPointTimes(point_id) {
			var widthTemp =  Math.round($(window).width()*0.6);
			var heightTemp = Math.round($(window).height()*0.8);
	  		var url ="${ctx}/dtaqDataInfoQuery3Action.do?method=showComparePointTimes&point_id="+point_id+"&type_kind=${info.type_id.type_kind}&startDate=${startDate}&endDate=${endDate}";
	   		art.dialog({id:'commonDialog1',title:'数据明细', iframe:url, width:widthTemp, height:heightTemp,top:'10'});
	}
	
	
	//获得将要删除的填报明细的测点记录
	function setDeletePointids(){
		var operate_mode = jQuery("[name='operate_mode']").val();
		var tableOjbTr = jQuery("#contractInfoList tbody tr");
		var type_kind = "${info.type_id.type_kind}";
		var point_ids = "";
		if(operate_mode == 'edit'){
			tableOjbTr.each(function(i){
				var curr_change = jQuery("#curr_change_"+i).val() ;
				if(type_kind == "1" || type_kind == "2"){
					if(curr_change == "" || curr_change == " " ){
						point_ids +=  "," + jQuery("#point_id_"+i).val();
					}
				}
				if(type_kind == "3" || type_kind == "4"){
					if(curr_change == "" || curr_change == " " ){
						point_ids +=  "," + jQuery("#point_id_"+i).val();
					}
				}
			}) ;
			if(point_ids != ""){
				jQuery("[name='delete_points']").val(point_ids.substring(1)) ;
			}
		}
	}
</script>
</head>
<content tag="heading">
<c:if test="${isthird=='O'}">
施工方数据编制
</c:if>
<c:if test="${isthird=='T'}">
第三方数据编制
</c:if>
</content>
<body onload="init()">
<ex:tab id="data">
<ex:tabItem name="dtaqDataInfoForm" label="基本信息" url="${ctx}/dtaqDataInfoAction.do?method=edit&info_id=${param.info_id}&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qorganType=${isthird}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}"/>
<ex:tabItem name="dtaqDataItem" label="监测数据填报" selected="true">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td style="vertical-align: top;min-width:180px;">
<%@include file="pointTree.jsp" %>
</td>
<td valign="top">
		<table cellpadding="0" cellspacing="2" border="0" width="100%" align="center">
		  <tr>
		  <td>
		  	<fieldset>
			  <legend><strong>填报说明</strong></legend>
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr align="center">
				  <td bordercolor="blue">
					  <font color="orange" size="2.5">
					  <strong>
					  	  <span class="stateTitle">预警状态说明：</span>
					  	  <span class="state4 stateDiv"></span><span class="stateMemo">红色警戒</span>
						  <span class="state3 stateDiv"></span><span class="stateMemo">橙色预警</span>
						  <span class="state2 stateDiv"></span><span class="stateMemo">黄色预警</span>
						  <span class="state1 stateDiv"></span><span class="stateMemo">正常</span>
					  </strong>
					  </font>
				  </td>
				</tr>
				<tr align="center">
					 <td style="m"><font color="orange" size="2.5"><strong>友情提示:如果工程中有新增的测点，请您在"监测点信息管理"模块中增加新的测点信息再进行数据填报！</strong></font></td>
				</tr>
				</table>
			</fieldset>
		  </td>
		  </tr>
		  <tr>
		  <td>
		  <fieldset>
			  <legend><strong>数据填报列表</strong></legend>
			    <html:form action="dtaqDataAction.do" styleId="dtaqDataForm">
				<input type="hidden" name="method" value="save">
				<input type="hidden" name="operate_mode" value="${operate_mode}">
				<input type="hidden" name="importData" value="${importData}">
				<input type="hidden" name="delete_points">
				<input type="hidden" name="info_id" value="${info.info_id}">
				<input type="hidden" name="part_id" value="${part.part_id}">
				<input type="hidden" name="write_date" id="write_date" value="${info.monitoring_date}">
				<table class="commonTable" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="80%" align="center">
							<c:if test="${part != null}">
								<font color="orange" size="3"><STRONG>所属部位：${part.part_name}</STRONG></font>	
							</c:if>
						</td>
						<td align="right" width="20%">
						<div class="listButtonDiv" >
							<c:if test="${operate_mode == 'edit' && part != null}">
			    				<input type="button" value="时序曲线" class="button1" onclick="showPartTimes('${info.type_id.type_kind}','${part.part_id}')">
							</c:if>
							<c:if test="${part != null}">
								<input type="button" value="测点布置图" class="button1" onclick="displayGeographicPicture('${info.station_id.station_id}','${info.info_type}','${part.part_id}')">
							</c:if>
			   				<c:if test="${operate_mode != 'edit'}">
							    <input type="button" class="button1" value="导出填报模板" onclick="modelDownLoad()">
							    <input type="button" class="button1" value="数据导入" onclick="dataImport()">
			  				</c:if>
			  				</div>
						</td>
					</tr>
				</table>
				<c:if test="${info.type_id.type_kind==1}">
				<%@include file="type1.jsp" %>
				</c:if>
				<c:if test="${info.type_id.type_kind==2}">
				<%@include file="type2.jsp" %>
				</c:if>
				<c:if test="${info.type_id.type_kind==3}">
				<%@include file="type3.jsp" %>
				</c:if>
				<c:if test="${info.type_id.type_kind==4}">
				<%@include file="type4.jsp" %>
				</c:if>
				<c:if test="${info.type_id.type_kind==5}">
				<%@include file="type5.jsp" %>
				</c:if>
				<c:if test="${info.type_id.type_kind==6}">
				<%@include file="type6.jsp" %>
				</c:if>
			</html:form>
			
			<div align="center" class="sb_div saveDiv">
				<c:if test="${fn:contains(userinfo.usercmd,'dtaqData1_save')==true || fn:contains(userinfo.usercmd,'dtaqData3_save')==true}">
				  	<input type="button" id="btnSave" class="saveButton" value="${texts['button.save']}" onclick="saveInfo()">
				</c:if>
			  		<input type="button" class="backButton" value="${texts['button.back']}" onclick="backToList()">
		  	</div>
			  
			  
		  </fieldset>
		  </td>
		 </tr>
	</table>

</td >
</tr>

</table>

		
		
		
		
		
		
</ex:tabItem>
</ex:tab>
	</body>
</html:html>

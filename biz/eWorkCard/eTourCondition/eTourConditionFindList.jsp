<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
	<script type="text/javascript">
	var oper_id="";
		$(document).ready(function(){
		 getLines('${param.qlineId}','${param.qsectionId}');
		    getSections('${param.qlineId}','${param.qsectionId}');
		    getWokPoints('${param.qsectionId}','${param.qworkPointId}');
		    
	  

		//全选
	       $("#btn_allSelect").click(function(){
	       		 $("[name='select_id']").attr("checked","checked") ;
	       		 $("[name='select_id']:checked").each(function(i){
	       		 })
	       });
	        //全不选
	       $("#btn_notSelect").click(function(){
    			 $("[name='select_id']").attr("checked","") ;
   	   });

            $("#btn_excel").click(function(){
           		 $("[name='idList']").val("");
	       		 $("[name='select_id']:checked").each(function(index, value, array){
	       		 	$("[name='idList']").val($("[name='idList']").val()+","+value.value);
	       		 })
	       		if($("[name='idList']").val()==''){
	       		 alert("请选择一条巡视情况记录！");
	       		}else{
	       		var url="eTourConditionAction.do?method=exportExcel&idList="+$("[name='idList']").val();
	       		 location.href=url;
	       		}
	       });
		
		});
		
	//获取标段
	function getSections(qlineId,qsectionId){
		getWokPoints('','');
		if(qlineId!=''){
			$.post("eTourConditionAction.do?method=getSections&qlineId="+qlineId,function(msg){
				fillJsonNoSelect($("#qsectionId"),msg,qsectionId,2);
			});
		}else{
			fillJsonSelect($("#qsectionId"),"","");
		}
	}
	//详细页面
		function showView(id){
	    	var url ='eTourConditionAction.do?method=view&qifFinishStatus=${param.qifFinishStatus}&qpatralRecordStatus=${param.qpatralRecordStatus}&qtourEngineer=${param.qtourEngineer}&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&viewFlag=true'+'&ec_crd='+$("[name='ec_rd']").val()+'&qendDate='+$("[name='qendDate']").val()+'&qstartDate='+$("[name='qstartDate']").val()+'&qsectionId='+$("[name='qsectionId']").val()+'&qlineId='+$("[name='qlineId']").val(); 
			commonUrl(url);
	  	}
	  	
	</script>
</head>
<content tag="heading">
	工程巡查情况查询
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
				<html:form action="eTourConditionAction.do?method=findList">
				<input name="idList" type="hidden"/>
					<table class="queryContentTable" >
				
						<tr>
						<td>线路：</td>
							    <td >
							    	<select id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
							    </td>							   
							     <td>工点：</td>
							    <td><select id="qsectionId" name="qsectionId" onchange="getWokPoints(this.value,'')"></select>
							    </td>
							    <td >巡查日期：</td>
							<td><html:text styleClass="inputText" property="qstartDate" maxlength="25" onfocus="WdatePicker()"></html:text>
							-&nbsp;<html:text styleClass="inputText" property="qendDate" maxlength="25" onfocus="WdatePicker()"></html:text></td>
							
							     </tr>
							    <tr>
							    <td>巡视工程师：</td>
							    <td>
							    <html:text styleClass="inputText"  property="qtourEngineer" />
							    </td>
							    
							     <td>完成情况填报状态：</td>
							    <td><ex:dictSelect type="FillStatus" property="qifFinishStatus"/>
							    </td>
							     <td>巡视表填报状态：</td>
							    <td><ex:dictSelect type="FillStatus" property="qpatralRecordStatus"/>
							    </td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		<div  class="listButtonDiv">
		
		<input type="button" id="btn_allSelect"   icon="icon_allSelect"              value="全  选"/>
	    <input type="button" id="btn_notSelect"     icon="icon_notSelect"         value="全不选"/>
		<input type="button" id="btn_excel"   icon="icon-pkg"          value="导出excel"/>
	</div>
	<ec:table items="eTourConditions" var="eTourCondition" 
			action="eTourConditionAction.do?method=findList" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="1000"  imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
			<ec:row highlightRow="true"  >
				<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="4%"/>
				<ec:column property="null" sortable="false" title="选择" width="4%">
					
					<input type="checkbox"  name="select_id"   value="${eTourCondition.id}" />
				</ec:column>
				<ec:column property="lineId.line_name" title="线路" />
				<ec:column property="stationId.station_name" title="工点" />
				<ec:column property="tourEngineer" title="巡视工程师" />
				<ec:column property="ifFinishStatus" title="完成情况填报状态" width="8%">
				<ex:dicDisplay dictIdentify="FillStatus" dictValue="${eTourCondition.ifFinishStatus}"/>
				</ec:column>
				<ec:column property="patralRecordStatus" title="巡视表填报状态" width="8%">
				<ex:dicDisplay dictIdentify="FillStatus" dictValue="${eTourCondition.patralRecordStatus}"/>
				</ec:column>
				<ec:column property="ifFinish" title="是否巡视完成" width="4%" >
				<ex:dicDisplay dictIdentify="Yesorno"  dictValue="${eTourCondition.ifFinish}"/>
				</ec:column>
				<ec:column property="finishRemark" title="完成情况备注" width="15%"/>
				<ec:column property="tourDate" title="巡查日期" >
				   <fmt:formatDate value="${eTourCondition.tourDate}" pattern="yyyy-MM-dd"/>
				</ec:column>
				<ec:column property="null" title="操作"  width="6%">
				<input class="btn_view" value="${texts['button.detail']}" type="button" icon="icon_view" onclick="showView(${eTourCondition.id})" />   
				</ec:column>
			</ec:row>
		</ec:table> 
</body>
</html:html>

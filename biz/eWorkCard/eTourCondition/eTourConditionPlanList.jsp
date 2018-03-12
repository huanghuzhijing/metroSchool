<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
		var oper_id="";
		$(document).ready(function(){
			$(document).ready(function(){
			$('tr:even.gray').css('background', '#EEE'); // 偶数行颜色
            $('tr:odd.gray').css('background', '#FFFFFF'); // 奇数行颜色
			var table1=$("#tablescrop1");
			var item1=$(".item1");
			if(table1.height()>item1.height()){
				var speed = 2000;  
	            function Marquee() {  
	            	var $self = table1; 
	            	var lineHeight = $self.find("tr:first").height(); 
	            	$self.animate({ 
	            		"marginTop": -lineHeight + "px" 
	            	}, 600, function() { 
		            	$self.css({ 
		            		marginTop: 0 
		            	}).find("tr:first").appendTo($self); 
	            	}) 
	            }  
	            var MyMar = setInterval(Marquee, speed);  
	            table1.mouseover(function(){
	            	 clearInterval(MyMar);  
	            });
	            table1.mouseout(function(){
	            	 MyMar = setInterval(Marquee, speed);  
	            });
			}
		})
		   getLines('${param.qlineId}','${param.qsectionId}');
		    getSections('${param.qlineId}','${param.qsectionId}');
		    getWokPoints('${param.qsectionId}','${param.qworkPointId}');
			//控制按钮
			var ec_id='${param.ec_id}';
			var oldOrNew='${oldOrNew}';
			//var ec_auditStatus=0;
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			
			
			pullValue(ec_id,oldOrNew);
			//新增
			$("#btn_add").click(function(){ 
				location.href='eTourConditionAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val(); 
			}); 
		
			
		});
		//刷新
		//获取线路
	function getLines(qlineId,qsectionId){
		$.post("eTourConditionAction.do?method=getLines",function(msg){
			fillJsonNoSelect($("#qlineId"),msg,qlineId,1,qsectionId);
		});
	}
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
		
	  	//设置list页面id
	//	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		function setPullValue(common_oper_id,select_count){
			oper_id=common_oper_id;
			var operObj = $("input[type=radio][name='select_id'][checked]");
			var state=operObj.attr("paramStatus");
			if(state==1){
				$("#btn_edit").show();
			}else{
				$("#btn_edit").hide();
			}
			if(select_count==1){
			$("#btn_edit").show();
			$("#btn_delete").show();
			}else{
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			}
		}
		
	</script>
</head>
<content tag="heading">
	巡视情况查询
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
			<html:form action="eTourConditionAction.do?method=planList">
			<input name="flagPage" type="hidden" value="1"/>
					<table align="left">
						       <tr>
								<td>线路：</td>
							    <td >
							    	<select id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
							    </td>
							     <td>工点：</td>
							    <td><select id="qsectionId" name="qsectionId" onchange="getWokPoints(this.value,'')"></select>
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



<div class="queryTable">
<table class="listTable1" border="1" style="width:100%;margin:auto;font-size: 34px;border-collapse: collapse;">
									<tr >
										<th width="14%">线路</th>
										<th width="14%">工点</th>
										<th width="14%">今日巡视工程师</th>
										<th width="35%">重点关注风险</th>
										<th width="23%">备注</th>
										
									</tr>
							</table>
							<div class="item1" style="height:526px;overflow:hidden;width: 100%">
							<table id="tablescrop1" class="listTable1" border="1" style="width:100%;margin:auto;font-size: 14px;border-collapse: collapse;">
								
									<c:forEach items="${eTourConditions}" var="eTourCondition" varStatus="index">
										<tr class="gray">
											<td width="14%">${eTourCondition.lineId.line_name}</td>
											<td width="14%">${eTourCondition.stationId.station_name}</td>
											<td width="14%">${eTourCondition.tourEngineer}</td>
											<td width="35%">${eTourCondition.emphasisRisk}</td>
											<td width="23%">${eTourCondition.planRemark}</td>
										</tr>
									</c:forEach>
										
								
							</table>
							</div>
</div>
</body>

</html:html>

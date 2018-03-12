<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	
		function completeFill(id){//现场巡视完成情况填报
			var widthTemp =  Math.round($(window).width()*0.6);
			var heightTemp = Math.round($(window).height()*0.8);
			var url ="${ctx}/eTourConditionAction.do?method=completeFill&id="+id;
			art.dialog({id:'commonDialog1',title:'现场巡视计划完成填报', iframe:url, width:widthTemp, height:heightTemp,top:'10',lock:false});
		}
		
		function pageRefresh(){
			location.href='eTourConditionAction.do?method=engineerList';   
	     }
	     
	     function patrolRecordFill(patrolType,conditionId){//巡视表填报
	     	if(patrolType==1){//明挖基坑
	     		$.ajax({//ajax判断是新增还是修改页面
					type: "POST",
					url: "${ctx}/ePatrolRecordOpenCutAction.do?method=validateStatus",
					data: "conditionId="+conditionId,
					success: function(msg){
						  if(msg!=null && msg!=''){//编辑
						  		location.href='ePatrolRecordOpenCutAction.do?method=edit&id='+msg;  
						  }else{//新增
	     						location.href='ePatrolRecordOpenCutAction.do?method=create&conditionId='+conditionId;  
						  }
					}
				});
	     	
	     	}else if(patrolType==2){//盖挖基坑
	     		$.ajax({//ajax判断是新增还是修改页面
					type: "POST",
					url: "${ctx}/ePatrolRecordCoverCutAction.do?method=validateStatus",
					data: "conditionId="+conditionId,
					success: function(msg){
						  if(msg!=null && msg!=''){//编辑
						  		location.href='ePatrolRecordCoverCutAction.do?method=edit&id='+msg;  
						  }else{//新增
	     						location.href='ePatrolRecordCoverCutAction.do?method=create&conditionId='+conditionId;  
						  }
					}
				});
	     	}else if(patrolType==3){//盾构隧道
	     		$.ajax({//ajax判断是新增还是修改页面
					type: "POST",
					url: "${ctx}/ePatrolRecordSTMAction.do?method=validateStatus",
					data: "conditionId="+conditionId,
					success: function(msg){
						  if(msg!=null && msg!=''){//编辑
						  		location.href='ePatrolRecordSTMAction.do?method=edit&id='+msg;  
						  }else{//新增
	     						location.href='ePatrolRecordSTMAction.do?method=create&conditionId='+conditionId;  
						  }
					}
				});
	     	}else if(patrolType==4){//暗挖
	     	 $.ajax({//ajax判断是新增还是修改页面
					type: "POST",
					url: "${ctx}/ePatrolRecordExcavationAction.do?method=validateStatus",
					data: "conditionId="+conditionId,
					success: function(msg){
						  if(msg!=null && msg!=''){//编辑
						  		location.href='ePatrolRecordExcavationAction.do?method=edit&id='+msg;  
						  }else{//新增
	     						location.href='ePatrolRecordExcavationAction.do?method=create&conditionId='+conditionId;  
						  }
					}
				});
	     	}else if(patrolType==5){//高架
	     	 $.ajax({//ajax判断是新增还是修改页面
					type: "POST",
					url: "${ctx}/ePatrolRecordBraceAction.do?method=validateStatus",
					data: "conditionId="+conditionId,
					success: function(msg){
						  if(msg!=null && msg!=''){//编辑
						  		location.href='ePatrolRecordBraceAction.do?method=edit&id='+msg;  
						  }else{//新增
	     						location.href='ePatrolRecordBraceAction.do?method=create&conditionId='+conditionId;  
						  }
					}
				});
	     	}
	     }
	     
	      function RecordTypeFill(conditionId,patrolType){//巡视表类型填报
	      		//if(patrolType==''){
		      		var widthTemp =  Math.round($(window).width()*0.6);
					var heightTemp = Math.round($(window).height()*0.8);
					var url ="${ctx}/eTourConditionAction.do?method=selectRecordType&id="+conditionId;
					art.dialog({id:'commonDialog1',title:'现场巡视计划完成填报', iframe:url, width:widthTemp, height:heightTemp,top:'10',lock:false});
	      		//}else{
	      			//patrolRecordFill(patrolType,conditionId);
	      		//}
						      
	      }
	       function RecordTypeDelete(conditionId,patrolType){//巡视表类型删除
	      		//if(patrolType==''){
		      		var widthTemp =  Math.round($(window).width()*0.6);
					var heightTemp = Math.round($(window).height()*0.8);
					var url ="${ctx}/eTourConditionAction.do?method=deleteRecordType&id="+conditionId;
					art.dialog({id:'commonDialog1',title:'现场巡视计划删除', iframe:url, width:widthTemp, height:heightTemp,top:'10',lock:false});
	      		//}else{
	      			//patrolRecordFill(patrolType,conditionId);
	      		//}
						      
	      }
	</script>
</head>
<content tag="heading">
	现场巡视计划完成
</content>
<body >
	<ec:table items="eTourConditions" var="eTourCondition" 
			action="eTourConditionAction.do?method=engineerList" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="50" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
			<ec:row highlightRow="true" >
				<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
				<ec:column property="lineId.line_name" title="线路"  width="20%" />
				<ec:column property="stationId.station_name" title="工点" width="15%" />
				<ec:column property="tourEngineer" title="巡视工程师" width="10%"/>
				<ec:column property="tourDate" title="巡视日期" width="10%" >
				   <fmt:formatDate value="${eTourCondition.tourDate}" pattern="yyyy-MM-dd"/>
				</ec:column>
				<ec:column property="ifFinishStatus" title="完成情况填报状态" width="10%">
				<ex:dicDisplay dictIdentify="FillStatus" dictValue="${eTourCondition.ifFinishStatus}"/>
				</ec:column>
				<ec:column property="patralRecordStatus" title="巡视表填报状态" width="10%">
				<ex:dicDisplay dictIdentify="FillStatus" dictValue="${eTourCondition.patralRecordStatus}"/>
				</ec:column>
				
				<ec:column property="null" title="操作" width="20%">
					<div class="saveDiv">
						<input type="button" id="btn_add" icon="icon_add" value="完成情况填报" onclick="completeFill(${eTourCondition.id})"/>
						
						<c:if test="${eTourCondition.ifFinish==1}">
							<input type="button" id="btn_patrol" icon="icon_edit" value="巡视表编制" onclick="RecordTypeFill(${eTourCondition.id},'${eTourCondition.patrolType}')"/>
						</c:if>
						
					
					</div>
				</ec:column>
				
			</ec:row>
		</ec:table> 
</body>
</html:html>

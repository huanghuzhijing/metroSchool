<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#btn_save").click(function(){
				var ifFinishValue=jQuery("[name='ifFinishValue'][checked]").val();
				var finishRemarkTemp=jQuery("[name='finishRemarkTemp']").val();
				
				if(ifFinishValue==1){//已完成，可以填报巡视表,而且必进巡视类型选择页面
					$.ajax({//ajax判断是新增还是修改页面
						type: "POST",
						url: "${ctx}/eTourConditionAction.do?method=insertIfFinishValue",
						data: "ifFinishValue="+ifFinishValue+"&finishRemarkTemp="+finishRemarkTemp+"&conditionId="+${condition.id},
						success: function(msg){
							if(msg=='yes'){
								var url='eTourConditionAction.do?method=selectRecordType&id=${condition.id}';
								commonUrl(url);
							}else{
								alert("保存失败！");	
							}
						}
					});
				}else if(ifFinishValue==0){//未完成，不能填报巡视表
					$.ajax({//ajax判断是新增还是修改页面
						type: "POST",
						url: "${ctx}/eTourConditionAction.do?method=insertIfFinishValue",
						data: "ifFinishValue="+ifFinishValue+"&finishRemarkTemp="+finishRemarkTemp+"&conditionId="+${condition.id},
						success: function(msg){
							  if(msg=='yes'){
								  	alert("保存成功！");	
								  	parent.pageRefresh();
									parent.art.dialog({id:'commonDialog1'}).close();
							  }else{
								  	alert("保存失败！");	
							  }
						}
					});
				}else{//未选择是否巡视状态
					alert('请选择是否完成巡视！');
				}
			}); 
			
			
			$("#btn_close").click(function(){ 
				parent.pageRefresh();
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
		});
		/**
		function checkNum(num){//检查字数
			if(num.length>=100){
				alert("输入的内容长度必须在100个字符以内，你已输入"+num.length+"个字符!");
			}
		}
		*/
	</script>
</head>

<body >
	<html:form enctype="multipart/form-data" action="eTourConditionAction.do" method="POST">
		<input type="hidden" name="method" value="selectRecordType"/>
		<html:hidden property="id" value="${condition.id}"/>
		<fieldset >
		<legend>完成情况填报</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
					 
					  <tr>
					    <td> 线路名称：<span class="noRedSpan">*</span></td>
					    <td >
							${condition.lineId.line_name}
						</td>
					  </tr>
					  <tr>
					    <td >工点名称：<span class="noRedSpan">*</span></td>
					    <td >
							${condition.stationId.station_name}
						</td>
					  </tr>
					  <tr>
					    <td >巡视时间：<span class="noRedSpan">*</span></td>
					    <td >
							  <fmt:formatDate value="${condition.tourDate}" pattern="yyyy-MM-dd"/>
						</td>
					  </tr>
					  <tr>
					    <td >巡视工程师：<span class="noRedSpan">*</span></td>
					    <td >
							${condition.tourEngineer}
						</td>
					  </tr>
					  <tr>
					    <td >巡视计划备注：<span class="noRedSpan">*</span></td>
					    <td >
					    	<textarea disabled="disabled" name="planRemark"  >${condition.planRemark}</textarea>
						</td>
					  </tr>
					  <tr>
					    <td >重点关注风险：<span class="noRedSpan">*</span></td>
					    <td >
					    	<textarea  name="emphasisRisk" disabled="disabled" >${condition.emphasisRisk}</textarea>
						</td>
					  </tr>
					  <tr>
					    <td >是否完成巡视：<span class="redSpan">*</span></td>
					    <td >
							<ex:dictRadio type="Yesorno"  property="ifFinishValue" defaultValue="${condition.ifFinish}"/>
<!--							<ex:dictSelect type="Yesorno" property="ifFinishValue" value="${condition.ifFinish}"/>-->
						</td>
					  </tr>
					  <tr>
					    <td >完成情况备注：<span class="noRedSpan">*</span></td>
					    <td >
							<html:textarea property="finishRemarkTemp" value="${condition.finishRemark}" />
						</td>
					  </tr>
					 
					</table>
					</fieldset>
	

			<div  class="saveDiv">
				<input id="btn_save" value="下一步" type="button" icon="icon_save"/>
				<input id="btn_close" value="${texts['button.close']}" type="button"  icon="icon_close"/>
			</div>

	</html:form>
</body>
</html:html>

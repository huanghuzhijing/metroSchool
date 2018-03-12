<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">现场巡视计划编制</content>  
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
		$(document).ready(function(){
				//返回		
				 $("#btn_back").click(function(){ 
				 	var sup=${sup};
				 	//if(sup==0){
						document.forms[0].action='eTourConditionAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}'; 
				 	//}else if(sup==1){
						//document.forms[0].action='eTourConditionAction.do?method=completionList&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}'; 
				 	//}
			    	document.forms[0].submit();
			    }); 
	    }); 
	
		/**
		function checkNum(num){
			if(num.length>=100){
				alert("输入的内容长度必须在100个字符以内，你已输入"+num.length+"个字符!");
			}
		}S
		*/
		
	//	function lineChanged(){//线路联动
		//	location.href="eTourConditionAction.do?method=create&line_id="+jQuery("[name='line_id']").val();
	//	}
		//function save(){
		//	obj = document.getElementsByName("tourEngineerTemp");
		//	riskObj = document.getElementsByName("emphasisRiskTemp");
		//	if(obj.length>0){
		//		for(var i=0; i<obj.length ;i++){
		//			if(obj[i].value==null||obj[i].value==""){
		//				alert("有巡视工程师未填报！");
		//				return;
		//			}
		///			if(riskObj[i].value==null||riskObj[i].value==""){
			//			alert("有重点关注风险未填报！");
			//			return;
			//		}
			//	}
				//document.forms[1].submit();
		//	}
		//}
		function save(){
			obj = document.getElementsByName("tourEngineerTemp");
			if(obj.length>0){
				var count=0;
				for(var i=0; i<obj.length ;i++){
					if(obj[i].value==null||obj[i].value==""){
						count++;
					}
				}
				if(count>=obj.length){
					alert("至少填报一条记录的巡视工程师！");
				}else{
					loadMessage("正在保存数据，请稍候");
					document.forms[1].submit();
				}
			}
		}

</script>
<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >基本信息</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="eTourConditionAction.do?method=create" >
						<table class="formTable">
							<COLGROUP >
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
							</COLGROUP>
						<tr>
						<td></td>
						</tr>
						<tr>
						
							<td>所选线路：<span class="redSpan">*</span></td>
							<td>
								${lineName}
					   		</td>
						
							<td>巡视时间：<span class="redSpan">*</span></td>
							<td>${tourDate}</td>
						</tr>
						<tr>
						<td></td>
						</tr>
					</table>
<!--								<div class="saveDiv">-->
<!--									<input type="submit" value="填报" icon="icon_query" />-->
<!--								</div>-->
				</html:form>
			</td>
		</tr>
	</table>

    <html:form action="eTourConditionAction.do" method="POST" styleClass="form" styleId="eTourConditionForm" enctype="multipart/form-data">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${param.id}"/>
		<html:hidden property="tourDateTemp" value="${tourDate}"/>
		
  		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='15%'>线路名称</th>
				<th width='15%'>工点名称</th>
				<th width='10%'>巡视工程师</th>
				<th width='30%'>重点关注风险</th>
				<th width='30%'>备注</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach items="${conditions}" var="condition">
				<tr align="center">
						<td><html:hidden  property="id" value="${condition.id}" /><html:hidden  property="lineIdTemp" value="${condition.lineId.line_id}" />${condition.lineId.line_name}</td>
						<td><html:hidden  property="stationIdTemp" value="${condition.stationId.station_id}" />${condition.stationId.station_name}</td>
						<td>
						<html:select property="tourEngineerTemp" value="${condition.tourEngineerId}">
									 <html:option value="">请选择</html:option>
									 <html:optionsCollection name="employees" value="employee_id" label="employee_name"/>
						</html:select>
						</td>
<!--						<td><html:text property="tourEngineerTemp" styleClass="text" size="12" value="${condition.tourEngineer}"/></td>-->
<!--						-->
<!--						<td><html:text property="tourEngineerTemp" styleClass="text" size="12" value="${condition.tourEngineer}"  onkeyup="checkNum(this.value)"/></td>-->
						
						
						<td><html:textarea property="emphasisRiskTemp" value="${condition.emphasisRisk}"  />(1000字以内)</td>
						<td><html:textarea property="planRemarkTemp" value="${condition.planRemark}" />(1000字以内)</td>
				</tr>	
				</c:forEach>
		
		</tbody>
		</table>
	
			<div class="saveDiv">
			<c:if test="${conditions!=null}">
<!--				<input type="submit" class="saveButton" value="${texts['button.save']}"/>&nbsp;&nbsp;-->
					<input type="button" class="saveButton" value="${texts['button.save']}" onclick="save(this)"/>&nbsp;&nbsp;
			</c:if>
<!--				<input id="btn_save" value="确  定" type="button" icon="icon_save"/>-->
				<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
			</div> 
	</html:form>
 </body>
</html:html>

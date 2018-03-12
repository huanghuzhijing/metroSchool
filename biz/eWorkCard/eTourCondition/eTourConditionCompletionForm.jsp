<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">现场巡视计划完成</content>  
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
		$(document).ready(function(){
				//返回		
				 $("#btn_back").click(function(){ 
					document.forms[0].action='eTourConditionAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}'; 
			    	document.forms[0].submit();
			    }); 
	    }); 
		function checkNum(num){
			if(num.length>=100){
				alert("输入的内容长度必须在100个字符以内，你已输入"+num.length+"个字符!");
			}
		}
		function save(){
			obj = document.getElementsByName("ifFinishTemp");
			if(obj.length>0){
				for(var i=0; i<obj.length ;i++){
					if(obj[i].value==null||obj[i].value==""){
						alert("有是否完成巡视未填报！");
						return;
					}
				}
				document.forms[1].submit();
			}
		}
	//	function lineChanged(){//线路联动
		//	location.href="eTourConditionAction.do?method=create&line_id="+jQuery("[name='line_id']").val();
	//	}
		

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
		<input type="hidden" name="method" value="saveInfo"/>
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${param.id}"/>
		
  		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='15%'>线路名称</th>
				<th width='10%'>工点名称</th>
				<th width='10%'>巡视工程师</th>
				<th width='15%'>巡视计划备注</th>
				<th width='15%'>重点关注风险</th>
				<th width='10%'>是否完成巡视</th>
				<th width='20%'>备注</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${conditions !=null}">
				<c:forEach items="${conditions}" var="condition">
				<tr align="center">
						<td><html:hidden  property="id" value="${condition.id}" />${condition.lineId.line_name}</td>
						<td>${condition.stationId.station_name}</td>
						<td>${condition.tourEngineer}</td>
						<td>${condition.planRemark}</td>
						<td>${condition.emphasisRisk}</td>
						<td><ex:dictSelect type="Yesorno" property="ifFinishTemp" value="${condition.ifFinish}"/>  </td>
<!--						<td >-->
<!--						<html:radio property="ifFinishTemp" value="0" >否</html:radio>-->
<!--						<html:radio property="ifFinishTemp" value="1" >是</html:radio>-->
<!--						</td>-->
<!--						<td><html:text property="ifFinishTemp" styleClass="text" size="12" /></td>-->
						<td><html:textarea property="finishRemarkTemp" value="${condition.finishRemark}" onkeyup="checkNum(this.value)"/></td>
				</tr>	
				</c:forEach>
			</c:if>		
		</tbody>
		</table>
	
			<div class="saveDiv">
				<c:if test="${conditions !=null}">
<!--					<input type="submit" class="saveButton" value="${texts['button.save']}"/>&nbsp;&nbsp;-->
					<input type="button" class="saveButton" value="${texts['button.save']}" onclick="save(this)"/>&nbsp;&nbsp;
				</c:if>
<!--				<input id="btn_save" value="确  定" type="button" icon="icon_save"/>-->
				<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
			</div> 
	</html:form>
 </body>
</html:html>

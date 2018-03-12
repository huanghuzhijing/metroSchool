<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle/>
<html>
<head>
<title><fmt:message key="dtaq.dtaqDataInfo.title"/></title>
<content tag="heading">进度管理</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<style type="text/css">
.inputTd{
	cursor:hand ;
	height:25px;
	padding-top:4px;
	text-align:left ;
	padding-left:3px;
}

.default{
	color:#cccdf0 ;
}

.changeSelect{
	color:yellow ;
}
</style>
<script language="javascript">
var tempTd = null ; //临时单元格
jQuery(document).ready(function(){
	initTable() ;
	//单元格点击事件
	jQuery(".inputTd").click(function(){
		//设置单元格状态
		setTd(this) ;
		//初始化单元格编辑状态
		if(jQuery(this).find("select").length == 0){
			//添加状态下拉框
			jQuery(this).append("<select name='schedule_state' class='text'><option value='1' selected='selected'>未施工</option><option value='2'>正在施工</option><option value='3'>已完工</option></select>") ;
			var stateSelect = jQuery(this).find("select") ;
			//施工状态改变
			stateSelect.change(function(){
				var stateSelectVal = jQuery(this).val();
				if(stateSelectVal == 1){
					jQuery(this).parent().css("background-color","#cccdf0") ;
				}else if(stateSelectVal == 2){
					jQuery(this).parent().css("background-color","yellow") ;
				}else if(stateSelectVal == 3){
					jQuery(this).parent().css("background-color","green") ;
				}
			}) ;
			var input = jQuery(this).find("input[name=inputHidden]").val().split(",") ;
			if(input[1] != "" && input[1] != 1 ){
				stateSelect.val(input[1]) ;
			}
		}
	});
	
	//阻止事件冒泡
	jQuery(".inputTd span").click(function(event){
		event.stopPropagation();   
	})
})

//设置单元格状态
function setTd(object){
	var selectTd = jQuery(object); //获取当前单元格
	var inputTds = jQuery(".inputTd") ; 
	if(tempTd != null && inputTds.index(selectTd) != inputTds.index(tempTd)){
		setSelectTd() ;
	}
	selectTd.find("span").html("") ;
	tempTd = selectTd ;
}

//设置单元格锁定
function setSelectTd(){
	var select = tempTd.find("select") ;
		var inputHidden = tempTd.find("input[name=inputHidden]") ;
		var val = inputHidden.val().split(",") ;
		val[1]=select.val();
		if(val[1] == 1){
			val[2] = "" ;
		}
		inputHidden.val(val[0]+","+val[1]+","+val[2]+","+val[3]) ;
		//移除元素
		tempTd.find("select").remove();
}

//初始化表
function initTable(){
	jQuery.each(jQuery(".inputTd"),function(index,item){
		var obj = jQuery(item);
		var inputHidden = obj.find("input[name=inputHidden]") ;
		var value = inputHidden.val() ;
		var tempval = value.split(",") ;
		if(tempval[1] == 2){
			obj.css("background-color","yellow") ;
		}else if(tempval[1] == 3){
			obj.css("background-color","green") ;
		}else if(tempval[1] == 1){
			obj.css("background-color","#cccdf0") ;
		}
	}) ;
}

//保存前设置
function validate(){
	if(tempTd != null){
		setSelectTd() ;
	}
	return true ;
}

function searchHistory(){
	var recorddata = jQuery("[name='recorderDate']").val() ;
	var url="${ctx}/dtaqScheduleExcavateAction.do?method=list&station_id=${station_id}&segment_id=${segment_id}&station_state=1&recorderDate="+recorddata;
	location.href = url ;
}

function showHistory(){
	var url = "${ctx}/dtaqScheduleMainAction.do?method=list&station_id=${station_id}" ;
	art.dialog({id:'historydlg',title:'进度历史信息', iframe:url, width:'680', height:'400',top:'10'});
}

</script>
</head>
<body> 
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td valign="top"><%@include file="pointTree.jsp" %></td>
			<td width="85%" valign="top">
				<fieldset>
		  			<legend><strong>提示信息</legend>
		  			<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr align="center">
							<td style="">&nbsp;</td>
							<td align="center">
								<font color="#50A2E6" size="2"><strong>标段：${segment.segment_name}&nbsp;&nbsp;&nbsp;&nbsp;车站/区间：${station.station_name}</strong></font>
							</td>
							<td><span style="display:block;width:30px;margin-left:10px; background-color:green;height:15px;float:left"></span><span>已完工</span></td>
							<td><span style="display:block;width:30px;margin-left:10px; background-color:yellow;height:15px;float:left"></span><span>正在施工</span></td>
							<td><span style="display:block;width:30px;margin-left:10px; background-color:#cccdf0;height:15px;float:left"></span><span>未施工</span></td>
						</tr>
					</table>
		  		</fieldset>
		  		
				<fieldset>
		  			<legend><strong>当前进度信息</legend>
				 	<html:form action="/dtaqScheduleExcavateAction.do" method="POST" styleClass="form">
					<input type="hidden" name="method" value="save"/>
					<input type="hidden" name="station_id" value="${station.station_id}"/>
					<input type="hidden" name="segment_id" value="${segment.segment_id}"/>
			  		<table class="searchTable" width="100%" border="0" cellspacing="0" cellpadding="2">
  						<tr>
			  				<td>
			  					请选择日期：<input onfocus="WdatePicker()" name="recorderDate" value="${recorderDate}"/>&nbsp;&nbsp;
			  					<input type="hidden" name="main_id" value="${dtaqScheduleMain.main_id}"/>
			  					
			  				</td>
			  				<td align="right">
			  				<div class="saveDiv">
			  				<input type="button" value="查询" onclick="searchHistory()" class="button1"/>
			  					<input type="button" value="进度信息查询" class="button1" onclick="showHistory()"/>
			  				</div>
			  				</td>
			  			</tr>
			  		</table>
					<table class="listTable" id="tableTemp" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width="70px">段数</th>
							<c:forEach items="${schedulelayers}" var="schedulelayer">
								<th>${schedulelayer.data_name}</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dtaqSections}" var="section">
							<tr>
								<td align="center">${section.section_name}</td>
								<c:forEach items="${schedulelayers}" var="schedulelayer">
									<td class="inputTd">
										<span></span>
										<c:set var="flag" value="true"/>
										<c:forEach items="${schedules}" var="schedule">
											<c:if test="${schedule.section_id.section_id eq section.section_id && schedule.layer_on eq schedulelayer.data_short_name}">
												<input type="hidden" name="inputHidden" value="${schedule.excavate_id},${schedule.schedule_state},${schedulelayer.data_short_name},${section.section_id }"/>
												<c:set var="flag" value="false" />
											</c:if>
										</c:forEach>
										<c:if test="${flag}">
												<input type="hidden" name="inputHidden" value=",,${schedulelayer.data_short_name},${section.section_id }"/>
										</c:if>
									 </td>
								</c:forEach>			
							</tr>
						</c:forEach>
					</tbody>
				</table>
					<div class="saveDiv">
						<input type="submit" class="saveButton" value="${texts['button.save']}" onclick="return validate();" />&nbsp;&nbsp;
					</div> 
				</html:form>
				</fieldset>
			</td>
			
			
			
		</tr>
	</table>
</body>
</html>
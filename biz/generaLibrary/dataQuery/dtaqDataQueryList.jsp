<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<title><fmt:message key="dtaq.dataTotal.title" /></title>
<content tag="heading">监测综合查询</content>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script type="text/javascript" src="${ctx}/scripts/restrictLines.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<style type="text/css">
	.totalTable td{margin-left:20px;height:25px;line-height:25px;padding-left:20px;}
</style>
<script language="javascript">
jQuery(document).ready(function(){
 restrictTypes('${dtaqStation.station_id}','${param.qtypeId}');
	jQuery.ajax({
			   type: "POST",
			   url: "dtaqDataQueryAction.do?method=totalShow",		
			   success: function(msg){
				  jQuery("#matDiv").html(msg);
			   }
		});
})


//得到联动项目信息并构建options

function showPointDetail(pointid){
		var url = "checkpointManageAction.do?method=showDetail&station_id=${dtaqStation.station_id}&type_id="+$("[name='qtype_id']").val()+"&point_id="+pointid+"&organ_type="+$("[name='qorganType']").val() ;
		art.dialog({id:"curveType",title:'监测点信息', iframe:url, width:'900', height:'450',top:'10',lock:true});
}

function exportExcel(){

	var type_id = jQuery("[name='qtypeId']").val() ;
    if(type_id == ""){
		alert("请选择监测类型！") ;    	
	}else{
	
		jQuery("#dtaqDataQueryForm").attr("action","dtaqDataQueryAction.do?method=exportExcel") ;
		document.forms[0].submit();
		jQuery("#dtaqDataQueryForm").attr("action","dtaqDataQueryAction.do?method=list") ;
	}
}

function exportTXT(){
	var type_id = jQuery("[name='qtypeId']").val() ;
    if(type_id == ""){
		alert("请选择监测类型！") ;    	
	}else{
		jQuery("#dtaqDataQueryForm").attr("action","dtaqDataQueryAction.do?method=exportTXT") ;
		document.forms[0].submit();
		jQuery("#dtaqDataQueryForm").attr("action","dtaqDataQueryAction.do?method=list") ;
	}
	
}

function formSubmit(){
    var type_id = jQuery("[name='type_id']").val() ;
    if(type_id == ""){
	alert("请选择监测类型！") ;    	
    }else{
	document.forms[0].submit();
    }
}

function showSchedule(station_id,write_date){
	var url = "safeAnalysisTotalAction.do?method=showDetail&station_id="+station_id+"&write_date="+write_date ;
	art.dialog({id:"curveType",title:'安全形势分析', iframe:url, width:'900', height:'450',top:'10',lock:true});
}

</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td  valign="top" align="left">
<%@include file="pointTree.jsp" %>
</td>
<td valign="top">
		<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >${dtaqStation.station_name}数据查询</span>
			</td>
		</tr>
		<tr>
			<td>
			<html:form action="dtaqDataQueryAction.do?method=list" styleId="dtaqDataQueryForm">
			<input type="hidden" value="${dtaqStation.station_id}" name="qstationId"/>
			<table align="left">
				<tr>
					<td>
						第三方/施工方：
					</td>
					<td>
						<html:select property="qorganType" >
							<html:option value="T">
								第三方
							</html:option>
							<html:option value="O">
								施工方
							</html:option>
						</html:select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						监测类型：
						<select id="qtypeId" name="qtypeId" ></select>
					</td>
				
					<td>
						填报日期：
					</td>
					<td>
						<input name="qstartDate" value="${qstartDate}" onfocus="WdatePicker()"/>--<input name="qendDate" value="${qendDate}" onfocus="WdatePicker()"/>
					</td>
					
				</tr>
				<tr>
					<td>
						测点编码：
					</td>
					<td>
						<html:text property="point_code" styleId="point_code"
							styleClass="text" />
					</td>
					
				</tr>
			</table>
			<div style="float: right">
						<div class="saveDiv">
						<input type="button" class="button1"
							value="${texts['button.query']}" onclick="formSubmit()">
						&nbsp;&nbsp;
						<input type="button" class="button1"
							value="导出excel" onclick="exportExcel()">
						&nbsp;&nbsp;
						<input type="button" class="button1"
							value="导出TXT" onclick="exportTXT()">
						</div>
						</div>
		</html:form>
			</td>
			</tr>
			</table>
			
		
	<fieldset>
		<legend>
			监测数据明细列表${type.type_kind}
		</legend>
		<c:if test="${type.type_kind==1}">
			<%@include file="typeList1.jsp"%>
		</c:if>
		<c:if test="${type.type_kind==2}">
			<%@include file="typeList2.jsp"%>
		</c:if>
		<c:if test="${type.type_kind==3}">
			<%@include file="typeList3.jsp"%>
		</c:if>
		<c:if test="${type.type_kind==4}">
			<%@include file="typeList4.jsp"%>
		</c:if>
		<c:if test="${type.type_kind==5}">
			<%@include file="typeList5.jsp"%>
		</c:if>
	</fieldset>
	</td>
</tr>
<tr>
	<td colspan="2">
		<div id="matDiv"></div>
	</td>
</tr>
</table>
</body>
</html:html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/restrictLines.js"></script>
<script type="text/javascript">
	 $(document).ready(function(){
	 	//工地线路初始化
	 	 // restrictLines('${dtaqDataInfo.line_id.line_id}','${dtaqDataInfo.segment_id.segment_id}');
		//  restrictSegments('${dtaqDataInfo.line_id.line_id}','${dtaqDataInfo.segment_id.segment_id}');
		//  restrictStations('${dtaqDataInfo.segment_id.segment_id}','${dtaqDataInfo.station_id.station_id}');
		//  restrictTypes('${dtaqDataInfo.station_id.station_id}','${dtaqDataInfo.type_id.type_id}');
		  segmentChanged('${dtaqDataInfo.segment_id.segment_id}');
		  stationChanged('${dtaqDataInfo.station_id.station_id}');
		    
	 //保存
	 	$("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["segmentIdTemp","标段"];
			properties[1]=["stationIdTemp","车站区间"];
			properties[2]=["typeIdTemp","监测类型"];
			properties[3]=["monitoring_date","监测日期"];
			saveValidateRequired("#btn_save",properties,"dtaqDataInfoForm");
		}); 
		//返回		
		 $("#btn_back").click(function(){ 
			location.href = '${ctx}/dtaqDataInfoAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qorganType=${param.qorganType}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}';
	    }); 
	}); 
	
	//根据工点获取第三方监测单位
	function stationChanged(stationId) {
		$.ajax({
			type: "POST",
			url: "dtaqDataInfoAction.do?method=queryThird",
			data: "stationId="+stationId,
			success: function(msg){
				responseJc(msg);
			}
		});
	}	
	
	//施工单位监理单位
	function responseJc(selResponse){
		var text = selResponse;
		if(text != ""){
			jQuery("[name='eorgjc']").val(text) ;
		}else{
			jQuery("[name='eorgjc']").val("") ;
		}
	}
</script>
</head>
<content tag="heading">
<c:if test="${dtaqDataInfo.info_type=='O'}">
施工方数据编制
</c:if>
<c:if test="${dtaqDataInfo.info_type=='T'}">
第三方数据编制
</c:if>
</content>
<body>
<ex:tab id="info">
<ex:tabItem name="dtaqDataInfoForm" label="基本信息">
<html:form action="dtaqDataInfoAction.do" styleClass="form" method="POST" styleId="dtaqDataInfoForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="ec_crd" />
<html:hidden property="info_id" />
<html:hidden property="qorganType" value="${param.qorganType}"/>
<html:hidden property="qlineId" value="${param.qlineId}"/>
<html:hidden property="qsegmentId" value="${param.qsegmentId}"/>
<html:hidden property="qstationId" value="${param.qstationId}"/>
<html:hidden property="qtypeId" value="${param.qtypeId}"/>
<html:hidden property="qstartDate" value="${param.qstartDate}"/>
<html:hidden property="qendDate" value="${param.qendDate}"/>
		
<fieldset>
<legend>工点基本信息</legend>
<table class="formTable">
	<COLGROUP >
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
	</COLGROUP>
	<tr>
		<td>线路：<span class="noRedSpan">*</span></td>
		<td>
			${dtaqDataInfo.line_id.line_name}
		</td>
	</tr>
	<tr>
		<td>标段名称：<span class="redSpan">*</span></td>
		<td>
			${dtaqDataInfo.segment_id.segment_name}
		</td>
		<td>车站区间：<span class="redSpan">*</span></td>
		<td>
			${dtaqDataInfo.station_id.station_name}
		</td>
	</tr>
	<tr>
		<td>施工单位：<span class="noRedSpan">*</span></td>
		<td>
			<input name="eorg"  class="text" size="45" readonly="readonly"/>
		</td>
		<td>第三方检测单位：<span class="noRedSpan">*</span></td>
		<td>
			<input name="eorgjc"  class="text" size="45" readonly="readonly"/>
		</td>
	</tr>
	
	
	
	
</table>

</fieldset>
<fieldset>
<legend>填报基本信息</legend>
<table class="formTable">
	<COLGROUP >
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
	</COLGROUP>
	<tr>
		<td>检测类型：<span class="redSpan">*</span></td>
		<td>
			${dtaqDataInfo.type_id.type_name}
		</td>
	
	</tr>
	<tr>
		<td>填报人：<span class="noRedSpan">*</span></td>
		<td>
			<ex:employeeName id="${dtaqDataInfo.write_user}"/>
		</td>
		<td>测量人：<span class="noRedSpan">*</span></td>
		<td>
			<input type="text" name="measure_user" value="${dtaqDataInfo.measure_user}" class="text" maxlength="20">
		</td>
	</tr>
	<tr>
		<td>检测日期：<span class="redSpan">*</span></td>
		<td>
			<input name="monitoring_date" class="text"  value="${dtaqDataInfo.monitoring_date}" readonly="readonly"/>
			(时间格式：YYYY-MM-DD HI)
		</td>
		<td>填报日期：<span class="noRedSpan">*</span></td>
		<td>
			<input type="text"  name="write_date"  class="text" value="<fmt:formatDate value='${dtaqDataInfo.write_date}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly" />
		</td>
	</tr>
	<tr>
		<td>
			备注：<span class="noRedSpan">*</span>
		</td>
		<td colspan="3">
			<html:textarea property="remark" value="${dtaqDataInfo.remark}"  />4000字符以内!
		</td>
	</tr>
	
	
</table>







</fieldset>
		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
			<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
		</div>
	</html:form>
</ex:tabItem>
<ex:tabItem name="dtaqDataItem" label="监测数据填报" url="${ctx}/dtaqDataAction.do?method=list&info_id=${dtaqDataInfo.info_id}&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qorganType=${param.qorganType}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}" />
</ex:tab>
	</body>
</html:html>

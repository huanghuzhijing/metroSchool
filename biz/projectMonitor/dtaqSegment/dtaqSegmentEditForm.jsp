<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	 $(document).ready(function(){
	 //保存
	 	$("#btn_save").click(function(){
	 			$.ajax({
					   type: "POST",
					   url: "${ctx}/dtaqSegmentAction.do?method=validateCrop",
					   data: "sgId="+$("[name=corpIds]").val()+"&segId="+$("[name=segment_id]").val(),
					   success: function(msg){
					   		 if(msg=="1"){ 
					   		 		alert("施工单位已被其他标段占用，请选择其他施工单位！");
					   		 		//$("[name='segment_code']").val(""); 
									//$("segment_code").focus();
					   		 }else{
					   		 	var properties=new Array(); 
								properties[0]=["segment_name","标段名称"];
								properties[1]=["segment_code","标段编码"];
								properties[2]=["monitoring_status","监控状态"];
								properties[3]=["corpIds","施工单位"];
								properties[4]=["corpIds_1","设计单位"];
								properties[5]=["corpIds_2","监理单位"];
								saveValidateRequired("#btn_save",properties,"dtaqSegmentForm");
					   		 }    
					   }
					});
	 	
	 	
			//var properties=new Array(); 
			//properties[0]=["segment_name","标段名称"];
			//properties[1]=["segment_code","标段编码"];
			//properties[2]=["monitoring_status","监控状态"];
			//properties[3]=["corpIds","施工单位"];
			//properties[4]=["corpIds_1","设计单位"];
			//properties[5]=["corpIds_2","监理单位"];
			//saveValidateRequired("#btn_save",properties,"dtaqSegmentForm");
			}); 
		//返回		
		 $("#btn_back").click(function(){ 
			document.forms[0].action='dtaqSegmentAction.do?method=index&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&qlineId=${param.qlineId}&flagPage=2'; 
	    	document.forms[0].submit();
	    });
	    //施工单位
	    $("#btn_clear").click(function(){
		    $("[name='corpIds']").val('');
			$("[name='corpNames']").val('');
			}); 
		//设计单位
		$("#btn_clear_1").click(function(){
		    $("[name='corpIds_1']").val('');
			$("[name='corpNames_1']").val('');
			});
		//监理单位
		$("#btn_clear_2").click(function(){
		    $("[name='corpIds_2']").val('');
			$("[name='corpNames_2']").val('');
			});
	});
	//施工单位
	function setParamValue(corpIds,corpCodes,corpNames){
		if(corpIds!=""){
			$("[name='corpIds']").val(corpIds);
			$("[name='corpNames']").val(corpNames);
		}
	} 
	//设计单位
	function setParamValue_1(corpIds_1,corpCodes_1,corpNames_1){
		if(corpIds_1!=""){
			$("[name='corpIds_1']").val(corpIds_1);
			$("[name='corpNames_1']").val(corpNames_1);
		}
	} 
	//监理单位
	function setParamValue_2(corpIds_2,corpCodes_2,corpNames_2){
		if(corpIds_2!=""){
			$("[name='corpIds_2']").val(corpIds_2);
			$("[name='corpNames_2']").val(corpNames_2);
		}
	} 
	function setParamValue_3(corpIds_3,corpCodes_3,corpNames_3){
		if(corpIds_3!=""){
			$("[name='corpIds_3']").val(corpIds_3);
			$("[name='corpNames_3']").val(corpNames_3);
		}
	} 
	function validateCode(segment_code){//验证标段编码是否存在
		var segment_id = jQuery("[name='segment_id']").val();
		var old_code = jQuery("[name='old_code']").val();
		if(segment_code!=""){
			if(segment_id=="" || segment_code != old_code){//新增或者编码和原编码不一样
				$.ajax({
					   type: "POST",
					   url: "${ctx}/dtaqSegmentAction.do?method=validateSegmentCode",
					   data: "segment_code="+segment_code,
					   success: function(msg){
					   		 if(msg=="yes"){ 
					   		 		alert("已经存在该标段编号，请重新输入！");
					   		 		$("[name='segment_code']").val(""); 
									$("segment_code").focus();
					   		 }    
					   }
					});
			}	
		
		}
	}
</script>
<title>
	<content tag="heading"> 地铁线路基本信息</content>  
</title>
</head>
<body>

<html:form action="dtaqSegmentAction.do" styleClass="form" method="POST" styleId="dtaqSegmentForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="ec_crd" value="${param.ec_crd}"/>
<html:hidden property="qlineId" value="${param.qlineId}"/>
<html:hidden property="flagPage" value="2"/>
<html:hidden property="segment_id" />
<html:hidden property="old_code" value="${dtaqSegment.segment_code}"/>
<html:hidden property="ec_p" />
<fieldset>
<legend>地铁标段-编辑</legend>
<table class="formTable">
	<COLGROUP >
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
	</COLGROUP>
	
	<tr>
		<td>
			标段名称：<span class="redSpan">*</span>
		</td>
		<td>
			<html:text property="segment_name" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
	<tr>
		<td>
			标段编码：<span class="redSpan">*</span>
		</td>
		<td>
			<ex:numberInput property="segment_code" styleClass="inputText" maxlength="5" size="30" onchange="validateCode(this.value)"/><font color="#50A2E6" size="2">(示例说明:01015,'01'表示线路流水号即一号线,'015'表示标段流水号即15标)</font> 
		</td>
	</tr>
	  	<tr>
			<td >监控状态：<span class="redSpan">*</span></td>
			<td >
				<ex:dictSelect property="monitoring_status" type="MonitorStatus" /><font color="#50A2E6" size="2">(说明：如果标段修改为非监控状态时，则该标段下的所有工点自动变为非监控状态)</font>
			</td>
	</tr>
	<tr>
		<td align="right">安全监理单位：<span class="noRedSpan">*</span></td>
							<td colspan="3"> 
			<div style="float:left">
			<html:hidden property="corpIds_3" value="${corpIds_3}"/>
			<html:text property="corpNames_3" value="${corpNames_3}" styleClass="inputText"  size="70" readonly="true"/>
		    </div>
		     <div style="float:left">
		     <%@ include file="/biz/common/sysPlug/selectOrgans/corpSelects_safe.jsp" %>
		     
		    </div>
		    <div  style="float:left">
			<input id="btn_clear" value="清除选项" type="button" class="btn_clear" >
		    </div>
		</td>
	</tr>
	<tr>
		<td>
			施工单位：<span class="redSpan">*</span>
		</td>
		<td colspan="3"> 
			<div style="float:left">
			<html:hidden property="corpIds" value="${corpIds}"/>
			<html:text property="corpNames" value="${corpNames}" styleClass="inputText"  size="70" readonly="true"/>
		    </div>
		     <div style="float:left">
		     <%@ include file="/biz/common/sysPlug/selectOrgans/corpSelects.jsp" %>
		     
		    </div>
		    <div  style="float:left">
			<input id="btn_clear" value="清除选项" type="button" class="btn_clear" >
		    </div>
		</td>
	</tr>
	<tr>	
		<td>
			设计单位：<span class="redSpan">*</span>
		</td>
		<td colspan="3">  
		    <div style="float:left">
			<html:hidden property="corpIds_1" value="${corpIds_1}"/>
			<html:text property="corpNames_1" value="${corpNames_1}" styleClass="inputText" maxlength="100" size="70" readonly="true"/>
		    </div>
		     <div style="float:left">
		     <%@ include file="/biz/common/sysPlug/selectOrgans/corpSelects_1.jsp" %>
		    </div>
		    <div  style="float:left">
			<input id="btn_clear_1" value="清除选项" type="button" class="btn_clear_1" >
		    </div>
		</td>
	</tr>
	<tr>
		<td>
			监理单位：<span class="redSpan">*</span>
		</td>
		<td colspan="3">
		   <div style="float:left">
				<html:hidden property="corpIds_2" value="${corpIds_2}" />
				<html:text property="corpNames_2" value="${corpNames_2}" styleClass="inputText" maxlength="100" size="70" readonly="true"/>
		   </div>
		   <div style="float:left">
		   <%@ include file="/biz/common/sysPlug/selectOrgans/corpSelects_2.jsp" %>
		    </div>
		    <div  style="float:left">
			    <input id="btn_clear_2" value="清除选项" type="button" class="btn_clear_2" >
		    </div>
		</td>
	</tr>
	<tr>
		<td>
			甲方业主代表：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="owner_men" styleClass="inputText" maxlength="100" size="30" />
		</td>
		<td>
			项目经理：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="construct_men" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
	<tr>
		<td>
			监测单位负责人：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="JCTeam" styleClass="inputText" maxlength="100" size="30" />
		</td>
		<td>
			总监代表：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="JCTeam_men" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
	<tr>
		<td>
			总监：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="eOrgJC_men" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
</table>
</fieldset>
		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
			<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
		</div>
	</html:form>
	</body>
</html:html>

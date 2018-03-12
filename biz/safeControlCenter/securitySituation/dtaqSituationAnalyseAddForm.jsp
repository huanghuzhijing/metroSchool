<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
	 $(document).ready(function(){
	 		//工地线路初始化
		    getLines('');
		 	getSections('','');
		    getWokPoints('','');
		    
	 //保存
	 	$("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["record_date","填报日期"];
			properties[1]=["lineIdtemp","线路"];
			properties[2]=["sectionIdtemp","标段"];
			properties[3]=["workPointIdtemp","车站/区间"];
			properties[4]=["safe_state","工程安全综合状态"];
			properties[5]=["risk_attention","是否重点关注"];
			saveValidateRequired("#btn_save",properties,"dtaqSituationAnalyseForm");
			}); 
		//返回		
		 $("#btn_back").click(function(){ 
			document.forms[0].action='dtaqSituationAnalyseAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}'; 
	    	document.forms[0].submit();
	    }); 
	}); 
	//选择工点后联动
	function stationChanged(fieldStr) {
		var filed = fieldStr;
		var station_id = jQuery("[name='workPointIdtemp']").val();
		var record_date= jQuery("[name='record_date']").val();
		if(station_id != "" && record_date != ""){
			var fid = jQuery("[name='fid']").val();
			var oldStation = jQuery("[name='oldStation']").val();
			var oldrecord_date = jQuery("[name='oldrecord_date']").val();
			if(fid == "" || oldStation != station_id || record_date != oldrecord_date){
				$.ajax({
					type: "POST",
					url: "${ctx}/dtaqSituationAnalyseAction.do?method=ajaxSituation",
					data: "station_id="+station_id+"&record_date="+record_date,
					success: function(msg){
						checkResponse(msg);
					}
				});
			
			
			//	var url = "${ctx}/situationAnalyseAction.do?method=ajaxSituation";
			//	var checkAjax = new Ajax.Request(url, {method:"post", parameters:"station_id="+station_id+"&record_date="+record_date, onComplete:checkResponse});
			}
		}else{
			jQuery("[name='point_warn_count']").val("");
			jQuery("[name='third_warn_count']").val("");
			jQuery("[name='safe_step']").val("");
		}
	}
	//选择工点后联动结果
	function checkResponse(checkResponse){
		var resText = checkResponse;
		if(resText == 'no'){
			alert("该车站/区间的安全形势分析当天已经编制，请重新选择！");
			jQuey("[name='workPointIdtemp']").val("") ;
			jQuery("[name='workPointIdtemp']").focus();
			return false;
		}else{
			//loadMessage("${texts['situation.analyse.load_data']}");
			//安全隐患及整改措施
			var station_id = jQuery("[name='workPointIdtemp']").val();
			var record_date= jQuery("[name='record_date']").val();
			
			$.ajax({
					type: "POST",
					url: "${ctx}/dtaqSituationAnalyseAction.do?method=querySafeInfo",
					data: "station_id="+station_id+"&record_date="+record_date,
					success: function(msg){
						responseSafeInfo(msg);
					}
				});
			
	//	var url = "${ctx}/situationAnalyseAction.do?method=querySafeInfo";
	//	var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id="+jQuery("[name=station_id]").val()+"&recordDate="+jQuery("[name=record_date]").val(), onComplete:responseSafeInfo});
			//监测数据个数统计的加栽
			$.ajax({
					type: "POST",
					url: "${ctx}/dtaqSituationAnalyseAction.do?method=queryPointData",
					data: "station_id="+station_id+"&record_date="+record_date,
					success: function(msg){
						responsePointData(msg);
					}
				});
	//	var url = "${ctx}/situationAnalyseAction.do?method=queryPointData";
	//	var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id="+jQuery("[name=station_id]").val()+"&recordDate="+jQuery("[name=record_date]").val(), onComplete:responsePointData});
			//施工进度和施工进度图片的加载
			$.ajax({
					type: "POST",
					url: "${ctx}/dtaqSituationAnalyseAction.do?method=queryConstData",
					data: "station_id="+station_id,
					success: function(msg){
						responseConstData(msg);
					}
				});
	//	 var url = "${ctx}/situationAnalyseAction.do?method=queryConstData";
	//	var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id="+jQuery("[name=station_id]").val(), onComplete:responseConstData});
		}
	}
	
	//安全隐患及整改措施	
	function responseSafeInfo(selRequest){
		var ajaxResponse = selRequest;
		if(ajaxResponse != null && ajaxResponse !=""){
			jQuery("[name='safe_step']").val(ajaxResponse) ;
		}else{
			jQuery("[name='safe_step']").val("") ;
		}
	}
	//监测数据个数统计的加栽
	function responsePointData(selResponse){
		var text = selResponse;
		if(text != ""){
			var textStr = text.split("@");
			jQuery("[name='point_warn_count']").val(textStr[0]) ;
			jQuery("[name='third_warn_count']").val(textStr[1]) ;
		}else{
			jQuery("[name='point_warn_count']").val("") ;
			jQuery("[name='third_warn_count']").val("") ;
		}
		closeLayer();
	}
	//施工进度和施工进度图片的加载
	function responseConstData(selRequest){
		var ajaxResponse = selRequest;
		if(ajaxResponse != null && ajaxResponse !=""){
			jQuery("[name='constprogress']").val(ajaxResponse) ;
		}else{
			jQuery("[name='constprogress']").val("") ;
		}
		
		
	}
</script>
</head>
<content tag="heading">安全形势分析室</content>
<body>
<c:set var="tabDisabled" value="false"/>
<c:if test="${situationAnalyse.fid==null}">
	<c:set var="tabDisabled" value="true"/>
</c:if>
<ex:tab id="info">
<ex:tabItem name="situationAnalyseItem" label="基本信息">
<html:form action="dtaqSituationAnalyseAction.do" styleClass="form" method="POST" styleId="dtaqSituationAnalyseForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="ec_crd" />
<html:hidden property="id" />
		
<fieldset>
<legend>安全形势分析信息-新增</legend>
<table class="formTable">
	<COLGROUP >
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
	</COLGROUP>
		<tr>
			<td>填报日期：<span class="redSpan">*</span></td>
			<td>
				<html:text property="record_date" value="${currentDate}" styleClass="inputText"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" onchange="changMeetingDate();"/>
			</td>
          	<td>线路：<span class="redSpan">*</span></td>
          	<td colspan="3">
			  <select id="qlineId" name="lineIdtemp" onchange="getSections(this.value,'')"></select>
			 </td>
		</tr>
       <tr>
             <td>标段：<span class="redSpan">*</span></td>
             <td>
             	<select id="qsectionId" name="sectionIdtemp" onchange="getWokPoints(this.value,'')"></select>
			 </td>
             <td>车站/区间：<span class="redSpan">*</span></td>
             <td>
             	<select id="qworkPointId" name="workPointIdtemp" onchange="stationChanged('qworkPointId')"></select>
             </td>
	     </tr>
	     <tr>
		     <td>工程安全风险状态：<span class="redSpan">*</span></td>
		     <td>
		     	<ex:dictSelect property="safe_state" type="AnalyseSafeState" value="1"/>
		     </td>	
	     	 <td>是否重点关注：<span class="redSpan">*</span></td>
		     <td>
		     	<ex:dictSelect property="risk_attention" type="RiskAttention" value="2"/>
		     </td>	
	     </tr>     
		<tr>
			<td>编制人：<span class="noRedSpan">*</span></td>
			<td >
				<ex:employeeName id="${weave_author}"/>
			</td>
			<td>编制日期：<span class="noRedSpan">*</span></td>
			<td >
				${currentDate}
			</td>
		</tr>
		<tr>
			<td>施工方监测状态(动态抓取)：<span class="noRedSpan">*</span></td>
			<td >
				<html:text property="point_warn_count"  styleClass="text" size="15" />(红:橙:黄:绿测点数)
			</td>
			<td>第三方监测状态(动态抓取)：<span class="noRedSpan">*</span></td>
			<td >
				<html:text property="third_warn_count"  styleClass="text" size="15" />(红:橙:黄:绿测点数)
			</td>
		</tr>
		<tr>
			<td>
				施工进度：<span class="noRedSpan">*</span>
			</td>
			<td colspan="3">
				<html:textarea property="constprogress"  />
			</td>
		</tr>	
		<tr>
	      <td>施工进度图片：<span class="noRedSpan">*</span></td>
	      <td colspan="3"><html:file property="constprogressfile" size="30" styleClass="text" />
	      </td>
	    </tr>
	    <tr>
			<td>
				危险源预警信息：<span class="noRedSpan">*</span>
			</td>
			<td colspan="3">
				<html:textarea property="danger_warn"  />
			</td>
		</tr>	
		<tr>
			<td>
				安全隐患及整改措施(动态抓取)：<span class="noRedSpan">*</span>
			</td>
			<td colspan="3">
				<html:textarea property="safe_step"  />
			</td>
		</tr>
		<tr>
			<td>
				工点情况描述：<span class="noRedSpan">*</span>
			</td>
			<td colspan="3">
				<html:textarea property="situation_discription"  />
			</td>
		</tr>
			<tr>
			<td>
				建议：<span class="noRedSpan">*</span>
			</td>
			<td colspan="3">
				<html:textarea property="suggestion"  />
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
<ex:tabItem name="situationTableItem" label="安全状态分析" url="#"  disabled="${tabDisabled}"/>
<ex:tabItem name="situationSuggestItem" label="评估及综合建议" url="#" disabled="${tabDisabled}" />
</ex:tab>
	</body>
</html:html>

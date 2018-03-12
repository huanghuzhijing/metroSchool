<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
function lineChanged() {
	var deptType = '${deptType}';
	if(deptType == '3'){
		var url = "${ctx}/dtaq/dataLinkage.do?method=querySegment";
	    var myajax = new Ajax.Request(url, {method:"post", parameters:"line_id="+jQuery("[name='lineId']").val(), onComplete:responseList});
    }
}

//得到联动项目信息并构建options
function responseList(selRequest){
   	var segment_id = jQuery("[name='segmentId']");
	var station_id = jQuery("[name='station_id']");
	initSelect(station_id) ;
	var resulttext = selRequest.responseText;
  	if(resulttext==null || resulttext==""){
		initSelect(segment_id) ;		
		return false;
	}
	else{
		fillSelect(segment_id,resulttext,"${segment_id}") ;
	}
}

function segmentChanged() {
    var url = "${ctx}/dtaq/dataLinkage.do?method=queryStation";
	var myajax = new Ajax.Request(url, {method:"post", parameters:"segment_id="+jQuery("[name='segmentId']").val()+"&stationWorking=Y", onComplete:responseStationList});
}

function segmentInitChanged() {
	var deptType = '${deptType}';
	if(deptType == '3'){
		var segment_id = '${segment_id}';
	    var url = "${ctx}/dtaq/dataLinkage.do?method=queryStation";
		var myajax = new Ajax.Request(url, {method:"post", parameters:"segment_id="+segment_id+"&stationWorking=Y", onComplete:responseStationList});
	}
}

//得到联动项目信息并构建options
function responseStationList(selRequest){
   	var station_id = jQuery("[name='station_id']");
	var resulttext = selRequest.responseText;
  	if(resulttext==null || resulttext==""){
  		initSelect(station_id) ;
		return false;
	}
	else{
		fillSelect(station_id,resulttext,"${station_id}") ;
	}
}

function queryStation(){
	var fid = jQuery("[name='id']").val();
	var oldStation = jQuery("[name='oldStation']").val();
	var station_id = jQuery("[name='station_id']").val();
	var record_date = jQuery("[name='f_reportdate']").val();
	var org_flag = jQuery("[name='org_flag']").val();
	if(station_id != "" && record_date != "" && org_flag != ""){
		if(fid == "" || oldStation != station_id){
			var url = "${ctx}/safetyDaylyLogAction.do?method=validateStation";
			var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id="+station_id+"&record_date="+record_date+"&org_flag="+org_flag, onComplete:responseAddReprot});
		}
	}
}

function responseAddReprot(selRequest){
	var text = selRequest.responseText.split(",");
	if(text[0] == "no"){
		alert("${texts['dtaq.safetyDaylyLog.current_reported']}");
		jQuery("[name='station_id']").val("");
		jQuery("[name='station_id']").focus();
	}else{
		var station_type = text[1];
		if(station_type == "S"){
			jQuery("#schedule_station").show();
			jQuery("#schedule_sern").hide();
			jQuery("#riskplan_station").show();
			jQuery("#riskplan_sern").hide();
		}else if(station_type == "P"){
			jQuery("#schedule_station").hide();
			jQuery("#schedule_sern").show();
			jQuery("#riskplan_station").hide();
			jQuery("#riskplan_sern").show();
		}
		var station_id = jQuery("[name='station_id']").val();
		var record_date = jQuery("[name='f_reportdate']").val();
		record_date = record_date.substring(0,10);
		
		var url = "${ctx}/situationAnalyseAction.do?method=queryWarnInfo";
		var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id="+station_id+"&recordDate="+record_date, onComplete:responseWarnInfoList});
	}
}


function responseWarnInfoList(selRequest){
	var ajaxResponse = selRequest.responseText;
	var type = "${deptType}";
	if(ajaxResponse != null && ajaxResponse !=""){
		ajaxResponse = ajaxResponse.split("@");
		if(type == "3"){
			jQuery("[name='thirdWarnInfo']").val(ajaxResponse[0]);
			jQuery("[name='orgWarnInfo']").val(ajaxResponse[1]);
		}else if(type == "1"){
			jQuery("[name='orgWarnInfo']").val(ajaxResponse[1]);
		}
		
	}else{
		if(type == "3"){
			jQuery("[name='thirdWarnInfo']").val("");
			jQuery("[name='orgWarnInfo']").val("");
		}else if(type == "1"){
			jQuery("[name='orgWarnInfo']").val("");
		}
		
	}
}

function submitSave(deptType){
	var lineId = jQuery("[name='lineId']").val();
	var segmentId = jQuery("[name='segmentId']").val();
	var station_id = jQuery("[name='station_id']").val();
	if(deptType == "3"){
		var f_riskstatus = jQuery("[name='f_riskstatus']").val();
	}
	var f_riskplan = jQuery("[name='f_riskplan']").val();
	var f_schedule = jQuery("[name='f_schedule']").val();
	var f_safetywork = jQuery("[name='f_safetywork']").val();
	
	var f_safetywork = jQuery("[name='f_safetywork']").val();
	var f_checkman = jQuery("[name='f_checkman']").val();
	var errors = "";
	var focusStr = "";
	if(lineId == ""){
		errors += "线路  为必填项\n";
		focusStr +="lineId,";
	}
	if(segmentId == ""){
		errors += "标段  为必填项\n";
		focusStr +="segmentId,";
	}
	if(station_id == ""){
		errors += "车站/区间 为必填项\n";
		focusStr +="station_id,";
	}
	if(f_riskplan ==""){
		errors += "今日工点安全风险情况 为必填项\n";
		focusStr +="f_riskplan,";
	}
	if(f_schedule ==""){
		errors += "今日工程形象进度说明 为必填项\n";
		focusStr +="f_schedule,";
	}
	if(f_safetywork == ""){
		errors += "今日安全工作 为必填项\n";
		focusStr +="f_safetywork,";
	}
	if(deptType == "3"){
		if(f_riskstatus ==""){
			errors += "现场安全隐患及整改措施 为必填项\n";
			focusStr +="f_riskstatus,";
		}
	}
	if(f_checkman == "" ){
		errors += "安全副经理 为必填项\n";
		focusStr +="f_checkman,";
	}
	
	if(errors != ""){
		alert(errors);
		focusStr = focusStr.substring(0,focusStr.indexOf(","));
		jQuery("[name='"+focusStr+"']").focus();
		return false;
	}else{
		document.forms[0].submit();
	}
}

function backToList(){
	location.href = "${ctx}/safetyDaylyLogAction.do?method=listPage&log_type=${param.log_type}&segment_id=${safetyDaylyLog.segmentId}&station_id=${safetyDaylyLog.station_id}&station_state=${station_state}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&log_type=${log_type}&safetyDaylyLogList_page=${safetyDaylyLogList_page}&ec_p=${param.ec_p}&ec_id=${param.ec_id}&ec_p=${param.ec_crd}";
}


function init(){
	var station_type = '${station_type}';
	if(station_type != ''){
		if(station_type == "S"){
			
			jQuery("#schedule_station").show();
			jQuery("#schedule_sern").hide();
			jQuery("#riskplan_station").show();
			jQuery("#riskplan_sern").hide();
		}else if(station_type == "P"){
			jQuery("#schedule_station").hide();
			jQuery("#schedule_sern").show();
			jQuery("#riskplan_station").hide();
			jQuery("#riskplan_sern").show();
		}
	}
}
</script>
 <body>
  
    <html:form action="safetyDaylyLogAction.do" method="POST" styleClass="form">
			<input type="hidden" name="method" value="save"/> 
			<html:hidden property="segmentId" value="${segment.segment_id}"/>
			<html:hidden property="station_id" value="${station.station_id}"/>
			<html:hidden property="station_state" value="${station_state}"/>
			<html:hidden property="qstartDate" value="${param.qstartDate}"/>
			<html:hidden property="qendDate" value="${param.qendDate}"/>
			<html:hidden property="log_type" value="${param.log_type}"/>
			<html:hidden property="safetyDaylyLogList_page" value="${safetyDaylyLogList_page}"/>
			<html:hidden property="oldStation" value="${safetyDaylyLog.station_id}"/>
			<html:hidden property="id"/>
			<html:hidden property="ec_id" value="${param.ec_id}"/>
			<html:hidden property="ec_p" value="${param.ec_p}"/>
			<html:hidden property="ec_crd" value="${param.ec_crd}"/>
			<html:hidden property="state" value="0"/>
			<html:hidden property="f_pbid"/>
			<html:hidden property="org_flag"/>
	   <fieldset>
	   <legend align="left">新增</legend>
	    <fieldset>
	   <legend align="center"><font class="t_memo_font">提示：建议每日工作动态在17：00点到9：00点提交</font></legend>
	   <table class="formTable" >
					<COLGROUP>
							<COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
			                <COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
		</COLGROUP>
	    <tr>
	    	<td>线路：<span class="redSpan">*</span></td>
	    	<td>
				${line.line_name}<html:hidden property="lineId" value="${line.line_id}"/>
	    	</td>
	    	<td>标段：<span class="redSpan">*</span></td>
	    	<td>
				${segment.segment_name}<html:hidden property="segmentId" value="${segment.segment_id}"/>
	    	</td>
	    </tr>
	    <tr>
	    	<td>车站/区间：<span class="redSpan">*</span></td>
	    	<td>
	    		${station.station_name}<html:hidden property="station_id" value="${station.station_id}"/>
	    	</td>
	    	<td>报告日期:<span class="redSpan">*</span></td>
	    	<td>
	    		<html:text property="f_reportdate" styleClass="text" value="${report_date}" readonly="true"/>
	    	</td>
	    </tr>
	    
	    <tr>
	    	<td>今日工点安全风险情况：<span class="redSpan">*</span></td>
	    	<td colspan="3">
	    		<html:textarea rows="7" cols="75" property="f_riskplan" value="${safetyDaylyLog.f_riskplan}" styleId="f_riskplan" onkeydown="textCounter('f_riskplan','spanAim4',4000)" onkeyup="textCounter('f_riskplan','spanAim4',4000)" ></html:textarea>
             	<span class="req" id="spanAim4" style="display:inline">4000字以内</span><br>
             	<font class="memo_font">
             		<c:if test="${station.station_type == 'S'}">
	             		<span id="riskplan_station">备注说明：基坑风险：支护结构风险（冠梁、围檩裂缝；支撑、立柱变形、绕曲；止水帷幕开裂、渗漏；坑外土体沉陷、裂缝及滑移；坑底涌土、流砂；等）、基坑开挖风险（不良地质情况；基坑开挖时空效应；基坑降水、回灌设施运转情况；基坑周边地面堆载情况；等）、工程环境风险（地下管线破损、泄露；周边建筑物倾斜、裂缝；周边道路（地面）裂缝、沉陷；邻近施工情况；等）</span>
             		</c:if>
             		<c:if test="${station.station_type == 'P'}">
	             		<span id="riskplan_sern">备注说明：隧道风险：掌子面风险（不良地质情况；洞身开挖时空效应；洞内掌子面渗水情况；掌子面地面荷载情况；等）、支护结构风险（超前支护情况；隧道拱部、边墙、拱脚变形；背后注浆情况；隧道拱部、边墙初衬开裂、脱落；二衬渗漏、裂缝；等）、工程环境风险（地下管线破损、泄露；周边建筑物倾斜、裂缝；周边道路（地面）裂缝、沉陷；邻近施工情况；等）</span>
             		</c:if>
             	</font>
	    	</td>
	    </tr>
	    <tr>
	    	<td>今日工程形象进度说明：<span class="redSpan">*</span></td>
	    	<td colspan="3">
	    		<html:textarea rows="7" cols="75" property="f_schedule" value="${safetyDaylyLog.f_schedule}" styleId="f_schedule" onkeydown="textCounter('f_schedule','spanAim1',4000)" onkeyup="textCounter('f_schedule','spanAim1',4000)" ></html:textarea>
             	<span class="req" id="spanAim1" style="display:inline">4000字以内</span><br>
             	<font class="memo_font">
             		<c:if test="${station.station_type == 'S'}">
             			<span id="schedule_station">备注说明：围护结构（地下连续墙幅、旋喷止水桩号、钻孔灌注桩号、人工挖孔桩号、高喷搅拌桩号；等）、基坑开挖（开挖范围、开挖深度、混凝土支撑范围数量、钢管支撑范围数量；等）、主体结构（混凝土垫层、底板、侧墙、中板、顶板；等）</span>
             		</c:if>
             		<c:if test="${station.station_type == 'P'}">
             			<span id="schedule_sern">备注说明：开挖初衬里程、桩号；二衬里程、桩号；管片环号；等</span>
             		</c:if>
             	</font>
	    	</td>
	    </tr>
	    <tr>
	    	<td>今日安全工作：<span class="redSpan">*</span></td>
	    	<td colspan="3">
	    		<html:textarea rows="7" cols="75" property="f_safetywork" value="${safetyDaylyLog.f_safetywork}" styleId="f_safetywork" onkeydown="textCounter('f_safetywork','spanAim5',4000)" onkeyup="textCounter('f_safetywork','spanAim5',4000)" ></html:textarea>
             	<span class="req" id="spanAim5" style="display:inline">4000字以内</span>
	    	</td>
	    </tr>
	    <c:if test="${deptType == '3'}">
	    	<tr>
		    	<td>现场安全隐患及整改措施：<span class="redSpan">*</span></td>
		    	<td colspan="3">
		    		<html:textarea rows="7" cols="75" property="f_riskstatus" value="${safetyDaylyLog.f_riskstatus}" styleId="f_riskstatus" onkeydown="textCounter('f_riskstatus','spanAim4',4000)" onkeyup="textCounter('f_riskstatus','spanAim4',4000)" ></html:textarea>
	             	<span class="req" id="spanAim4" style="display:inline">4000字以内</span>
		    	</td>
		    </tr>
	    </c:if>
	    <tr>
	    	<td>安全副经理：<span class="redSpan">*</span></td>
	    	<td colspan="3"><html:text property="f_checkman"  value="${safetyDaylyLog.f_checkman}" styleClass="text" maxlength="25" />
	    	<font class="memo_font">(本内容必须经安全副经理（总监理代表）审核后,方可上报)</font>
	    	</td>
	    </tr>
	    <tr>
	    	<td>填写人：<span class="noRedSpan">*</span></td>
	    	<td colspan="3">
	    		<html:hidden property="f_userid" value="${userinfo.empId}"/>
	    		<ex:employeeName id="${userinfo.empId}"/>
	    	</td>
	    </tr>
    </table>
	   </fieldset>   
	   </fieldset> 
    <div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" class="button1" icon="icon_save" onclick="submitSave('${deptType}')"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" class="button1" icon="icon_back" onclick="backToList()"/>
		</div>
</html:form>
 </body>
</html:html>

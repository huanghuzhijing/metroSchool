<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">监测超限警情管理</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="${ctx}/scripts/stone.FollowDiv.js" type="text/javascript"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script type="text/javascript">
function initWork() {
	jQuery.each(jQuery(".opinion"),function(index,item){
		var obj = jQuery(item);
		obj.attr("title",obj.html());
		if(obj.html().lengthCheck()>50){
			obj.html(substr(obj.html(),50)+'...');
		}
	});
	jQuery.each(jQuery(".warn_memo"),function(index,item){
		var obj = jQuery(item);
		obj.attr("title",obj.html());
		if(obj.html().lengthCheck()>15){
			obj.html(substr(obj.html(),15)+'...');
		}
	});
	
}
//时序曲线
function showComparePointTimes(point_id,type_kind,part_id) {
		  var url ="/safemanagerSecond/dtaqDataInfoQuery3Action.do?method=showComparePointTimes&point_id="+point_id+"&type_kind=1&startDate=2017-08-04&endDate=2017-09-04";
	   	  if(type_kind == "3"){
		  		url ="${ctx}/dtaqDataInfoQuery3Action.do?method=showPartTimes3&part_id="+part_id+"&type_kind="+type_kind+"&qstartedDate=${beginWeekDate}&qendedDate=${endDate}";
		  }
		  art.dialog({id:'commonDialog1',title:'数据分析', iframe:url, width:'800', height:'440',top:'10'});
		
}
function saveHistory(){
	var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3}$/ig;
	var opinion = jQuery("[name='opinion']").val();
	var file = jQuery("[name='affix_address']").val();
	var suffixError = "";
//	if(file ==""){
//		suffixError = "上传附件不能为空！\n";
//	}
	if(opinion ==""){
		suffixError += "批阅意见不能为空！\n";
	}
	if(suffixError != ""){
		alert(suffixError);
		return false;
	}else{
			var properties=new Array(); 
			saveValidateRequired("#btn_save",properties,"warnAnalysisSignForm");
			alert("保存成功！");
	}
	return true;
}

function removeMySiteRow(sign_id,ob){
    var tableId = document.getElementById("tableObj");
	if(window.confirm("是否确认删除该条批阅记录?")){

		$.ajax({
			type: "POST",
			url: "${ctx}/warnAnalysisSignAction.do?method=deleteMySign",
			data: "sign_id="+sign_id,
			success: function(msg){
					($(ob).parent().parent()).remove();
					}
				});
			}
	
}



function backToList() {
  var url="warnAnalysisSignAction.do?method=list";
  document.forms[0].action=url;
  document.forms[0].submit();
	
}

function checkSuffix(object){
	var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3,4}$/ig;
	var suffixError = "";
	if(filePath.test(value)==false){
		alert("${texts['dtaq.warnSign.file_validate']}");
		object.outerHTML=object.outerHTML.replace(/value=\w/g,''); 
	}
}
function showUploadDialogAndRefresh(URL,tWidth,tHeight)
    {   dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
    }
</script>
</head>
<body>
<fieldset>
	<legend><strong>预警超限信息</strong></legend>
<table class="listTable" id="fileTable" width="100%" border="0" cellpadding="0" cellspacing="1" align="center">
		<thead>
		<tr align="center"  height="25" id="trSite">
		  <th width="10%">测点编码</th>
		  <th width="12%">监测类型</th>
		  <th width="10%">监测部位</th>
		  <th width="10%">监测日期</th>
		  <th width="10%">累计变化量</th>
		  <th width="10%">变化速率</th>
		  <th width="10%">预警状态</th>
		  <th width="10%">预警原因</th>
		  <th width="10%">操作</th>
		</tr>
		</thead>
		<c:forEach items="${dtaqDatas}" var="data">
			<tr align = "center" >
				<td>${data.point_code}</td>
				<td>${data.info_id.type_id.type_name}</td>
				<td>
					<c:forEach items="${parts}" var="part">
		  				<c:if test="${part.part_id == data.part_id.part_id}">
			  				<c:out value="${part.part_name}"></c:out>
			  			</c:if>
			  		</c:forEach>
				</td>
				<td><fmt:formatDate value="${data.write_date}" pattern="yyyy-MM-dd"/></td>
				<td>${data.total_change}</td>
				<td>${data.change_rate}</td>
				<td><center><div id="warn_state" class="state${data.warn_state}"></div></center></td>
				<td><center><div align="center" class="warn_memo">${data.warn_memo}</div></center></td>
				<td>
					<div align="center">
	    				<input type="button" value="时序曲线" class="button1" onclick="showComparePointTimes('${data.point_id.point_id}','${data.info_id.type_id.type_kind}','${data.part_id.part_id }')">
	    			</div>
	    		</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	 <table class="formTable"  width="100%"  align="center" cellpadding="3" cellspacing="0" >
				<COLGROUP>
				 <COL class="tdLeftTwo">
	            <COL class="tdRightTwo">
	            <COL class="tdLeftTwo">
	            <COL class="tdRightTwo">
				    </COLGROUP>
		<tr>
			<td>警情下发原因:<span class="noRedSpan">*</span></td>
			<td colspan="3">
				 <html:textarea property="reason" cols="80" rows="8" value="${analysis.reason}" readonly="true"/>
			</td>
		</tr>
		<tr>
			<td>下发人员:<span class="noRedSpan">*</span></td>
			<td><ex:employeeName id="${analysis.issue_person}"/></td>
			<td>所属部门:<span class="noRedSpan">*</span></td>
			<td><ex:organNameById id="${analysis.person_dept}"/></td>
		</tr>
	</table>
</fieldset>
<%--<fieldset>--%>
<%--<legend>警情下发原因</legend>--%>
<%--<table>--%>
<%--	<tr>--%>
<%--		<td><br/><div align="center">&nbsp;&nbsp;${analysis.reason}</div><br/></td>--%>
<%--	</tr>--%>
<%--</table>--%>
<%--</fieldset>--%>
<fieldset>
	<legend><strong>批阅意见</strong></legend>
	<table width="100%">
		<tr>
			<td>
				<table class="listTable" id="tableObj" width="100%" border="0" cellpadding="0" cellspacing="1" align="left">
					<thead>
						<tr align="center"  height="25" id="trSite">
							 <th width="8%">序号</th>
							 <th width="10%">批阅人</th>
							 <th width="14%">批阅部门</th>
							 <th width="15%">批阅时间</th>
							 <th width="28%">批阅意见</th>
							 <th width="17%">附件</th>
							 <th width="8%">操作</th>
						  </tr>
					</thead>
					<c:set var="idx" value="0"/>
				  	<c:forEach items="${signs}" var="sign">
				  		<tr align="center" height="20" >
							<td>${idx+1}</td>
							<td><ex:employeeName id="${sign.signer}"/></td>
							<td><ex:organNameById id="${sign.dept_id}" /></td>
							<td><fmt:formatDate value="${sign.sign_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td class="opinion">${sign.opinion}</td>
							<td>
								<c:if test="${sign.affix_address!=null}">
								<a href="<%=request.getContextPath()%>/warnAnalysisSignAction.do?method=download&id=${sign.sign_id }">${sign.affix_name}</a>
							</c:if>	</td>
							<td>
							 <c:if test="${userInfo.empId == sign.signer}">
					         	<input type="button" class="button1" value="${texts['button.delete']}" onclick="removeMySiteRow('${sign.sign_id}',this)"/>
					         </c:if>
					         </td>
				         
							<td style="display:none">${sign.signer}</td>
						</tr>
						<c:set var="idx" value="${idx+1}"/>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr><td>
		<html:form action="warnAnalysisSignAction" method="POST">
		    <input type="hidden" name="method" value="saveSign"/> 
			<html:hidden property="sign_id"/>
			<html:hidden property="analysis_id" value="${param.analysis_id}"/>
			<html:hidden property="line_id" value="${line_id}"/>
			<html:hidden property="segment_id" value="${segment_id}"/>
			<html:hidden property="station_id" value="${station_id}"/>
			<html:hidden property="organ_type" value="${organ_type}"/>
			<html:hidden property="startDate" value="${startDate}"/>
			<html:hidden property="endDate" value="${endDate}"/>
			<html:hidden property="qlineId"/>
			<html:hidden property="qsegmentId"/>
			<html:hidden property="qstationId"/>
			<html:hidden property="qorganType" />
			<html:hidden property="qstartDate"/>
			<html:hidden property="qendDate"/>
			<html:hidden property="totalType" value="${totalType}"/>
			<html:hidden property="dtaqWarnAnalysisList_page" value="${dtaqWarnAnalysisList_page}"/>
			<html:hidden property="signer" value="${userInfo.empId}"/>
			<html:hidden property="dept_id" value="${userInfo.deptId}"/>
			
		    <table class="formTable"  width="100%"  align="center" cellpadding="3" cellspacing="0" >
				<COLGROUP>
				 <COL class="tdLeftTwo">
	            <COL class="tdRightTwo">
	            <COL class="tdLeftTwo">
	            <COL class="tdRightTwo">
				    </COLGROUP>
				     <tr height="30px">
				    	<td>批阅人:<span class="noRedSpan">*</span></td>
				    	<td><ex:employeeName id="${userInfo.empId}"/></td>
				    	<td>批阅部门:<span class="noRedSpan">*</span></td>
				    	<td><ex:organNameById id="${userInfo.deptId}" /></td>
				    	
				    </tr>
				    <tr>
				    	<td>批阅时间:<span class="noRedSpan">*</span></td>
				    	<td>
					    	 <input type="text" name="sign_date" value="${nowDate}" readonly="readonly" class="text">
				    	</td>
				    	</tr>
				    <tr>
	                <td>
							上传附件:<span class="noRedSpan">*</span>
						</td>
							<td>
							<div style="float:left">
						      <input type="text" id="fileName_" name="affix_name"
							class="inputText" size="30"  />
						</div>
						<div style="float:left">
						<input type="button" icon="icon_currWeek"
							onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&suffix=t&flag=1&mainTableName=${maintable}',900,700);"
							style="width: 76px; height: 65px; cursor: pointer" value="文件上传"
							alt="进入文件上传页面" />
						<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_"/>--%>
						</div>
						<div style="float:left">
						<input type="button" icon="icon_delete" onclick="fileClear(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
							</div>
							
<%--							<html:text property="fileName_" styleClass="inputText"	value="${compCompleteCheck.reportAnnex}" maxlength="100" size="30"/>--%>
						</td>
						<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="affix_address" class="inputText" readonly="readonly" size="30" />
							
						</td>
						<td style="display:none">附件:<span class="noRedSpan">*</span></td>
				    	<td style="display:none"><html:file property="file" size="40" styleClass="text" onchange="checkSuffix(this)"/></td>
				    
	    </tr> 
				    <tr>
				    	<td>批阅意见:<span class="redSpan">*</span></td>
				    	<td colspan="3">
					    	<html:textarea property="opinion" cols="80" rows="6" onblur="checkTextarea('opinion',1000)" onkeydown="textCounter('opinion','spanSummary',1000)" onkeyup="textCounter('opinion','spanSummary',1000)"/>
					    	<span class="req" id="spanSummary">(1000字符以内)</span>
				    	</td>
				    </tr>
				    <tr>
			           <td align="center" colspan="4">
			           	<div class="saveDiv">
			           		<html:button property="save" styleClass="saveButton" value="${texts['button.save']}" onclick="return saveHistory()" />
						   	<html:button property="back"  styleClass="backButton" value="${texts['button.back']}" onclick="backToList()" />
			           </div>
			           </td>
	           		</tr>
				</table>
		</html:form>
		</td>
		</tr>
		</table>
</fieldset>
</body>
</html:html>

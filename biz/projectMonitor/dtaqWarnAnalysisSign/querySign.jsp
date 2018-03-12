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

function saveHistory(){
	var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3}$/ig;
	var opinion = jQuery("[name='opinion']").val();
	var file = jQuery("[name='file']").val();
	var suffixError = "";
	if(file !="" && filePath.test(file)==false){
		suffixError = title+"未找到，请检查导入文件所在文件夹\n";
	}
	if(opinion ==""){
		suffixError += "批阅意见不能为空！\n";
	}
	if(suffixError != ""){
		alert(suffixError);
		return false;
	}
	return true;
}

function removeMySiteRow(sign_id){
    var tableId = document.getElementById("tableObj");
	if(window.confirm("${texts['dtaq.warnQuery.delete_history']}")){
		var url =  "${ctx}/dtaq/warnSign.do?method=deleteMySign";
    	var myajax = new Ajax.Request(url, {method:"post", parameters:"sign_id="+sign_id, onComplete:responseDeleteInfo});
    	
		o = findSiteTD(event.srcElement);
		tableId.deleteRow(o.parentElement.rowIndex*1);
		setMySiteNos(tableId);
	}
}

function responseDeleteInfo(selResponse){
<%--	var text = selResponse.responseText;--%>
<%--	if(parseInt(text) > 0){--%>
<%--		alert(text);--%>
<%--	 	var tableId = document.getElementById("tableObj");--%>
<%--		var o = findSiteTD(event.srcElement);--%>
<%--		tableId.deleteRow(o.parentElement.rowIndex*1);--%>
<%--		setMySiteNos(tableId);--%>
<%--	}else{--%>
<%--		alert("删除批阅记录失败，请稍后在试！");--%>
<%--	}--%>
}

function setMySiteNos(obj){
	if(null != obj){
	   var rowsLength = obj.rows.length;
	   if(rowsLength > 0){
	       for(var i = 1;i < rowsLength;i++){
		      obj.rows(i).cells(0).innerText = i;
	       }
		}
	}
}
//时序曲线
	function showPointTimes(point_id) {
	  var url ="${ctx}/dtaqDataInfoQuery3Action.do?method=showComparePointTimes&point_id="+point_id+"&type_kind=${info.type_id.type_kind}&startDate=${startDate}&endDate=${endDate}";
	   art.dialog({id:'commonDialog1',title:'数据明细', iframe:url, width:'800', height:'440',top:'10'});
	}
function findSiteTD(o){
	if (o.nodeName=="TR"||o.nodeName=="TABLE") return;
	if(o.nodeName=="TD")
	   return (o);
	else
	   return (o.parentElement);
}

function showComparePointTimes(point_id,type_kind) {

		
		var sheight = screen.height;
		var swidth = screen.width;
		var url ="${ctx}/dtaqDataInfoQuery3Action.do?andomCode=abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890&method=showComparePointTimes&point_id="+point_id+"&type_kind="+type_kind+"&qstartDate=${beginMonDate}&qendDate=${endDatePic}&from=data";
		window.open(url,'','height='+sheight+',width='+swidth+',top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no,titlebar=no')
			
		//  var url ="${ctx}/dtaqDataInfoAction.do?method=showComparePointTimes&point_id="+point_id+"&type_kind="+type_kind+"&qstartDate=${beginMonDate}&qendDate=${endDatePic}&from=data";
		//  art.dialog({id:'commonDialog1',title:'数据分析', iframe:url, width:'900', height:'500',top:'10'});
	
}

function backToList() {
  location.href='warnAnalysisSignAction.do?method=queryList&queryFlag=t&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qorganType=${param.qorganType}';

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
				<td><div id="warn_state" class="state${data.warn_state}"></div></td>
				<td><div align="center" class="warn_memo">${data.warn_memo}</div></td>
				<td>
					<div align="center">
	    				<input type="button" value="时序曲线" class="button1" onclick=" showComparePointTimes('${data.point_id.point_id}','${data.info_id.type_id.type_kind}')">
	    			</div>
	    		</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	 
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
<legend>被下发人员列表</legend>
<table class="listTable" id="fileTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1" >
	<thead>
		<tr align="center" height="25" id="trSite">
	  <th width="10%">序号</th>
	  <th width="35%">所属单位/部门</th>
	  <th width="20%">员工姓名</th>
	  <th width="20%">员工工号</th>
	  <th width="15%">员工性别</th>
	</tr>
	</thead>
	
	<c:set value="1" var="index" />
	<c:forEach items="${employees}" var="employee">
	  <tr bgcolor="#E5EAF5" align="center">
		<td>${index}</td>
		<td>${employee.e_org.f_name}</td>
		<td>${employee.employee_name}</td>
		<td>${employee.employee_code}</td>
		
		<td><ex:dicDisplay dictIdentify="EmployeeSex" dictValue="${employee.employee_sex}"/></td>
	  </tr>
		<c:set value="${index+1}" var="index" />
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
							
				         
							<td style="display:none">${sign.signer}</td>
						</tr>
						<c:set var="idx" value="${idx+1}"/>
					</c:forEach>
				</table>
			</td>
		</tr>
		
		</table>
</fieldset>
	<div class="saveDiv">
						   	<html:button property="back"  styleClass="backButton" value="${texts['button.back']}" onclick="backToList()" />
			           </div>
</body>
</html:html>

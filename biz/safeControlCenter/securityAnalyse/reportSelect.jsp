<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="situation.report.title"/></title>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/restrictLines.js"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
		jQuery(document).ready(function(){
			   getLines('${param.lineId}','${param.segmentId}');
		    getSections('${param.lineId}','${param.segmentId}');
		    getWokPoints('${param.segmentId}','${param.stationId}');
			  restrictTypes('${param.qstationId}','${param.qtypeId}');
			  })


function centerLayer( obj ) {   
    var ocw = obj.clientWidth;   
    var och = obj.clientHeight;   
    var bsl = document.body.scrollLeft || document.documentElement.scrollLeft;   
    var bst = document.body.scrollTop || document.documentElement.scrollTop;   
    var bcw = document.body.clientWidth || document.documentElement.clientWidth;   
    var bch = document.body.clientHeight || document.documentElement.clientHeight;   
    var osl = bsl + Math.floor( ( bcw - ocw ) / 2 );   
        osl = Math.max( bsl , osl );   
    var ost = bst + Math.floor( ( bch - och ) / 2 );   
        ost = Math.max( bst , ost );   
    obj.style.left  = osl + 'px';   
    obj.style.top   = ost + 'px';   
}   

function closeLayer(){   
    massage_box.style.visibility='hidden';    
    mask.style.visibility='hidden';//关闭子窗口   
}   
  
function openLayer(){   
    mask.style.visibility='visible';   
    massage_box.style.visibility='visible';   
    var obj = document.getElementById('massage_box');   
    centerLayer( obj );   
}

function loadMessage(message){
	openLayer();
	var oDiv = document.getElementById("messageDiv");
	oDiv.innerHTML=message;	
 	var time =".";
 	setInterval(function(){
 		try{
 			if(oDiv&&oDiv.innerHTML){
 				if(time.length<5){
 					time += "." ;
 				}else{
 					time="." ;
 				}
 				oDiv.innerHTML=message+time;
 			}
 		}
 		catch(er){
 		}	
 	},300); 
}

function submitValue(){
	var station_id = jQuery("[name='stationId']").val();
	var info_type = jQuery("[name='info_type']").val();
	var beginDate = jQuery("[name='beginDate']").val();
	var endDate = jQuery("[name='endDate']").val();
	var errors = "";
	var focusFields = "";
	if(station_id == ""){
		errors += "工点 为必选项\n";
	}
	if(info_type == ""){
		errors += "监测方 为必选项\n";
	}
	if(beginDate == "" || endDate == ""){
		errors += "填报日期 为必选项\n";
	}
	if(errors != ""){
		alert(errors);
		return false;
	}
	return true;
}

function exportFile(export_type){
	this.forwardType = export_type;
	var station_id = jQuery("[name='stationId']").val();
	var info_type = jQuery("[name='info_type']").val();
	var recordDate = jQuery("[name='recordDate']").val();
	//如果为html报表
	if(this.forwardType == "1"){
		//loadMessage("${texts['situation.analyse.load_data']}");
		parent.forwardReport(station_id,recordDate,info_type);
	}else if(this.forwardType == "2"){
		//loadMessage("${texts['situation.analyse.load_data']}");
		parent.exportFile(station_id,recordDate,info_type,this.forwardType);
	}else if(this.forwardType == "3"){
<%--		parent.loadMessage("${texts['situation.analyse.load_data']}");--%>
		parent.exportFile(station_id,recordDate,info_type,this.forwardType);
		parent.sSuc("b1");
	}
}

</script>

</head>
<body onload="">
<fieldset>
  	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dtaqSecurityAnalyseAction.do?method=displayQueryWindow&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table align="left">
						<tr>
								<td>线路：</td>
							    <td >
							    	<select style="width: 240px" id="qlineId" name="lineId" onchange="getSections(this.value,'')"></select>
							    </td>
							    <td>标段：</td>
							    <td>
							     	<select id="qsectionId" name="segmentId" onchange="getWokPoints(this.value,'')"></select>
							    </td>
					 	</tr>
					 	<tr>
							    <td>车站/区间：</td>
							    <td>
							    	<select id="qworkPointId" name="stationId" onchange="restrictTypes(this.value,'')"></select>
							    </td>
							    <td align="right">第三方/施工方：</td>
								<td>
									<html:select property="info_type">
										<html:option value="T">第三方</html:option>
										<html:option value="O">施工方</html:option>
									</html:select>
								</td>
						</tr>
						
						<tr>
						 		<td>填报日期：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								
								<td align="right">
									<input type="submit" value="查询" icon="icon_query" />
								</td>
								</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
</fieldset>
<c:if test="${record_dates != null}">
<fieldset>
	<legend>查询结果</legend>
	<html:form action="dtaqSecurityAnalyseAction">
		<table width="100%" border="0" cellspacing="4" cellpadding="2">
			<tr>
				<td width="130px">
					&nbsp;&nbsp;报表数据的可选日期
				</td>
				<td>
					<html:select property="recordDate">
						<c:forTokens items="${record_dates}" delims=", " var="record_date">
							<html:option value="${record_date}">${record_date}</html:option>
						</c:forTokens>
					</html:select>
				</td>
				<td>
					<html:radio property="radio_print" value="1" onclick="exportFile('1')"/>html报表&nbsp;&nbsp;
			 		<html:radio property="radio_print" value="2" onclick="exportFile('2')"/>pdf报表&nbsp;&nbsp;
			 		<html:radio property="radio_print" value="3" onclick="exportFile('3')"/>导出excel&nbsp;&nbsp;
				</td>
			</tr>
		</table>
 	</html:form>
</fieldset>
</c:if>
<c:if test="${messageStr != null}">
<div align="center">
	<font color="red" size="2"><strong>提示：安全形势分析在该工点、监测方、填报日期下不存在监测数据报表信息！</strong></font>
</div>
</c:if>
<div id="massage_box"><div class="header" id="messageDiv"></div></div>  
<div id="mask"></div> 
</body>
</html:html>
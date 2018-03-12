<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>

<ex:bundle/>
<html:html>
<head>
<title>监测数据报表信息</title>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<style type="text/css">
* {margin:0;padding:0;}
html {background:#FFFFFF;}
body {background-color:#ffffff;text-align:left;font:normal 12px/1.6em simsun, Verdana, Lucida, Arial, Helvetica, sans-serif;color:#353535;}
input.button{
	/*用于普通button*/
	
	BORDER-RIGHT: #2C59AA 1px solid;
	PADDING-RIGHT: 2px; 
	BORDER-TOP: #2C59AA 1px solid; 
	PADDING-LEFT: 2px; 
	FONT-SIZE: 12px;
	FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#D7E7FA); 
	BORDER-LEFT: #2C59AA 1px solid; 
	CURSOR: hand; 
	COLOR: black; 
	PADDING-TOP: 2px; 
	BORDER-BOTTOM: #2C59AA 1px solid;
}	
ol,ul {list-style:none;}
a {text-decoration:none;color:#353535;}
a:hover {color:#CD0102;}
#contain {width:970px;overflow:hidden;_zoom:1;margin:0 auto;display:inline; white-space:nowrap}
.mainBox {float:left;width:100%;height:auto;overflow:hidden;_zoom:1;}
.smallBox{position:relative;padding:10px;width:98% ;background-color:#ffffff;float:left;border:0px solid #B6CAE3;}
.showcontent {color: #4A4949;}
.tmpRow {background-color: #F8F5F4;}
.smallBox .submenu{text-align:left;font-weight:bold;font-size:14px;left:0px; background:#F2F6FB;top:0px;width:100%;z-index:1;height:26px;line-height:26px;border:1px solid #B6CAE3;}
.smallBox .content{left:0px; background:#ffffff;top:0px;z-index:1;border:1px solid #B6CAE3;border-top:0px solid #B6CAE3;}
.smallBox .submenu{font-weight: bold;font-size: 13px;background: #E1F0F8;line-height: 26px;width: 100%;height: 26px;border: 1px solid #B6CAE3;}
.smallBox .content{width:100%;}
.smallBox h4 {float:left;width:152px;height:26px;margin:-1px -1px 0;line-height:26px;text-align:center;font-size:12px;font-weight:normal;border:1px solid #B6CAE3;border-right:0;background:#F2F6FB;cursor:pointer;}
#contain .more{ text-align:right;padding-right:30px}
#mycontain {border:1px solid #B6CAE3;height:auto;background-color:#fff;}
#mycontain .menu{font-size:15px;font-weight:bold;text-align:center;background:#F1F5F8;border-bottom:1px solid #B6CAE3;height:30px}
#mycontain .footer	{background:#F1F5F3;text-align:center;}	
#nav_div{background:#BBB;border:2px double #000000;position:fixed;right:0px;bottom:0px;height:200px;width:200px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
})
var d1 = new Date();
function fun(){
	d2 = new Date();
	diff = (d2.getTime() - d1.getTime())/1000;
	diff = Math.round(diff);
	second = diff % 60;
	minute = Math.round((diff-30)/60);
	second = (second<10)?"0"+second:second;
	minute = (minute<10)?"0"+minute:minute;
	document.all.show.innerHTML="您在本页面已停留:"+ minute + "分" + second+"秒";
}
setInterval("fun()",1000);	
function initOpinion() {
	var opinion = jQuery("[name='opinion']").val();
	if('${opinion}' != null && '${opinion}' != ""){
		jQuery("#opinion").val('${opinion}') ;
		var heit = document.body.scrollHeight;
		scroll(0,heit) ;
	
	
	}else if(opinion == null || opinion == ""){
		jQuery("#opinion").val('${defaultValue}') ;
	}
}

function setOpinion(){
	var opinion = jQuery("[name='opinion']").val();
	if(opinion == '${defaultValue}'){
		jQuery("#opinion").val("") ;
	}
}

function selectRadio(value){
	$("opinion").value = value;
}

var editSigner="";
var editSigndate="";
var editOpinion="";
var rowsIndex = null;
var deleteId = null;
var deleteState = null;
function saveHistory(){
	var extendid = jQuery("[name='extendid']").val();
	if(extendid == ""){
		alert("保存失败!");
	}else{
		var station_id = jQuery("[name='station_id']").val();
		var opinion = jQuery("[name='opinion']").val();
		var model = jQuery("[name='model']").val();
		if(deleteState != null){
			var url =  "${ctx}/safeAnalysisTotalAction.do?method=saveHistory";
		    var myajax = new Ajax.Request(url, {method:"post", parameters:"extedid="+extendid+"&model="+model+"&station_id="+station_id+"&deleteId="+deleteId, onComplete:responseHistoryInfo});//实现ajax请求
		}else{
			if(opinion !=""){
				$("opinion").value = "";
			    var rodias = document.getElementsByName("signRadio1");
			    for(var i=0; i<rodias.length;i++){
			    	rodias[i].checked = false;
			    }
				if(rowsIndex != null){
					var tableObj = document.getElementById("tableObj");
					tableObj.deleteRow(rowsIndex);
				}
				$.ajax({
				type: "post",
				data: "opinion="+opinion,
				url: "safeAnalysisTotalAction.do?method=saveHistory&extedid="+extendid+"&model="+model+"&station_id="+station_id+"&deleteId="+deleteId,
				success:function(msg){
				var url ="safeAnalysisTotalAction.do?method=viewAnalysisReport&forwardType=viewAnalysisReport&analyse_id=${situationAnalyse.fid}&displayType=${displayType}";
				location.href=url;
				}
				})
			}else{
				alert("保存失败!");
			}
		}
	}
}

function setcheckUser(text){
	return text;											
}

function responseHistoryInfo(selRequest){
	var tableObj = document.getElementById("tableObj");
	if(tableObj.rows.length > 1){
		for(var j=tableObj.rows.length-1;j>=1;j--){
			tableObj.deleteRow(j); 
		}
	}
	var textStr = selRequest.responseText;
	if(textStr != null && textStr != ""){
		var textList = textStr.split("||");
		for(var m=0; m<textList.length; m++){
			var text = textList[m].split("@");
		    var currentRow = tableObj.insertRow();
		    currentRow.align = "center";
		    currentRow.height = "20";
		    currentRow.style.backgroundColor="#F8F5F4";
		    for(var i=0; i<9; i++){
		        currentRow.insertCell();
		    }
	    	var empnames = text[2].split(",");
			var htmlStr = "<div class='divClass'><a class='min' href='#'  onmouseover=\"contentMouse('"+parseInt(m+1)+"')\" onmouseout=\"contentMouseOut(\'"+parseInt(m+1)+"\')\">";
			htmlStr += "<span id='cengContent_"+parseInt(m+1)+"' class='spanClass'><span style='cursor:hand;width:90%;margin-top:2px;color:#4C78A6;border-bottom:1px dashed #6B7278' onclick=\"displayMailBox(\'"+parseInt(m+1)+"\',\'"+empnames[1]+"\','${fid}')\">发送站内消息</span>";
			if(empnames[2] != " "){
				htmlStr += "<br>";
			}
			htmlStr +="</span><font color='#4C78A6'><strong>"+empnames[0]+"</strong></font></a></div>";
		    currentRow.cells(1).innerHTML = htmlStr;
		    currentRow.cells(2).innerText = text[3];
		    currentRow.cells(3).innerText = text[4];
		    currentRow.cells(4).innerText = text[5];
		    currentRow.cells(4).className ="opinion";
		    varHtml = '<input type="button" id="delete" class="button2" value="删除" onclick="removeMySiteRow('+text[1]+',this)"/>'
		    varHtml += '&nbsp;<input type="button" id="delete" class="button2" value="修改" onclick="editMySiteRow('+text[1]+',this)"/>'
		    var historyId = '${historyId}';
		    if(historyId != text[6]){
		    	varHtml = '&nbsp;';
		    }
		    currentRow.cells(5).innerHTML = varHtml;
		    currentRow.cells(6).innerText = text[6];
		    currentRow.cells(6).style.display="none";
		    currentRow.cells(7).innerText = text[1];
		    currentRow.cells(7).style.display="none";
		    currentRow.cells(8).innerText = text[5];
		    currentRow.cells(8).style.display="none";
		}
	    var rowsLength = tableObj.rows.length;
	    if(rowsLength > 1){
	       for(var i = 1;i < rowsLength;i++){
		      tableObj.rows(i).cells(0).innerText = i;
	       }
		}
		rowsIndex = null;
		deleteId = null;
		deleteState = null;
	}
	$.ajax({
				type: "post",
				url: "${ctx}/safeAnalysisTotalAction.do?method=findTop3History&station_id=${station_id}",
				success:function(msg){
				responseHistoryTop3Info(msg)
				}
				})
}

function responseHistoryTop3Info(selRequest){
	var text = selRequest.responseText;
	var tableObj = document.getElementById("historyTable");
	if(text != null && text != ""){
		if(tableObj.rows.length > 1){
			for(var j=tableObj.rows.length-1;j>=1;j--){
				tableObj.deleteRow(j); 
			}
		}
		text = text.split("&");
		for(var i=0; i<text.length; i++){
			var info = text[i].split("@");
			var currentRow = tableObj.insertRow();
		    currentRow.align = "center";
		    currentRow.style.backgroundColor="#F8F5F4";
		    currentRow.insertCell();
		    currentRow.insertCell();
		    currentRow.height=20;
		    currentRow.cells(0).innerText = info[0];
	    	currentRow.cells(1).innerText = info[1];
	    	currentRow.cells(1).className = "opinion";
		}
	}else{
		if(tableObj.rows.length > 1){
			for(var j=tableObj.rows.length-1;j>=1;j--){
				tableObj.deleteRow(j); 
			}
		}
	}
}

 function removeMySiteRow(id,ob){
    var tableId = document.getElementById("tableObj");
	if(window.confirm("确定删除？")){
		if(id != null && id != ""){
			var tableObj = document.getElementById("tableObj");
			 o = findSiteTD(event.srcElement);
		    ($(ob).parent().parent()).remove();
		    var url='safeAnalysisTotalAction.do?method=saveSign&analyse_id=${situationAnalyse.fid}&displayType=${displayType}&id='+id+'&dialog=t&station_id=${station_id}&delete=d';
		    location.href=url
		}
	}
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

function findSiteTD(o){
	if (o.nodeName=="TR"||o.nodeName=="TABLE") return;
	if(o.nodeName=="TD")
	   return (o);
	else
	   return (o.parentElement);
}
function editMySiteRow(id,opinion,ob){

 var tableId = document.getElementById("tableObj");
	
		if(id != null && id != ""){
			var tableObj = document.getElementById("tableObj");
			 o = findSiteTD(event.srcElement);
		    ($(ob).parent().parent()).remove();
		    var url='safeAnalysisTotalAction.do?method=saveSign&analyse_id=${situationAnalyse.fid}&displayType=${displayType}&id='+id+'&station_id=${station_id}&dialog=t&delete=d&opinion='+opinion;
		    location.href=url;
		}
	
}

function responseDeleteInfo(selResponse){
$.ajax({
				type: "post",
				url: "${ctx}/safeAnalysisTotalAction.do?method=findTop3History&station_id=${station_id}",
				success:function(msg){
				responseHistoryTop3Info(msg)
				}
				})
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

function findSiteTD(o){
	if (o.nodeName=="TR"||o.nodeName=="TABLE") return;
	if(o.nodeName=="TD")
	   return (o);
	else
	   return (o.parentElement);
}

function toTop(){
	scroll(0,0) ;
}
</script>
</head>
<body onload="initOpinion();">
<c:if test="${displayType == 'report'}">
	<c:if test="${situationAnalyse.fckContent != null}">
			<div class="submenu"><font color="orange">&nbsp;</font></div>
			<div class="content">
				<c:out value='${situationAnalyse.fckContent}' escapeXml="false"></c:out>
			</div>
	</c:if>
</c:if>
<c:if test="${displayType == 'description'}">
	<div class="smallBox">
		<div class="submenu">
			<span style="margin-left: 20px"><font color="#0B273C"><strong>${station_name}安全分析评估及综合建议
				</strong>
			</font></span>
		</div>
		<div class="content" align="center">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<c:if test="${situationSuggest.fileContent != null}">
				<tr>
					<td><br><c:out value='${fileContent}' escapeXml="false"></c:out></td>
				</tr>
			</c:if>
			<c:if test="${situationAnalyse.situation_discription != null}">
				<tr>
					<td><br>${situationAnalyse.situation_discription}</td>
				</tr>
			</c:if>
			<c:if test="${situationAnalyse.suggestion != null}">
				<tr>
					<td><br><br>${situationAnalyse.suggestion}</td>
				</tr>
			</c:if>
		</table>
		</div>
	</div>
	<div class="smallBox">
			<div class="submenu" align="left" style="border-color: #D5E2E4">
				<table border="0" style="margin-left:20px; margin-top: 5px;" cellpadding="0" cellspacing="0">
					<tr>
						<td width="80%">
							<font color="#0B273C" size="2"><strong>
								安全形势分析批阅记录<font color="#075CAF">(<label id="show">您在本页面已停留:00分00秒</label>)</font>&nbsp;
								今日访问本页面次数:${visitCount}，访问用户:</strong></font>
						</td>
						<td width="20%">
							<font color="#075CAF" size="2"><strong><marquee direction="left" scrollamount=3 onMouseOver="this.stop()" onMouseOut="this.start()">${visitPerson}</marquee></strong></font>
						</td>
					</tr>
				</table>
			</div>
			<div align="center" class="content" style="border-top: none;margin-top:1px;">
			 	<table id="tableObj" width="100%" border="1" cellpadding="0" cellspacing="0" bordercolorlight="#DDDDE0" bordercolordark="#ffffff"  align="center">
					<tr align="center"  bgcolor="#E1F0F8"  style=" color: #0B333C" height="25" bordercolorlight="#DDDDE0" bordercolordark="#E1F0F8" id="trSite">
						 <td width="5%">序号</td>
						 <td width="10%">批阅人</td>
						 <td width="15%">所属部门</td>
						 <td width="13%">批阅日期</td>
						 <td width="45%">批阅意见</td>
						 <td width="12%">操作</td>
					  </tr>
					<c:set var="idx" value="0"/>
				  	<c:forEach items="${historylist}" var="historylist">
			  		<tr align="center" height="20" bgcolor="#F8F5F4" class="showcontent">
						<td>${idx+1}</td>
						<td><ex:employeeName id="${historylist.signer}"/></td>
						<td><ex:orgDisplay  id="${historylist.deptid}" /></td>
						<td><fmt:formatDate value="${historylist.signdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="opinion">${historylist.opinion}</td>
						<td>
						 <c:if test="${historyId != null && historyId == historylist.signer}">
				         	<input type="button"  class="btn_delete" value="删除" onclick="removeMySiteRow('${historylist.id}',this)"/>
				         	<input type="button"  class="btn_edit" value="修改" onclick="editMySiteRow('${historylist.id}','${historylist.opinion}',this)"/>
				         </c:if>
				         </td>
						<td style="display:none">${historylist.signer}</td>
						<td style="display:none">${historylist.id}</td>
						<td style="display:none">${historylist.opinion}</td>
					</tr>
					<c:set var="idx" value="${idx+1}"/>
					</c:forEach>
				</table>
			</div>
		</div>
			<table width="98%">
				<tr align="right">
					<td height="26px"><img height="26px" width="30px" alt="返回顶部" src="${ctx}/images/toTop.gif" onclick="toTop()" />&nbsp;&nbsp;</td>
				</tr>
			</table>
			<div class="smallBox">
				<div class="submenu" align="left" style="border-color: #D5E2E4">
					<span style="margin-left: 20px;font-color:#0B273C">您最近的前3条记录</span>
				</div>
				<div align="center" class="content" style="border-top: none;margin-top:1px;">
					 <table id="historyTable" width="100%" border="1" cellpadding="0" cellspacing="0" bordercolorlight="#DDDDE0" bordercolordark="#ffffff"  align="center">
						<tr align="center"  style=" color: #0B333C"  bgcolor="#E1F0F8" height="25" bordercolorlight="#DDDDE0" bordercolordark="#E1F0F8" id="trSite">
							 <td width="25%">批阅日期</td>
							 <td width="75%">批阅意见</td>
						  </tr>
							<c:if test="${topHistory3List != null}">
							  <c:forEach items="${topHistory3List}" var="history3list">
					  			<tr align="center" height="20"  bgcolor="#F8F5F4" class="showcontent">
									<td><fmt:formatDate value="${history3list.signdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td class="opinion">${history3list.opinion}</td>
					  		  	</tr>
					  		  </c:forEach>
							</c:if>
					</table>
				</div>
				<div class="submenu" align="left" style="margin-top:10px;">
					<span style="margin-left: 20px"><font color="#0B273C">批阅意见</font></span>
				</div>
				<div align="center" class="content" style="border-top: none;margin-top:1px;">
					 <html:form action="safeAnalysisTotalAction.do" method="POST" styleClass="form">
					    <input type="hidden" name="method" value="saveHistory"/> 
						<html:hidden property="extendid" value="${situationAnalyse.fid}"/>
						<html:hidden property="model" value="situationAnalyse"/>
						<html:hidden property="state" value="0"/>
						<html:hidden property="type"/>
						<div >
						    <table width="100%" border="0" align="center" cellpadding="1" bgcolor="#BED0E2" cellspacing="1" class="tableblue">
								<COLGROUP>
									<COL class="tr03" align="right" width="20%">
									<COL class="tmpRow" width="30%">
									<COL class="tr03" align="right" width="20%">
									<COL class="tmpRow" width="30%">
								</COLGROUP>
							     <tr height="30px">
							    	<td style="color:#0B333C">批阅人</td>
							    	<td>
								    	<ex:employeeName id="${userInfo.empId}"/>
								    	<html:hidden property="signer" value="${userInfo.empId}"/>
							    	</td>
							    	<td style="color:#0B333C">批阅时间</td>
							    	<td>
								    	 <input type="text" name="signdate" value="<fmt:formatDate value='${currDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly" class="text">
							    	</td>
							    </tr>
							    <tr>
							    	<td style="color:#0B333C">批阅意见</td>
							    	<td colspan="3">
								    	<html:textarea property="opinion" styleId="opinion" cols="80" rows="6" onfocus="setOpinion()" onblur="checkTextarea('opinion',1000)" onkeydown="textCounter('opinion','spanSummary',1000)" onkeyup="textCounter('opinion','spanSummary',1000)"/>
								    	<span class="req" id="spanSummary">1000字符以内</span>
							    	</td>
							    </tr>
							    <tr bgcolor="#E1F0F8">
						           <td align="center" colspan="4">
						           		<div align="center" class="sb_div">
											<html:hidden property="fid" value="${fid}" />
											<html:hidden property="station_id" value="${station_id}" />
											<input type="button" class="saveButton" value=" 批 阅 " onclick="saveHistory()"/>
									   	<div>
						           </td>
				           		</tr>
								</table>
							</div>
						</html:form>
					</div>
			 </div>
</c:if>
</body>
</html:html>
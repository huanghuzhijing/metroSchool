<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>

<content tag="heading">
内部工作日志评价
</content>
<script src="${ctx}/scripts/jquery-1.2.6.js" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<link rel="StyleSheet" href="${ctx}/styles/main.css" type="text/css" />
<link rel="StyleSheet" href="${ctx}/styles/def_table.css" type="text/css" />
<style type="text/css">
.mainBox {float:left;width:100%;height:auto;overflow:hidden;_zoom:1;}
.smallBox{
position:relative;
padding:10px;

width:459px;background-color:#ffffff;float:left;border:0px solid #B6CAE3;

}
.showcontent {
	color: #4A4949;
}
.tmpRow {
	background-color: #F8F5F4;
}

.smallBox .submenu{text-align:left;font-weight:bold;font-size:14px;left:0px; background:#F2F6FB;top:0px;width:100%;z-index:1;height:26px;line-height:26px;border:1px solid #B6CAE3;}

.smallBox .content{left:0px; background:#ffffff;top:0px;z-index:1;border:1px solid #B6CAE3;border-top:0px solid #B6CAE3;}

.smallBox .submenu{
		font-weight: bold;
	font-size: 13px;
	background: #E1F0F8;
	line-height: 26px;
	width: 100%;
	height: 26px;
	border: 1px solid #B6CAE3;
}

.smallBox .content{width:100%;}

.smallBox h4 {float:left;width:152px;height:26px;margin:-1px -1px 0;line-height:26px;text-align:center;font-size:12px;font-weight:normal;border:1px solid #B6CAE3;border-right:0;background:#F2F6FB;cursor:pointer;}

#contain .more{ text-align:right;padding-right:30px}

#mycontain {border:1px solid #B6CAE3;height:auto;background-color:#fff;}
#mycontain .menu{font-size:15px;font-weight:bold;text-align:center;background:#F1F5F8;border-bottom:1px solid #B6CAE3;height:30px}
#mycontain .footer	{background:#F1F5F3;text-align:center;}	
#nav_div{
	background:#BBB;
	border:2px double #000000;
	position:fixed;
	right:0px;
	bottom:0px;
	height:200px;
	width:200px;                            
 }
 
 
 
 .table_borwse{
 margin-left:8px;
 margin-right:5px;
<%-- margin:1%;--%>
 width:98%;
 border:1px;
 border-collapse:collapse;border-spacing:0;
}

.table_borwse tr{
 /*background-color:#fff;*/
 text-align:center;
 }
 
  .table_borwse th{
 border:1px solid #BED0E2;
 color:#1F4A65;
 background-color:#F6FEEB;
 background-image:url(${ctx}/images/titlebg.gif);
 height:23px;
 }
 
.table_borwse tr:hover{
 background-color:#EAFCD5;
 }
 .table_borwse td{
 border:1px solid #BED0E2;
 }

<%--th,td{--%>
<%--text-align:left;--%>
<%--}--%>
th{
cursor:pointer;}
.contentDiv{
display:none;
border:#ABE3FC solid 1px;
margin:3px;
}
.follow{
margin:3px;
border:#ABE3FC solid 1px;
}
textarea{
margin:1px;
width:98%;
height:50px;}
.followHistory{
display:none;
margin:3px;
border:#ABE3FC solid 1px;
}
</style>
<script type="text/javascript">	
var editSigner="";
var editSigndate="";
var editOpinion="";
var rowsIndex = null;
var deleteId = null;
var deleteState = null;
jQuery.noConflict();
jQuery(function(){
	jQuery("th").toggle(
		function(){
			jQuery(this).parent().next("tr").find(".contentDiv").show(200);
		},
		function(){
			jQuery(this).parent().next("tr").find(".contentDiv").hide(200);
		}
	);
});


function saveHistory(){
//   alert("deleteId----"+deleteId)
	var appraisal_id = jQuery("[name='appraisal_id']").val();
	var history_content = jQuery("[name='history_content']").val();
//	alert("appraisal_id----"+appraisal_id);
//	alert("history_content----"+history_content);
//	alert("deleteState----"+deleteState);
	if(deleteState != null){
//		var url =  "${ctx}/maWorkLogAppraisalAction.do?method=saveHistory";
//	    var myajax = new Ajax.Request(url, {method:"post", parameters:"appraisal_id="+appraisal_id+"&deleteId="+deleteId, onComplete:responseHistoryInfo});//实现ajax请求
	$.ajax({
					type: "POST",
					url: "${ctx}/maWorkLogAppraisalAction.do?method=saveHistory",
					data: "appraisal_id="+appraisal_id+"&deleteId="+deleteId,
					success: function(msg){
						responseHistoryInfo(msg);
					}
				});
	
	}else{
		if(history_content !=""){
			$("history_content").value = "";
	//		alert("rowsIndex----"+rowsIndex);
			if(rowsIndex != null){
				var tableObj = document.getElementById("tableObj");
				tableObj.deleteRow(rowsIndex);
			}
			$.ajax({
					type: "POST",
					url: "${ctx}/maWorkLogAppraisalAction.do?method=saveHistory",
					data: "appraisal_id="+appraisal_id+"&history_content="+history_content+"&deleteId="+deleteId,
					success: function(msg){
						responseHistoryInfo(msg);
					}
				});
			//var url =  "${ctx}/maWorkLogAppraisalAction.do?method=saveHistory";
		    //var myajax = new Ajax.Request(url, {method:"post", parameters:"appraisal_id="+appraisal_id+"&history_content="+history_content+"&deleteId="+deleteId, onComplete:responseHistoryInfo});//实现ajax请求
		}else{
			alert("请输入评价意见!");
		}
	}
}

function responseHistoryInfo(selRequest){
	var tableObj = document.getElementById("tableObj");
	if(tableObj.rows.length > 1){
		for(var j=tableObj.rows.length-1;j>=1;j--){
			tableObj.deleteRow(j); 
		}
	}
	//var textStr = selRequest.responseText;
	var textStr = selRequest

	if(textStr != null && textStr != ""){
		var textList = textStr.split("||");
		
		for(var m=0; m<textList.length; m++){
			var text = textList[m].split("@");
	//		alert("text"+text);
		    var currentRow = tableObj.insertRow();
		    currentRow.align = "center";
		    currentRow.style.backgroundColor="#F8F5F4";
		    
		    currentRow.insertCell().innerText=m+1;
		    currentRow.insertCell().innerText = text[2];
		    currentRow.insertCell().innerText = text[3];
		    currentRow.insertCell().innerText = text[4];
		   currentRow.insertCell().innerText = text[5];
		    currentRow.insertCell().className ="opinion";
		    var varHtml = '<input type="button" id="delete" class="button1" value="删除" onclick="removeMySiteRow('+text[1]+')"/>'
//		    varHtml += '&nbsp;<input type="button" id="delete" class="button1" value="修改" onclick="editMySiteRow('+text[1]+')"/>'
		    var historyId = '${login_empid}';
		    if(historyId != text[6]){
		    	varHtml = '&nbsp;';
		    }
		   
		   currentRow.insertCell().innerHTML = varHtml;
//		    currentRow.insertCell().innerText = text[6];
//		    currentRow.insertCell().style.display="none";
//		    currentRow.insertCell().innerText = text[1];
//		    currentRow.insertCell().style.display="none";
//		   currentRow.insertCell().innerText = text[5];
//		   currentRow.insertCell().style.display="none";
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
}

function removeMySiteRow(id){
//    var tableId = document.getElementById("tableObj");
    
	if(window.confirm("是否确定删除该条评价记录？")){
		if(id != null && id != ""){
		     deleteId=id;
	    
			var tableObj = document.getElementById("tableObj");
		    o = findSiteTD(event.srcElement);  //event.srcElement意思是"获得触发事件的元素",就是删除按钮所在的列td
		    rowsIndex = o.parentElement.rowIndex*1;
		//    alert("rowsIndex-----"+rowsIndex);
		   // deleteId =  tableObj.rows(rowsIndex).cells(7).innerText;
		   // alert("deleteId是"+deleteId);
		    deleteState = "Y";
		  
			saveHistory();
		}
	}
}
 
// function editMySiteRow(id){
 //   var tableObj = document.getElementById("tableObj");
 //   o = findSiteTD(event.srcElement);
 //   rowsIndex = o.parentElement.rowIndex*1;
 //   deleteId =  tableObj.rows(rowsIndex).cells(7).innerText;
//    var opinion = tableObj.rows(rowsIndex).cells(8).innerText;
//    $("history_content").value = opinion;
//}

function findSiteTD(o){
	if (o.nodeName=="TR"||o.nodeName=="TABLE") return;
	if(o.nodeName=="TD")
	   return (o);
	else
	   return (o.parentElement);
}

function windowClose(rowIndex,appraisal_id){

	parent.art.dialog({id:'dialog1'}).close();
}

function initOpinion() {
	var opinion = jQuery("[name='history_content']").val();
	if(opinion == ""){
		$("history_content").value = "已评价";
	}
}

function setOpinion(){
	var opinion = jQuery("[name='history_content']").val();
	if(opinion == "已评价"){
		$("history_content").value = "";
	}
}

function toTop(){
	scroll(0,0) ;
}


</script>
</head>
<body onload="initOpinion();">
	<table class="table_borwse">
		<c:forEach items="${maSiteWorkLogList}" var="maSiteWorkLog">
	     	<tr>
	      		 <th align="left">
	       		 【<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maSiteWorkLog.maSiteWork.work_rank}"/>】【${maSiteWorkLog.maSiteWork.station.station_name}】${maSiteWorkLog.maSiteWork.work_name}
	      		 </th>
	     		 </tr>
	     		 <tr>
	         		<td>
	             		<div class="contentDiv" align="left">
	             			${maSiteWorkLog.maSiteWork.work_memo}<br/>
	             			创建人：<ex:employeeName id="${maSiteWorkLog.maSiteWork.creater}"/>&nbsp;&nbsp;
	             			创建时间：<fmt:formatDate value="${maSiteWorkLog.maSiteWork.creat_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
	             		</div>
	             		<div class="follow" align="left">
	              			<html:textarea property="work_log_content" readonly="true" value="${maSiteWorkLog.log_content}" />
	             			<br/>
	             			填报状态：
	             			<c:if test="${maSiteWorkLog.continue_status == '0'}">
	             				进行中
	             			</c:if>
	             			<c:if test="${maSiteWorkLog.continue_status == '1'}">
		             			处理完成
	             			</c:if>
		             		&nbsp;&nbsp;填报日期：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${maSiteWorkLog.log_date}"/>
	               </div>
	              </td>
	          </tr>
		</c:forEach>
		<c:forEach items="${maGeneralWorkLogList}" var="maGeneralWorkLog">
			<tr>
	     			<th align="left">
	     				【<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maGeneralWorkLog.maGeneralWork.general_rank}"/>】【${maGeneralWorkLog.maGeneralWork.general_type=='1'?'文档汇编':'需求报告'}】${maGeneralWorkLog.maGeneralWork.general_name}
	     			</th>
	     		</tr>
	     		 <tr>
	         		<td>
	             		<div class="contentDiv" align="left">
	             			${maGeneralWorkLog.maGeneralWork.general_memo}<br/>
	             			创建人：<ex:employeeName id="${maGeneralWorkLog.maGeneralWork.creater}"/>&nbsp;&nbsp;
	             			创建时间：<fmt:formatDate value="${maGeneralWorkLog.maGeneralWork.creat_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
	             		</div>
	             		<div class="follow" align="left">
	             				<html:textarea readonly="true" property="general_log_content" value="${maGeneralWorkLog.log_content}" />
	             			<br/>
	             			填报状态：
	             			<c:if test="${maGeneralWorkLog.continue_status == '0'}">
	             				进行中
	             			</c:if>
	             			<c:if test="${maGeneralWorkLog.continue_status == '1'}">
		             			处理完成
	             			</c:if>
		             		&nbsp;&nbsp;填报日期：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${maGeneralWorkLog.log_date}"/>
	               		</div>
	              </td>
	          </tr>
		</c:forEach>
	 </table> 
	<table width="100%">
		<tr align="right">
			<td height="26px"><img height="26px" width="30px" alt="返回顶部" src="${ctx}/images/toTop.gif" onclick="toTop()" />&nbsp;&nbsp;</td>
		</tr>
	</table>
	<div class="smallBox" style="width: 100%">
				<div class="submenu" align="left" style="border-color: #D5E2E4">
					<table border="0" style="margin-left:20px; margin-top: 5px;" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<font color="#0B273C" size="2"><strong>评价记录列表</strong></font>
							</td>
						</tr>
					</table>
				</div>
			<div align="center" class="content" style="border: none; margin-top: 1px;">
			 <table id="tableObj" width="100%" border="1" cellpadding="0" cellspacing="0"
						  bordercolorlight="#DDDDE0" bordercolordark="#ffffff"  align="center">
					<tr align="center"  bgcolor="#E1F0F8"  style=" color: #0B333C" height="25" bordercolorlight="#DDDDE0" bordercolordark="#E1F0F8" id="trSite">
						 <td width="5%">序号</td>
						 <td width="10%">评价人</td>
						 <td width="15%">所属部门</td>
						 <td width="15%">评价日期</td>
						 <td width="43%">评价意见</td>
						 <td width="12%">操作</td>
					  </tr>
					  <c:set var="idx" value="0"/>
					  	<c:forEach items="${historyList}" var="history">
					  		<tr align="center" height="20" bgcolor="#F8F5F4" class="showcontent">
								<td>${idx+1}</td>
								<td><ex:employeeName id="${history.history_emp}"/></td>
								<td><ex:orgDisplay id="${history.history_dept}" /></td>
								<td><fmt:formatDate value="${history.history_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="opinion">${history.history_content}</td>
								<td>
								 <c:if test="${userinfo.empId == history.history_emp}">
						         	<input type="button"  class="button1" value="删除" onclick="removeMySiteRow('${history.history_id}')"/>
<!--						         	<input type="button"  class="button1" value="修改" onclick="editMySiteRow('${history.history_id}')"/>-->
						         </c:if>&nbsp;
						         </td>
								<td style="display:none">${history.history_emp}</td>
								<td style="display:none">${history.history_id}</td>
								<td style="display:none">${history.history_content}</td>
							</tr>
							<c:set var="idx" value="${idx+1}"/>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="smallBox" style="width: 100%;">
				<div class="submenu" align="left">
										<span style="margin-left: 20px"><font color="#0B273C">评价意见</font>
										</span>
									</div>
									<div align="center" class="content"
										style="border: none; margin-top: 0px;">
					 <html:form action="maWorkLogAppraisalAction.do" method="POST" styleClass="form">
					    <input type="hidden" name="method" value="saveHistory"/> 
						<html:hidden property="appraisal_id" value="${appraisal_id}"/>
						<div >
						    <table width="100%" border="0" align="center"
													cellpadding="1" bgcolor="#BED0E2" cellspacing="1"
													class="tableblue">
									<COLGROUP>
									   
										<COL class="tr03" align="right" width="20%">
										<COL class="tmpRow" width="30%">
										<COL class="tr03" align="right" width="20%">
										<COL class="tmpRow" width="30%">
										
								    </COLGROUP>
								     <tr height="30px">
								    	<td style="color:#0B333C">评价人</td>
								    	<td>
									    	<ex:employeeName id="${userinfo.empId}"/>
									    	<html:hidden property="appraisal_emp" value="${userinfo.empId}"/>
								    	</td>
								    	<td style="color:#0B333C">评价时间</td>
								    	<td>
									    	 <input type="text" name="appraisal_date" value="<fmt:formatDate value='${currDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly" class="text">
								    	</td>
								    </tr>
								    <tr>
								    	<td style="color:#0B333C">评价意见</td>
								    	<td colspan="3">
									    	<html:textarea property="history_content" cols="80" rows="6" onfocus="setOpinion()" onblur="checkTextarea('history_content',1000)" onkeydown="textCounter('history_content','spanSummary',1000)" onkeyup="textCounter('history_content','spanSummary',1000)"/>
									    	<span class="req" id="spanSummary">1000字符以内</span>
								    	</td>
								    </tr>
								    <tr bgcolor="#E1F0F8">
					           <td align="center" colspan="4">
					           <div align="center" class="sb_div">
										<input type="button" class="saveButton" value=" 评 价 " onclick="saveHistory()" icon="icon_edit"/>
								   		<input type="button" value=" 关 闭 " class="backButton" onclick="windowClose('${rowIndex}','${appraisal_id}')" icon="icon_delete"/>
								   		<div>
					           </td></tr>
								</table>
							</div>
						</html:form>
					</div>
			 </div>
</body>
</html:html>
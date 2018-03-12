<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<style type="text/css">
.button2 {
	border-right: #3333ff 1px solid;
	border-top: #3333ff 1px solid;
	font-size: 9pt;
	border-left: #3333ff 1px solid;
	color: #3333ff;
	border-bottom: mediumpurple 1px solid;
	font-family: "verdana", "arial", "����";
	background-color: transparent;
	event: expression(onmouseover =   function() { 
 this . style . background = '#D1D8DD', this . style . color = '#1679AA'
}

</style>
<script language="javascript">
//var rule = "gif,jpg,jpeg,png,bmp";
var rule = "jpg";
function onchangeFile(fileObject){
	var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3}$/ig;
	var suffixError = "";
	var value = fileObject.value;
	if(filePath.test(value)==false){
		suffixError = "该文件未找到，请检查导入文件所在文件夹\n";
	}else{
		var ruleStr = ","+rule+",";
		var suffix = value.substring(value.lastIndexOf(".") + 1).toLowerCase();
		if(ruleStr.indexOf(","+suffix+",") <= -1){
			suffixError = "文件格式不合法,正确的文件格式为:" + rule;
		}
	}
	if(suffixError !=""){
		alert(suffixError);
		fileObject.outerHTML=fileObject.outerHTML.replace(/value=\w/g,'');
		return false;
	}
}


function validateData(object){
	var value = object.value;
	if(isNaN(value)){
		alert("该值必须为数字类型");
		object.value = "";
		object.focus();
	}
}
function init(){
	var fileCount = '${fileCount}';
	if(fileCount != "0"){
		var count = parseInt(fileCount) ;
		for(var i=1;i<=count;i++){
			var obj = jQuery("#tr"+i);
			if(obj.is(":hidden")){
				obj.show() ;
			}
		}
	}
}

jQuery(document).ready(function(){
	init() ;
	$("#btn_back").click(function(){
       		document.forms[0].action='projectMaterialsAction.do?method=list&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&ec_id=${projectMaterials.materials_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}';   
	    	document.forms[0].submit(); 
       });
})



function add(){
	var object4 = jQuery("#tr4") ;
	if(!object4.is(":hidden")){
		alert("上传附件个数最多不允许超过4个!");
	}else{
		for(var i=1 ;i<5;i++){
			var obj = jQuery("#tr"+i);
			if(obj.is(":hidden")){
				obj.show() ;
				break ;
			}
		}
	}
}

function insertTr(){
    var tableObj = document.getElementById("tableObj");
    var currentRow = tableObj.insertRow();
    currentRow.align = "center";
    currentRow.insertCell().innerHTML = '<input type="hidden" name="stratum_id"/><input type="text" name="stratum_code" class="text" size="9"/>';
    currentRow.insertCell().innerHTML = '<input type="text" name="stratum_name" class="text" size="15"/>';
    currentRow.insertCell().innerHTML = '<input type="text" name="color" class="text" size="9"/>';
    currentRow.insertCell().innerHTML = '<input type="text" name="state" class="text" size="9"/>';
    currentRow.insertCell().innerHTML = '<input type="text" name="feature_description" class="text" size="30"/>';
    currentRow.insertCell().innerHTML = '<input type="text" name="layer_thick" class="text" size="9"/>';
    currentRow.insertCell().innerHTML = '<input type="text" name="permeability" class="text" size="11"/>';
    currentRow.insertCell().innerHTML = '<input type="button" id="delete" class="button2" onclick="removeMySiteRow(this,this)" value="删 除" />';
 }
 

function removeMySiteRow(stratum_id,ob){
    var tableId = document.getElementById("tableObj");
	if(window.confirm("确定删除？")){
		if(stratum_id != null && stratum_id != ""){
		$.ajax({
					type: "POST",
					url : "${ctx}/stratumRockAction.do?method=deleteInfo",
					data: "stratum_id="+stratum_id,
					success: function(msg){
						responsedeleteInfo(msg);
					}
				});
			}
		($(ob).parent().parent()).remove();
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
function responsedeleteInfo(selResponse){
	var text = selResponse;
	if(text == "no"){
		alert("删除失败！");
	}
}
function findSiteTD(o){
	if (o.nodeName=="TR"||o.nodeName=="TABLE") return;
	if(o.nodeName=="TD")
	   return (o);
	else
	   return (o.parentElement);
}

function deleteFile(){
	for(var m=4; m>=1; m--){
		var obj=document.getElementById('tr'+m);
		var obj = jQuery("#tr"+m) ;
		if(!obj.is(":hidden")){
			if(m == 1){
				var displayFile1 = jQuery("#displayFile1") ;
				if(displayFile1.length > 0 ){
					displayFile1.hide();
				}
			}else{
				obj.hide() ;
			}
			var fileObj = document.getElementById('file'+m);
			var fileObj = jQuery("#file"+m) ;
			fileObj.val("") ;
			jQuery("[name='fileName_"+m+"']").val("") ;
			jQuery("[name='fileAddr_"+m+"']").val("") ;
			break;
		}
	}
}
function initId(name,addr){
$("[name=fileName_1]").attr("id","fileName_1");
$("[name=fileAddr_1]").attr("id","fileAddr_1");



$("[name=fileName_2]").attr("id","fileName_2");
$("[name=fileAddr_2]").attr("id","fileAddr_2");

$("[name=fileName_3]").attr("id","fileName_3");
$("[name=fileAddr_3]").attr("id","fileAddr_3");

$("[name=fileName_4]").attr("id","fileName_4");
$("[name=fileAddr_4]").attr("id","fileAddr_4");


 $("[name="+name+"]").attr("id","fileName_");
  $("[name="+addr+"]").attr("id","fileAddr_");
}
function setParameter(name,addr){
  initId(name,addr);
  
    showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);
    
   
}
function showUploadDialogAndRefresh(URL,tWidth,tHeight)
{
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	//window.open(URL,"",dlgFeatures);
	//window.location.reload();
	//window.open (URL, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
}   
s
</script>
</head>
<body>
<fieldset>
	<legend><strong>备注</strong></legend>
	<table width="98%" border="0" cellpadding="2" cellspacing="4">
		<tr>
			<td width="110px" class="label"><font color="#50A2E6" size="2"><strong>必填项说明：</strong></font></td>
			<td><font color="#9EC3DA" size="2"><strong>报表标题为蓝色背景的列为必填项，如果用户未输入该项数值，则保存时该行将被过滤掉！</strong></font></td>
		</tr>
		<tr>
			<td width="110px" class="label"><font color="#50A2E6" size="2"><strong>数据导入说明：</strong></font></td>
			<td><font color="#9EC3DA" size="2"><strong>如果报表信息是最近一次的填报的历史记录时，导入数据后，历史记录信息将被替换掉；
<br>如果报表信息为已有的填报数据时，导入数据后，将在已有的数据后面进行累加！</strong></font></td>
		</tr>
	</table>
</fieldset>
<fieldset>
	<legend><strong>地层岩性性能表</strong></legend>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="center" width="60%">
				<font color="#50A2E6" size="2"><strong>
				工程资料类型：<ex:dicDisplay dictIdentify="MaterialsType" dictValue="${projectMaterials.materials_type}" /></strong></font>
			</td>
			<td align="right" width="40%">
				<html:button property="addTr" onclick="insertTr()" styleClass="button1" value="新增行" />
				<input type="button" class="button1" value="导出填报模板" icon="icon_add" onclick="location.href='${ctx}/stratumRockAction.do?method=modelDownLoad'" >
				<input type="button" class="button1" value="数据导入" icon="icon_add" onclick="location.href='${ctx}/stratumRockAction.do?method=showExcelImport&flagPage=${flagPage }&importType=stratumRock&materials_id=${projectMaterials.materials_id}&materials_type=${projectMaterials.materials_type}&lineId=${lineId}&segmentId=${segmentId}&station_id=${projectMaterials.station_id}&station_state=${station_state}&station_type=${station_type}&startDate=${startDate}&endDate=${endDate}'">&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<html:form action="stratumRockAction.do" method="POST" enctype="multipart/form-data" styleClass="form">
			    <input type="hidden" name="method" value="save"/> 
				  <html:hidden property="materials_id" value="${projectMaterials.materials_id}"/>
				  <html:hidden property="materials_type" value="${projectMaterials.materials_type}"/>
				  <html:hidden property="station_id" value="${projectMaterials.station_id}"/>
				   <html:hidden property="flagPage" value="${flagPage}"/>  
				 
				  	
				  
			      <html:hidden property="lineId" value="${lineId}"/>
			      <html:hidden property="segmentId" value="${segmentId}"/>
				  <html:hidden property="stationId" value="${stationId}"/>
				  <html:hidden property="station_state" value="${station_state}"/>
				  <html:hidden property="station_type" value="${station_type}"/>
				  <html:hidden property="startDate" value="${startDate}"/>
				  <html:hidden property="endDate" value="${endDate}"/>
			    <table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width='10%'>地层代号</th>
							<th width='15%' ><font color="#50A2E6">地层名称</font></th>
							<th width='10%'>颜色</th>
							<th width='10%'>状态</th>
							<th width='25%'>特征描述</th>
							<th width='10%'>层厚</th>
							<th width='12%'>渗透性</th>
							<th width='8%'>操作</th>
						</tr>
					</thead>
					<c:forEach items="${stratumRocks}" var="stratumRock">
						<tr align="center" id="">
							<td>
								<html:hidden property="stratum_id" value="${stratumRock.stratum_id}"/>
								<html:text property="stratum_code" value="${stratumRock.stratum_code}" styleClass="text" size="9"/>
							</td>
							<td><html:text property="stratum_name" value="${stratumRock.stratum_name}" styleClass="text"  size="15"/></td>
							<td><html:text property="color" value="${stratumRock.color}" styleClass="text"  size="9"/></td>
							<td><html:text property="state" value="${stratumRock.state}" styleClass="text" size="9" /></td>
							<td><html:text property="feature_description" value="${stratumRock.feature_description}" styleClass="text"  size="30"/></td>
							<td><html:text property="layer_thick" value="${stratumRock.layer_thick}" styleClass="text"  size="9"/></td>
							<td><html:text property="permeability" value="${stratumRock.permeability}" styleClass="text"  size="11"/></td>
							<td align="center"><button class="button2" value="${texts['button.delete']}" onclick="removeMySiteRow('${stratumRock.stratum_id}',this)"/>${texts['button.delete']}</td>
						</tr>
					</c:forEach>
				</table>
				<table class="def_table" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width='100%' colspan="2" align="left">图片信息</th>
						</tr>
					</thead>
					 <tr id=tr1 style="display:block">
				      	<td>图片附件1</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_1" value="${projectMaterials.stratumRock_attach_name1 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_1','fileAddr_1');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		<html:button property="addFileBtn" styleClass="button1"  value="添加附件" onclick="add()" />
				      		<input type="button" class="button1" id="delBtn" icon="icon_delete" value="删除附件" onclick="deleteFile()">
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectMaterials.stratumRock_attach_address1!=null}">
								<a href="<%=request.getContextPath()%>/stratumRockAction.do?method=download&materials_id=${projectMaterials.materials_id }&index=1">${projectMaterials.stratumRock_attach_name1}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_1" value="${projectMaterials.stratumRock_attach_address1 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
					 <tr id=tr2 style="display:none">
				      	<td>图片附件2</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_2" value="${projectMaterials.stratumRock_attach_name2 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_2','fileAddr_2');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectMaterials.stratumRock_attach_address2!=null}">
								<a href="<%=request.getContextPath()%>/stratumRockAction.do?method=download&materials_id=${projectMaterials.materials_id }&index=2">${projectMaterials.stratumRock_attach_name2}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_2" value="${projectMaterials.stratumRock_attach_address2 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr3 style="display:none">
					 <td>图片附件3</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_3" value="${projectMaterials.stratumRock_attach_name3 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_3','fileAddr_3');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectMaterials.stratumRock_attach_address3!=null}">
								<a href="<%=request.getContextPath()%>/stratumRockAction.do?method=download&materials_id=${projectMaterials.materials_id }&index=3">${projectMaterials.stratumRock_attach_name3}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_3" value="${projectMaterials.stratumRock_attach_address3 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr4 style="display:none">
					 <td>图片附件4</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_4" value="${projectMaterials.stratumRock_attach_name4 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_4','fileAddr_4');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectMaterials.stratumRock_attach_address4!=null}">
								<a href="<%=request.getContextPath()%>/stratumRockAction.do?method=download&materials_id=${projectMaterials.materials_id }&index=4">${projectMaterials.stratumRock_attach_name4}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_4" value="${projectMaterials.stratumRock_attach_address4 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				</table>
			    <div align="center">
					<input type="submit" class="saveButton" icon="icon_save" value="${texts['button.save']}"/>&nbsp;&nbsp;
					<input type="button" value="${texts['button.back']}" icon="icon_back" class="backButton" id="btn_back">
			    </div>
			</html:form>
			</td>
		</tr>
	</table>
</fieldset>
</body>
</html>
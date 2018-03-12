<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<title>资料信息管理</title>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
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
		for(var i=1;i<count;i++){
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

function add(){
	var object4 = jQuery("#tr4") ;
	if(!object4.is(":hidden")){
		alert("上传附件个数最多不允许超过4个!");
	}else{
		for(var i=1 ;i<5;i++){
			var obj = jQuery("#tr"+i);
			if(obj.is(":hidden")){
				obj.css("display","block") ;
				break ;
			}
		}
	}
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
</script>
</head>
<body>
<fieldset>
	<legend><strong>工程地质基本参数</strong></legend>
	
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr><td><center> 工程资料类型:<span class="redSpan"><ex:dicDisplay dictIdentify="MaterialsType" dictValue="${projectMaterials.materials_type}"/></span></center>
		</td></tr>
		<tr>
			<td>
			<html:form action="projectGeologyAction.do" method="POST" enctype="multipart/form-data" styleClass="form">
			    <input type="hidden" name="method" value="save"/> 
			     <html:hidden property="flagPage" value="${flagPage}"/>  
				 
				  <html:hidden property="geology_id" value="${projectGeology.geology_id}"/>
				  <html:hidden property="materials_id" value="${projectMaterials.materials_id}"/>
				  <html:hidden property="materials_type" value="${projectMaterials.materials_type}"/>
				  <html:hidden property="station_id" value="${projectMaterials.station_id}"/>
				  <html:hidden property="attach_name1" value="${projectGeology.attach_name1}"/>
					<html:hidden property="attach_address1" value="${projectGeology.attach_address1}"/>
					<html:hidden property="attach_name2" value="${projectGeology.attach_name2}"/>
					<html:hidden property="attach_address2" value="${projectGeology.attach_address2}"/>
					<html:hidden property="attach_name3" value="${projectGeology.attach_name3}"/>
					<html:hidden property="attach_address3" value="${projectGeology.attach_address3}"/>
					<html:hidden property="attach_name4" value="${projectGeology.attach_name4}"/>
					<html:hidden property="attach_address4" value="${projectGeology.attach_address4}"/>
				  
			      <html:hidden property="lineId" value="${lineId}"/>
			      <html:hidden property="segmentId" value="${segmentId}"/>
				  <html:hidden property="stationId" value="${stationId}"/>
				  <html:hidden property="station_state" value="${station_state}"/>
				  <html:hidden property="station_type" value="${station_type}"/>
				  <html:hidden property="startDate" value="${startDate}"/>
				  <html:hidden property="endDate" value="${endDate}"/>
			    <table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width='10%'>序号</th>
							<th width='20%'>项目</th>
							<th width='70%'>内容</th>
						</tr>
					</thead>
					<tr>
						<td>1</td>
						<td>地表高程范围</td>
						<td><html:textarea property="ground_altitude_range" value="${projectGeology.ground_altitude_range}" rows="6" cols="80" /></td>
					</tr>
					<tr>
						<td>2</td>
						<td>原始地貌</td>
						<td><html:textarea property="primitive_ground" value="${projectGeology.primitive_ground}" rows="6" cols="80" /></td>
					</tr>
					<tr>
						<td>3</td>
						<td>不良地质情况</td>
						<td><html:textarea property="bad_geological_situation" value="${projectGeology.bad_geological_situation}" rows="6" cols="80" /></td>
					</tr>
					<tr>
						<td>4</td>
						<td>特殊土情况</td>
						<td><html:textarea property="special_soil_situation" value="${projectGeology.special_soil_situation}" rows="6" cols="80" /></td>
					</tr>
					<tr>
						<td>5</td>
						<td>上层滞水情况</td>
						<td><html:textarea property="stagnat_water_situation" value="${projectGeology.stagnat_water_situation}" rows="6" cols="80" /></td>
					</tr>
					<tr>
						<td>6</td>
						<td>承压水情况</td>
						<td><html:textarea property="artesian_water_situation" value="${projectGeology.artesian_water_situation}" rows="6" cols="80" /></td>
					</tr>
					<tr>
						<td>7</td>
						<td>基岩裂隙水情况</td>
						<td><html:textarea property="crevice_water_situation" value="${projectGeology.crevice_water_situation}" rows="6" cols="80" /></td>
					</tr>
					<tr>
						<td>8</td>
						<td>岩溶水情况</td>
						<td><html:textarea property="karst_water_situation" value="${projectGeology.karst_water_situation}" rows="6" cols="80" /></td>
					</tr>
					<tr>
						<td>9</td>
						<td>水腐蚀性</td>
						<td><html:textarea property="water_corrosivity" value="${projectGeology.water_corrosivity}" rows="6" cols="80" /></td>
					</tr>
				</table>
				<table class="def_table" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width='100%' colspan="2" align="left">图片信息</th>
						</tr>
					</thead>
					 <tr id=tr1 style="display:block">
				      	<td>
				      	图片附件1:<span class="noRedSpan">*</span>
				      	</td>				      					      	
				      	<td >				      	
							<input type="text"  name="fileName_1" value="${projectGeology.attach_name1 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_1','fileAddr_1');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
				      		<html:button property="addFileBtn" styleClass="button1" value="添加附件" onclick="add()" />
				      		<input type="button" class="button1" id="delBtn" value="删除附件" onclick="deleteFile()">
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectGeology.attach_address1!=null}">
								<a href="<%=request.getContextPath()%>/projectGeologyAction.do?method=download&geology_id=${projectGeology.geology_id}&index=1 ">${projectGeology.attach_name1}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_1" value="${projectGeology.attach_address1 }" class="inputText" readonly="readonly" size="30"/>

						</td>
				    </tr>
					 <tr id=tr2 style="display:none">
				      	<td>图片附件2:<span class="noRedSpan">*</span></td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_2" value="${projectGeology.attach_name2 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_2','fileAddr_2');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectGeology.attach_address2!=null}">
								<a href="<%=request.getContextPath()%>/projectGeologyAction.do?method=download&geology_id=${projectGeology.geology_id}&index=2">${projectGeology.attach_name2}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_2" value="${projectGeology.attach_address2 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr3 style="display:none">
					 <td>图片附件3:<span class="noRedSpan">*</span></td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_3" value="${projectGeology.attach_name3 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_3','fileAddr_3');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectGeology.attach_address3!=null}">
								<a href="<%=request.getContextPath()%>/projectGeologyAction.do?method=download&geology_id=${projectGeology.geology_id}&index=3">${projectGeology.attach_name3}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_3" value="${projectGeology.attach_address3 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr4 style="display:none">
					 <td>图片附件4:<span class="noRedSpan">*</span></td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_4" value="${projectGeology.attach_name4 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_4','fileAddr_4');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${projectGeology.attach_address4!=null}">
								<a href="<%=request.getContextPath()%>/projectGeologyAction.do?method=download&geology_id=${projectGeology.geology_id}&index=4">${projectGeology.attach_name4}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_4" value="${projectGeology.attach_address4 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				</table>
			    <div align="center">
					<input type="submit" class="saveButton" value="${texts['button.save']}"/>&nbsp;&nbsp;
					<input type="button" id="btn_back" value="${texts['button.back']}" class="backButton" />
					</div>
			</html:form>
			</td>
		</tr>
	</table>
</body>
</html>
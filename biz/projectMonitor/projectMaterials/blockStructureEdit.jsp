<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<title></title>


<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script language="javascript">
jQuery(document).ready(function(){
	init() ;
	 $("#btn_back").click(function(){
       		document.forms[0].action='projectMaterialsAction.do?method=list&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&ec_id=${projectMaterials.materials_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}';   
	    	document.forms[0].submit(); 
       });
       
})
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
		var count = parseInt(fileCount);
		for(var i=1;i<=count;i++){
			 var obj=document.getElementById('tr'+i);
			 if(obj.style.display=='none'){
			   obj.style.display='block';
			 }
		}
	}
}

function add(){
	var object4=document.getElementById('tr4');
	if(object4.style.display == 'block'){
		alert("上传附件个数最多不允许超过4个!");
	}else{
		for(var i=1;i<5;i++){
			 var obj=document.getElementById('tr'+i);
			 if(obj.style.display=='none'){
			   obj.style.display='block';
			   break;
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
	<legend><strong>车站结构设计参数</strong></legend>
	<table class="formTable" >
							<COLGROUP>
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
							</COLGROUP>
							
							<tr>
								<td>
									车站/区间:
								</td>
								<td >
									<span class="redSpan">${block.block_name}</span>
								</td>
								<td>
									工程资料类型:
								</td>
								<td >
									<span class="redSpan"><ex:dicDisplay dictIdentify="MaterialsType" dictValue="${projectMaterials.materials_type}"/></span>
								</td>
		</tr>
		</table>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
	
		<tr>
			<td>
			<html:form action="blockStructureAction.do" method="POST" enctype="multipart/form-data" styleClass="form">
			    <input type="hidden" name="method" value="save"/> 
			     <html:hidden property="flagPage" value="${flagPage}"/>  
				  <html:hidden property="block_id" value="${blockStructure.block_id}"/>
				  <html:hidden property="materials_id" value="${projectMaterials.materials_id}"/>
				  <html:hidden property="materials_type" value="${projectMaterials.materials_type}"/>
				  <html:hidden property="station_id" value="${projectMaterials.station_id}"/>
				 
			      <html:hidden property="lineId" value="${lineId}"/>
			      <html:hidden property="segmentId" value="${segmentId}"/>
				  <html:hidden property="stationId" value="${stationId}"/>
				  <html:hidden property="station_state" value="${station.station_state}"/>
				  <html:hidden property="station_type" value="${station.station_type}"/>
				  <html:hidden property="startDate" value="${startDate}"/>
				  <html:hidden property="endDate" value="${endDate}"/>
			    <table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width='10%'>序号</th>
							<th width='25%'>项目</th>
							<th width='65%'>内容</th>
						</tr>
					</thead>
					<tr>
						<td align="center">1</td>
						<td  align="center">左线长度(m)</td>
						<td><html:text property="left_line_length" value="${blockStructure.left_line_length}" styleClass="text" size="50" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td  align="center">2</td>
						<td  align="center">左线起止里程</td>
						<td><html:text property="left_start_mileage" value="${blockStructure.left_start_mileage}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">3</td>
						<td align="center">左线平均坡度</td>
						<td><html:text property="left_average_slope" value="${blockStructure.left_average_slope}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">4</td>
						<td align="center">左线最大坡度及里程</td>
						<td><html:text property="left_max_slope" value="${blockStructure.left_max_slope}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">5</td>
						<td align="center">右线长度(m)</td>
						<td><html:text property="right_line_length" value="${blockStructure.right_line_length}" styleClass="text" size="50" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">6</td>
						<td align="center">右线起止里程</td>
						<td><html:text property="right_start_mileage" value="${blockStructure.right_start_mileage}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">7</td>
						<td align="center">右线平均坡度</td>
						<td><html:text property="right_average_slope" value="${blockStructure.right_average_slope}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">8</td>
						<td align="center">右线最大坡度及里程</td>
						<td><html:text property="right_max_slope" value="${blockStructure.right_max_slope}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">9</td>
						<td align="center">平均埋深(m)</td>
						<td><html:text property="average_bury_deep" value="${blockStructure.average_bury_deep}" styleClass="text" size="50" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">10</td>
						<td align="center">覆土厚度最大(m)</td>
						<td><html:text property="soil_max_deep" value="${blockStructure.soil_max_deep}" styleClass="text" size="50" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">11</td>
						<td align="center">覆土厚度最小(m)</td>
						<td><html:text property="soil_min_deep" value="${blockStructure.soil_min_deep}" styleClass="text" size="50" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">12</td>
						<td align="center">施工工法</td>
						<td><html:text property="construction_law" value="${blockStructure.construction_law}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">13</td>
						<td align="center">隧道净空高度(m)</td>
						<td><html:text property="tunnel_clearance_height" value="${blockStructure.tunnel_clearance_height}" styleClass="text" size="50" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">14</td>
						<td align="center">隧道中心线距离(m)</td>
						<td><html:text property="tunnel_center_distance" value="${blockStructure.tunnel_center_distance}" styleClass="text" size="50" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">15</td>
						<td align="center">隧道外沿宽度(m)</td>
						<td><html:text property="tunnel_outside_width" value="${blockStructure.tunnel_outside_width}" styleClass="text" size="50" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">16</td>
						<td align="center">覆跨比</td>
						<td><html:text property="cover_across_than" value="${blockStructure.cover_across_than}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">17</td>
						<td align="center">高跨比</td>
						<td><html:text property="high_step_than" value="${blockStructure.high_step_than}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">18</td>
						<td align="center">竖井个数及位置</td>
						<td><html:text property="shaft_number_position" value="${blockStructure.shaft_number_position}" styleClass="text" size="50"/></td>
					</tr>
					<tr>
						<td align="center">19</td>
						<td align="center">隧道截面类型个数及尺寸</td>
						<td><html:text property="tunnel_sectional_size" value="${blockStructure.tunnel_sectional_size}" styleClass="text" size="50"/></td>
					</tr>
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
				      	
							<input type="text"  name="fileName_1" value="${blockStructure.attach_name1 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_1','fileAddr_1');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		<html:button property="addFileBtn" styleClass="button1" value="添加附件" onclick="add()" />
				      		<input type="button" class="button1" id="delBtn" value="删除附件" onclick="deleteFile()">
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${blockStructure.attach_address1!=null}">
								<a href="<%=request.getContextPath()%>/blockStructureAction.do?method=download&block_id=${blockStructure.block_id }&index=1">${blockStructure.attach_name1}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_1" value="${blockStructure.attach_address1 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
					 <tr id=tr2 style="display:none">
				      	<td>图片附件2</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_2" value="${blockStructure.attach_name2 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_2','fileAddr_2');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${blockStructure.attach_address2!=null}">
								<a href="<%=request.getContextPath()%>/blockStructureAction.do?method=download&block_id=${blockStructure.block_id }&index=2">${blockStructure.attach_name2}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_2" value="${blockStructure.attach_address2 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr3 style="display:none">
					 <td>图片附件3</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_3" value="${blockStructure.attach_name3 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_3','fileAddr_3');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${blockStructure.attach_address3!=null}">
								<a href="<%=request.getContextPath()%>/blockStructureAction.do?method=download&block_id=${blockStructure.block_id }&index=3">${blockStructure.attach_name3}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_3" value="${blockStructure.attach_address3 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr4 style="display:none">
					 <td>图片附件4</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_4" value="${blockStructure.attach_name4 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_4','fileAddr_4');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${blockStructure.attach_address4!=null}">
								<a href="<%=request.getContextPath()%>/blockStructureAction.do?method=download&block_id=${blockStructure.block_id }&index=4">${blockStructure.attach_name4}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_4" value="${blockStructure.attach_address4 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				</table>
			    <div align="center">
					<input type="submit" class="saveButton" value="${texts['button.save']}"/>&nbsp;&nbsp;
					<input type="button" id="btn_back" value="${texts['button.back']}" class="backButton" >
			    </div>
			</html:form>
			</td>
		</tr>
	</table>
</body>
</html>
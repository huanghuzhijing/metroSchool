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
									<span class="redSpan">${station.station_name}</span>
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
			<html:form action="stationStructureAction.do" method="POST" enctype="multipart/form-data" styleClass="form">
			    <input type="hidden" name="method" value="save"/> 
			     <html:hidden property="flagPage" value="${flagPage}"/>  
				  <html:hidden property="structure_id" value="${stationStructure.structure_id}"/>
				  <html:hidden property="materials_id" value="${projectMaterials.materials_id}"/>
				  <html:hidden property="materials_type" value="${projectMaterials.materials_type}"/>
				  <html:hidden property="station_id" value="${projectMaterials.station_id}"/>
				 
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
							<th width='25%'>项目</th>
							<th width='65%'>内容</th>
						</tr>
					</thead>
					<tr>
						<td  align="center">1</td>
						<td align="center">车站层数</td>
						<td><html:text property="station_level_count" value="${stationStructure.station_level_count}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">2</td>
						<td align="center">车站跨数</td>
						<td><html:text property="station_step_count" value="${stationStructure.station_step_count}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">3</td>
						<td align="center">外包总长度</td>
						<td><html:text property="outer_package_lenght" value="${stationStructure.outer_package_lenght}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">4</td>
						<td align="center">外包总宽度</td>
						<td><html:text property="outer_package_width" value="${stationStructure.outer_package_width}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">5</td>
						<td align="center">总高</td>
						<td><html:text property="total_width" value="${stationStructure.total_width}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">6</td>
						<td align="center">主体结构型式</td>
						<td><html:text property="subject_struct_pattern" value="${stationStructure.subject_struct_pattern}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">7</td>
						<td align="center">围护结构形式</td>
						<td><html:text property="round_struct_pattern" value="${stationStructure.round_struct_pattern}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">8</td>
						<td align="center">围护结构深度</td>
						<td><html:text property="round_struct_deep" value="${stationStructure.round_struct_deep}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">9</td>
						<td align="center">围护结构是否入岩</td>
						<td><html:text property="round_struct_isrock" value="${stationStructure.round_struct_isrock}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">10</td>
						<td align="center">入土比</td>
						<td><html:text property="bury_proportion" value="${stationStructure.bury_proportion}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">11</td>
						<td align="center">顶板埋深</td>
						<td><html:text property="roof_deeply" value="${stationStructure.roof_deeply}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">12</td>
						<td align="center">底板埋深</td>
						<td><html:text property="bottom_deeply" value="${stationStructure.bottom_deeply}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">13</td>
						<td align="center">支撑形式</td>
						<td><html:text property="support_pattern" value="${stationStructure.support_pattern}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">14</td>
						<td align="center">端头井个数</td>
						<td><html:text property="head_well_count" value="${stationStructure.head_well_count}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">15</td>
						<td align="center">主动区加固</td>
						<td><html:text property="voluntarily_area_strong" value="${stationStructure.voluntarily_area_strong}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">16</td>
						<td align="center">被动区加固</td>
						<td><html:text property="passive_area_strong" value="${stationStructure.passive_area_strong}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">17</td>
						<td align="center">总建筑面积</td>
						<td><html:text property="total_building_area" value="${stationStructure.total_building_area}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">18</td>
						<td align="center">主体建筑面积</td>
						<td><html:text property="main_building_area" value="${stationStructure.main_building_area}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">19</td>
						<td align="center">出入口个数</td>
						<td><html:text property="exits_enter_count" value="${stationStructure.exits_enter_count}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">20</td>
						<td align="center">消防疏散口个数</td>
						<td><html:text property="fire_evacuate_count" value="${stationStructure.fire_evacuate_count}" styleClass="text" size="70" maxlength="18" onchange="validateData(this)"/></td>
					</tr>
					<tr>
						<td align="center">21</td>
						<td align="center">人防等级</td>
						<td><html:text property="prevent_leave" value="${stationStructure.prevent_leave}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">22</td>
						<td align="center">抗震设防烈度等级</td>
						<td><html:text property="earthquake_prevent_leave" value="${stationStructure.earthquake_prevent_leave}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">23</td>
						<td align="center">结构耐火等级</td>
						<td><html:text property="struct_fire_leave" value="${stationStructure.struct_fire_leave}" styleClass="text" size="70"/></td>
					</tr>
					<tr>
						<td align="center">24</td>
						<td align="center">结构防化等级</td>
						<td><html:text property="struct_antichemical_leave" value="${stationStructure.struct_antichemical_leave}" styleClass="text" size="70"/></td>
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
				      	
							<input type="text"  name="fileName_1" value="${stationStructure.attach_name1 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_1','fileAddr_1');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		<html:button property="addFileBtn" styleClass="button1" value="添加附件" onclick="add()" />
				      		<input type="button" class="button1" id="delBtn" value="删除附件" onclick="deleteFile()">
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${stationStructure.attach_address1!=null}">
								<a href="<%=request.getContextPath()%>/stationStructureAction.do?method=download&structure_id=${stationStructure.structure_id }&index=1">${stationStructure.attach_name1}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_1" value="${stationStructure.attach_address1 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
					 <tr id=tr2 style="display:none">
				      	<td>图片附件2</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_2" value="${stationStructure.attach_name2 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_2','fileAddr_2');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${stationStructure.attach_address2!=null}">
								<a href="<%=request.getContextPath()%>/stationStructureAction.do?method=download&structure_id=${stationStructure.structure_id }&index=2">${stationStructure.attach_name2}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_2" value="${stationStructure.attach_address2 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr3 style="display:none">
					 <td>图片附件3</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_3" value="${stationStructure.attach_name3 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_3','fileAddr_3');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${stationStructure.attach_address3!=null}">
								<a href="<%=request.getContextPath()%>/stationStructureAction.do?method=download&structure_id=${stationStructure.structure_id }&index=3">${stationStructure.attach_name3}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_3" value="${stationStructure.attach_address3 }" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
				    </tr>
				     <tr id=tr4 style="display:none">
					 <td>图片附件4</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_4" value="${stationStructure.attach_name4 }" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_4','fileAddr_4');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							
						
						
				      
				      		
				      		<font color="blue">(文件格式为:jpg)</font>
						     <c:if test="${stationStructure.attach_address4!=null}">
								<a href="<%=request.getContextPath()%>/stationStructureAction.do?method=download&structure_id=${stationStructure.structure_id }&index=4">${stationStructure.attach_name4}</a>
							</c:if>
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_4" value="${stationStructure.attach_address4 }" class="inputText" readonly="readonly" size="30"/>
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
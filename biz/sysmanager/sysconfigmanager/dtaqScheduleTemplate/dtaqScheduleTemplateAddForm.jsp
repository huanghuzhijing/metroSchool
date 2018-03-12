<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		//
	   $(document).ready(function(){
			//
			$("#btn_save").click(function(){
				var properties=new Array();
				if('${dtaqStation.station_type}'=='P'){
				properties[0]=["fileName3_","形象进度剖面图模板 "];
				}else{
				properties[0]=["fileName2_","形象进度平面图模板 "];
				properties[1]=["fileName_","形象进度剖面图模板 "];
				}
				saveValidateRequired("#btn_save",properties,"dtaqScheduleTemplateForm");
			}); 
			$("#btn_back").click(function(){ 
				//location.href='dtaqScheduleTemplateAction.do?method=list&station_id=${param.station_id}&station_state=${param.station_state}&station_type=${param.station_type}';    
	    		history.back(-1);
			});
		
		
			
		});
		function fileSelect(){
		  $("[name='fileName_']").val( $("#fileAddr_").val().substring($("#fileAddr_").val().lastIndexOf("\\")+1,$("#fileAddr_").val().lastIndexOf(".")));
		}
		
		function fileClear2(){
			 $("#fileName2_").val("");
			 $("#fileAddr2_").val("");
		}
		function fileClear(){
			 $("#fileName_").val("");
			 $("#fileAddr_").val("");
		}
		function fileClear3(){
			 $("#fileName3_").val("");
			 $("#fileAddr3_").val("");
		}
		function showUploadDialogAndRefresh(URL,tWidth,tHeight)
    {   dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
    }
   
	</script>
</head>

<body>
	<html:form enctype="multipart/form-data" action="dtaqScheduleTemplateAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="station_id" value="${param.station_id}"/>
		<html:hidden property="station_state" value="${param.station_state}"/>
		<html:hidden property="station_type" value="${param.station_type}"/>
		<!--查询定位 结束-->
		<fieldset >
			<legend>形象进度模板管理-编辑</legend>
			<table class="formTable" >
					<COLGROUP>
							<COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
			                <COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
						  标段：<span class="redSpan">*</span>
						</td>
						<td >
							${dtaqStation.station_name}
						</td>
					</tr>
					
					<tr>
						<td>
						  车站/区间：<span class="redSpan">*</span>
						</td>
						<td>
						${dtaqStation.segment_id.segment_name}
					
						</td>
						
					</tr>
					
					 <c:if test="${dtaqStation.station_type=='S'}">
					
					<tr>
						<td>
						形象进度平面图模板<span class="redSpan">*</span>
						</td>
						<td >
							<input type="text" id="fileName_" name="fileName_" class="inputText"  size="30"/>(dwg格式文件，大小2M以内!)
							<input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('dtaqScheduleTemplateAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="fileClear(this)" style="width: 76px; height: 65px; cursor:pointer" value="清空"/>
			
						</td>
						<td style="display:none">
							形象进度平面图模板地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="fileAddr_" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
					</tr>
					<tr>
						<td>
						形象进度剖面图模板<span class="redSpan">*</span>
						</td>
						<td >
							<input type="text" id="fileName2_" name="fileName2_" class="inputText"  size="30"/>(dwg格式文件，大小2M以内!)
							<input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('dtaqScheduleTemplateAction.do?method=uploadFile&flag=2&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="fileClear2(this)" style="width: 76px; height: 65px; cursor:pointer" value="清空"/>
			
						</td>
						<td style="display:none">
							形象进度剖面图模板地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr2_" name="fileAddr2_" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
					</tr>
					</c:if>
					
					 <c:if test="${dtaqStation.station_type=='P'}">
					 <tr>
						<td>
						形象进度剖面图模板<span class="redSpan">*</span>
						</td>
						<td >
							<input type="text" id="fileName3_" name="fileName3_" class="inputText"  size="30"/>(dwg格式文件，大小2M以内!)
							<input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('dtaqScheduleTemplateAction.do?method=uploadFile&flag=3&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="fileClear3(this)" style="width: 76px; height: 65px; cursor:pointer" value="清空"/>
			
						</td>
						<td style="display:none">
							形象进度示意图模板：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr3_" name="fileAddr3_" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
					</tr>
					 </c:if>
					
			</table>
		</fieldset>
		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>

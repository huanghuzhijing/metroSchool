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
				if('${station_type}'=='P'){
				properties[0]=["fileName3_","形象进度示意图 "];
				}else{
				properties[0]=["fileName_","形象进度平面图 "];
				properties[1]=["fileName2_","形象进度剖面图 "];
				}
				saveValidateRequired("#btn_save",properties,"dtaqSegmentScheduleForm");
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

		function validateMemo(){
			
			var sch_id = jQuery("[name='sch_id']").val();
			var station_type = '${station_type}';
			
			if(sch_id != ""){
				if(station_type == "S"){
					var plane_file = jQuery("[name='fileName_']").val();
					var section_file = jQuery("[name='fileName2_']").val();
			//		var update_section_file = jQuery("[name='update_section_file']").val();
					var exist_plane = jQuery("[name='exist_plane']").val();
			//		if(exist_plane != "" && plane_file == "" && update_section_file == "N"){
			if(exist_plane != "" && plane_file == ""){
						alert("修改填错的形象进度说明只能重新上传图片，才能修改!");
						jQuery("[name='fileName_']").focus();
					}
				}else if(station_type == "P"){
					var schematic_file = jQuery("[name='fileName3_']").val();
					var exist_schematic = jQuery("[name='exist_schematic']").val();
					if(schematic_file == ""  && exist_schematic != ""){
						alert("修改填错的形象进度说明只能重新上传图片，才能修改!");
						jQuery("[name='fileName3_']").focus();
					}
				}
			}
		}
   
	</script>
</head>

<body>
	<html:form enctype="multipart/form-data" action="segmentScheduleAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="sch_id"/>
	    <html:hidden property="template_id"/>
	    <html:hidden property="status"/>
		<html:hidden property="ts"/>
		
		<html:hidden property="segment_id" value="${param.segment_id}"/>
		<html:hidden property="station_id" value="${param.station_id}"/>
		<html:hidden property="station_state" value="${param.station_state}"/>
		<html:hidden property="station_type" value="${param.station_type}"/>
		
		<html:hidden property="exist_section" value="${dtaqSegmentSchedule.section_jpeg_name}"/>
		<html:hidden property="exist_plane" value="${dtaqSegmentSchedule.plane_jpeg_name}"/>
		<html:hidden property="exist_schematic" value="${dtaqSegmentSchedule.schematic_jpeg_name}"/>
		<!--查询定位 结束-->
		<fieldset >
			<legend>形象进度-编辑</legend>
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
							${segment.segment_name}
						</td>
					</tr>
					
					<tr>
						<td>
						  车站/区间：<span class="redSpan">*</span>
						</td>
						<td>
						${station.station_name}
					
						</td>
						
					</tr>
					
					 <c:if test="${station_type=='S'}">
					
					<tr>
						<td>
						形象进度平面图:<span class="redSpan">*</span>
						</td>
						<td >
							<input type="text" id="fileName_" name="fileName_" value="${dtaqSegmentSchedule.plane_jpeg_name }" class="inputText"  size="30"/>(jpeg/jpg文件,大小2M以内!)
							<input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('segmentScheduleAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="fileClear(this)" style="width: 76px; height: 65px; cursor:pointer" value="清空"/>
			<span  style="display:inline">[<a href="${ctx}/segmentScheduleAction.do?method=download&type=plane&sch_id=${dtaqSegmentSchedule.sch_id}">平面图DWG文件下载</a>]</span>
						</td>
						<td style="display:none">
							形象进度平面图地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="fileAddr_" value="${dtaqSegmentSchedule.plane_jpeg_address }" class="inputText" readonly="readonly" size="30"/>

						</td>
						
					</tr>
					<tr>
						<td>
						形象进度剖面图:<span class="redSpan">*</span>
						</td>
						<td >
							<input type="text" id="fileName2_" name="fileName2_" value="${dtaqSegmentSchedule.section_jpeg_name }" class="inputText"  size="30"/>(jpeg/jpg文件,大小2M以内!)
							<input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('segmentScheduleAction.do?method=uploadFile&flag=2&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="fileClear2(this)" style="width: 76px; height: 65px; cursor:pointer" value="清空"/>
			<span  style="display:inline">[<a href="${ctx}/segmentScheduleAction.do?method=download&type=section&sch_id=${dtaqSegmentSchedule.sch_id}">剖面图DWG文件下载</a>]</span>
						</td>
						<td style="display:none">
							形象进度剖面图地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr2_" value="${dtaqSegmentSchedule.section_jpeg_address }" name="fileAddr2_" class="inputText" readonly="readonly" size="30"/>

						</td>
						
					</tr>
					
					<tr>
						<td>
						  形象进度说明：<span class="redSpan">*</span>
						</td>
						 <td>
	             	<html:textarea property="station_memo" cols="80" rows="8" onfocus="validateMemo()" onkeydown="textCounter('sector_memo','spanAim5',4000)" onkeyup="textCounter('sector_memo','spanAim5',4000)" ></html:textarea>
	             	<span class="req" id="spanAim5" style="display:inline">4000字符以内!</span><br>
	             	<font class="memo_font">车站工程形象进度：围护结构（地下连续墙幅、旋喷止水桩号、钻孔灌注桩号、人工挖孔桩号、高喷搅拌桩号；等）、基坑开挖（开挖范围、开挖深度、混凝土支撑范围数量、钢管支撑范围数量；等）、主体结构（混凝土垫层、底板、侧墙、中板、顶板；等）</font>
	             </td>
						
					</tr>
					</c:if>
					
					 <c:if test="${station_type=='P'}">
					 <tr>
						<td>
						形象进度示意图:<span class="redSpan">*</span>
						</td>
						<td >
							<input type="text" id="fileName3_" name="fileName3_" value="${dtaqSegmentSchedule.schematic_jpeg_name }" class="inputText"  size="30"/>(jpeg/jpg文件,大小2M以内!)
							<input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('segmentScheduleAction.do?method=uploadFile&flag=3&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="fileClear3(this)" style="width: 76px; height: 65px; cursor:pointer" value="清空"/>
			<span style="display:inline">[<a href="${ctx}/segmentScheduleAction.do?method=download&type=schematic&sch_id=${dtaqSegmentSchedule.sch_id}">示意图DWG文件下载</a>]</span>
						</td>
						<td style="display:none">
							形象进度示意图地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr3_" name="fileAddr3_" value="${dtaqSegmentSchedule.schematic_jpeg_address }" class="inputText" readonly="readonly" size="30"/>

						</td>
						
					</tr>
					<tr>
						<td>
						  形象进度说明：<span class="redSpan">*</span>
						</td>
						 <td>
	             	<html:textarea property="sector_memo" cols="80" rows="8" onfocus="validateMemo()" onkeydown="textCounter('sector_memo','spanAim5',4000)" onkeyup="textCounter('sector_memo','spanAim5',4000)" ></html:textarea>
	             	<span class="req" id="spanAim5" style="display:inline">4000字符以内!</span><br>
	             	<font class="memo_font">隧道工程形象进度：开挖初衬里程、桩号；二衬里程、桩号；管片环号；等</font>
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

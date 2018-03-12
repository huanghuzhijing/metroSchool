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
				
				saveValidateRequired("#btn_save",properties,"dtaqSegmentScheduleForm");
			}); 
			//
			$("#btn_back").click(function(){ 
				//location.href='dtaqSegmentScheduleAction.do?method=list&station_id=${param.station_id}&station_state=${param.station_state}&station_type=${param.station_type}';    
	    		history.back(-1);
			});  
		
		
			
		});
		function fileSelect(){
		  $("[name='fileName_']").val( $("#fileAddr_").val().substring($("#fileAddr_").val().lastIndexOf("\\")+1,$("#fileAddr_").val().lastIndexOf(".")));
		}
		function fileSelect(){
		  $("[name='fileName2_']").val( $("#fileAddr2_").val().substring($("#fileAddr2_").val().lastIndexOf("\\")+1,$("#fileAddr2_").val().lastIndexOf(".")));
		}
		
		function fileClear(){
			 $("#fileName_").val("");
			 $("#fileAddr_").val("");
		}
		function fileClear2(){
			 $("#fileName2_").val("");
			 $("#fileAddr2_").val("");
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
	<html:form enctype="multipart/form-data" action="dtaqSegmentScheduleAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<!--查询定位 开始-->
		<html:hidden property="sch_id" value="${dtaqSegmentSchedule.sch_id}"/>
		<html:hidden property="station_id" value="${param.station_id}"/>
		<html:hidden property="station_state" value="${param.station_state}"/>
		<html:hidden property="station_type" value="${param.station_type}"/>
		<!--查询定位 结束-->
		<fieldset >
			<legend>形象进度初始化-编辑</legend>
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
							${dtaqSegmentSchedule.segment.segment_name}
						</td>
					</tr>
					
					<tr>
						<td>
						  车站/区间：<span class="redSpan">*</span>
						</td>
						<td>
						${dtaqSegmentSchedule.station.station_name}
						</td>
						
					</tr>
					 <c:if test="${dtaqSegmentSchedule.station.station_type=='S'}">
					<tr>
						<td>
							形象进度平面图模板：<span class="redSpan">*</span>
						</td>
							<td >
						       <span style="float: left;"><input type="text" id="fileName_" name="fileName_"
							class="inputText" size="30" value="${dtaqSegmentSchedule.plane_name}" /></span>(dwg格式文件，大小2M以内!)
						<span style="float: inherit;margin-left:5px;"><input type="button" icon="icon_currWeek"
							onclick="javascript:showUploadDialogAndRefresh('dtaqSegmentScheduleAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);"
							style="width: 76px; height: 65px; cursor: pointer" value="文件上传"
							alt="进入文件上传页面" /></span>
						<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_"/>--%>
						<input type="button" icon="icon_delete" onclick="fileClear(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
							<c:if test="${dtaqSegmentSchedule.plane_address!=null}">
								<a href="<%=request.getContextPath()%>/dtaqSegmentScheduleAction.do?method=download&type=plane&sch_id=${dtaqSegmentSchedule.sch_id }">${dtaqSegmentSchedule.plane_name}</a>
							</c:if>
							<a href='${ctx}/dtaqSegmentScheduleAction.do?method=downloadTemplate&type=plane&template_id=${dtaqSegmentSchedule.template_id}'">[平面图DWG模板下载]</a>
<%--							<html:text property="fileName_" styleClass="inputText"	value="${compCompleteCheck.reportAnnex}" maxlength="100" size="30"/>--%>
						</td>
						<td style="display:none">
							形象进度平面图模板址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="fileAddr_" class="inputText" readonly="readonly" size="30" value="${dtaqSegmentSchedule.plane_address}"/>
							
						</td>
					</tr>
					<tr>
						<td>
							形象进度剖面图模板：<span class="redSpan">*</span>
						</td>
							<td >
						       <span style="float: left;"><input type="text" id="fileName2_" name="fileName2_"
							class="inputText" size="30" value="${dtaqSegmentSchedule.section_name}" /></span>(dwg格式文件，大小2M以内!)
						<span style="float: inherit;margin-left:5px;"><input type="button" icon="icon_currWeek"
							onclick="javascript:showUploadDialogAndRefresh('dtaqSegmentScheduleAction.do?method=uploadFile&flag=2&mainTableName=${maintable}',900,700);"
							style="width: 76px; height: 65px; cursor: pointer" value="文件上传"
							alt="进入文件上传页面" /></span>
						<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_"/>--%>
						<input type="button" icon="icon_delete" onclick="fileClear2(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
							<c:if test="${dtaqSegmentSchedule.section_address!=null}">
								<a href="<%=request.getContextPath()%>/dtaqSegmentScheduleAction.do?method=download&type=section&sch_id=${dtaqSegmentSchedule.sch_id}">${dtaqSegmentSchedule.section_name}</a>
							</c:if>
							<a href='${ctx}/dtaqSegmentScheduleAction.do?method=downloadTemplate&type=section&template_id=${dtaqSegmentSchedule.template_id}'">[剖面图DWG模板下载]</a></td>
						<td style="display:none">
							形象进度剖面图模板地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr2_" name="fileAddr2_" class="inputText" readonly="readonly" size="30" value="${dtaqSegmentSchedule.section_address}"/>
							
						</td>
					</tr>
					</c:if>
					 <c:if test="${dtaqSegmentSchedule.station.station_type=='P'}">
					 <tr>
						<td>
							形象进度剖面图模板：<span class="redSpan">*</span>
						</td>
							<td >
						       <span style="float: left;"><input type="text" id="fileName3_" name="fileName3_"
							class="inputText" size="30" value="${dtaqSegmentSchedule.schematic_name}" /></span>(dwg格式文件，大小2M以内!)
						<span style="float: inherit;margin-left:5px;"><input type="button" icon="icon_currWeek"
							onclick="javascript:showUploadDialogAndRefresh('dtaqSegmentScheduleAction.do?method=uploadFile&flag=3&mainTableName=${maintable}',900,700);"
							style="width: 76px; height: 65px; cursor: pointer" value="文件上传"
							alt="进入文件上传页面" /></span>
						<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_"/>--%>
						<input type="button" icon="icon_delete" onclick="fileClear3(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
							<c:if test="${dtaqScheduleTemplate.schematic_address!=null}">
								<a href="<%=request.getContextPath()%>/dtaqSegmentScheduleAction.do?method=download&type=schematic&sch_id=${dtaqSegmentSchedule.sch_id }">${dtaqSegmentSchedule.schematic_name}</a>
							</c:if>
								<a href='${ctx}/dtaqSegmentScheduleAction.do?method=downloadTemplate&type=schematic&template_id=${dtaqSegmentSchedule.template_id}'">[示意图DWG模板下载]</a></td>
						<td style="display:none">
							形象进度剖面图模板地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr3_" name="fileAddr3_" class="inputText" readonly="readonly" size="30" value="${dtaqSegmentSchedule.schematic_address}"/>
							
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

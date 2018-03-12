<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	//加载
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		document.forms[0].action='projectMaterialsAction.do?method=list&ec_id=${projectMaterials.materials_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}';   
	    	document.forms[0].submit(); 
       });
       //保存
       $("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["materials_type","工程资料类型"];
			saveValidateRequired("#btn_save",properties,"projectMaterialsForm");
		}); 
		//
	 });
</script>
</head>
	
<body>
	<html:form action="projectMaterialsAction.do" method="POST">
		<input type="hidden" name="method" value="save">
		  <html:hidden property="flagPage" value="${flagPage}"/>  
		  <html:hidden property="materials_id" value="${materials_id}"/>
		  <html:hidden property="line_id" value="${line.line_id}"/>
		  <html:hidden property="segment_id" value="${segment.segment_id}"/>
		  <html:hidden property="station_id" value="${station.station_id}"/>
	      <html:hidden property="creator"/>
		<html:hidden property="ec_id" value="${dict_id}"/>
		<html:hidden property="ec_p" value="${param.ec_p}"/>
		<html:hidden property="ec_crd" value="${param.ec_crd}"/>
		<!-- 查询条件 结束-->
		<fieldset >
		<legend>资料信息管理</legend>
			<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								线路：<span class="noRedSpan">*</span>
							</td>

							<td>
								${line.line_name}
							</td>
							<td>
								标段：<span class="noRedSpan">*</span>
							</td>
							<td>
								${segment.segment_name}
							</td>
						</tr>
						<tr>
							<td>
								车站区间：<span class="noRedSpan">*</span>
							</td>

							<td>
								${station.station_name}
							</td>
							<td>
								工程资料类型：<span class="redSpan">*</span>
							</td>
							<td>
								<ex:dictSelect property="materials_type" type="MaterialsType"/>
							</td>
						</tr>
						<tr>
							<td>
								编制人：<span class="noRedSpan">*</span>
							</td>

							<td>
								<ex:userName id="${creator}"/>
							</td>
							<td>
								编制日期：<span class="noRedSpan">*</span>
							</td>
							
								<td><input type="text" class="text" readonly="readonly" name="create_date" value="<fmt:formatDate value='${createDate}' pattern='yyyy-MM-dd HH:mm:ss'/>"/></td>
	   
						</tr>
						
					</table>
					</fieldset>
		
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" class="button1" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" class="button1" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>

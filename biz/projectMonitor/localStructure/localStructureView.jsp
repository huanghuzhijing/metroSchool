<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="base.dataDict.title"/></title>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script language="javascript">
	jQuery(document).ready(function(){
		stationLayerChange() ;
		isPortChange() ;
	})
	function stationLayerChange(){
		var station_layer = jQuery("[name='station_layer']") ;
		if(station_layer.val() == '4'){
			jQuery("#fourTr").show() ;
		}else{
			jQuery("#fourTr").hide() ;
		}
	}
	
	function isPortChange(){
		var isport = jQuery("[name='isport']") ;
		if(isport.val() == '1'){
			jQuery("#portTr").show() ;
		}else{
			jQuery("#portTr").hide() ;
		}
	}
	
	function saveInfo(){
		document.forms[0].submit();
	}
</script>
</head>
<body>

<html:form action="localStructureAction.do">
		<input type="hidden" name="method" value="save">
		<html:hidden property="station_id" value="${station.station_id}"/>
		<html:hidden property="structure_id"/>
		<fieldset>
		<legend><div style="float: left" ><font color="#50A2E6">所属工点：${station.station_name}</font></div></legend>
		<table class="form_table" >
		    <COLGROUP>
				<COL class="tdLeftTwo">
				<COL class="tdRightTwo">
				<COL class="tdLeftTwo">
				<COL class="tdRightTwo">
			</COLGROUP>
			
			<tr>
				<td>起始里程：</td>
				<td>${localStructure.start_position}(m) </td>
				<td>截止里程：</td>
				<td>${localStructure.end_position}(m) </td>
			</tr>
			<tr>
				<td>标准段宽度：</td>
				<td>${localStructure.section_width}(m)</td>
				<td>车站层数：</td>
				<td>
					<html:select property="station_layer" onchange="stationLayerChange()">
						<html:option value="2">二层</html:option>
						<html:option value="3">三层</html:option>
						<html:option value="4">四层</html:option>
					</html:select>
				</td>
			</tr>
			<tr>
				<td>第一层（埋深）：</td> 
				<td>${localStructure.first_depth}(m)</td>
				<td>第二层（埋深）：</td>
				<td>${localStructure.second_depth}(m)</td>
			</tr>
			<tr>
				<td>第三层（埋深）：</td>
				<td colspan="3">${localStructure.third_depth}(m)</td>
			</tr>
			<tr id="fourTr">
				<td>第四层（埋深）：</td>
				<td colspan="3">${localStructure.four_depth}(m)</td>
			</tr>
			<tr>
				<td>围护结构样式：</td>
				<td colspan="3">${localStructure.envelope_style}(m)</td>
			</tr>
			<tr>
				<td>围护结构是否入岩：</td>
				<td colspan="3">
					<html:select property="envelope_stone">
						<html:option value="1">是</html:option>
						<html:option value="0">否</html:option>
					</html:select>
			</tr>
			<tr>
				<td>支撑形式：</td>
				<td>${localStructure.support_style}</td>
				<td>是否有端头井</td>
				<td>
					<html:select property="isport" onchange="isPortChange()">
						<html:option value="1">是</html:option>
						<html:option value="0">否</html:option>
					</html:select>
				</td>
			</tr>
			<tr id="portTr">
				<td>端头井宽度：</td>
				<td>${localStructure.port_width}(m)</td>
				<td>断头井长度：</td>
				<td>${localStructure.port_length}(m)</td>
			</tr>
		</table>
		</fieldset>
	</html:form>
</body>
</html:html>
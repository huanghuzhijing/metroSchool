<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="base.dataDict.title"/></title>
<content tag="heading">结构主体</content>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script language="javascript">
	jQuery(document).ready(function(){
		<c:if test="${localStructure != null}">
			self.parent.leftFrame.location = "${ctx}/dtaqStationAction.do?method=showEnvironment&station_id=${station.station_id}" ;
		</c:if>
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
		<table class="listTable" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%" border="1" align="center" cellpadding="3" cellspacing="0" >
		    <COLGROUP>
				<COL class="tr03" align="right" width="18%">
				<COL class="tr02" width="32%">
				<COL class="tr03" align="right" width="20%">
				<COL class="tr02" width="30%">
			</COLGROUP>
			<tr><td colspan="4" ><span style="color:#50A2E6;font-size:23px;font-weight: bold ;">所属工点：${station.station_name}</span></td></tr>
			<tr>
				<td>起始里程：</td>
				<td><html:text property="start_position" styleClass="text" />(m) </td>
				<td>截止里程：</td>
				<td><html:text property="end_position" styleClass="text" />(m) </td>
			</tr>
			<tr>
				<td>标准段宽度：</td>
				<td><ex:numberInput property="section_width" styleClass="text" type="float" />(m)</td>
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
				<td><ex:numberInput property="first_depth"  type="float"  />(m)</td>
				<td>第二层（埋深）：</td>
				<td><ex:numberInput property="second_depth"  type="float"  />(m)</td>
			</tr>
			<tr>
				<td>第三层（埋深）：</td>
				<td colspan="3"><ex:numberInput property="third_depth" type="float"  />(m)</td>
			</tr>
			<tr id="fourTr">
				<td>第四层（埋深）：</td>
				<td colspan="3"><ex:numberInput property="four_depth" type="float" />(m)</td>
			</tr>
			<tr>
				<td>围护结构样式：</td>
				<td colspan="3"><html:textarea property="envelope_style" cols="70" rows="4"/>(m)</td>
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
				<td><html:text property="support_style" styleClass="text"/></td>
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
				<td><ex:numberInput property="port_width"  type="float" />(m)</td>
				<td>断头井长度：</td>
				<td><ex:numberInput property="port_length"  type="float" />(m)</td>
			</tr>
		</table>
	</html:form>
	<div class="saveDiv">
		  <input type="button" class="saveButton" value="${texts['button.save']}" onclick="saveInfo()" >&nbsp;&nbsp;
	</div>
</body>
</html:html>
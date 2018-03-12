<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
var rule = "gif,jpg,jpeg,png,bmp";
var selectpoint = "";
function backToList() {
  location.href="dtaqCheckpointUseAction.do?method=list&dtaqProjMachCheckpointList_page=${dtaqProjMachCheckpointList_page}&station_id=${param.station_id}&station_state=${param.station_state}&segment_id=${param.segment_id}&isthird=${param.isthird}";
}

function selectType(){
	var pointtypeid = jQuery("[name='pointtypeid']").val();
	if(pointtypeid != ""){
		var url = "${ctx}/dtaqCheckpointUseAction.do?method=validateEdit";
		var checkAjax = new Ajax.Request(url, {method:"post", parameters:"pointtypeid="+pointtypeid+"&projid="+jQuery("[name='projid']").val()+"&stationid="+jQuery("[name='stationid']").val(), onComplete:checkResponse});
	}
}

function checkResponse(checkResponse){
	var resText = checkResponse.responseText;
	if(resText == "no"){
		selectpoint = "${texts['dtaq.dtaqCheckpointUse.used_error']}";
		alert(selectpoint);
		jQuery("[name='pointtypeid'] option:eq(0)").attr("selected","selected") ;
		jQuery("[name='pointtypeid']").focus();
	}else{
		selectpoint = "";
	}
}


function saveInfo() {
	var properties=new Array(); 
	properties[0]=["pointtypeid","监测类型"];
	properties[1]=["onuse","启用状态"];
	saveValidateRequired("#btn_save",properties,"dtaqCheckpointUseForm");
}
</script>
</head>
<body>
   <html:form action="dtaqCheckpointUseAction.do" method="POST">
  	    <input type="hidden" name="method" value="save">
	    <html:hidden property="id"/>
		<html:hidden property="stationid"/>
		<html:hidden property="segment_id" value="${station.segment_id.segment_id}"/>
		<html:hidden property="station_id" value="${param.station_id}"/>
		<html:hidden property="station_state" value="${station.station_state}"/>
		<html:hidden property="dtaqProjMachCheckpointList_page" value="${dtaqProjMachCheckpointList_page}"/>
       <fieldset>
       <c:if test="${pointType != null}"><legend>编辑</legend></c:if>
       <c:if test="${pointType == null}"><legend>新增</legend></c:if>
       <table class="formTable"  width="100%" align="center" cellpadding="3" cellspacing="0">
         	<COLGROUP>
            <COL class="tr03" align="right" width="25%">
            <COL class="tr02" width="75%">
    </COLGROUP>
    		<tr>
             <td>标段：<span calss="noRedSpan"></span></td>
             <td colspan="3">
              ${station.segment_id.segment_name}
              </td>
             
           	 <td>车站/区间：<span calss="noRedSpan"></span></td>
             <td colspan="3">
               	${station.station_name}
             </td>
           </tr>
	           <tr>
	           		<td>监测类型：<span calss="redSpan"></span></td>
	           		<td colspan="3">
		           		<c:if test="${pointType == null}">
		           			<html:select property="pointtypeid" onchange="selectType()">
		           				<html:option value="">请选择</html:option>
		           				<html:optionsCollection name="pointTypeList" value="type_id" label="type_name"/>
		           			</html:select>
		           		</c:if>
		           		<c:if test="${pointType != null}">
		           			<html:hidden property="pointtypeid" value="${pointType.type_id}"/>${pointType.type_name}
		           		</c:if>
	           		</td>
	           	
			    	<td>启用状态：<span calss="redSpan"></span></td>
			    	<td colspan="3">
			    		<ex:dictSelect type="CheckpointTypeOnuse" property="onuse" value="${dtaqProjMachCheckpoint.onuse}"/>
			    	</td>
			    </tr>
         </table>
       </fieldset>
<div class="saveDiv">
	<input type="button" id="btn_save"  value="${texts['button.save']}" onclick="saveInfo()" />&nbsp;&nbsp;
  	<html:button property="back"  styleClass="backButton" value="${texts['button.back']}" onclick="backToList()" />
</div>
</html:form>
  </body>
</html:html>

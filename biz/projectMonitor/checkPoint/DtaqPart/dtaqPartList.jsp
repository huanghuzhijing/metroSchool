<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<ex:bundle />
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
   var oper_id=""; 
	 $(document).ready(function(){
	 //获取线路标段工点
		    getLines('${param.qlineId}','${param.qsectionId}');
		    getSections('${param.qlineId}','${param.qsectionId}');
		    getWokPoints('${param.qsectionId}','${param.qworkPointId}');
     	})
		
		 function selectSegment(){
	      location.href="dtaqPartAction.do?method=list&organ_type=${param.organ_type}&qlineId="+jQuery("[name='qlineId']").val()+"&qsectionId="+jQuery("[name='qsectionId']").val();
		  }
    
     
  

  
</script>

  <fieldset >
		<legend>请选择条件设置</legend>
					<table class="titleTable" >
					    	<colgroup>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							</colgroup>
						<tr>
								<td>线路：</td>
							    <td>
							    	<select id="qlineId" name="qlineId" onchange="getSections(this.value,'')">
							    	
							    	</select>
							    </td>
							     <td>标段：</td>
							    <td><select id="qsectionId" name="qsectionId" onchange="selectSegment()" >
							        
							    </select>
							    </td>
							    <td align="right" width="100%">
								     <c:if test="${qsectionId!=null &&qsectionId!=''}">
											  <c:if test="${organ_type=='O'}">
											  		<input type="button" class="addButton" style="width:110px;" value="导入测点清单" onclick="location.href='${ctx}/dtaqCheckpointAction.do?method=doImport&organ_type=${organ_type}&qlineId=${qlineId}&qsectionId=${qsectionId}'">
											 </c:if>
											  <c:if test="${organ_type=='T'}">
											  		<input type="button" class="addButton" style="width:110px;" value="导入测点清单" onclick="location.href='${ctx}/dtaqCheckpointAction.do?method=doImport&organ_type=${organ_type}&qlineId=${qlineId}&qsectionId=${qsectionId}'">
											  </c:if>
											  <c:if test="${organ_type=='A'}">
											  		<input type="button" class="addButton" style="width:110px;" value="导入测点清单" onclick="location.href='${ctx}/dtaqAutoCheckpointAction.do?method=doImport&organ_type=${organ_type}&qlineId=${qlineId}&qsectionId=${qsectionId}'">
											  </c:if>
								       </c:if>
                               </td>
					 	</tr>								
					</table>
	</fieldset>

  
<table width="100%" border="0" cellpadding="0" cellspacing="0" >
<tr>
  <td valign="top" width="180px">

<c:if test="${segment!=null}">
    <%@include file="/biz/projectMonitor/checkPoint/DtaqCheckpoint/ListLeftTree.jsp" %>
</c:if>
  </td>
  <td valign="top">

<c:if test="${type_id!=null and part_id==null}">
  	<%@include file="/biz/projectMonitor/checkPoint/DtaqPart/dtaqPartList1.jsp"%>
</c:if>	

<c:if test="${part_id!=null and organ_type!='A'}">
  	<%@include file="/biz/projectMonitor/checkPoint/DtaqCheckpoint/dtaqCheckPointList.jsp" %>

</c:if>	
<c:if test="${part_id!=null and organ_type=='A'}">
  	<%@include file="/biz/projectMonitor/checkPoint/dtaqAutoCheckpoint/dtaqAutoCheckpointList.jsp" %>
</c:if>
  </td>
</tr>
</table>

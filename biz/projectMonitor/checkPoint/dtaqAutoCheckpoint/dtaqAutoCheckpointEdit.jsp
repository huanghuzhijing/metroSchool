<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<style>
   #box{
	width: 900px;
	height: 400px;
	margin: 0 auto;
	border: 1px solid #333;
	overflow: auto;
}
#picWrap{
	position: relative;
}
#divCover{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 99;
}
#picWrap img{
	position: absolute;
	z-index: 98;
	left: 0;
	top: 0;
}
.point{
	display: none;
	width: 16px;
	height: 16px;
	cursor: pointer;
	position: absolute;
	z-index: 999;
	background: url(${ctx}/image/icon-point.gif) 0 0 no-repeat;
}
#selectPoint{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9999;
	border: 1px solid #0f0;
	background-color: rgba(0,255,0,.5);
}
#tablePoint{
	width: 96%;
	margin: 20px auto;
	border-collapse: collapse;
}
#tablePoint th, #tablePoint td{
	padding: 5px;
	border: 1px solid #ccc;
}
#tablePoint .code{
	text-align: center;
	width: 50px;
}
</style>

<head>
<style >
#box{
	width: 900px;
	height: 500px;
	margin: 0 auto;
	border: 1px solid #333;
	overflow: auto;
}
#picWrap{
	position: relative;
}
#divCover{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 99;
}
#picWrap img{
	position: absolute;
	z-index: 98;
	left: 0;
	top: 0;
}
.point{
	display: none;
	width: 16px;
	height: 16px;
	cursor: pointer;
	position: absolute;
	z-index: 999;
	background: url(${ctx}/image/icon-point.gif) 0 0 no-repeat;
}
#selectPoint{
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9999;
	border: 1px solid #0f0;
	background-color: rgba(0,255,0,.5);
}
#tablePoint{
	width: 96%;
	margin: 20px auto;
	border-collapse: collapse;
}
#tablePoint th, #tablePoint td{
	padding: 5px;
	border: 1px solid #ccc;
}
#tablePoint .code{
	text-align: center;
	width: 50px;
}
</style>

<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/publicFunction.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery-easyui-1.0.2/jquery.easyui.min.js"></script>

	<script type="text/javascript">
	   $(document).ready(function(){

			
			$("#btn_save").click(function(){
				var properties=new Array(); 
			properties[0]=["point_code","测点编码"];
			    properties[1]=["point_mechine","检测仪器"];
				properties[2]=["part_id","监测部位"];
				properties[3]=["check_frequency","检测频率"];
				properties[4]=["init_value","初始值"];
				properties[5]=["check_state","是否正在检测"];
				properties[6]=["abs_critical_value","绝对临界值"];
				properties[7]=["abs_warning_value","绝对警戒值"];
				properties[8]=["negative_abs_critical_value","负绝对临界值"];
				properties[9]=["negative_abs_warning_value","负绝对警戒值"];
				properties[10]=["rel_critical_value","相对临界值"];
				properties[11]=["rel_warning_value","相对警戒值"];
				properties[12]=["project_direction","工程方向"];
				properties[13]=["update_reason","修改原因"];
				properties[14]=["init_date","监测日期"];
				saveValidateRequired("#btn_save",properties,"dtaqAutoCheckpointForm");
			}); 
		
	
		$("#btn_back").click(function(){ 
		
		location.href='dtaqAutoCheckpointAction.do?method=index&ec_crd=${param.ec_crd}&organ_type=${organ_type}&qlineId=${param.qlineId}&qsectionId=${param.qsectionId}&station_id=${param.station_id}&type_id=${param.type_id}&part_id=${param.part_id}&station_state=${station_state}';
			});
		});
		//
		
	
		function setComparePoint(point_id) {
	
	jQuery("[name='compare_point']").val(point_id) ;
}


////////验证 
function checkDataValue(fieldType,field){

	if(fieldType == "abs"){
		var abs_critical_value = jQuery("[name='abs_critical_value']").val();
		var abs_warning_value = jQuery("[name='abs_warning_value']").val();
		var value = jQuery("[name='"+field+"]").val();
		if(value != "" && parseFloat(value) < 0){
			var field_name = "绝对警戒值";
			if(field == "abs_critical_value"){
				field_name = "绝对临界值";
			}
			alert(field_name + "必须大于0!");
			jQuery("[name='"+field+"']").val("");
			jQuery("[name='"+field+"']").focus();
			return false;
		}
		if(abs_critical_value !="" && abs_warning_value !=""){
			if(parseFloat(abs_critical_value) >= parseFloat(abs_warning_value)){
				alert("绝对警戒值必须大于绝对临界值!");
				jQuery("[name='"+field+"']").val("");
				jQuery("[name='"+field+"']").focus();
				return false;
			}
		}
	}
	else if(fieldType == "neg"){
		var negative_abs_critical_value = jQuery("[name='negative_abs_critical_value']").val();
		var negative_abs_warning_value = jQuery("[name='negative_abs_warning_value']").val();
		var value = jQuery("[name='"+field+"]").val() ;
		if(value != "" && parseFloat(value) > 0){
			var field_name = "负绝对警戒值";
			if(field == "negative_abs_critical_value"){
				field_name = "负绝对临界值";
			}
			alert(field_name + "必须小于0!");
			jQuery("[name='"+field+"']").val("");
			jQuery("[name='"+field+"']").focus();
			return false;
		}
		if(negative_abs_warning_value != "" && negative_abs_critical_value !=""){
			if(parseFloat(negative_abs_warning_value) >= parseFloat(negative_abs_critical_value)){
				alert("负绝对警戒值必须小于负绝对临界值!");
				jQuery("[name='"+field+"']").val("");
				jQuery("[name='"+field+"']").focus();
				return false;
			}
		}
	}
	else if(fieldType == "rel"){
		var rel_critical_value = jQuery("[name='rel_critical_value']").val();
		var rel_warning_value = jQuery("[name='rel_warning_value']").val();
		var value = jQuery("[name='"+field+"]").val()
		if(value != "" && parseFloat(value) < 0){
			var field_name = "相对警戒值";
			if(field == "rel_critical_value"){
				field_name = "相对临界值";
			}
			alert(field_name + "必须大于0!");
			jQuery("[name='"+field+"']").val("");
			jQuery("[name='"+field+"']").focus();
			return false;
		}
		if(rel_critical_value != "" && rel_warning_value !=""){
			if(parseFloat(rel_critical_value) >= parseFloat(rel_warning_value)){
				alert("相对警戒值必须大于相对临界值!");
				jQuery("[name='"+field+"']").val("");
				jQuery("[name='"+field+"']").focus();
				return false;
			}
		}
	}
}





	</script>
</head>
<content tag="heading">
监测点信息维护
</content> 
<body>
	<html:form enctype="multipart/form-data" action="dtaqAutoCheckpointAction.do" method="POST" styleId="pointMgmt">
		<input name="method" value="save" type="hidden"  />
		<html:hidden property="point_id" />
		<!--查询定位 开始-->
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${dtaqCheckpoint.point_id}"/>
	    <html:hidden property="compare_point" styleId="compare_point"/>
		<html:hidden property="type_id" value="${param.type_id}"/>
		<html:hidden property="qlineId" value="${param.qlineId}"/>
		<html:hidden property="qsectionId" value="${param.qsectionId}"/>

		<html:hidden property="station_id"  value="${station_id}"/>
        <html:hidden property="station_state"/>
		<html:hidden property="organ_type" />
	    <html:hidden property="pointx" />
	    <html:hidden property="pointy" />
	  
		
		<!--查询定位 结束-->
		<fieldset >
			<legend></legend>
			<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
						<tr>
						<td>
							测点编码：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text property="point_code"  styleClass="inputText" maxlength="100" size="30"/>
						</td>

						<td>
							监测部位：<span class="redSpan">*</span>
						</td>
						<td >
					        <html:select property="part_id">
									<html:option value="">请选择</html:option>
								        <c:forEach items="${parts}" var="part">
											<html:option value="${part.part_id}" >
									        	${part.part_name} 
									   </html:option>
								   </c:forEach>
								</html:select>
					
						</td>
					</tr>
					
					<tr>
						<td>
							检测仪器：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="point_mechine" styleClass="inputText" size="30"/>
						</td>
						<td>
							检测频率：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="check_frequency" styleClass="inputText" size="30"/>
						</td>
					</tr>
					
					<tr>
						   <c:if test="${kind.type_kind==1}">
							<td>
								初始高层：<span class="redSpan">*</span>
							</td>
							<td>
							<ex:numberInput property="init_value" type="float" maxlength="10"/>(单位：m)
							</td>
					  </c:if>
						 <c:if test="${kind.type_kind==2}">
						<td>
							初始坐标/值：<span class="redSpan">*</span>
						</td>
						<td>
						<ex:numberInput property="init_value" type="float" maxlength="10"/>(单位：m)
						</td>
						</c:if>
						 <c:if test="${kind.type_kind==3}">
						<td>
							初始值：<span class="redSpan">*</span>
						</td>
						<td>
						<ex:numberInput property="init_value" type="float" maxlength="10"/>(单位：m)
						</td>
						</c:if>
						
						 <c:if test="${kind.type_kind==4}">
						<td>
							初始PN值：<span class="redSpan">*</span>
						</td>
						<td>
						<ex:numberInput property="init_value" type="float" maxlength="10"/>(单位：kn)
						</td>
						</c:if>
						 <c:if test="${kind.type_kind==5}">
						<td>
							调整值：<span class="redSpan">*</span>
						</td>
						<td>
						<ex:numberInput property="tune_value" type="float" maxlength="10"/>(单位：kn)
						</td>
						</c:if>
						<td>
							是否正在检测：<span class="redSpan">*</span>
						</td>
						<td>
							 <ex:dictSelect property="check_state" type="TestResult" />
						</td>
						</td>
					</tr>
					<c:choose>
					<c:when test="${kind.type_kind==5}">
					<tr>
					<td>
						   最大振速峰值：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="abs_warning_value" styleClass="inputText"  size="30" value="${kind.abs_warning_value}" onchange="checkDataValue('abs','abs_critical_value')"/>
							(单位：cm/s)
						</td>
					</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<td>
							绝对临界值：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="abs_critical_value" styleClass="inputText"   size="30"  onchange="checkDataValue('abs','abs_critical_value')"/>
							<c:choose>
							<c:when test="${kind.type_kind==4}" >
							(值为:绝对警戒值*80%,单位：kn)
							</c:when>
							<c:otherwise>
							(单位：m)
						      </c:otherwise>
						      </c:choose>
						
						</td>
						<td>
							绝对警戒值：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="abs_warning_value" styleClass="inputText"  size="30"  onchange="checkDataValue('abs','abs_critical_value')"/>
							<c:choose>
							<c:when test="${kind.type_kind==4}" >
							(单位：kn)
							</c:when>
							<c:otherwise>
							(单位：mm)
						      </c:otherwise>
						      </c:choose>
						</td>
					</tr>
					
					<tr>
						<td>
							负绝对临界值：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="negative_abs_critical_value" styleClass="inputText"   size="30"  onchange="checkDataValue('neg','negative_abs_critical_value')"/>
	                        <c:choose>
							<c:when test="${kind.type_kind==4}" >
							(单位：kn)
							</c:when>
							<c:otherwise>
							(单位：mm)
						      </c:otherwise>
						      </c:choose>
						</td>
						<td>
							负绝对警戒值：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="negative_abs_warning_value" styleClass="inputText"  size="30" onchange="checkDataValue('neg','negative_abs_critical_value')"/>
							<c:choose>
							<c:when test="${kind.type_kind==4}" >
							(单位：kn)
							</c:when>
							<c:otherwise>
							(单位：mm)
						      </c:otherwise>
						      </c:choose>
						</td>
					</tr>
					
					
					<tr>
						<td>
							相对临界值：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="rel_critical_value" styleClass="inputText"   size="30"  onchange="checkDataValue('rel','rel_critical_value')"/>
							<c:choose>
							<c:when test="${kind.type_kind==4}" >
							(单位：kn/d)
							</c:when>
							<c:otherwise>
							(单位：mm/d)
						      </c:otherwise>
						      </c:choose>
						</td>
						<td>
							相对警戒值：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="rel_warning_value" styleClass="inputText"  size="30"  onchange="checkDataValue('rel','rel_critical_value')"/>
							<c:choose>
							<c:when test="${kind.type_kind==4}" >
							(单位：kn/d)
							</c:when>
							<c:otherwise>
							(单位：mm/d)
						      </c:otherwise>
						      </c:choose>
						</td>
					</tr>
					</c:otherwise>
					</c:choose>
					<tr>
					<td>
							工程方向：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="project_direction" styleClass="inputText"  size="30"/>(示例：+隆起-下沉)
						</td>
					</tr>	
					
					<td>
							监测日期：<span class="redSpan">*</span>
						</td>
						<td>
<input type="text" id="init_date" name="init_date" class="form_input" value='<fmt:formatDate pattern="yyyy-MM-dd HH" value="${dtaqCheckpoint.init_date}"/>' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH'})"/>
		
						
						</td>
					</tr>	
					
					
					<td>
							修改原因：<span class="redSpan">*</span>
						</td>
						<td>
							<ex:dictSelect property="update_reason" type="UpdatePointReason"/>
						</td>
					</tr>	
					
					<tr>
						<td>
							备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<html:textarea  property="remark"></html:textarea>
						</td>
					</tr>
			</table>
		</fieldset>
	<c:if test="${param.organ_type =='T'}">
		  <iframe frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" height="180px"
				  src="dtaqAutoCheckpointAction.do?method=doCompare&organ_type=${param.organ_type}&__skip__&station_id=${param.station_id}&qlineId=${param.qlineId}&segment_id=${param.segment_id}&type_id=${param.type_id}&__skip__"></iframe>
		</c:if>
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
		</div>
		<td align="center">&nbsp;<%@include file="/biz/projectMonitor/checkPoint/dtaqAutoCheckpoint/dtaqAutoCheckpointEdit2.jsp" %></td>
	</html:form>
</body>
</html:html>


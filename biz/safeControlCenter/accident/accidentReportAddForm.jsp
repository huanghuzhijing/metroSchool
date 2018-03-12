<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
	<script type="text/javascript">
		
	   $(document).ready(function(){
	   
	   //获取线路标段
		    getLines('${param.qlineId}','${param.qsectionId}');
		    getSections('${param.qlineId}','${param.qsectionId}');
		    getWokPoints('${param.qsectionId}','${param.qworkPointId}');
		
						      
			$("#btn_save").click(function(){
				var properties=new Array(); 
				properties[0]=["fname","事故主题"];
				properties[1]=["lineId","线路"];
				properties[2]=["segmentId","标段"];
				properties[3]=["happenTime","事故发生时间"];
			
				saveValidateRequired("#btn_save",properties,"accidentReportForm");
			}); 
			
			});
			
	</script>
</head>
<content tag="heading">
	安全事故快报
</content>
<body>
	<html:form enctype="multipart/form-data" action="accidentReportAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="fid" />
		<!--查询定位 开始-->
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<!--查询定位 结束-->
		
			
			<table class="formTable" >
					<COLGROUP>
							<COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
			                <COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
						  事故主题：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text size="60" property="fname"  styleClass="inputText" maxlength="100"/>
						</td>
					</tr>
					<tr>
					<td>
						  线路：<span class="redSpan">*</span>
						</td>
						<td >
							    	<select style="width: 240px" id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select>
							    </td>
						<td>
						  标段：<span class="redSpan">*</span>
						</td>
						<td>
								<select id="qsectionId" name="qsectionId" onchange="getWokPoints(this.value,'')"></select>
							</td>
					</tr>
					<tr>
					<td>
						  事故发生时间：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="happenTime"  styleClass="inputText" maxlength="100"/>
						</td>
						<td>
						  当前状态：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="currentState"  styleClass="inputText" maxlength="100"/>
						</td>
					</tr>
					<tr>
					<td>
						  车站区间：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="station"  styleClass="inputText" maxlength="100"/>
						</td>
						<td>
						  事故发生地点：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="address"  styleClass="inputText" maxlength="100"/>
						</td>
					</tr>
					<tr>
					<td>
						  事故等级：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="levels"  styleClass="inputText" maxlength="100"/>
						</td>
						<td>
						  事故类别：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="catagory"  styleClass="inputText" maxlength="100"/>
						</td>
					</tr>
					<tr>
					<td>
						  天气状况：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="weather"  styleClass="inputText" maxlength="100"/>
						</td>
						<td>
						  受伤人数：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="wounderNumber"  styleClass="inputText" maxlength="100"/>
						</td>
					</tr>
					<tr>
					<td>
						  死亡人数：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="deathNumber"  styleClass="inputText" maxlength="100"/>
						</td>
						<td>
						  事故简单描述：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text size="30" property="describe"  styleClass="inputText" maxlength="100"/>
						</td>
					</tr>
				<tr>
				<td>
						  事故详细描述：<span class="noRedSpan">*</span>
						</td>
				<td colspan="3">
	   		<html:textarea property="details" styleId="details" cols="20" rows="40" onblur="checkTextarea('content',2000)" onkeydown="textCounter('content','spanSummary',2000)" onkeyup="textCounter('content','spanSummary',2000)"/>
	   		<span class="req" id="spandescription" style="display:inline">（2000字符以内）</span>	   					
	    </td>
				</tr>
					
					
					
			</table>
	
		
		<div class="saveDiv">
			<input id="btn_save" value="保 存" type="button" icon="icon_save"/>
			
		</div>
	</html:form>
</body>
</html:html>

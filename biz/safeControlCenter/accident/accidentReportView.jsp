<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>

	<script type="text/javascript">
		
	   $(document).ready(function(){
	   	  								      					
			//返回
			$("#btn_back").click(function(){   
	    		location.href="${ctx}/accidentReportAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.fid}&ec_crd=${param.ec_crd}";
			});  
			
			});
			
	</script>
</head>
<content tag="heading">
	安全事故跟踪处理详细
</content>
<body>
	<html:form enctype="multipart/form-data" action="accidentReportAction.do"
		method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="fid" value="${accidentDeal.fid}" />
		<html:hidden property="problemId" value="${accidentReport.fid}" />
		<!--查询定位 开始-->
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<!--查询定位 结束-->
		<fieldset>
                <legend>基本信息</legend> 
		<table class="formTable">
			<COLGROUP>
				<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
				<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
			</COLGROUP>
		
			
			<tr>
				<td>
					事故主题：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.fname}
				</td>
			</tr>

			<tr>
				<td>
					事故发生时间：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.happenTime}
				</td>
				<td>
					当前状态：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.currentState}
				</td>
			</tr>
			<tr>
				<td>
					车站区间：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.station}
				</td>
				<td>
					事故发生地点：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.address}
				</td>
			</tr>
			<tr>
				<td>
					事故等级：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.levels}
				</td>
				<td>
					事故类别：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.catagory}
				</td>
			</tr>
			<tr>
				<td>
					天气状况：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.weather}
				</td>
				<td>
					受伤人数：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.wounderNumber}
				</td>
			</tr>
			<tr>
				<td>
					死亡人数：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.deathNumber}
				</td>
				<td>
					事故简单描述：
					<span class="noRedSpan">*</span>
				</td>
				<td>
					${accidentReport.describe}
				</td>
			</tr>
			<tr>
				<td>
					事故详细描述：
					<span class="noRedSpan">*</span>
				</td>
				<td colspan="3">
					${accidentReport.details}
				</td>
			</tr>
			

		</table>
</fieldset>
<%@ include file="/commons/showFilesException.jsp"%>

		<div class="saveDiv">
			
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>

		</div>
	</html:form>
</body>
</html:html>

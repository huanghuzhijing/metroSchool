<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
        var oper_id="";
		jQuery(document).ready(function(){
		
		//控制按钮状态
			
			$("#btn_view").show();

			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);	
				
			//详情
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
							
		});
		
		//详细页面
		function showView(id){
		   
	    	var url ='constructorAction.do?method=view&flag=2&flagExp=${param.flag}&cons_id='+id+'&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}&qsex=${param.qsex}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			commonUrl(url);
	  	}
		
		
		
		//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;		
		}
		
		//指令码判断
		function checkCmd(){
			var cmdIds='${userinfo.usercmd}';
		}
          		
		//计算年龄
		function init(){
	
	var birthdayHids = jQuery("[name='birthdayHid']");
	var ageDivs = jQuery("[flag='ageDiv']");
	var birthday = "";
	
	birthdayHids.each(function(i){
	
	if(getAge(jQuery(this).val())==0){
	$("[flag='ageDiv']").eq(i).html("0");
	}else{
	$("[flag='ageDiv']").eq(i).html(getAge(jQuery(this).val()));
	}
	
	})
}

function getAge(birthday){

	var date = new Date();
	var yy = date.getFullYear();
	var birthdayYear = birthday.substring(0,4);

	return parseInt(yy)-parseInt(birthdayYear);
}
		
</script>
</head>
<body onload="init()">
<table class="queryTable">
<tr>
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
 	<tr>
 	<td>
 	<html:form action="constructorAction.do?method=queryList&flag=${param.flag}&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}">
		  				
						  <table align="left">
						<tr>
							<td >姓名：</td>
							<td><html:text property="qname" /></td>
							<td >性别：</td>
							<td><ex:dictSelect type="EmployeeSex" property="qsex"/>  </td>
						</tr>
						<tr>
						<td>资格证有效期：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								<td align="right">
									<input type="submit" value="查询" icon="icon_query" />
								</td>
						</tr>
					</table>
					  </html:form>
					  </td>
		</tr>
 	</table>
 	<fieldset>
 <legend><strong>信息列表</strong></legend>
  	<div align="center">
 		<font class="t_memo_font">
				  	<span style="float:left;margin-left:10px;">颜色说明:</span>
				  	<span style="background-color:#fc8080;display:block;width:40px;height:15px;float:left;"></span><span style="float:left">&nbsp;在岗资格证已失效&nbsp;&nbsp;&nbsp;</span>
				  	<span style="background-color:#807e7e;display:block;width:40px;height:15px;float:left;"></span><span style="float:left">&nbsp;已离岗</span>
	</font>
	
	</div><br>
	
	<div >
	<input id="btn_view" value="${texts['button.detail']}" type="button"
			icon="icon_view" />
	</div>		

			
			
  
<c:set var="nowDate" value="<%=System.currentTimeMillis()%>"></c:set>
	<ec:table items="constructors" var="constructor"
		action="constructorAction.do?method=list" title="" width="100%"
		sortable="false" rowsDisplayed="10"
		imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		locale="zh_CN" retrieveRowsCallback="limit" filterRowsCallback="limit"
		sortRowsCallback="limit">
		<ec:row highlightRow="true"
			onclick="pullValue('${constructor.cons_id}','');"
			ondblclick="showView('${constructor.cons_id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%" />
			<ec:column property="null" sortable="false" title="选择" width="5%">
				<input name="select_id" value="${constructor.cons_id}" type="radio" />
			</ec:column>
															
			<ec:column property="name" title="姓名" width="5%">
				${constructor.name}
			</ec:column>
			<ec:column property="sex" title="性别" width="5%">
				<ex:dicDisplay dictIdentify="EmployeeSex" dictValue="${constructor.sex}"/>    
			</ec:column>
			<ec:column property="birthday" title="年龄" width="5%">
			<div flag="ageDiv"></div>
				<input type="hidden" id="birthdayHid" name="birthdayHid" value='<fmt:formatDate value="${constructor.birthday}" pattern="yyyy-MM-dd"/>'/>
			</ec:column>
			<ec:column property="line_id" title="线路" width="10%">
				${dtaqSegment.line_id.line_name}   
			</ec:column>
			<ec:column property="segment_id" title="标段" width="10%">
				${dtaqSegment.segment_name}    
			</ec:column>
			<ec:column property="organ_sg" title="施工单位" width="12%">
				<c:forEach items="${organs}" var="org">
			  	 	<c:if test="${org.f_id == constructor.organ_sg}">
			  	 		<c:out value="${org.f_name}"></c:out>
			  	 	</c:if>
			  	 </c:forEach>
			</ec:column>
			<ec:column property="job_type" title="工种" width="5%">
			<ex:dicDisplay dictIdentify="JobType" dictValue="${constructor.job_type}"/>	
			</ec:column>
			
			<ec:column property="qualify_limit" title="资格证有效期" width="12%">
				<fmt:formatDate var="limitDate" value="${constructor.qualify_limit}" pattern="yyyy-MM-dd"/>
			  		<c:if test="${nowDate - constructor.qualify_limit.time < 3600*24*1000*1}">
			  			<div align="center" style="width:100%">${limitDate}</div>
			  		</c:if>
			  		<c:if test="${(constructor.job_state == '0') && (nowDate - constructor.qualify_limit.time >= 3600*24*1000*1)}">
			  			<div align="center" style="width:100%">${limitDate}</div>
			  		</c:if>
			  		<c:if test="${(constructor.job_state == '1') && (nowDate - constructor.qualify_limit.time >= 3600*24*1000*1)}">
			  			<div align="center" style="background-color:#fc8080;width:100%">${limitDate}</div>
			  		</c:if>
			</ec:column>
			<ec:column property="isjob_training" title="岗前培训" width="5%">
				<c:if test="${constructor.isjob_training == '1'}">有</c:if>
			  		<c:if test="${constructor.isjob_training == '0'}">无</c:if>
			</ec:column>
			<ec:column property="job_state" title="状态" width="5%">
				<c:if test="${constructor.job_state == '1'}"><div align="center" style="background-color:width:80%">在岗</div></c:if>
			  		<c:if test="${constructor.job_state == '0'}"><div align="center" style="background-color:#807e7e;width:80%">离岗</div></c:if>
			</ec:column>
			

		</ec:row>
	</ec:table>
	</fieldset>
</body>

</html:html>
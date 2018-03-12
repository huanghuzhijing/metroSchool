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
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			$("#btn_view").hide();

			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);	
				//新增
			$("#btn_add").click(function(){ 			  
				location.href='constructorAction.do?method=create&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}&ec_crd='+$("[name='ec_rd']").val()+'';
			}); 
			//编辑
			$("#btn_edit").click(function(){		  
				var url='constructorAction.do?method=edit&cons_id='+oper_id+'&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='constructorAction.do?method=delete&cons_id='+oper_id+'&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			
			//详情
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
							
		});
		
		//详细页面
		function showView(id){
		   
	    	var url ='constructorAction.do?method=view&flag=1&cons_id='+id+'&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
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
	<fieldset>
 	<legend><strong>列表说明</strong></legend>
 	<div align="center">
 		<font class="t_memo_font">
				  	<span style="float:left;margin-left:10px;">颜色说明:</span>
				  	<span style="background-color:#fc8080;display:block;width:40px;height:15px;float:left;"></span><span style="float:left">&nbsp;在岗资格证已失效&nbsp;&nbsp;&nbsp;</span>
				  	<span style="background-color:#807e7e;display:block;width:40px;height:15px;float:left;"></span><span style="float:left">&nbsp;已离岗</span>
	</font></div>
 	
 </fieldset>
 <fieldset>
 <legend><strong>信息列表</strong></legend>
  	
			  	
			 <c:if test="${not empty dtaqSegment.segment_id}">

			<div class="promptDiv">
				所属线路：
				<span class="keyInfoSpan">${dtaqSegment.line_id.line_name}</span>&nbsp;&nbsp;&nbsp;&nbsp;
				所属标段：
				<span class="keyInfoSpan">${dtaqSegment.segment_name}</span>
			</div>
			  </c:if>	
			 		
  	
  	
	<div class="listButtonDiv">
		<input id="btn_add" value="${texts['button.new']}" type="button"
			icon="icon_add" />
		<input id="btn_view" value="${texts['button.detail']}" type="button"
			icon="icon_view" />
		<input id="btn_edit" value="${texts['button.edit']}" type="button"
			icon="icon_edit" />
		<input id="btn_delete" value="${texts['button.delete']}" type="button"
			icon="icon_delete" />
		<input type="button" class="button1" value="导出excel" icon="icon-excel" onclick="location.href='constructorAction.do?method=exportConstructExcel&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}'"/>
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
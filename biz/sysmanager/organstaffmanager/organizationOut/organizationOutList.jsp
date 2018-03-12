<%@   page contentType="text/html;charset=UTF-8"  %>

 <%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
	var oper_id="";
	//加载
	$(document).ready(function(){
		//
		$("#btn_edit").hide();
		$("#btn_delete").hide();
		$("#btn_view").hide();
		//控制按钮
		var ec_id='${param.ec_id}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
		}
		pullValue(ec_id);
		//
		//增加
       $("#btn_add").click(function(){
       		location.href='organizationOutAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val()+'&qf_name='+$("[name='qf_name']").val()+'&qf_economictype='+$("[name='qf_economictype']").val();
       });
       //
		$("#btn_view").click(function(){ 
			showView(oper_id);
		}); 
       //修改
       $("#btn_edit").click(function(){ 
       		var url='organizationOutAction.do?method=edit&f_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qf_economictype='+$("[name='qf_economictype']").val();
			commonUrl(url);
		});
		//selectProjectPeriods
		$("#btn_change").click(function(){ 
       		var url="organizationAction.do?method=changePro&f_id="+oper_id+"&qf_no=${param.qf_no}&static_parent_id=${param.static_parent_id}"+"&ec_p="+$("input[name='ec_p']").val();
			commonUrl(url);
		});
       //删除
       $("#btn_delete").click(function(){ 
        			if(window.confirm("${texts['dtaq.common.delete.msg']}"))
					{
					   $.ajax({
					   type: "POST",
					   url: "${ctx}/organizationOutAction.do?method=validateDelete",
					   data: "orgId="+oper_id+"&orgType=outer",
					   success: function(msg){
					   		if(msg=="no"){
								alert("该组织下有子节点组织信息，删除无效");
								return;
							}
							if(msg=="haveEmp"){
								alert("该组织下有员工信息,删除无效");
								return;
							}
							if(msg=="dtaqSegment_error"){
								alert("标段有关联该员工信息,删除无效");
								return;
							}
							if(msg=="station_error"){
								alert("车站有关联该员工信息,删除无效");
								return;
							}
							if(msg=='yes'){
								var url="organizationOutAction.do?method=delete&f_id="+oper_id;
								commonUrl(url);
							}
					   }
					});
				}	
	    });
		//
	});
	
	//详细页面
	function showView(id){
		var url='organizationOutAction.do?method=view&f_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qf_economictype='+$("[name='qf_economictype']").val();
		commonUrl(url);
  	}
  	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
</script>
</head>
<content tag="heading">
参建单位信息管理
</content>
<body> 
<td valign="top">
	          <table class="queryTable" >
					<tr>
						<td class="queryTitle">
							<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td>
							<html:form action="organizationOutAction.do?method=list" method="POST">
								<table class="queryContentTable">
									<tr>
										
										<td>
											名称：&nbsp;&nbsp;
										</td>
										<td>
											<html:text property="qf_name" value="${param.qf_name}" size="20" styleClass="inputText"/>
										</td>
									
										<td>
											单位类别：&nbsp;&nbsp;
										</td>
										<td>
											<ex:dictSelect property="qf_economictype" type="OrgaizeationEconomictype"/> 
										</td>
										<td><input type="submit" id="btn_query" icon="icon_query" value="查 询" /></td>
									</tr>
								</table>
							</html:form>
						</td>
					</tr>
				</table>
					<div  class="promptDiv">
				
						 <input type="button" id="btn_add"  icon="icon_add" value="${texts['button.new']}"/>
						 <input type="button"  icon="icon_view"  id="btn_view"  value="${texts['button.detail']}"/>
						 <input type="button"  icon="icon_edit"  id="btn_edit"  value="${texts['button.edit']}"/>
						 <input type="button"  icon="icon_delete" id="btn_delete" value="${texts['button.delete']}"/>
				  
					</div>
				<ec:table items="organizations" var="organization"
							action="organizationOutAction.do?method=list" title=""  locale="zh_CN"
							sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
							retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
					<ec:row highlightRow="true" ondblclick="showView('${organization.f_id}');"
							onclick="pullValue('${organization.f_id}');">
						<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
						<ec:column property="null" sortable="false" title="选择" width="6%" >
							<input name="select_id" value="${organization.f_id}" type="radio"/>
						</ec:column>
						<ec:column property="f_name" title="名称" />
						<ec:column property="f_no" title="编号" />
						<ec:column property="f_chargeperson" title="法人" />
						<ec:column property="f_economictype" title="单位类别" width="120px">
						<ex:dicDisplay dictIdentify="OrgaizeationEconomictype" dictValue="${organization.f_economictype}" />
				   		</ec:column>
						<ec:column property="f_tel" title="电话" />
						
						<ec:column property="f_createdate" title="创建日期" >
							<fmt:formatDate value="${organization.f_createdate}" pattern="yyyy-MM-dd"/>
						</ec:column>
					</ec:row>
				</ec:table> 
			
  </body>
</html:html>
<%@ page contentType="text/html;charset=UTF-8" %>
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
       		location.href='organizationAction.do?method=create&qf_no=${qf_no}&static_parent_id=${static_parent_id}&fIsdelete=${fIsdelete}&name=${name}';
       });
       //
		$("#btn_view").click(function(){ 
			showView(oper_id);
		}); 
       //修改
       $("#btn_edit").click(function(){ 
       		var url="organizationAction.do?method=edit&f_id="+oper_id+"&name=${name}&fIsdelete=${fIsdelete}&qf_no=${param.qf_no}&static_parent_id=${static_parent_id}"+"&ec_p="+$("input[name='ec_p']").val();
			commonUrl(url);
		});
		//selectProjectPeriods
		$("#btn_change").click(function(){ 
		 $.ajax({
					   type: "POST",
					   url: "${ctx}/organizationAction.do?method=validateDelete",
					   data: "orgId="+oper_id,
					   success: function(msg){
					   alert(msg);
					   		if(msg=="no"){
								alert("该组织下还有组织，不能转换部门");
							}else{
								var url="organizationAction.do?method=changePro&f_id="+oper_id+"&name=${name}&qf_no=${param.qf_no}&fIsdelete=${fIsdelete}&static_parent_id=${static_parent_id}"+"&ec_p="+$("input[name='ec_p']").val();
			                    commonUrl(url);
							}
					   }
					});
       		
			
		});
       //删除
       $("#btn_delete").click(function(){ 
	    //	var orgid = $(this).attr("paramId");
        			if(window.confirm("${texts['dtaq.common.delete.msg']}"))
					{
					   $.ajax({
					   type: "POST",
					   url: "${ctx}/organizationAction.do?method=validateDelete",
					   data: "orgId="+oper_id,
					   success: function(msg){
					 
					   		if(msg=="no"){
								alert("该组织下有子节点组织信息，删除无效");
								return;
							}
							if(msg=="haveEmp"){
								alert("该组织下有员工信息,删除无效");
								return;
							}else{
								var url="organizationAction.do?method=delete&f_id="+oper_id+"&name=${name}&qf_no=${qf_no}&fIsdelete=${fIsdelete}&static_parent_id=${static_parent_id}"+"&ec_p="+$("input[name='ec_p']").val();
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
		var url="organizationAction.do?method=view&f_id="+oper_id+"&name=${name}&qf_no=${qf_no}&static_parent_id=${static_parent_id}&fIsdelete=${fIsdelete}"+"&ec_p="+$("input[name='ec_p']").val()+'&viewFlag=true';
		commonUrl(url);
  	}
  	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
</script>
</head>
<content tag="heading">
内部组织信息管理
</content>  
<body > 
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
       <tr>
       	 <td valign="top" width="150px"> 
	          <div style="overflow: auto;width: 220px;">
					<script  type="text/javascript">
							//显示树
							var organizationTree = new dTree('organizationTree');
							organizationTree.setIconPath("${ctx}/scripts/dtree/");
							organizationTree.add('-1',-99,'组织树','${ctx}/organizationAction.do?method=list');
							<c:forEach items="${organizationstree}" var="organization">
									organizationTree.add('${organization.f_id}','${organization.parent_id}','${organization.f_name}','${ctx}/organizationAction.do?method=list&static_parent_id=${organization.f_id}&fIsdelete=0&qf_no=${organization.f_no}');
							</c:forEach>
							organizationTree.add('0','-1','被移除组织','${ctx}/organizationAction.do?method=list&fIsdelete=1&static_parent_id=0');
							<c:forEach items="${organizationsremovetree}" var="orgaizeation">							
								organizationTree.add('${orgaizeation.f_id}','0','${orgaizeation.f_name}','${ctx}/organizationAction.do?method=list&static_parent_id=${orgaizeation.f_id}&fIsdelete=1&qf_no=${organization.f_no}');
							</c:forEach>
							<c:if test="${param.static_parent_id!=''}">
								organizationTree.openTo("${static_parent_id}",true);
							</c:if>
							
							document.write(organizationTree);
							organizationTree.openAll();
							
						
						</script>
				</div>
		 </td>
         <td valign="top">
	      <br/>
				<div class="promptDiv">
		          <span class="keyInfoSpan">当前节点:${name}</span>
		       </div>	
					<div  class="promptDiv">
					<c:if test="${fIsdelete=='0'}">
						 <input type="button" id="btn_add"  icon="icon_add" value="${texts['button.new']}"/>
						 <input type="button"  icon="icon_view"  id="btn_view"  value="${texts['button.detail']}"/>
						 <input type="button"  icon="icon_edit"  id="btn_edit"  value="${texts['button.edit']}"/>
						 <input type="button"  icon="icon_delete" id="btn_delete" value="${texts['button.delete']}"/>
						<c:if test="${change!=''}">
						 <input type="button"  icon="icon_edit" id="btn_change" value="转换部门"/>
					</c:if>
				    </c:if>
				     
				    <c:if test="${fIsdelete=='1'}">
				     <input type="button"  icon="icon_view"  id="btn_view"  value="${texts['button.detail']}"/>
				    </c:if>
					</div>
				<ec:table items="organizations" var="organization"
							action="organizationAction.do?method=list" title=""  locale="zh_CN"
							sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
							retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
					<ec:row highlightRow="true" ondblclick="showView('${organization.f_id}');"
							onclick="pullValue('${organization.f_id}');">
						<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
						<ec:column property="null" sortable="false" title="选择" width="6%" >
							<input name="select_id" value="${organization.f_id}" type="radio"/>
						</ec:column>
						<ec:column property="f_no" title="组织编号" />
						<ec:column property="f_name" title="组织名称" />
						<ec:column property="f_tel" title="电话" />
						<ec:column property="f_createdate" title="创建日期" >
							<fmt:formatDate value="${organization.f_createdate}" pattern="yyyy-MM-dd"/>
						</ec:column>
					</ec:row>
				</ec:table> 
		</td>
		</tr>
	</table>		
  </body>
</html:html>

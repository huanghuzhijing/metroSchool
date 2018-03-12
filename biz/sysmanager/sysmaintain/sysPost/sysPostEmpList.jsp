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
	 //
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
 	   //增加
       $("#btn_add").click(function(){
       		location.href='employeeAction.do?method=create&static_postid=${param.static_postid}';
       });
       //详细
		$("#btn_view").click(function(){ 
			showView(oper_id);
		}); 	  
       //修改
		$("#btn_edit").click(function(){ 
			var url="employeeAction.do?method=edit&id="+oper_id+"&static_postid=${param.static_postid}"+"&ec_p="+$("input[name='ec_p']").val();
			commonUrl(url);
		});	            
       //删除
		$("#btn_delete").click(function(){ 
			if(window.confirm("将删除该员工信息在用户管理、用户组员工管理、员工项目配置中的关联信息")){
				var url="employeeAction.do?method=delete&id="+oper_id+"&static_postid=${param.static_postid}"+"&ec_p="+$("input[name='ec_p']").val();
				commonUrl(url);
			}
		});
		//	 
	 });
	//
	function showView(id){
		var url ='employeeAction.do?method=view'+'&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&static_postid=${param.static_postid}'+'&viewFlag=true';
		commonUrl(url);
	} 
	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
	//人员选择
	function setParamValue(empIds,empNames,organNames){
		if(empIds!=''){
			var url="sysPostAction.do?method=selectEmp&staticPostId=${staticPost.id}&empIds="+empIds;
			art.dialog({id:'commonDialog2',title:'', iframe:url, width:'20', height:'20'});
		}
	}
	//刷新页面
	function pageRefresh(){
		var url='sysPostAction.do?method=postEmpList&static_postid=${param.static_postid}';
		commonUrl(url);
	}
	//
	function deleteObj(joinId){
		ret = window.confirm('${texts['dtaq.common.delete.msg']}');
		if(ret){
			var url="sysPostAction.do?method=selectEmp&deleteFlag=1&joinId="+joinId;
			art.dialog({id:'commonDialog2',title:'', iframe:url, width:'20', height:'20'});
		}
	}
</script>
</head>
<content tag="heading">
岗位员工设置管理
</content>  
<body > 
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
       <tr>
       	 <td valign="top" width="250px"> 
	          <div style="overflow: auto;width: 250px;">
					<script language='javascript'>
						//显示树
						var organizationTree = new dTree('organizationTree');
						organizationTree.setIconPath("${ctx}/scripts/dtree/");
						organizationTree.add('-1',-99,'岗位结构树','${ctx}/sysPostAction.do?method=postEmpList&static_postid=-1');
						<c:forEach items="${sysPosts}" var="sysPost">
								organizationTree.add('${sysPost.id}','${sysPost.parentId}','${sysPost.postName}','${ctx}/sysPostAction.do?method=postEmpList&static_postid=${sysPost.id}');
						</c:forEach>
						document.write(organizationTree);
						organizationTree.openAll();
					</script>
				</div>
		 </td>
         <td valign="top">
	          <table class="queryTable" >
					<tr>
						<td class="queryTitle">
							<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td>
							<html:form action="sysPostAction.do?method=postEmpList&static_postid=${param.static_postid}" method="POST">
								<table class="queryContentTable">
									<tr>
										<td>
											姓&nbsp;&nbsp;&nbsp;&nbsp;名：
										</td>
										<td>
											<html:text property="qempname" size="20" styleClass="inputText"/>
										</td>
										<td><input type="submit" id="btn_query" icon="icon_query" value="查 询" /></td>
									</tr>
								</table>
							</html:form>
						</td>
					</tr>
				</table>
				<div class="promptDiv">
					岗位名称：
					<span class="keyInfoSpan">
						<c:if test="${param.static_postid==null || param.static_postid=='' || param.static_postid==-1}">岗位结构树</c:if>
						<c:if test="${param.static_postid!=null && param.static_postid!=-1}">${staticPost.postName}</c:if>
					</span>
				</div>
				<div class="promptDiv">
					<c:if test="${param.static_postid == null || param.static_postid == '' || param.static_postid == '-1' || nodesize =='4'}">
						<span  class="keyInfoSpan">点击最底层组织节点才能增加</span>
					</c:if>
					<c:if test="${param.static_postid!=null && param.static_postid!='' && param.static_postid!='-1'}">
						<%@ include file="/biz/sysmanager/sysmaintain/sysPlug/selectEmpNoteOrganGroup/selectEmpNoteOrganGroup.jsp" %>
					</c:if>		
				</div>
				<ec:table items="sysPostEmpJoins" var="sysPostEmpJoin"
						action="sysPostAction.do?method=postEmpList" title=""  locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						>
						<ec:row highlightRow="true" 
						>
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="10%"/>
							<ec:column property="empId.empname" title="姓名" />
							<ec:column property="null" title="操作" width="10%">
								<input value="${texts['button.delete']}" type="button" onclick="deleteObj(${sysPostEmpJoin.id });" icon="icon_delete" />
							</ec:column>
						</ec:row>
					</ec:table>
		</td>
		</tr>
	</table>		
  </body>
</html:html>

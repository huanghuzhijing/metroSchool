<%@   page contentType="text/html;charset=UTF-8"  %>

 <%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
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
		$(".choose").click(function(){ 
		 parent.$("[name='qe_org']").val($(this).attr("paramName"));
		  parent.$("[name='qe_orgid']").val($(this).attr("paramId"));
		  //qe_orgName
		  parent.$("[name='qe_orgName']").val($(this).attr("paramName"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
     $("[name='select_id']").parent().parent().click(function(){
			var select_row = $(this).find("[name='select_id']") ;
			select_row.attr("checked","checked") ;
			pullValue(select_row.get(0).value) ;
	});
	});
	
  	
</script>
</head>

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
							<html:form action="organizationOutAction.do?method=selectCorp" method="POST">
								<table class="queryContentTable">
									<tr>
										
										<td>
											单位名：&nbsp;&nbsp;
										</td>
										<td>
											<html:text property="qf_name" size="20" styleClass="inputText"/>
										</td>
									    <td>
											单位编号：&nbsp;&nbsp;
										</td>
										<td>
											<html:text property="qf_no" size="20" styleClass="inputText"/>
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
					
				<ec:table items="organizations" var="organization"
							action="organizationOutAction.do?method=selectCorp" title=""  locale="zh_CN"
							sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
							retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
					<ec:row highlightRow="true" ondblclick="showView('${organization.f_id}');"
							onclick="pullValue('${organization.f_id}');">
						<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
						
						<ec:column property="f_name" title="单位名称" />
						<ec:column property="f_no" title="单位编号" />
						<ec:column property="f_economictype" title="单位类别" width="120px">
						<ex:dicDisplay dictIdentify="OrgaizeationEconomictype" dictValue="${organization.f_economictype}" />
				   		</ec:column>
						<ec:column property="f_chargeperson" title="企业法人" />
						<ec:column property="f_address" title="地址" />
						<ec:column property="f_postcode" title="邮编" />
						<ec:column property="f_attribute" title="属性" />
						<ec:column property="null" title="操作" >
						<input type="button" class="choose" icon="icon_query" value="选择" paramName="${organization.f_name}" paramId="${organization.f_id}"/>
						</ec:column>
						
					</ec:row>
				</ec:table> 
			
  </body>
</html:html>
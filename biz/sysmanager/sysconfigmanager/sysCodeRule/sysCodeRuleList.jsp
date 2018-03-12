<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		var oper_id="";
		//加载
		$(document).ready(function(){
			//
			var ec_id='${param.ec_id}';
			$("#btn_addchild").hide();
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);
			//
			$("#btn_add").click(function(){ 
				var url ='sysCodeRuleAction.do?method=create';
				art.dialog({id:'commonDialog1',title:'编码规则', iframe:url, width:'600', height:'450',top:'0'});
			}); 
			//
			$("#btn_edit").click(function(){
				var url ='sysCodeRuleAction.do?method=edit&id='+oper_id;
				art.dialog({id:'commonDialog1',title:'编码规则', iframe:url, width:'600', height:'450',top:'0'});
			}); 
			//
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					location.href='sysCodeRuleAction.do?method=delete&id='+oper_id;
				}
			});
			//
			$("#btn_addchild").click(function(){ 
				var url = 'sysCodeRuleitemAction.do?method=create&staticRuleid='+oper_id;
				art.dialog({id:'commonDialog1',title:'编码规则项', iframe:url, width:'600', height:'400',top:'30'});
			}); 
			//
		});
		//刷新
		function pageRefresh(){
			document.forms[0].action='sysCodeRuleAction.do?method=list'+'&ec_id='+oper_id+'&pageIndex='+$("input[name='ec_p']").val();   
    		document.forms[0].submit();
		}
		//点击单行
		function pullValue(mutil_id){ 
			var select_count=0;
			var sels=$("input[name='select_id']");
			for(i=0;i<sels.length;i++){
				if(sels[i].value==mutil_id){
					select_count++;
					oper_id=mutil_id;
					sels[i].checked=true;
					listChild(oper_id);
				}
			}
			if(select_count!=0){
				if(oper_id!=""){
					$("#btn_addchild").show();
					$("#btn_edit").show();
					$("#btn_delete").show();
				}else{
					$("#btn_addchild").hide();
					$("#btn_edit").hide();
					$("#btn_delete").hide();
				}
			}
		}
		//查询提交
		function commonUrl(url){
			document.forms[0].action=url;   
		    document.forms[0].submit();   
		}
		//ajax加载子页面
		function listChild(mutil_id){
		    $.ajax({
				   type: "POST",
				   url: "${ctx}/sysCodeRuleitemAction.do?method=list&ruleid="+mutil_id,		
				   success: function(msg){
					  $('#childbody').html(msg);
				   }
			}); 	
		}
	</script>
</head>
<content tag="heading">
	 编码规则 
</content>
<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="sysCodeRuleAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td >编码规则名称：</td>
							<td><html:text property="qrulename" maxlength="25" styleClass="inputText" ></html:text></td>
							<td>
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		<div  class="listButtonDiv">
			<input id="btn_add" type="button" icon="icon_add" value="${texts['button.new']}"  />
			<input id="btn_addchild" type="button" icon="icon_add"  value="新增编码规则项" />
			<input id="btn_edit" type="button" icon="icon_edit"  value="${texts['button.edit']}" />
			<input id="btn_delete" type="button" icon="icon_delete" value="${texts['button.delete']}" />
		</div>
	<ec:table items="sysCodeRules" var="sysCodeRule"
		action="sysCodeRuleAction.do" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" 				onclick="pullValue('${sysCodeRule.id}');"
		>
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="null" sortable="false" title="选择" >
				<input name="select_id" value="${sysCodeRule.id}" type="radio"/>
			</ec:column>
			<ec:column property="ruleCode" title="编码规则编号" />
			<ec:column property="rulename" title="编码规则名称" />
			<ec:column property="recorddate" title="创建日期" cell="date"/>
			<ec:column property="remark" title="备注" />
		</ec:row>
	</ec:table>
	<div id="childbody" class="div_iconShow"></div>
</body>
</html:html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
		<script language="javascript" src="${ctx}/scripts/button/script/pico-div-button.js"></script>
<script type="text/javascript">
		//加载
		$(document).ready(function(){
			//编辑
			$(".btn_edit").click(function(){
				var url = 'sysCodeRuleitemAction.do?method=edit&id='+$(this).attr("paramId");
				art.dialog({id:'commonDialog1',title:'编码规则项', iframe:url, width:'600', height:'400',top:'30'});
			}); 
			//删除
			$(".btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					 $.ajax({
						   type: "POST",
						   url: 'sysCodeRuleitemAction.do?method=delete'+'&id='+$(this).attr("paramId")+'&ruleid='+$(this).attr("paramArray"),		
						   success: function(msg){
						   	  alert("成功删除。");
							  $('#childbody').html(msg);
						   }
					});
				}
			});
			//
		});
		//刷新子页面
		function pageRefreshChild(){
			$.ajax({
				   type: "POST",
				   url: "${ctx}/sysCodeRuleitemAction.do?method=list&ruleid=${param.ruleid}",		
				   success: function(msg){
					  $('#childbody').html(msg);
				   }
			}); 
		}
	</script>
<fieldset>
		<legend>
			[编码规则项列表]
		</legend>
<table class="listTable" >
	<thead>
		<tr >
			<th width="5%" >序号</th>
				<th width="25%">规则类型</th>
				<th width="10%" >规则样式</th>
				<th width="10%" >排序值</th>
				<th width="25%" >操作</th>
		</tr>
		</thead>
		<c:forEach items="${sysCodeRuleitems}" varStatus="index" var="sysCodeRuleitem">
			<tr  id="${sysCodeRuleitem.id}">
				<td>${index.count}</td>
				<td><ex:dicDisplay dictIdentify="RuleType" dictValue="${sysCodeRuleitem.ruletype}"/>&nbsp;</td>
				<td>${sysCodeRuleitem.rulecontent}&nbsp;</td>
				<td>${sysCodeRuleitem.orderno}&nbsp;</td>
				<td>
					<div >
				        <input type="button" class="btn_edit" icon="icon_edit"  value="${texts['button.edit']}" paramId="${sysCodeRuleitem.id}" paramArray="${param.ruleid}"/>
						<input type="button" class="btn_delete" icon="icon_delete" value="${texts['button.delete']}" paramId="${sysCodeRuleitem.id}" paramArray="${param.ruleid}"/>			
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</fieldset>

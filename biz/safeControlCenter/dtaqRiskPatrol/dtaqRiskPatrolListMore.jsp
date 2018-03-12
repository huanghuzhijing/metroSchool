<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		var oper_id="";
		//
		$(document).ready(function(){
			//
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			$("#btn_view").hide();
			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);
			//
			$("#btn_add").click(function(){ 
				location.href='dtaqRiskPatrolAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val(); 
			}); 
			//
			$("#btn_edit").click(function(){
				var url='dtaqRiskPatrolAction.do?method=edit&id='+oper_id+'&qname='+$("[name='qname']").val()+'&qtype=${param.qtype}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='dtaqRiskPatrolAction.do?method=delete&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			//
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
			
			//
		});
		//刷新
		function pageRefresh(){
			document.forms[0].action='dtaqRiskPatrolAction.do?method=list'+'&ec_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();   
    		document.forms[0].submit();
		}
		//详细页面
		function showView(id){
	    	var url ='dtaqRiskPatrolAction.do?method=view&id='+id+'&qtype=${param.qtype}&ec_p='+$("input[name='ec_p']").val()+'&viewFlag=true'+'&ec_crd='+$("[name='ec_rd']").val(); 
			commonUrl(url);
	  	}
	  	//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;
			$.ajax({
					   type: "POST",
					   url: "${ctx}/dtaqRiskPatrolAction.do?method=checkNew&id="+oper_id,		
					   success: function(msg){
						  if(msg=='yes'){
						   $("#btn_edit").hide();
						   $("#btn_delete").hide();
						  }else{
						   $("#btn_edit").show();
						   $("#btn_delete").show();
						  }
					   }
		  		 	});
		}
		
	</script>
</head>
<body >
		<center>
			<input type="button" style="float: right;" value="返&nbsp;&nbsp;回" onclick="location.href='dtaqRiskPatrolAction.do?method=projectReport'">
		</center>
	<fieldset>
	<legend><ex:dicDisplay dictIdentify="RiskPatrolType" dictValue="${param.qtype}"/></legend>
	<ec:table items="dtaqRiskPatrols" var="dtaqRiskPatrol" 
		action="dtaqRiskPatrolAction.do?method=showMore" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
		>
		<ec:row highlightRow="true"  onclick="pullValue('${dtaqRiskPatrol.id}','');"
				ondblclick="showView('${dtaqRiskPatrol.id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="8%" />
			<ec:column property="name" title="名称" />
			<ec:column property="recoder" title="填报人" />
			<ec:column property="null" title="填报日期" width="18%"> 
				<fmt:formatDate value="${dtaqRiskPatrol.recoder_date}" pattern="yyyy-MM-dd"/>
			</ec:column>
			<ec:column property="attach_name" title="附件 名称" >
			<c:if test="${dtaqRiskPatrol.attach_name!=null}">
						<a href="<%=request.getContextPath()%>/dtaqRiskPatrolAction.do?method=download&id=${dtaqRiskPatrol.id }">${dtaqRiskPatrol.attach_name}</a>
					</c:if>
			</ec:column>
		</ec:row>
	</ec:table>
	</fieldset>
</body>
</html:html>

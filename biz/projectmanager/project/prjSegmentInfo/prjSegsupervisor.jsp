<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css"
		type="text/css" />
	<script type="text/javascript">
	var oper_id="";
	//加载
	$(document).ready(function(){ 
		//
		$("#btn_edit").hide();
		$("#btn_delete").hide();
		$("#btn_view").hide();
		$("#btn_submit").hide();
		//控制按钮
		var ec_id='${param.ec_id}';
		var ec_auditStatus='${param.ec_auditStatus}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			ec_auditStatus='${ec_auditStatus}';
		}
        $("#prj_id").val(${staticPrjId});
       
		pullValue(ec_id,ec_auditStatus);
		//
		$("#btn_add").click(function(){ 
			var url='prjSegmentSupervisorAction.do?method=create&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&ec_p='+$("input[name='ec_p']").val()+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}&flagPage=1';
			 art.dialog({id:'commonDialog1',title:'标段管理-新增', iframe:url, width:'800', height:'400',top:'0'});
			
			//commonUrl(url);
		}); 
		$("#btn_edit").click(function(){
			commonEdit(oper_id);
			
		}); 
		//
		$("#btn_delete").click(function(){ 
			ret = window.confirm('${texts['dtaq.common.delete.msg']}');
			if(ret){
			
				var url='prjSegmentSupervisorAction.do?method=delete&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&staticPrjId='+$("[name='staticPrjId']").val()+'&flagPage=2';
				commonUrl(url);
			}
		});
		//
		$("#btn_view").click(function(){ 
			showView(oper_id);
		});
		//提交
		$("#btn_submit").click(function(){ 
			ret = window.confirm("是否上报？");
			if(ret){
				var url='prjSegmentSupervisorAction.do?method=upReport&id='+oper_id+'&ec_id='+oper_id+'&ec_auditStatus=-1'+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
				commonUrl(url);
			}
		});
		$("#btn_select").click(function(){
		       		
			var url='prjSegmentSupervisorAction.do?method=selectPrjSegments&id='+oper_id+'&ec_id='+oper_id+'&ec_auditStatus=-1'+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&prj_id='+$("[name='prj_id']").val();
		    art.dialog({id:'commonDialog1',title:'监理标段选择', iframe:url, width:'600', height:'425',top:'110'}).close(function(){					  
					
					});	
				
				
		});

		function setPrjSegParamValue(prjId,prjName,prjCode,segId,segName){
			if(segId!=""){
				$("#prjId").val(prjId);
				$("#supSeg_name").val(prjName);
				
			}
		}
		
       //
	});
	
	//详细页面
	function showView(id){
    	var url ='safeCheckReportAction.do?method=view'+'&id='+id+'&ec_p='+$("input[name='ec_p']").val()+''+'&viewFlag=true'+'&ec_crd='+$("[name='ec_rd']").val();
    	 art.dialog({id:'commonDialog1',title:'标段管理-新增', iframe:url, width:'800', height:'400',top:'0'});
		
  	}
  function setParamValue(id,code,name){
 $("#seg_Names").val(name);
		
		}
  	//编辑页面
	function commonEdit(id){
    	var url='safeCheckReportAction.do?method=edit'+'&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
		commonUrl(url);
  	}
  	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
	function pageRefresh(){
		var url='prjSegmentSupervisorAction.do?method=listRight&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&ec_p='+$("input[name='ec_p']").val()+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		commonUrl(url);
	}
	//指令码判断
	function checkCmd(){
		var cmdIds='${userinfo.cmdIds}';
	//		if(!isContains(cmdIds,",prjSegmentSupervisor_add,"))$("#btn_add").hide();
		if(!isContains(cmdIds,",prjSegmentSupervisor_edit,"))$("#btn_edit").hide();
		//	if(!isContains(cmdIds,",prjSegmentSupervisor_delete,"))$("#btn_delete").hide();
			if(!isContains(cmdIds,",prjSegmentSupervisor_submit,"))$("#btn_submit").hide();
	}
</script>
</head>
<content tag="heading">
监理标段信息
</content>
<body>

	<%@ include file="includeProjectInfoView.jsp"%>
	<div class="listButtonDiv">
		<input id="btn_add" value="${texts['button.new']}" type="button"
			icon="icon_add" />
		<input id="btn_view" value="${texts['button.detail']}" type="hidden"
			icon="icon_view" />
		<input id="btn_edit" value="${texts['button.edit']}" type="button"
			icon="icon_edit" />
		<input id="btn_delete" value="${texts['button.delete']}" type="button"
			icon="icon_delete" />
		
		<input type="hidden" name="supSeg_code" id="supSeg_code"
			class="showText" />
		<input type="hidden" name="supSeg_name" id="supSeg_name"
			class="showText" />
		<input type="hidden" name="prj_id" id="prj_id" class="showText" />
		<input id="btn_select" value="${texts['button.select']}" type="button"
			icon="icon_add" />
		<input  value="发  布" type="button" class="btn_temp btn_submit" icon="icon_submit" paramId="${prjSegmentInfo.id}"	paramName="${prjSegmentInfo.auditStatus}"/>
		<input id="segIds" name="segIds" value="${segIds }" type="hidden">
		
	</div>

	<ec:table items="prjSegmentSupervisors" var="prjSegmentSupervisor"
		action="prjSegmentSupervisorAction.do?method=listRight" title=""
		locale="zh_CN" sortable="false" rowsDisplayed="10"
		imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit"
		sortRowsCallback="limit">
		<ec:row highlightRow="true"
			ondblclick="showView('${prjSegmentSupervisor.id}');"
			onclick="pullValue('${prjSegmentSupervisor.id}','${prjSegmentSupervisor.auditStatus}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="6%" />
			<ec:column property="null" sortable="false" title="选择" width="6%">
				<input name="select_id" value="${prjSegmentSupervisor.id}"
					auditStatus='${prjSegmentSupervisor.auditStatus}' type="radio" />
			</ec:column>
			<ec:column property="supSegCode" title="监理标段编号" />
			<ec:column property="supSegName" title="监理标段名称" />
			<ec:column property="segNames" title="关联的标段" />

			<ec:column property="updateMan" title="录入人">
				<ex:empName id="${prjSegmentSupervisor.updateMan}" />
			</ec:column>
			<ec:column property="updateDate" title="录入日期" cell="date" />
			<ec:column property="null" title="发布状态">
				<ex:dicDisplay dictIdentify="IssueStatus"
					dictValue="${prjSegmentSupervisor.auditStatus}" />
			</ec:column>
			<ec:column property="remark" title="备注" />


		</ec:row>
	</ec:table>
</body>
</html:html>

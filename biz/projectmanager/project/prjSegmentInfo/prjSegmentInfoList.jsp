<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript">
	var oper_id="";
	//加载
	$(document).ready(function(){
	checkCmd();
		//控制按钮
		$(".btn_temp").each(function(){
			if($(this).attr("paramName")==-1){
				$(this).hide();
			}
		});
		//
		$("#btn_back").click(function(){ 
			var url='projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&ec_p=${param.parent_ec_p}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}&staticPrjSort='+$("[name='staticPrjSort']").val()+'&staticFootNode='+$("[name='staticFootNode']").val()+'&flag='+$("[name='flag']").val();
			commonUrl(url);
		}); 
		//
		$("#btn_add").click(function(){ 
			var url='prjSegmentInfoAction.do?method=create&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&ec_p='+$("input[name='ec_p']").val()+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
			commonUrl(url);
		}); 
		//
		$(".btn_edit").click(function(){
			var url='prjSegmentInfoAction.do?method=edit&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}&id='+$(this).attr("paramId")+'&ec_p='+$("input[name='ec_p']").val()+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
			commonUrl(url);
		}); 
		//
		$(".btn_delete").click(function(){ 
			ret = window.confirm('${texts['dtaq.common.delete.msg']}');
			if(ret){
				var url='prjSegmentInfoAction.do?method=delete&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}&id='+$(this).attr("paramId")+'&ec_p='+$("input[name='ec_p']").val()+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
				commonUrl(url);
			}
		});
		//
		$(".btn_submit").click(function(){ 
			ret = window.confirm("确定发布？");
			if(ret){
				var url='prjSegmentInfoAction.do?method=issue&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}&id='+$(this).attr("paramId")+'&ec_p='+$("input[name='ec_p']").val()+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
				commonUrl(url);
			}
		});
		//
		$(".btn_selectCtr").click(function(){
			var url='prjSegmentInfoAction.do?method=selectCtr&staticSegId='+$(this).attr("paramId");
			art.dialog({id:'commonDialog1',title:'合同信息', iframe:url, width:'750', height:'400'});
		}); 
		//
		$(".btn_configMan").click(function(){
			var url='prjSegmentInfoAction.do?method=listCorpMan&staticSegId='+$(this).attr("paramId")+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&ec_p='+$("input[name='ec_p']").val()+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
			commonUrl(url);
		}); 
		//
	});
	       	//指令码判断
	function checkCmd(){
		var cmdIds='${userinfo.cmdIds}';
	//	if(!isContains(cmdIds,",prjSegmentInfo_add,"))$("#btn_add").hide();
	//	if(!isContains(cmdIds,",prjSegmentInfo_edit,"))$(".btn_edit").hide();
	//	if(!isContains(cmdIds,",prjSegmentInfo_submit,"))$(".btn_submit").hide();
	//	if(!isContains(cmdIds,",prjSegmentInfo_delete,"))$(".btn_delete").hide();
	//	if(!isContains(cmdIds,",prjSegmentInfo_selectCtr,"))$(".btn_selectCtr").hide();
	//	if(!isContains(cmdIds,",prjSegmentInfo_configMan,"))$(".btn_configMan").hide();
	}
	//刷新页面
	function pageRefresh(){
		var url='prjSegmentInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&staticPrjId=${param.staticPrjId}'+'&ec_p='+$("input[name='ec_p']").val()+'&parent_ec_p=${param.parent_ec_p}'+'&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		commonUrl(url);
	}
</script>
</head>
<content tag="heading">
标段划分
</content>  
<body > 
	<html:form enctype="multipart/form-data" action="prjSegmentInfoAction.do" method="POST">
		<!--查询定位 开始-->
		<html:hidden property="qprjCode" value="${param.qprjCode}"/>
		<html:hidden property="qprjName" value="${param.qprjName}"/>
		<html:hidden property="qauditStatus" />
		<html:hidden property="staticPrjSort" />
		<html:hidden property="staticFootNode" />
		<html:hidden property="flag" />
		<!--查询定位 结束-->
	</html:form>
	<%@ include file="includeProjectInfoView.jsp"%>         
	<div  class="listButtonDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button" class="button1" icon="icon_back"/>
<!--		<input id="btn_add" value="${texts['button.new']}" type="button" icon="icon_add" />-->
	</div>
	<ec:table items="prjSegmentInfos" var="prjSegmentInfo" 
		action="prjSegmentInfoAction.do" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" 
		>
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="segCode" title="标段编号" />
			<ec:column property="segName" title="标段名称" />
			<ec:column property="ctrName" title="合同名称" />
			<ec:column property="updateMan" title="录入人" >
				<ex:empName id="${prjSegmentInfo.updateMan}"/>
			</ec:column>
			<ec:column property="updateDate" title="录入日期" cell="date"/>
			<ec:column property="null" title="发布状态" >
				<ex:dicDisplay dictIdentify="IssueStatus" dictValue="${prjSegmentInfo.auditStatus}"/>
			</ec:column>
			<ec:column property="null" title="${texts['label.operate']}" >
				<input  value="${texts['button.edit']}" type="button" class="btn_edit" icon="icon_edit" paramId="${prjSegmentInfo.id}" paramName="${prjSegmentInfo.auditStatus}"/>
				<input  value="发  布" type="button" class="btn_temp btn_submit" icon="icon_submit" paramId="${prjSegmentInfo.id}"	paramName="${prjSegmentInfo.auditStatus}"/>
				<input  value="${texts['button.delete']}" type="button" class="btn_temp btn_delete" icon="icon_delete" paramId="${prjSegmentInfo.id}"	paramName="${prjSegmentInfo.auditStatus}"/>
				
				<input  value="选择合同" type="button" class="btn_selectCtr" icon="icon_edit" paramId="${prjSegmentInfo.id}" paramName="${prjSegmentInfo.auditStatus}"/>
				
				<c:if test="${prjSegmentInfo.ctrName!=null&&prjSegmentInfo.ctrName!=''}">
					<input  value="人员委派" type="button" class="btn_configMan" icon="icon_edit" paramId="${prjSegmentInfo.id}" paramName="${prjSegmentInfo.auditStatus}"/>
				</c:if>
			</ec:column>
		</ec:row>
	</ec:table> 
  </body>
</html:html>

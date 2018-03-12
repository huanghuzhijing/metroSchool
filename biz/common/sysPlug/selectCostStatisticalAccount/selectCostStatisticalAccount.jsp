<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
	<script type="text/javascript">
		var gridTree;	
		tree_path="${ctx}";
		var oper_id='${param.oper_id}';
	
		$(document).ready(function(){
			//
			$("#btn_submit").click(function(){ 
				var operObj = $("input[type=radio][name='select_row'][checked]");
				parent.$("#plug_costStatisticalAccountId").val(operObj.val());
				parent.$("#plug_costStatisticalAccountCode").val(operObj.attr("paramArray"));
				parent.$("#plug_costStatisticalAccountName").val(operObj.attr("paramName"));
				parent.$("#flag_costStatisticalAccountId").val(1);
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
		   $("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
		});
		function showGridTree(){
			gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
			gridTree.tableDesc="<table border=\"1\" class=\"GridView\"  id=\"table1\"   >";	
			var headerDataList=new Array("统计科目编号","统计科目名称","统计科目标识");
			var widthList=new Array("35%","35%","20%");
			//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
			gridTree.setHeader(headerDataList,-1,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
			//设置列样式
			gridTree.gridHeaderColStyleArray=new Array("leftClo","centerClo","centerClo");
			gridTree.gridDataCloStyleArray=new Array("leftClo","centerClo","centerClo");
			
			var icon = gridTree.icon.folder;
			var openIcon = gridTree.icon.folderOpen;
			var booleanOpen='';
			var src ='';
			
			var classStyle='';
			var target="_self";
			var codeTip='';
			
			<c:forEach items="${costStatisticalAccounts}" var="costStatisticalAccount">
				var select_radio="";
				<c:if test="${costStatisticalAccount.accountType==1}">
			    select_radio ='${costStatisticalAccount.accountCode}';
			    </c:if>
				 <c:if test="${costStatisticalAccount.accountType==2}">
			     select_radio='<input <c:if test="${param.oper_id == costStatisticalAccount.id}">checked</c:if> name="select_row" id="select_row" type="radio" onclick="pullValue(this);" value="${costStatisticalAccount.id}" paramArray="${costStatisticalAccount.accountSign}" paramName="${costStatisticalAccount.accountName}" /> ${costStatisticalAccount.accountCode}';
				</c:if>
			    var accountName = '${costStatisticalAccount.accountName}';
				var orderNum = '${costStatisticalAccount.orderNum}';
				var accountSign = '${costStatisticalAccount.accountSign}';
				var dataList=new Array(select_radio,accountName,accountSign);
				//添加节点
				gridTree.addGirdNode(dataList,'${costStatisticalAccount.id}','${costStatisticalAccount.parentId}',booleanOpen,'${costStatisticalAccount.nodeCode}',src,target,"",classStyle,icon,null,codeTip,"");
			</c:forEach>
			gridTree.printTableTreeToElement("gridTreeDiv");
			gridTree.openAllNodes();
		}
		
		//点击选择
		function pullValue(obj){
			oper_id=obj.value
		}
	</script>
</head>
<body>
<div class="listButtonDiv">
<input id="btn_submit" type="button" icon="icon_submit"  value="确认" />
<input id="btn_close" type="button" icon="icon_close"  value="关闭" />
</div>
<div id="gridTreeDiv" class="tableTreeDiv"></div>
	<script type="text/javascript">
		showGridTree();
	</script>
</body>
</html:html>

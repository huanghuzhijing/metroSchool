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
			if(oper_id!=null&&oper_id!=""){
				showChar(oper_id);
			}
			//
			$("#btn_submit").click(function(){ 
				var operObj = $("input[type=radio][name='select_row'][checked]");
				parent.$("#plug_ctrCountWorklistId").val(operObj.val());
				parent.$("#plug_cwlName").val(operObj.attr("paramName"));
				parent.$("#plug_totalSum").val(operObj.attr("paramArray"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
		   $("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			
		});
		function showGridTree(){
			gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
			gridTree.tableDesc="<table border=\"1\" class=\"GridView\"  id=\"table1\"   >";	
			var headerDataList=new Array("项目编码","清单项名称");
			var widthList=new Array("35%","55%");
			//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
			gridTree.setHeader(headerDataList,-1,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
			//设置列样式
			gridTree.gridHeaderColStyleArray=new Array("leftClo","centerClo");
			gridTree.gridDataCloStyleArray=new Array("leftClo","centerClo");
			
			var icon = gridTree.icon.folder;
			var openIcon = gridTree.icon.folderOpen;
			var booleanOpen='';
			var src ='';
			
			var classStyle='';
			var target="_self";
			var codeTip='';
			
			<c:forEach items="${ctrCountWorklists}" var="ctrCountWorklist">
			    <c:if test="${ctrCountWorklist.footNode==1}">
			    var select_radio ='${ctrCountWorklist.cwlCode}';
			    var totalSum = '';
			    </c:if>
				 <c:if test="${ctrCountWorklist.footNode==0}">
			    var select_radio ='<input <c:if test="${param.oper_id == ctrCountWorklist.id}">checked</c:if> name="select_row" id="select_row" type="radio" onclick="pullTreeValue(this);" value="${ctrCountWorklist.id}" paramArray="<fmt:formatNumber value="${ctrCountWorklist.totalSum}" pattern="###0.00"/>" paramName="${ctrCountWorklist.cwlName}" /> ${ctrCountWorklist.cwlCode}';
			    </c:if>
				var cwlName =  '${ctrCountWorklist.cwlName}';
				var remark = '${ctrCountWorklist.remark}';
				var dataList=new Array(select_radio,cwlName);
				//添加节点
				gridTree.addGirdNode(dataList,'${ctrCountWorklist.id}','${ctrCountWorklist.parentId}',booleanOpen,'${ctrCountWorklist.nodeCode}',src,target,"",classStyle,icon,null,codeTip,"");
			</c:forEach>
			gridTree.printTableTreeToElement("gridTreeDiv");
		}
		
		//点击选择
		function pullTreeValue(obj){
			oper_id=obj.value;
			showChar(oper_id);
		}
		//
        function showChar(worklistId){
       		 $.ajax({
			   type: "POST",
			   url: "${ctx}/docCertificateAction.do?method=showChar&worklistId="+worklistId,		
			   success: function(msg){
				  $('#request').html(msg);
			   }
	  		 }); 
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
<div id="request" class="div_iconShow"></div>
</body>
</html:html>

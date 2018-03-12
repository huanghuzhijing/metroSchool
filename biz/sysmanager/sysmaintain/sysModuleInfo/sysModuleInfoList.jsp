<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>

<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
<script type="text/javascript">
	var gridTree;	
	tree_path="${ctx}";
	var oper_id='${param.oper_id}';
	
	$(document).ready(function(){
		//
		$("#btn_add").click(function(){ 
		 	if(oper_id!=""){
				var url = "sysModuleInfoAction.do?method=create&parentid="+oper_id;
				art.dialog({id:'commonDialog1',title:'模块管理', iframe:url, width:'700', height:'400'});
			}else{
				alert("请选中一个节点");
			}
		}); 
		//
		$("#btn_edit").click(function(){ 
			if(oper_id!=""){
				var url = 'sysModuleInfoAction.do?method=edit&f_mid='+oper_id;
				art.dialog({id:'commonDialog1',title:'模块管理', iframe:url, width:'700', height:'400'});
			}else{
				alert("请选中一个节点");
			}
		}); 
		//
		$("#btn_delete").click(function(){ 
			if(oper_id!=""){
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					$.ajax({
					   type: "POST",
					   url: "${ctx}/sysModuleInfoAction.do?method=checkdelete",
					   data: "id="+oper_id,
					   success: function(msg){
					   		 if(msg=="no"){ 
					   		 		alert("此节点下有子节点，不能删除");     
							  }else {
							  		location.href='sysModuleInfoAction.do?method=delete&f_mid='+oper_id;
							  }
					   }
					});
				}
			}else{
				alert("请选中一个节点");
			}
		});
		
		
		//
		$("#btn_dooperation").click(function(){
			if(oper_id!=""){
				$.ajax({
				   type: "POST",
				   url: "${ctx}/sysModuleInfoAction.do?method=checkdelete",
				   data: "id="+oper_id,
				   success: function(msg){
				   		 if(msg=="no"){ 
				   		 		alert("非底层节点，不提供指令码!");     
						  }else {
						  var url ='sysModuleOperationAction.do?method=list&staticModuleId='+oper_id;
				          art.dialog({id:'commonDialog1',title:'模块管理', iframe:url, width:'600', height:'400'});
						   }
				   }
				});
			}else{
				alert("请选中一个节点");
			}
		});
		//
		
		
		$("[name='select_row']").parent().parent().click(function(){
			var select_row = $(this).find("[name='select_row']") ;
			select_row.attr("checked","checked") ;
			pullValue(select_row.get(0)) ;
		})
		
		
	});
	
	function showGridTree(){
		gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
		gridTree.tableDesc="<table border=\"1\" class=\"GridView\"  id=\"table1\"   >";	
		var headerDataList=new Array("模块名称","选择","层次编码","启用状态","指令码");
		var widthList=new Array("38%","5%","10%","5%","42%");
		//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
		gridTree.setHeader(headerDataList,-1,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
		//设置列样式
		gridTree.gridHeaderColStyleArray=new Array("leftClo","centerClo","centerClo","centerClo","centerClo");
		gridTree.gridDataCloStyleArray=new Array("leftClo","centerClo","centerClo","centerClo","centerClo");
		
		var icon = gridTree.icon.folder;
		var openIcon = gridTree.icon.folderOpen;
		var booleanOpen='';
		var src ='';
		
		var classStyle='';
		var target="_self";
		var codeTip='';
		
		<c:forEach items="${sysModuleInfos}" var="sysModuleInfo">
			var modulename = '${sysModuleInfo.f_mname}';
			var select_radio ='<input <c:if test="${param.oper_id == sysModuleInfo.f_mid}">checked</c:if> name="select_row" type="radio" onclick="pullValue(this);" value="${sysModuleInfo.f_mid}" />';
			var code='${sysModuleInfo.f_rtreecode}';
			var validstate = '启用';
			<c:if test="${sysModuleInfo.f_mstate eq 0}">
				validstate = '禁用';
			</c:if>
			var sysModuleOperations="";
			<c:forEach items="${sysModuleInfo.sysModuleOperations}" var="sysModuleOperation">
				sysModuleOperations+='&nbsp;&nbsp;|&nbsp;&nbsp;'+'${sysModuleOperation.f_mname}';
			</c:forEach>
			var dataList=new Array(modulename,select_radio,code,validstate,sysModuleOperations);
			//添加节点
			gridTree.addGirdNode(dataList,'${sysModuleInfo.f_mid}','${sysModuleInfo.f_parentid}',booleanOpen,'${sysModuleInfo.f_rtreecode}',src,target,"",classStyle,icon,null,codeTip,"");
		</c:forEach>
		gridTree.printTableTreeToElement("gridTreeDiv");
	}
	//点击选择
	function pullValue(obj){
		oper_id=obj.value
	}
	//刷新页面
	function pageRefresh(){
		location.href='sysModuleInfoAction.do?method=list&oper_id='+oper_id;
	}
</script>
</head>
<content tag="heading">
	系统程序模块维护
</content>
<body>
	<div class="listButtonDiv">
	                <input id="btn_add" type="button" icon="icon_add"  value="${texts['button.new']}"  />
					<input id="btn_edit" type="button" icon="icon_edit"  value="${texts['button.edit']}" />
					<input id="btn_dooperation" type="button" icon="icon_edit"   value="编辑指令码"/>
					<input id="btn_delete" type="button" icon="icon_delete" value="${texts['button.delete']}" />
	</div>

    <div id="gridTreeDiv" class="tableTreeDiv"></div>

<script type="text/javascript">
	showGridTree();
</script>
</body>
</html:html>

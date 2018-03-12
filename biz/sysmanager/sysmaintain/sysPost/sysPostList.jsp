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
	var static_ParentId;
	//加载
	$(document).ready(function(){
		checkCmd();
		$("#btn_add").click(function(){ 
		 	if(oper_id!=""){
	 			var url = "sysPostAction.do?method=create&staticParentId="+oper_id;
				art.dialog({id:'commonDialog1',title:'工程文档分类', iframe:url, width:'700', height:'300'});
			}else{
				var url = "sysPostAction.do?method=create&staticParentId=-1";
				art.dialog({id:'commonDialog1',title:'工程文档分类', iframe:url, width:'700', height:'300'});
			}
		}); 
		//
		$("#btn_edit").click(function(){ 
			if(oper_id!=""){
				var url = 'sysPostAction.do?method=edit&id='+oper_id;
				art.dialog({id:'commonDialog1',title:'工程文档分类', iframe:url, width:'700', height:'300',top:'0'});
			}else{
				alert("请选中一个节点");
			}
		}); 
		//
		$("#btn_delete").click(function(){ 
			if(oper_id!=""){
				if(oper_id==1||static_ParentId==1){
					alert("此节点不能删除！");
				}else{
					ret = window.confirm('${texts['dtaq.common.delete.msg']}');
					if(ret){
						$.ajax({
						   type: "POST",
						   url: "${ctx}/sysPostAction.do?method=checkdelete",
						   data: "id="+oper_id,
						   success: function(msg){
						   		 if(msg=="no1"){ 
						   		 		alert("此节点下有子节点，不能删除");     
								  }else if(msg=="no2"){
								  		alert("此节点下已存在工程文档数据，不能删除"); 
								  }else {
								  		location.href='sysPostAction.do?method=delete&id='+oper_id;
								  }
						   }
						});
					}
				}
			}else{
				alert("请选中一个节点");
			}
		});
		//
		$("[name='select_row']").parent().parent().click(function(){
			var select_row = $(this).find("[name='select_row']") ;
			select_row.attr("checked","checked") ;
			pullValue(select_row.get(0).value,select_row.get(0).paramId) ;
		})
		//
	});
	//树
	function showGridTree(){
			gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
			gridTree.tableDesc="<table border=\"1\" class=\"GridView\" width=\"100%\" id=\"table1\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: collapse\"  bordercolordark=\"#C0C0C0\" bordercolorlight=\"#C0C0C0\" >";	
			var headerDataList=new Array("名称","排序号","选择");
			var widthList=new Array("84%","8%","8%");
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
			var target="self";
			var codeTip='';
			<c:forEach items="${sysPosts}" var="sysPost">
				var f_name = '${sysPost.postName}';
				var f_orderNum = '${sysPost.orderNum}';
				var f_select ='<input <c:if test="${param.oper_id == sysPost.id}">checked</c:if> name="select_row" type="radio" onclick="pullValue(${sysPost.id},${sysPost.parentId});" value="${sysPost.id}" paramId="${sysPost.parentId}" />';
				var dataList=new Array(f_name,f_orderNum,f_select);
				//添加节点
				gridTree.addGirdNode(dataList,'${sysPost.id}','${sysPost.parentId}',booleanOpen,Number('${sysPost.orderNum}'),src,target,"",classStyle,icon,null,codeTip,"");
			</c:forEach>
			gridTree.printTableTreeToElement("gridTreeDiv");
			gridTree.openAllNodes();
		}
	//点击选择
	function pullValue(objId,objparentId){
		oper_id=objId;
		static_ParentId=objparentId;
		checkCmd();
	}
	//刷新页面
	function pageRefresh(){
		location.href='sysPostAction.do?method=list&oper_id='+oper_id;
	}
	       	//指令码判断
	function checkCmd(){
		var cmdIds='${userinfo.cmdIds}';
		if(!isContains(cmdIds,",sysPost_add,"))$("#btn_add").hide();
		if(!isContains(cmdIds,",sysPost_edit,"))$("#btn_edit").hide();
		if(!isContains(cmdIds,",sysPost_delete,"))$("#btn_delete").hide();
	}
</script>
</head>
<content tag="heading">
岗位管理
</content>
<body>
	<div class="listButtonDiv">
	                <input id="btn_add" type="button" icon="icon_add"  value="${texts['button.new']}"  />
					<input id="btn_edit" type="button" icon="icon_edit"  value="${texts['button.edit']}" />
					<input id="btn_delete" type="button" icon="icon_delete" value="${texts['button.delete']}" />
	</div>
    <div id="gridTreeDiv" class="tableTreeDiv"></div>
<script type="text/javascript">
	showGridTree();
</script>
</body>
</html:html>

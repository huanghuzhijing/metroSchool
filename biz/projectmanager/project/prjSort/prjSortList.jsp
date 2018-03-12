<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
		//页面加载
	   $(document).ready(function(){
			//
			$("#btn_add").click(function(){
				var parentId=oper_id;
				if($("input[type=radio][name='select_row'][checked]").size()==0||oper_id==""){
					parentId=-1;
					if('${fn:length(prjSorts)}'!=0){
						alert("已经存在根节点，不能增加！");
					}else{
						var url = "prjSortAction.do?method=create&staticParentId="+parentId;
						art.dialog({id:'commonDialog',title:'工程子类', iframe:url, width:'800', height:'400',top:'0'});
					}
				}else{
					var url = "prjSortAction.do?method=create&staticParentId="+parentId;
					art.dialog({id:'commonDialog',title:'工程子类', iframe:url, width:'800', height:'400',top:'0'});
				}
			}); 
			//
			$("#btn_edit").click(function(){ 
				if($("input[type=radio][name='select_row'][checked]").size()!=0&&oper_id!=""){
					var url = 'prjSortAction.do?method=edit&id='+oper_id;
					art.dialog({id:'commonDialog',title:'工程子类', iframe:url, width:'800', height:'400',top:'0'});
				}else{
					alert("请选中一个节点");
				}
			}); 
			//
			$("#btn_delete").click(function(){ 
				if($("input[type=radio][name='select_row'][checked]").size()!=0&&oper_id!=""){
					ret = window.confirm('${texts['dtaq.common.delete.msg']}');
					if(ret){
							$.ajax({
						   type: "POST",
						   url: "${ctx}/prjSortAction.do?method=checkDelete",
						   data: "id="+oper_id,
						   success: function(msg){
						   		 if(msg=="no"){ 
						   		 		alert("此节点下有子节点或者已被项目引用 不能删除！");
								  }else{
								  		location.href='prjSortAction.do?method=delete&id='+oper_id;
								  }
						   }
						});
					}
				}else{
					alert("请选中一个节点");
				}
			});
			//
			$("#btn_view").click(function(){ 
				if($("input[type=radio][name='select_row'][checked]").size()!=0&&oper_id!=""){
					var url = 'prjSortAction.do?method=view&id='+oper_id;
					art.dialog({id:'commonDialog',title:'工程子类', iframe:url, width:'800', height:'400',top:'0'});
				}else{
					alert("请选中一个节点");
				}
			});
			//
			//点击单行
			$("[name='select_row']").parent().parent().click(function(){
				var select_row = $(this).find("[name='select_row']") ;
				select_row.attr("checked","checked") ;
				pullValue(select_row.get(0)) ;
			})
		});
		//
		function showGridTree(){
			gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
			gridTree.tableDesc="<table border=\"1\" class=\"GridView\"  id=\"table1\"   >";	
			var headerDataList=new Array("工程子类编号","选择","工程子类名称","排序号","备注");
			var widthList=new Array("30%","10","30%","8%","22%");
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
			
			<c:forEach items="${prjSorts}" var="prjSort">
				var select_radio ='<input <c:if test="${param.oper_id == prjSort.id}">checked</c:if> name="select_row" type="radio" onclick="pullValue(this);" value="${prjSort.id}"  /> ';
				var sortCode = '${prjSort.sortCode}'
				var sortName = '${prjSort.sortName}';
				var orderNum = '${prjSort.orderNum}';
				var remark = '${prjSort.remark}';
				var dataList=new Array(sortCode,select_radio,sortName,orderNum,remark);
				//添加节点
				gridTree.addGirdNode(dataList,'${prjSort.id}','${prjSort.parentId}',booleanOpen,'${prjSort.orderNum}',src,target,"",classStyle,icon,null,codeTip,"");
			</c:forEach>
			gridTree.printTableTreeToElement("gridTreeDiv");
		}
		
		//点击选择
		function pullValue(obj){
			oper_id=obj.value
		}
		//刷新页面
		function pageRefresh(){
			location.href='prjSortAction.do?method=list&id=${param.id}'+"&oper_id="+oper_id;
		}
	</script>
</head>
<content tag="heading">
工程子类
</content> 
<body>
	<div class="listButtonDiv">
		<c:if test="${fn:contains(userinfo.cmdIds,',prjSort_add,')==true}">
	    <input id="btn_add" type="button" icon="icon_add"  value="${texts['button.new']}"  />
	    </c:if>
	    <input id="btn_view" value="${texts['button.detail']}" type="button" icon="icon_view"/>
	    <c:if test="${fn:contains(userinfo.cmdIds,',prjSort_edit,')==true}">
		<input id="btn_edit" type="button" icon="icon_edit"  value="${texts['button.edit']}" />
		</c:if>
		<c:if test="${fn:contains(userinfo.cmdIds,',prjSort_delete,')==true}">
		<input id="btn_delete" type="button" icon="icon_delete" value="${texts['button.delete']}" />
		</c:if>
	</div>
    <div id="gridTreeDiv" class="tableTreeDiv"></div>
	<script type="text/javascript">
		showGridTree();
	</script>
</body>
</html:html>

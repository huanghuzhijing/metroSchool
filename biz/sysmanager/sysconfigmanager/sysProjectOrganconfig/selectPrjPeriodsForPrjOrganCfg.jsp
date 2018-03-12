<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
	//
	var gridTree;	
	tree_path="${ctx}";
	//
	$(document).ready(function(){
		//
		var moduleid=parent.$("input[name='moduleid']").val(); 
		$.each( $(".cbox_select"), function(i, obj){
			if(moduleid.indexOf(","+$(this).attr("paramModuleId")+",")>-1){
				obj.checked=true;
			}
		});
		//
	    $("#btn_confirm").click(function(){
	    	var periodsid="";
	    	var periodsname="";
	    	moduleid="";
	    	var modulename="";
	    	var tmpperiodsid="";
	      	$.each( $(".cbox_select"), function(i, obj){
				if(obj.checked==true){
					if(periodsid==""){
						periodsid=","+$(this).attr("paramPerId")+",";
						periodsname=","+$(this).attr("paramPerName")+",";
						moduleid=","+$(this).attr("paramModuleId")+",";
						modulename=","+$(this).attr("paramModuleName")+",";
						tmpperiodsid=$(this).attr("paramPerId");
					}else{
						if($(this).attr("paramPerId")!=tmpperiodsid){
							periodsid+=$(this).attr("paramPerId")+",";
							periodsname+=$(this).attr("paramPerName")+",";
						}
						moduleid+=$(this).attr("paramModuleId")+",";
						modulename+=$(this).attr("paramModuleName")+",";
					}
				}
			});	
			if(periodsid!=""){
				parent.$("input[name='periodsid']").val(periodsid);
				parent.$("input[name='periodsname']").val(periodsname);
				parent.$("input[name='moduleid']").val(moduleid);
				parent.$("input[name='modulename']").val(modulename);
				parent.art.dialog({id:'commonDialog1'}).close();
			}else{
				alert("请至少选择一条");
			}
	    });
		//
		$("#btn_allSelect").click(function(){
			$(".cbox_select").attr("checked","checked");	
		});
		//  
		$("#btn_notSelect").click(function(){
			$(".cbox_select").attr("checked","");
		});
		//
	});
	//
	function showGridTree(){
		gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
		gridTree.tableDesc="<table border=\"1\" class=\"GridView\"  id=\"table1\"   >";	
		var headerDataList=new Array("项目周期名称","模块名称选择");
		var widthList=new Array("50%","50%");
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
		var target="self";
		var codeTip='';
		<c:forEach items="${voPrjPeriodsModules}" var="voPrjPeriodsModule">
			var periodsname = '${voPrjPeriodsModule.projectPeriods.periodsname}';
			var checkbox_con = '';
			<c:forEach items="${voPrjPeriodsModule.sysModuleInfos}" var="sysModuleInfo">
				checkbox_con+='${sysModuleInfo.modulename}'+'<input type="checkbox" class="cbox_select" paramPerId="${voPrjPeriodsModule.projectPeriods.id}" paramModuleId="${sysModuleInfo.id}" paramPerName="${voPrjPeriodsModule.projectPeriods.periodsname}" paramModuleName="${sysModuleInfo.modulename}" />'+'<br>';
			</c:forEach>
			var dataList=new Array(periodsname,checkbox_con);
			gridTree.addGirdNode(dataList,'${voPrjPeriodsModule.projectPeriods.id}','${voPrjPeriodsModule.projectPeriods.parentid}',booleanOpen,'${voPrjPeriodsModule.projectPeriods.nodecode}',src,target,"",classStyle,icon,null,codeTip,"");
		</c:forEach>
		gridTree.printTableTreeToElement("gridTreeDiv");
		gridTree.openAllNodes();
	}
  
</script>
</head>
<body>
	<div class="listButtonDiv">
					<input id="btn_allSelect" value="全  选" type="button" icon="icon_allSelect"/>
					<input id="btn_notSelect" value="全不选" type="button" icon="icon_notSelect" />
					<input id="btn_confirm" value="确  定" type="button" icon="icon_confirm"/>
				</div>

      	<div id="gridTreeDiv" class="tableTreeDiv"></div>

<script type="text/javascript">
	showGridTree();
</script>
</body>

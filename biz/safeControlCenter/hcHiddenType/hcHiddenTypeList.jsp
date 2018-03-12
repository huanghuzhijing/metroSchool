<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<html> 
<head>
<LINK rel=stylesheet href="${ctx}/styles/sys.css"  type="text/css">
<title>隐患类别</title>
<content tag="heading">隐患类别</content>
<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
<style type="text/css">	
.body{
	font-size:12px;	
}
.btnDiv a{
	color:#0000FF;	
	text-decoration: none;	
}
.btnDiv a:hover{
	color:#CC3300;	
	text-decoration: underline;	
}
.items{
	color:#669999;
	font-size:14px;		
}
.title{
	font-size:16px;		
	font-weight:bold;
}
.copyrightdiv{
	font-size:12px;	
	font-family:"Arial";
	color:#C0C0C0;	
}
.centerClo {
	text-align:center;
}
#treebar_div{
    position:relative;
	height:50x;
	display:inline;
}
#new_span,#edit_span,#delete_span{
	width:54px!important;
	height:49x !important;
	border:1px #fff solid;
	font-family:"Arial";
	color:gray;	
	text-align:center;	
	background-image:url(${ctx}/scripts/TableTree/img/treebar.png);
	cursor:pointer;
	padding-left:12px;
	padding-right:12px;	
	padding-top:1px;	
}
#addCode_span{
	width:90px!important;
	height:49x !important;
	border:1px #fff solid;
	font-family:"Arial";
	color:gray;	
	text-align:center;	
	background-image:url(${ctx}/scripts/TableTree/img/treebar.png);
	cursor:pointer;
	padding-left:12px;
	padding-right:12px;	
	padding-top:1px;	
}
</style>
<script type="text/javascript">
$(document).ready(function(){

})
//
function tree_check_add(obj){
if(!obj)obj=document.getElementById("treebar_div");
if(!obj.abled){
	return null;
}
else
return obj.abled;
}
//新增
function tree_add(){
	var radioValue=document.getElementsByName("noderadio");
	var nodeid=$("input[type=radio][checked]").val();
	var url = "";
	if(radioValue == null || radioValue.length == 0 || nodeid == null || nodeid == ""){
		url = "${ctx}/hcHiddenTypeAction.do?method=edit&parentid=-1";
	}else if(nodeid){
		url = "${ctx}/hcHiddenTypeAction.do?method=create&parentid="+nodeid;
	}
	 art.dialog({id:'editMod',title:'新增', iframe:url+"&rnd="+Math.random(), width:'580', height:'450',top:'100'});
}

//修改
function tree_edit(){
var nodeid=$("input[type=radio][checked]").val();
  	var radioValue=jQuery("#node"+nodeid+"radio").val();
	if(nodeid){
		url = "${ctx}/hcHiddenTypeAction.do?method=edit&id="+radioValue;
		art.dialog({id:'editMod',title:'编辑', iframe:url+"&rnd="+Math.random(), width:'580', height:'450',top:'100'});
	}else{
alert("请先选中节点！");
}
	
}

//删除
function tree_delete(){
var nodeid=$("input[type=radio][checked]").val();
if(nodeid!=null){
if(confirm("删除后将不能恢复，您确认删除？")){
	
	var radioValue=jQuery("#node"+nodeid+"radio").val();
	if(nodeid){
		var url = "${ctx}/hcHiddenTypeAction.do?method=checkDelete";
		$.ajax({
		    type: "POST",
		    url:"${ctx}/hcHiddenTypeAction.do?method=checkDelete",
		    data:"FMid="+radioValue,
		    success:function(msg){
		    if(msg!="yes"){
		    alert("改节点下存在子节点，无法删除！");
		    }
		    pageRefresh();
		    }
		    
		
		})
	}
}
}else{
alert("请先选中节点！");
}
}

//刷新页面
function pageRefresh(){
	location.href='hcHiddenTypeAction.do?method=list';
}
</script>
</head>	
<body>
<div class="listButtonDiv">
		    <input id="btn_add" type="button" onclick="tree_add()" icon="icon_add"  value="新&nbsp;&nbsp;增"  />
			<input id="btn_edit" type="button" onclick="tree_edit()" icon="icon_edit"  value="编&nbsp;&nbsp;辑 "/>
			<input id="btn_delete" type="button" onclick="tree_delete()" icon="icon_delete" value="删&nbsp;&nbsp;除" />
		</div>
${msg}
<div id="gridTreeDiv"></div>
<script language="JavaScript">		
		var gridTree;	
		tree_path="${ctx}";
		function showGridTree(){
			gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
			gridTree.tableDesc="<table border=\"1\" class=\"GridView\" width=\"100%\" id=\"table1\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse: collapse\"  bordercolordark=\"#C0C0C0\" bordercolorlight=\"#C0C0C0\" >";		
			var headerDataList=new Array("类别编码","类别名称","类别层级","隐患级别","综合分值","操作");
			var widthList=new Array("14%","37%","20%","5%","6%","5%");
			//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
			gridTree.setHeader(headerDataList,-98,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
			//设置列样式
			gridTree.gridHeaderColStyleArray=new Array("leftClo","leftClo","leftClo","leftClo","leftClo","leftClo");
			gridTree.gridDataCloStyleArray=new Array("leftClo","leftClo","leftClo","leftClo","leftClo","leftClo");
			
			var icon = gridTree.icon.folder;//oNode.getAttribute("icon");
			var openIcon = gridTree.icon.folderOpen;//oNode.getAttribute("openIcon");
			var booleanOpen='';
			var src ='';// ""+oNode.getAttribute("src")+"";	
			
			var classStyle='';
			var target="self";
			var codeTip='';
			var root=new Array("隐患类别树","","","","","<input type='radio' name='noderadio' id='node-1radio' value='-1'/>");
			gridTree.addGirdNode(root,-1,-98,booleanOpen,'','',target,"",classStyle,icon,null,codeTip,"");
			<c:forEach items="${hcHiddenTypes}" var="hcHiddenType">
				var FMid='${hcHiddenType.id}';
				var sortType='<ex:dicDisplay dictIdentify="SortType" dictValue="${hcHiddenType.sortType}"/>';
				var grade='<ex:dicDisplay dictIdentify="HiddenType" dictValue="${hcHiddenType.hiddenGrade}"/>';
				var dataList=new Array('${hcHiddenType.sortCode}',
						'${hcHiddenType.sortName}',
						sortType,
						grade,
						'${hcHiddenType.evaluateScore}',
						"<input type='radio' name='noderadio' id='node"+FMid+"radio' value='"+FMid+"'/>");
				//添加节点
				gridTree.addGirdNode(dataList,'${hcHiddenType.id}','${hcHiddenType.parentId}',booleanOpen,Number('${hcHiddenType.sortNo}'),src,target,"",classStyle,icon,null,codeTip,"");
			</c:forEach>
			gridTree.printTableTreeToElement("gridTreeDiv");
			var static_parentid=getCookie(gridTree.obj+"currentId");
			initBody(static_parentid,null);//记住刷新前勾选的结点
		}			
</script>
  	
	<script type="text/javascript">
		showGridTree();
	</script>
  </body>
</html>

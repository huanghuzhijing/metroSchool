<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:v="urn:schemas-microsoft-com:vml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作流web设计器</title>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+ "://" + request.getServerName()+ ":" + request.getServerPort() + path + "/";
%>
<script charset="UTF-8" type="text/javascript" language="javascript">
//参数初始化
    var wfentryid=${param.wfentryid};
    var workFlow=null;
    function chooses(target)
    {
    	var selectbox = target;
    	var selectValue=selectbox.options[selectbox.selectedIndex].value; 
    	if(selectValue==0)
    	{
    		sysroleselectforwf();
    	}
    	if(selectValue==1)
    	{
    		employeeSelForWf();
    	}
    }
    function sysroleselectforwf()
	{ 
	
	  var url = "<%=basePath%>/workFlowAction.do?method=choseActor&choose=0&flag=os";
	  //alert(url);
	  //window.open(url,"","dialogHeight:440px;dialogWidth:600px;status:no");
	  //sAlert('b1',url,url,600,440);
	  // sAlert('b1',null,url,600,440,"69%","19%");
	  art.dialog({id:'commonDialog1',title:'角色信息', iframe:url, width:'750', height:'400',top:'0'});
	}
	function employeeSelForWf()
	{
	  var url = "<%=basePath%>/oswfentryAction.do?method=choseActor&index=3&choose=1&flag=os";
	 // window.open(url,"","dialogHeight:440px;dialogWidth:600px;status:no");
	  //sAlert('b1',url,url,600,440);
	  //sAlert('b1',null,url,600,440,"69%","19%");
	   art.dialog({id:'commonDialog1',title:'人员信息', iframe:url, width:'750', height:'400',top:'0'});
	}
</script>
<script type="text/javascript" src="<%=basePath%>/scripts/artDialog2.1.1/artDialog.js"></script>
<script src="<%=basePath%>/scripts/jquery-1.2.6.js" charset="UTF-8" type="text/javascript"></script>
<script charset="UTF-8" type="text/javascript"
	src="<%=basePath%>/scripts/workflow/wfsrc/workflow/mootools-1.11.js" language="javascript"></script>
	
<script charset="UTF-8" type="text/javascript"
	src="<%=basePath%>/scripts/workflow/register/WorkSpace.js" language="javascript"></script>
<script charset="UTF-8" type="text/javascript" src="<%=basePath%>/scripts/workflow/register/index.js"
	language="javascript"></script>
</head>
<body >
<link type="text/css" href="<%=basePath%>/scripts/artDialog2.1.1/skin/default.css" rel="stylesheet"  />
<style type="text/css" media="all">

#loading { position:absolute;left:30%;top:40%;z-index:1000; } 
</style>
<input type='hidden' value='<%=basePath%>' name='basePath'/>
<div id="loading" style="" ><img src='<%=basePath%>/styles/images/timespace/loading.gif'>loading...</div>
<div id="oDiv1" style='background-color: #ffffff;width:98%;height:200px'/>
<div id="oDiv"
	style="position: absolute; z-index: 99; background-color:#ffffff; Filter: Alpha(Opacity =0); border: 1px solid #333333; display: none; width: 98%; height: 1000px; top: 0px; left: 0px; vertical-align: center; text-align: center;"></div>
<div id="designer"
	style="width:98%;height:98%;border: #e0e0e0 1px solid;"></div>
	<!--  
<div id="a" style="position: absolute;width: 100px; height:100px;border: 1px black; background-color: black;z-index: 10">
-->

<div id="designerList"
	style="position: absolute;float:left;width:98%;border: #e0e0e0 1px solid;background-color:#ffffff;top:290px">
	
	
	<div id="desListMenu" class='title'>工作流节点管理</div>
	<div id="desListContent">
		<div id="desListContentMenu" class='title'>节点列表</div>
		<div id="desListContentPanel">
			<table id="listHeadTable" border=0 cellpadding=0 cellspacing=0>	
			<tr>
				<th style="width:5%"    class="fixed" >序号</th>
				<th style="width:12%"  class="fixed"  >节点名称</th>
				<th style="width:6%;"    class="fixed"  >处理方式</th>
				<th style="width:10%;"    class="fixed"  >任务处理角色</th>
				
				<th style="width:10%;"    class="fixed"  >任务执行人</th>
				<th style="width:10%;"   class="fixed"  >描述</th>
				<th style="width:9%;"    class="fixed" >节点类型</th>
				<th style="width:10%;"    class="fixed"  >上一节点</th>
				<th style="width:10%;"  class="fixed"  >下一节点</th>
				<th style="width:10%;"  class="fixed"  >回退至节点</th>	
				<th style="width:8%;"  class="fixed"  >流程类型</th>			
			</tr>
			<tr>
				<td colspan="7"   align='center' class="fixed" >暂无纪录!</td>				
			</tr>
			</table>
		</div>
		<!-- 
		<div id="desListContentEdit" style='height:190px'>
			<div class='title' style='border-bottom: #e0e0e0 1px solid;'>详细信息</div>
			<div  >
				<fieldset>
					<legend>节点信息</legend>
					<div id='nodeDiv'>
						<form name='nodeForm' id='nodeForm'>
							<label for="nodename">节点名称:</label>
							<input type="text" size=19 id="nodename" name="nodename" value="无" /><br/>
							<label for="nodedes">节点描述:</label>
							<textarea  id="nodedes" name="nodedes" rows=3 cols=16></textarea><br/>
							<label for="processmode">处理方式:</label>
							<select size=1 id="processmode" name="processmode" style='display:none;width:150px'>
							<option value='单人任务'>单人任务</option>
							<option value='多人任务'>多人任务</option>
							</select><br/>
							<label for="roleorman">
							<select size=1 id="roleorman" name="roleorman" style='width:150px'>
							<option value='0'>角色</option>
							<option value='1'>人</option>
							</select></label><br/>
							<input type="text" id="roleorman_name" name="roleorman_name"/><button onclick="chooses();" >choose</button>
							<input type="hidden"  id="roleorman_value" name="roleorman_value" value="" />
							 <input type="button"  id="joiner" name="joiner" value="设置参与者" />
							<input type="button"  id="nodeForm_save" name="nodeForm_save" value="保存" />
						</form>
					</div>
					<div id='defaultNodeDiv'>未添加数据或未选择节点，无法查看信息!</div>
				</fieldset>
			</div>		
		</div>
		 -->
	</div>	
	<div id='info' style='display:none'>

</div>
</div>

<script charset="UTF-8" type="text/javascript" language="javascript">
//参数初始化







  


</script>
	</body>
</html>
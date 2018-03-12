<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript" src="${ctx}/scripts/publicFunction.js"></script>
	<script type="text/javascript">
	 $(document).ready(function(){
	 //保存
	 	$("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["line_name","线路名称"];
			properties[1]=["line_code","线路编码"];
			saveValidateRequired("#btn_save",properties,"dtaqLineForm");
			}); 
		//返回		
		 $("#btn_back").click(function(){ 
			document.forms[0].action='dtaqLineAction.do?method=index&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&flagPage=1'; 
	    	document.forms[0].submit();
	    }); 
	    
	    //选择用户
			$("#btn_selectEmployeein").click(function(){
				var url = "employeeAction.do?method=selectEmpsForLine&qorganidentify=0" ;
				art.dialog({id:'commonDialog1',title:'员工信息', iframe:url, width:'800', height:'500',top:'30'});
			}); 
	}); 
</script>
<title>
	<content tag="heading"> 地铁线路基本信息</content>  
</title>
</head>

<body>

<html:form action="dtaqLineAction.do" styleClass="form" method="POST" styleId="dtaqLineForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save" />
<html:hidden property="ec_crd" />
<html:hidden property="flagPage" value="1"/>
<html:hidden property="id" />
<fieldset>
<legend>地铁线路-新增</legend>
<table class="formTable">
	<COLGROUP >
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
	</COLGROUP>
	<tr>
		<td>
			线路名称：<span class="redSpan">*</span>
		</td>
		<td>
			<html:text property="line_name" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
	<tr>
		<td>
			线路编码：<span class="redSpan">*</span>
		</td>
		<td>
			<html:text property="line_code" styleClass="inputText" maxlength="100" size="30" /><font color="#50A2E6" size="2">(示例说明:01，'01'表示线路流水号即一号线)</font>
		</td>
	</tr>
	<tr>
		<td>
			线路简称：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="shortName" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
	<tr>
		<td>
			GIS默认显示：<span class="noRedSpan">*</span>
		</td>
		<td>
			<input type="checkbox"  name="tempIsGISShow" value="1" />
		</td>
	</tr>
	<tr>
		<td>
			GIS排序：<span class="noRedSpan">*</span>
		</td>
		<td>
			<ex:numberInput property="gisOrder" maxlength="5" />
		</td>
	</tr>
	<tr>
		<td>
			显示类型：<span class="noRedSpan">*</span>
		</td>
		<td>
			<input type="checkbox"  name="tempShowType_1" value="1"  />建设期
			<input type="checkbox"  name="tempShowType_2" value="2"  />运营期
		</td>
	</tr>
	<tr>
		<td>
			监控状态：<span class="noRedSpan">*</span>
		</td>
		<td>
			<ex:dictSelect property="monitoring_status" type="MonitorStatus"  />
		</td>
	</tr>
	<tr>
		<td>
			巡视主任：<span class="noRedSpan">*</span>
		</td>
		<td>
			<input id="empId" name="empId" type="hidden" value="${empId}">
	    	<input id="empName" value="${empName}" type="text" class="showText" 
	    		   maxlength="100" size="48">
			<input id="btn_selectEmployeein" value="选择用户"  type="button"  icon="icon_selectInfo" />
		</td>
	</tr>
	<tr>
		<td>
			线路颜色值：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="lineColor" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
	<tr>
		<td>
			地图缩放级别：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="mapFix" value="13" styleClass="inputText" maxlength="100" size="30" />
			<font color="#50A2E6" size="2">(填报的数字越大，地图的放大倍数越大)</font>
		</td>
	</tr>
</table>
</fieldset>
		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
			<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
		</div>
	</html:form>
	</body>
</html:html>

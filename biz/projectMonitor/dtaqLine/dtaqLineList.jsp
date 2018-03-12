<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		var oper_id="";
		$(document).ready(function(){
			//新增
			$("#btn_add").click(function(){ 
				parent.document.location='dtaqLineAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val()+'&flagPage=1'; 
			}); 
		//		window.parent.frames["Links"].location.href="dtaqLineAction.do?method=listLeft"; 
		
		
			//编辑
			$("#btn_gisAnalyse").click(function(){ 
				parent.document.location='dtaqLineAction.do?method=gisAnalyseIndex'; 
			//	commonUrl(url);
			});
		});
		//地图
		function drawMap(id){
			parent.document.location='dtaqLineAction.do?method=drawMap&line_id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&flagPage=1'; 
	    }
	    
		//编辑
		function btn_edit(oper_id){
			parent.document.location='dtaqLineAction.do?method=edit&line_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&flagPage=1'; 
		//	commonUrl(url);
		}
		
		//删除
		function btn_delete(oper_id){
			ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
						$.ajax({
					   type: "POST",
					   url: "${ctx}/dtaqLineAction.do?method=checkdelete",
					   data: "line_id="+oper_id,
					   success: function(msg){
					   		 if(msg=="no"){ 
					   		 		alert("此节点下有子节点，不能删除");     
							  }else {
							  		parent.document.location='dtaqLineAction.do?method=delete&line_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
							  }
					   }
					});
				}
		}
		//刷新
		function pageRefresh(){
			parent.document.forms[0].action='dtaqLineAction.do?method=index'+'&ec_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&flagPage=1';   
    		parent.document.forms[0].submit();
		}
	</script>
</head>
<body > 
					<div class="promptDiv">
						本级节点名称：<span class="keyInfoSpan">地铁线路</span>
					</div>
<div class="listButtonDiv">
	<input type="button" id="btn_add" icon="icon_add" value="新增线路"/>
	<input type="button" id="btn_gisAnalyse" icon="icon_view" value="地图线路展示"/>
</div>
<ec:table items="dtaqLines" var="dtaqLine" action="dtaqLineAction.do?method=list"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
	
  	<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
		<ec:column property="line_code" calcTitle="line_code" title="线路编码"/>
		<ec:column property="line_name" calcTitle="line_name" title="线路名称"/>
		<ec:column property="shortName" calcTitle="shortName" title="简称"/>
		
		<ec:column property="temp" title="操作"  >
			<input type="button"   id="btn_draw"    icon="icon_edit"  onclick="drawMap('${dtaqLine.line_id}')"     value="线路画图"/>
			<input type="button"   id="btn_edit"    icon="icon_edit"  onclick="btn_edit('${dtaqLine.line_id}')"     value="编辑"/>
			<input type="button"   id="btn_delete"    icon="icon_delete"  onclick="btn_delete('${dtaqLine.line_id}')"     value="删除"/>
		</ec:column> 
		
	</ec:row>
</ec:table>
</body>

</html:html>

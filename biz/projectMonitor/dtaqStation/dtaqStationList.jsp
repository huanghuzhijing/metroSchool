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
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			$("#btn_view").hide();
			$("#btn_secBtn").hide();
			$("#btn_layBtn").hide();
			$("#btn_conBtn").hide();
			
			//控制按钮
			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);
			
			//新增
			$("#btn_add").click(function(){ 
				parent.document.location='dtaqStationAction.do?method=create&tabFlag=1'+'&ec_crd='+$("[name='ec_rd']").val()+'&qsegmentId='+${param.qsegmentId}; 
			}); 
			//编辑
			$("#btn_edit").click(function(){ 
				parent.document.location='dtaqStationAction.do?method=edit&tabFlag=1&station_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&flagPage=3'+'&qsegmentId='+${param.qsegmentId}; 
			}); 
			
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					//alert('删除');
					//var url='dtaqStationAction.do?method=delete&station_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qsegmentId='+${param.qsegmentId}; 
					//commonUrl(url);
					parent.document.location='dtaqStationAction.do?method=delete&station_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qsegmentId='+${param.qsegmentId}; 
				}
			});
			
			//详细
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
			//分段信息
			$("#btn_secBtn").click(function(){ 
				//var station_id = jQuery("[name='station_id']:checked").val() ;
				var url = "${ctx}/dtaqSectionAction.do?method=list&station_id="+oper_id+"&segment_id=${param.qsegmentId}" ;
				art.dialog({id:'commonDialog1',title:'分段信息', iframe:url, width:'700', height:'500'});
			});
			//分层信息
			$("#btn_layBtn").click(function(){ 
				//var station_id = jQuery("[name='station_id']:checked").val() ;
				var url = "${ctx}/dtaqLayerAction.do?method=list&station_id="+oper_id+"&segment_id=${param.qsegmentId}" ;
				art.dialog({id:'commonDialog1',title:'分层信息', iframe:url, width:'700', height:'500'});
			});
			$("#btn_conBtn").click(function(){ //工况属性
				parent.document.location="dtaqStationAction.do?method=toStationCondition&station_id="+oper_id+"&segment_id=${segment_id}" ;
			});
		});
		//详细页面
		function showView(oper_id){
	    	var url ='dtaqStationAction.do?method=view'+'&station_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qsegmentId='+${param.qsegmentId}; 
			commonUrl(url);
	  	}
		
		//刷新
		function pageRefresh(){
			parent.document.forms[0].action='metroLineAction.do?method=index'+'&ec_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&qsegmentId='+${param.qsegmentId};   
    		parent.document.forms[0].submit();
		}
	  	//设置list页面id
		function setPullValue(common_oper_id){
			oper_id=common_oper_id;
			
			var operObj = $("input[type=radio][name='select_id'][checked]");
			var station_type=operObj.attr("paramStatus");
			if(station_type == "P"){
				$("#btn_secBtn").hide();
				$("#btn_layBtn").hide();
				$("#btn_conBtn").show();
			}else if(station_type == "S"){
				$("#btn_secBtn").show();
				$("#btn_layBtn").show();
				$("#btn_conBtn").show();
			}
		}
	</script>
</head>

<body > 
					<div class="promptDiv">
						所属标段：<span class="keyInfoSpan">${segmentNames}</span>
					</div>
<div class="listButtonDiv">
	<input type="button" id="btn_add" icon="icon_add" value="新增"/>
	<input type="button" id="btn_view" icon="icon_view" value="详细"/>
	<input type="button" id="btn_edit" icon="icon_edit" value="编辑"/>
	<input type="button" id="btn_delete" icon="icon_delete" value="删除"/>
	
	<input type="button" id="btn_secBtn" icon="icon_add" value="分段信息"/>
	<input type="button" id="btn_layBtn" icon="icon_add" value="分层信息"/>
	<input type="button" id="btn_conBtn" icon="icon_add" value="工况属性"/>
</div>
<ec:table items="dtaqStations" var="dtaqStation" action="dtaqStationAction.do?method=list"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
	
  	<ec:row highlightRow="true" onclick="pullValue('${dtaqStation.station_id}');">
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
		<ec:column property="null" sortable="false" title="选择" width="5%">
				<input type="radio" name="select_id" value="${dtaqStation.station_id}" paramStatus="${dtaqStation.station_type}"/>
		</ec:column>
		<ec:column property="station_code" calcTitle="station_code" title="车站/区间编码"/>
		<ec:column property="station_name" calcTitle="station_name" title="车站/区间名称"/>
		
	</ec:row>
</ec:table>
</body>

</html:html>

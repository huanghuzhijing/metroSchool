<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		var oper_id="";
		//
		$(document).ready(function(){
			//
			$("#btn_edit").show();
			$("#btn_view").show();
			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);
			
			//编制
			$("#btn_edit").click(function(){
				var url='accidentDealAction.do?method=edit&fid='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
				
				commonUrl(url);
			}); 
			
			//详细
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
			
			
		});
		
		//详细页面
		function showView(id){
	    	var url ='accidentReportAction.do?method=view&fid='+id+'&ec_p='+$("input[name='ec_p']").val()+'&viewFlag=true'+'&ec_crd='+$("[name='ec_rd']").val(); 
			commonUrl(url);
	  	}
	  	//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;		
		}
		
		//指令码判断
		function checkCmd(){
			var cmdIds='${userinfo.usercmd}';

		}
		
	</script>
</head>
<content tag="heading">
	安全事故跟踪处理
</content>
<body >
	
	<div  class="listButtonDiv">
		
		<input id="btn_view" value="${texts['button.detail']}" type="button" icon="icon_view"/>
		<input id="btn_edit" value="编制" type="button" icon="icon_edit"/>
		
	</div>
	<ec:table items="accidentReports" var="accidentReport" 
		action="accidentReportAction.do" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
		>
		<ec:row highlightRow="true"  onclick="pullValue('${accidentReport.fid}','');"
				ondblclick="showView('${accidentReport.fid}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="8%" />
			<ec:column property="null" sortable="false" title="选择" width="8%">
				<input name="select_id" value="${accidentReport.fid}"  type="radio"/>
			</ec:column>
			<ec:column property="fname" title="事故主题" />			
			<ec:column property="happenTime" title="事故发生时间" />
			<ec:column property="station" title="车站区间" />			
			<ec:column property="levels" title="事故等级" />
			<ec:column property="catagory" title="事故类别 "/>			
			<ec:column property="weather" title="天气状况" />
			<ec:column property="wounderNumber" title="受伤人数" />			
			<ec:column property="deathNumber" title="死亡人数" />			
			<ec:column property="creator" title="编制人" >		
		<ex:empName id="${accidentReport.creator}"/>
			</ec:column>
			
			
		</ec:row>
	</ec:table>
	
</body>
</html:html>

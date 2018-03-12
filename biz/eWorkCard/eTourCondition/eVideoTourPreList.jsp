<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	var oper_id="";
		$(document).ready(function(){
		
			var table1=$("#tablescrop1");
			var item1=$(".item1");
			if(table1.height()>item1.height()){
				var speed = 2000;  
	            function Marquee() {  
	            	var $self = table1; 
	            	var lineHeight = $self.find("tr:first").height(); 
	            	$self.animate({ 
	            		"marginTop": -lineHeight + "px" 
	            	}, 600, function() { 
		            	$self.css({ 
		            		marginTop: 0 
		            	}).find("tr:first").appendTo($self); 
	            	}) 
	            }  
	            var MyMar = setInterval(Marquee, speed);  
	            table1.mouseover(function(){
	            	 clearInterval(MyMar);  
	            });
	            table1.mouseout(function(){
	            	 MyMar = setInterval(Marquee, speed);  
	            });
			}
		
		var ec_id='${param.ec_id}';
		var ec_auditStatus='${param.ec_auditStatus}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			ec_auditStatus='${ec_auditStatus}';
		}
		pullValue(ec_id,ec_auditStatus);
			//
			$("#btn_add").click(function(){
			 var url ="eVideoTourAction.do?method=create&flagPage=${param.flagPage}";
		     art.dialog({id:'commonDialog1',title:'新增', iframe:url, width:'600', height:'400',top:'30'});
			});
			$("#btn_delete").click(function(){ 
					ret = window.confirm('${texts['dtaq.common.delete.msg']}');
					if(ret){
					location.href='eVideoTourAction.do?method=delete&flagPage=${param.flagPage}&id='+oper_id+"&ec_p="+$("input[name='ec_p']").val();
				}
			});
			$("#btn_edit").click(function(){ 
			var url="eVideoTourAction.do?method=create&flagPage=${param.flagPage}&id="+oper_id+"&ec_p="+$("input[name='ec_p']").val()+'&qvideoTourDate='+$("input[name='qvideoTourDate']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			 art.dialog({id:'commonDialog1',title:'编辑', iframe:url, width:'600', height:'400',top:'30'});
		});	
		});
		//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
		
	function pageRefresh(){
		location.href='eVideoTourAction.do?method=list&flagPage=${param.flagPage}&ec_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();   
     }
	</script>
</head>
<content tag="heading">
	巡视情况查询
</content>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
			<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
			<c:if test="${param.flagPage==null}">
				<html:form action="eVideoTourAction.do?method=list">
				<html:hidden property="flagPage"  value="${param.flagPage}"/>
					<table class="queryContentTable">
						<tr>
							<td >巡查日期：</td>
							<td><html:text styleClass="inputText" property="qvideoTourDate1" maxlength="25" onfocus="WdatePicker()"></html:text>
							-&nbsp;<html:text styleClass="inputText" property="qvideoTourDate2" maxlength="25" onfocus="WdatePicker()"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
				</c:if>
				<c:if test="${param.flagPage!=null}">
				<html:form action="eVideoTourAction.do?method=tab">
				<html:hidden property="flagPage"  value="${param.flagPage}"/>
					<table class="queryContentTable">
						<tr>
							<td >巡查日期：</td>
							<td><html:text styleClass="inputText" property="qvideoTourDate1" maxlength="25"  value="${qvideoTourDate1}" readonly="true"></html:text>
							-&nbsp;<html:text styleClass="inputText" property="qvideoTourDate2" maxlength="25"  value="${qvideoTourDate2}" readonly="true"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
				</c:if>
			</td>
		</tr>
	</table>
	<div class="queryTable">
<table class="listTable1" border="1" style="width:100%;margin:auto;font-size: 14px;border-collapse: collapse;">
									<tr class="ggHeader">
										<th width="50%">视频监控巡视工程师</th>
										<th width="50%">巡视日期</th>
										<!-- <th width="33%">填报日期 </th> -->
										
									</tr>
							</table>
							<div class="item1" style="height:526px;overflow:hidden;width: 100%">
							<table id="tablescrop1" class="listTable1" border="1" style="width:100%;margin:auto;font-size: 14px;border-collapse: collapse;">
								
									<c:forEach items="${eVideoTours}" var="eVideoTour" varStatus="index">
										<tr>
											<td width="50%">${eVideoTour.videoTourEngineer}</td>
											<td width="50%"><fmt:formatDate value="${eVideoTour.videoTourDate}" pattern="yyyy-MM-dd"/></td>
										<!-- 	<td width="33%"><fmt:formatDate value="${eVideoTour.registerDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										 -->
										</tr>
									</c:forEach>
										
								
							</table>
							</div>
</div>
	
</body>
</html:html>

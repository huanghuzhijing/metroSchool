<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="${ctx}/scripts/flex_pub.js"></script>
<script src="${ctx}/scripts/newWatchpoint.js"></script>	
<script language="javascript" src="${ctx}/scripts/Charts/swf/FusionCharts.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function(){
				 showCharts_1();
		
		});
		function showCharts_1(){
			var myCharts = new FusionCharts("${ctx}/scripts/Charts/swf/MSColumn3D.swf"," ","600","350"); 
			var dataXml="<chart caption=' ' xAxisName='线路标段' yAxisName='预警次数' formatNumberScale='0' >";
			dataXml+="<categories>";
					<c:forEach items="${datas}" var="data">
							dataXml+="<category label='${data.segment_name}' />";
					</c:forEach>
			dataXml+="</categories>";
			
			dataXml+="<dataset seriesName='黄色'  showValues='0' color='FEFE00'>";
						<c:forEach items="${datas}" var="data">
							dataXml+="<set value='"+Number('${data.yellow_count}')+"'/>";
						</c:forEach>
			dataXml+="</dataset>";
			
			dataXml+="<dataset seriesName='橙色'  showValues='0'  color='FFA500'>";
					<c:forEach items="${datas}" var="data">
						dataXml+="<set value='"+Number('${data.organ_count}')+"'/>";
					</c:forEach>
			dataXml+="</dataset>";
		
			dataXml+="<dataset seriesName='红色'  showValues='0' color='FE0000'>";
			<c:forEach items="${datas}" var="data">
				dataXml+="<set value='"+Number('${data.red_count}')+"' />";
			</c:forEach>
			dataXml+="</dataset>";
			
			dataXml+="</chart>";
			myCharts.setDataXML(dataXml);
			myCharts.render("chartdiv_1");
		}
		
		/*鼠标定图*/
		var graphUrl1="";
		<c:if test="${isthird == 'Y'}">
		graphUrl1="${third_img}";
		</c:if>
		<c:if test="${isthird != 'Y'}">
		graphUrl1="${work_img}";
		</c:if>
		var wp=null,xyList="";
		function init(){
			var station_id = '${station_id}';
			if(station_id != null && station_id !=""){
			   //初始化	   
			   wp=new NewWatchPoint({
			   name:"wp",//实例名
			   target:$("wp_chartBody"),//显示区DIV ID
			   xName:"pointx",//X轴表单名
			   yName:"pointy",//Y轴表单名
			   wbsidName:"point_id",//绑定主键ID
			   ctx:"${ctx}",//基本路径
			   radius:5,//图层半径
			   allowNew:false,
			   allowSelected:1,
			   baseHeight:10,//调节与上边距
			   graphUrl:graphUrl1,//地理底图
			   targetElW:640,
			   targetElH:document.body.clientHeight-50,
			   offsetLeft:230,//左边内容项的宽度
			   offsetTop:0,	   
			   selectedHandle:displayWarnInfo,
			   vars:"dataCallWay=1&allowSelected=1",//传入参数用于指定FLASH要显示哪个点
			   VIEWMODE:2//测点观察模式	   
			   //graphUrlW:641,//地理底图宽高
			   //graphUrlH:910
			   });
			   //添加数据
			  xyList="${xyList}";
			   //输出图
			  wp.paint();//画出框架
			  wp.addAndShowData(xyList);//加载并显示数据
			}
		}
		//查询
		function query(){
			location.href="dtaqDataInfoQuery2Action.do?method=list&isthird=${isthird}&line_id=${line_id}&startDate="+jQuery("[name='startDate']").val()+"&endDate="+jQuery("[name='endDate']").val();
		}
		
	</script>
</head>
<content tag="heading">
监测安全状态分析
</content>

<body onload="init()">

<input type="hidden" name="isthird" value="${isthird}"/>
<input type="hidden" name="pointids"/>
<c:if test="${isthird=='Y'}">
  <c:set var="selectUnit" value="false"/>
  <c:set var="selectThird" value="true"/>
</c:if>
<c:if test="${isthird=='N'}">
  <c:set var="selectUnit" value="true"/>
  <c:set var="selectThird" value="false"/>
</c:if>
<ex:tab id="queryTab">
  <ex:tabItem name="third" label="第三方监测单位" url="${ctx}/dtaqDataInfoQuery2Action.do?method=list&isthird=Y" selected="${selectThird}">
  	<c:if test="${isthird=='Y'}">
  		<%@include file="content.jsp" %>
  	</c:if>
  </ex:tabItem>
  <ex:tabItem name="constr" label="施工单位" url="${ctx}/dtaqDataInfoQuery2Action.do?method=list&isthird=N" selected="${selectUnit}">
	<c:if test="${isthird=='N'}">
		<%@include file="content.jsp" %>
	</c:if>
  </ex:tabItem>
</ex:tab>


</body>
</html:html>
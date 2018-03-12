<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle />
<html lang="en">
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/highcharts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/highcharts/highcharts.js"></script>
<script type="text/javascript" src="${ctx}/scripts/highcharts/exporting.js"></script>
<script type="text/javascript" src="${ctx}/scripts/highcharts/highcharts-zh_CN.js"></script>
 <script>	
	$(function () {
    $('#container').highcharts({
    		labels:{
           
            items:[{
                html:'华中科技大学安全预警系统',
                style: { 
                    left: ${left},
                    top: ${top},
                    color:'#C0C0C0',
                    fontSize:'20px',
                    fontWeight:'bold',
                    fontFamily:'微软雅黑'
                }
            }]
        },
        
        chart: {
            type: 'line',
             inverted:${flagPage}
        },
         credits:{
        	enabled:false//不显示highCharts版权信息
        },
        title: {
            text: ${title}
        },
        
        xAxis: {
        	
        	 title: {
                text: ${xTitle}
            },
        	gridLineWidth: 0,
        	lineColor: '#000',
			tickColor: '#000',
            //categories: ${listName}
            ${timetype}
            type:${category}
        },
        
        yAxis: {
        	${lsb}
        	opposite : ${flagPage},
        	//lineWidth: 2,
        	//minorTickInterval: 'auto',
        	gridLineWidth: 0,
			lineColor: '#000',
			lineWidth: 1,
			tickWidth: 1,
			tickColor: '#000',
            title: {
                text: ${yTitle}
            },
            tickInterval:0.5
        },
        tooltip: {
          //  enabled: false,
         //   formatter: function() {
          //      return '<b>'+ this.series.name +'</b><br/>'+this.x +': '+ this.y +'°C';
          //  }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: false
                },
                 marker: {
                    enabled: true
                },
                connectNulls:true,
                enableMouseTracking: false
            }
        },
        
        exporting: {
            type:'image/png',
            buttons: {
            	contextButton: {
           		 menuItems: [{
            		text: '导出PNG图片文件',
            		onclick: function() {
            			this.exportChart();
            		},
            		separator: false
           		 }]
            }
            }
        },
        
        series: ${dataTemp}
    });
    
    
});	
  </script>
</head>

<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="checkpointPictureAction.do?method=showSuccessionCurve">
					<input type="hidden" name="point_type" value="${point_type}">
					<input type="hidden" name="group_id" value="${group_id}">
					<table align="left">
						<tr>
							<td>监测类型</td>
							<td>
								 <html:select property="type_id"  value="${type_id}">
							      <html:option value="">--请选择--</html:option>
							      <html:optionsCollection name="types" value="type_id" label="type_name"/>
							    </html:select>
							</td>
							
							<c:if test="${flagPage eq true}">
								<td>监测部位</td>
								<td>
									<html:select property="part_id" value="${part_id}">
										<html:option value="">--请选择--</html:option>
										<html:optionsCollection name="parts" value="part_id" label="part_name" />
									</html:select>
								</td>
						</c:if>
							<td>监测时间段</td>
							<td>
								<input type="text"  name="startDate"  class="inputText" value="${startDate}"  onfocus="WdatePicker()" />--<input type="text"  name="endDate"  class="inputText" value="${endDate}" onfocus="WdatePicker()" />
							</td>
							
							<td align="right" >
								<input type="submit"  icon="icon_query"   value="查  询" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<c:if test="${flagPage eq false}">
	
	 	<div id="container" style="width:900px;height:500px"></div>
	</c:if>
	<c:if test="${flagPage eq true}">
	
	 	<div id="container" style="width:700px;height:1000px"></div>
	</c:if>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle />
<html lang="en">
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/modules/exporting.js"></script>
 <script>	
	$(function () {
    $('#container').highcharts({
    		labels:{
           
            items:[{
                html:'华中科技大学安全预警系统',
                style: { 
                    left: '300px',
                    top: '200px',
                    color:'#C0C0C0',
                    fontSize:'20px',
                    fontWeight:'bold',
                    fontFamily:'微软雅黑'
                }
            }]
        },
        
        chart: {
            type: 'line'
        },
         credits:{
        	enabled:false//不显示highCharts版权信息
        },
        title: {
            text: ${title}
        },
        
        xAxis: {
        	
        	 title: {
                text: '监测日期'
            },
        	gridLineWidth: 0,
        	lineColor: '#000',
			tickColor: '#000',
            categories: ${list_name}
           
        },
        
        yAxis: {
        	//lineWidth: 2,
        	//minorTickInterval: 'auto',
        	${lsb}
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
            enabled: false,
            formatter: function() {
                return '<b>'+ this.series.name +'</b><br/>'+this.x +': '+ this.y +'°C';
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: false
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
				<html:form action="dtaqAutoDataInfoQuery3Action.do?method=showComparePointTimes">
					<input type="hidden" name="point_id" value="${point_id}">
					<input type="hidden" name="type_kind" value="${type_kind}">
					<table align="left">
						<tr>
							<td>监测时间：</td>
							<td>
								<input type="text"  name="qstartDate"  class="inputText" value="${qstartDateTemp}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDateTemp}" onfocus="WdatePicker()" />
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
	<c:if test="${datas1 != null}">
	<table class="listTable" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
		<thead>
			<tr>
				 <th colspan="3">${tableTitle1}</th>
			</tr>
			<tr>
				<th>监测日期</th>
		      	<c:if test="${type_kind == '1' || type_kind == '2'}">
			        <th>${type.change_rate_title}</th>
			        <th>${type.total_change_title}</th>
		      	</c:if>
		      	<c:if test="${type_kind == '4'||type_kind == '6'}">
			        <th>${type.current_value_title}</th>
			        <th>${type.current_change_title}</th>
		      	</c:if>
		      	<c:if test="${type_kind == '5'}">
			        <th>地震波频率(hz)</th>
			        <th>振速峰值(cm/s)</th>
		      	</c:if>
	       	</tr>
		</thead>
		<c:forEach items="${datas1}" var="data1">
			<tr align="center" class="row1">
				<td align="center"><fmt:formatDate value="${data1.write_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<c:if test="${type_kind != '4'&& type_kind != '6'}">
					<td align="center">${data1.change_rate}</td>
					<td align="center">${data1.total_change}</td>
				</c:if>
				<c:if test="${type_kind == '4'||type_kind == '6'}">
					<td align="center">${data1.total_change}</td>
					<td align="center">${data1.change_rate}</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<c:if test="${datas2 != null}">
		<table class="listTable" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
			<thead>
			<tr>
				<th colspan="3">${tableTitle2}</th>
			</tr>
			<tr>
				<c:if test="${type_kind == '1'}">
					<th>填报日期</th>
					<th>沉降速率(mm/d)</th>
					<th>累计沉降(mm)</th>
				</c:if>
				<c:if test="${type_kind == '2'}">
					<th>填报日期</th>
					<th>位移/收敛速率(mm/d)</th>
					<th>累计位移/收敛值(mm)</th>
				</c:if>
				<c:if test="${type_kind == '4'}">
					<th>填报日期</th>
					<th>应力变化量(kn)</th>
					<th>本次PN值(kn)</th>
				</c:if>
				<c:if test="${type_kind == '6'}">
					<th>填报日期</th>
					<th>温度变化量(℃)</th>
					<th>本次温度值(℃)</th>
				</c:if>
			</tr>
			</thead>
			<c:forEach items="${datas2}" var="data2">
				<tr align="center" class="row1">
					<td align="center"><fmt:formatDate value="${data2.write_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<c:if test="${type_kind != '4' && type_kind != '6'}">
						<td align="center">${data2.change_rate}</td>
						<td align="center">${data2.total_change}</td>
					</c:if>
					<c:if test="${type_kind == '4'||type_kind == '6'}">
						<td align="center">${data2.total_change}</td>
						<td align="center">${data2.change_rate}</td>
					</c:if>
				</tr>
			</c:forEach>		
		</table>

	 </c:if>
	 	<div id="container" style="width:900px;height:500px"></div>
	 <fieldset>
	 <legend><strong>基本信息</strong></legend>
	 <table class="titleTable" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
		  <tr>
		    <td>项目名称：</td>
		    <td>${dtaqStation.segment_id.line_id.line_name}</td>
		    <td>标段名称：</td>
		    <td>${dtaqStation.segment_id.segment_name}</td>
		  </tr>
		  <tr>
		    <td>车站区间：</td>
		    <td>${dtaqStation.station_name}</td>
		    <td>监测单位：</td>
		    <td>${orgName}</td>
		  </tr>
		  <tr>
		    <td>监测类型：</td>
		    <td>${type.type_name}</td>
		    <td>监测部位名称：</td>
		    <td>${point.partId.part_name}</td>
		  </tr>
		  <tr>
		    <td>测点编码：</td>
		    <td>${point.point_code}</td>
		    <td>测量仪器：</td>
		    <td>${point.point_mechine}</td>
		  </tr>
		  <c:if test="${type_kind != '5'}">
			  <tr>
			    <td>绝对警戒值：</td>
			    <td>${point.abs_warning_value}</td>
			    <td>绝对临界值：</td>
			    <td>${point.abs_critical_value}</td>
			  </tr>
			 <tr>
			    <td>负绝对警戒值：</td>
			    <td>${point.negative_abs_warning_value}</td>
			    <td>负绝对临界值：</td>
			    <td>${point.negative_abs_critical_value}</td>
			  </tr>
			  <tr>
			    <td>相对警戒值：</td>
			    <td>${point.rel_warning_value}</td>
			    <td>相对临界值：</td>
			    <td>${point.rel_critical_value}</td>
			  </tr>
		  </c:if>
		   <c:if test="${type_kind == '5'}">
		  	 <tr>
			    <td>最大振速峰值：</td>
			    <td colspan="3">${point.abs_warning_value}</td>
			  </tr>
		  </c:if>	 
	 
	 
	 
	 </table>
	 
	 
	 </fieldset>
</body>
</html>
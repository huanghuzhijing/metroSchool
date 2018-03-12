<%@ page contentType="text/html;charset=UTF-8" %>
 <div class="tableRegion">
	<table class="listTable" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
		<tr>
			<td>
				<div class="grid">
					<table border="0" cellspacing="0" cellpadding="0" width="100%" style="border-collapse: collapse;" id="contractInfoList">
						<thead>
							<tr>
								<th width="10%">测点编码</th>
	    						<th width="10%">爆心距(m)</th>
							    <th width="10%">最大装药量(kg)</th>
							    <th width="10%">振速峰值(cm/s)</th>
							    <th width="10%">地震波频率(hz)</th>
							    <th width="10%">预警状态</th>
							    <th width="10%">预警原因</th>
							    <th width="10%">图形操作</th>
	  						</tr>
  						</thead>
						<tbody>
							<c:forEach items="${datas}" var="data">
								<tr title="${data.warn_memo}"><td onclick="showPointPosition(this)">${data.point_code}</td><td>${data.curr_value}</td><td>${data.curr_change}</td><td>${data.total_change}</td><td>${data.change_rate}</td><td><span class="state${data.warn_state}" style="width:50px;display:block;height:18px;"></div></td><td><input type="text" class="lineinput" readonly="readonly" name="warn_memo" id="warn_memo_${idx}" value="${data.warn_memo}" style="width:100%"></td><td align="center"><input type="button" value="时序曲线" class="button1" onclick="showComparePointTimes(${data.point_id.point_id})"></td></tr>
							</c:forEach>
  						</tbody>
					</table>
				</div>
			</td>
		</tr>
	</table>

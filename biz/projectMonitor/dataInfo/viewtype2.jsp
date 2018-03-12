<%@ page contentType="text/html;charset=UTF-8"%>
<div class="tableRegion">
	<table class="listTable" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
		<tr>
			<td>
				<div class="grid">
					<table border="0" width="100%" cellspacing="0" cellpadding="0"
						style="border-collapse: collapse;" id="contractInfoList">
						<thead>
							<tr>
								<th width="10%">测点编码</th>
								<th width="10%">${dtaqTypeTitle.init_value_title}</th>
								<th width="10%">${dtaqTypeTitle.current_value_title}</th>
								<th width="10%">${dtaqTypeTitle.pre_value_title}</th>
								<th width="10%">${dtaqTypeTitle.current_change_title}</th>
								<th width="10%">${dtaqTypeTitle.change_rate_title}</th>
								<th width="10%">${dtaqTypeTitle.total_change_title}</th>
								<th width="10%">预警状态</th>
								<th width="10%">图形操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${datas}" var="data">
								<tr title="${data.warn_memo}"><td onclick="showPointPosition(this)">${data.point_code}</td><td>${data.init_value}</td><td>${data.curr_value}</td><td>${data.prev_value}</td><td>${data.curr_change}</td><td>${data.change_rate}</td><td>${data.total_change}</td><td><span class="state${data.warn_state}" style="width:50px;display:block;height:18px;"></div></td><td align="center"><input type="button"value="时序曲线" class="button1"onclick="showComparePointTimes(${data.point_id.point_id})">&nbsp;</td></tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</td>
		</tr>
	</table>
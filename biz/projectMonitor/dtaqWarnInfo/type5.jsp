<%@ page contentType="text/html;charset=UTF-8" %>
<div class="tableRegion">
<table border="0"  cellpadding="0"  cellspacing="0">
<tr>
<td><div class="grid">
<table border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse;" id="contractInfoList"><thead>
  <tr>
    <th class="tableHeader" style="border:1px solid #D9E8FB;"  onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="80">部位</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;"  onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="80">测点编码</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="100">测点里程</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="100">爆心距(m)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="100">最大装药量(kg)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="100">振速峰值(cm/s)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="100">地震波频率(hz)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="80">预警原因</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="80">监测日期</th>
  </tr></thead>
  <tbody>
<c:set var="idx" value="0"/>
<c:forEach items="${datas}" var="data">
<tr>
  <td style="border:1px solid #D9E8FB;">${data.partName}</td>
  <td style="border:1px solid #D9E8FB;">${data.point_code}</td>
  <td style="border:1px solid #D9E8FB;">${data.point_distance}</td>
  <td style="border:1px solid #D9E8FB;">${data.curr_value}</td>
  <td style="border:1px solid #D9E8FB;">${data.curr_change}</td>
  <td style="border:1px solid #D9E8FB;">${data.total_change}</td>
  <td style="border:1px solid #D9E8FB;">${data.change_rate}</td>
  <td style="border:1px solid #D9E8FB;">${data.warn_memo}</td>
  <td style="border:1px solid #D9E8FB;">${data.write_date}</td>
</tr>
<c:set var="idx" value="${idx+1}"/>
</c:forEach>
  </tbody>
</table>
</div>
</td>
</tr>
</table>
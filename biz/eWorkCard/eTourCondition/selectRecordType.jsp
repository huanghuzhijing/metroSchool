<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#btn_save").click(function(){
				var patrolRecordType=jQuery("[name='patrolRecordType']").val();
				if(patrolRecordType!=''){
					parent.patrolRecordFill(patrolRecordType,${condition.id});
				}else{
					alert('请选择巡视表类型！');
				
				}
				
			}); 
			$("#btn_close").click(function(){ 
				parent.pageRefresh();
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
		});
		function fillPatrol(patrolId,id){
			parent.patrolRecordFill(patrolId,id);
		}
		function deletePatrol(patrolId,id){
			$.ajax({//ajax判断是新增还是修改页面
					type: "POST",
					url: 'eTourConditionAction.do?method=deletePatrol',
					data: 'id='+id+'&patrolType_id='+patrolId,
					success: function(msg){
						  if(msg=='success'){//编辑
						  alert("删除成功！");
						  		location.href='eTourConditionAction.do?method=selectRecordType&id='+id;  
						  }else{//新增
	     					alert("删除失败");
						  }
					}
				});
		}
	</script>
</head>

<body >
	<html:form enctype="multipart/form-data" action="eTourConditionAction.do" method="POST">
		<input type="hidden" name="method" value="selectRecordType"/>
		<html:hidden property="id" value="${condition.id}"/>
		<fieldset >
		<legend>巡视情况</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
					 
					  <tr>
					    <td> 线路名称：<span class="noRedSpan">*</span></td>
					    <td >
							${condition.lineId.line_name}
						</td>
					  </tr>
					  <tr>
					    <td >工点名称：<span class="noRedSpan">*</span></td>
					    <td >
							${condition.stationId.station_name}
						</td>
					  </tr>
					  <tr>
					    <td >巡视时间：<span class="noRedSpan">*</span></td>
					    <td >
							  <fmt:formatDate value="${condition.tourDate}" pattern="yyyy-MM-dd"/>
						</td>
					  </tr>
					 
					</table>
					</fieldset>
	
<table class="listTable">
	<thead>
	<th>序号</th>
	<th>巡视表类型</th>
	<th>填报状态</th>
	<th>操作</th>
	</thead>
	<c:set var="idx" value="0"/>
	<c:forEach var="vo" items="${eTourConditionVoList}"> 
	<tr>
	<td>${idx+1}</td>
	<td><ex:dicDisplay dictIdentify="PatrolRecordType" dictValue="${vo.patrolType}"/> </td>
	<td><ex:dicDisplay dictIdentify="FillStatus" dictValue="${vo.fillingStatus}"/>  </td>
	<td width="25%" style="text-align: left">
		<div class="listButtonDiv">
		 	<input type="button" value="巡视表填报" onclick="fillPatrol('${vo.patrolType}','${condition.id}')"/>
	   		<c:if test="${vo.fillingStatus==1}">
	   			<input type="button" icon="icon_delete" value="巡视表删除" onclick="deletePatrol('${vo.patrolType}','${condition.id}')"/>
	   		</c:if>
		</div>
	</td>
	</tr>
		<c:if test="${idx+1<5}">
			<c:set var="idx" value="${idx+1}"/>
		</c:if>
	</c:forEach>
	</table>
			<div  class="saveDiv">
				<input id="btn_close" value="${texts['button.close']}" type="button"  icon="icon_close"/>
			</div>

	</html:form>
</body>
</html:html>

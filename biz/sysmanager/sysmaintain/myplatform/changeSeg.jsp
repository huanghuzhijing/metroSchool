<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html lang="en">
<head>
	<script type="text/javascript">
		//
		$(document).ready(function(){
			//
			$("#btn_save").click(function(){
				var selectSegId=$("input[type='radio'][name='selectSegId'][checked]").val();
				top.location.href = "loginsystem.do?method=changPrjLogin&selectSegId="+selectSegId;
			});
			//
		});
	</script>
</head>
<body>
	
		<div  class="saveDiv" >
			<c:forEach items="${prjSegmentInfos}" var="prjSegmentInfo" varStatus="index">
				<input type="radio" name="selectSegId" value="${prjSegmentInfo.id}" <c:if test="${prjSegmentInfo.id==userinfo.segId}">checked</c:if> />${prjSegmentInfo.prjId.prjName}(${prjSegmentInfo.segName})
				&nbsp;&nbsp;
			</c:forEach>
			<input id="btn_save" value="切  换" type="submit" class="button2"/>
		</div>
</body>
</html>





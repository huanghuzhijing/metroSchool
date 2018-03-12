<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
	<script type="text/javascript">
     function showContorl(){
        var operid = $("input[type=radio][name='select_id'][checked]").val();
        var sels = jQuery("[name='select_id']");
        if($("input[type=radio][name='select_id'][checked]").size()!=0){
               $("#btn_approve").show();

        }else{
               $("#btn_approve").hide();
        }
     }
      jQuery(document).ready(function(){
        //按钮控制函数
         showContorl();
        jQuery("[name='select_id']").click(function(){
           showContorl()
        });
        
       //审核
       jQuery("#btn_approve").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		var id = operObj.val();
       		location.href=$(this).attr("url")+"&id="+id;
       });      
     });
	</script>
</head>
<content tag="heading">
待审合同签订流程
</content>
  <body > 
		<div class="listButtonDiv">
			     <input type="button" id="btn_approve"     class="button1 hidden "    url="leaveAction.do?method=approveView&forwardFlag=approveView&designType=${param.designType}"        value="审  核"/>
		</div>
	  <ec:table items="leaves" var="leave" action="leaveAction.do?method=approveView&forwardFlag=approveView"
	 			sortable="false" rowsDisplayed="10"
		imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		locale="zh_CN" retrieveRowsCallback="limit" filterRowsCallback="limit"
		sortRowsCallback="limit">
		    	<ec:row highlightRow="true" 		>
		    	 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
		    	 <ec:column property="null" sortable="false" title="选择">
		    	 	 <input type="radio" name="select_id"   value="${leave.id}" />
		    	 </ec:column>
				<ec:column property="leaver.empname" title="请假人"/>
	    	  	<ec:column property="leaveDate" cell="date" width="10%" title="请假日期" />
	    	  	<ec:column property="leaveDays" calcTitle="leaveDyas" title="请假天数"/>
				<ec:column property="transState" calcTitle="transState" title="审核状态" width="8%">
					<ex:workFlowState  auditstatus="${leave.auditStatus}"  transState="${leave.transState}"/>
				</ec:column>
		</ec:row>
   	</ec:table>
			
  </body>
</html:html>

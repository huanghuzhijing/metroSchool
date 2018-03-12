<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title></title>
  <content tag="heading">
	选择办理步骤
	</content>  
	<script type="text/javascript">
	function initSelect(){
		var select_id ='${select_id}';
	   if(select_id!=''){
	  	 $("input[type=radio][name='select_id'][value='"+select_id+"']").attr("checked","checked");
	   }
	}
	function checkform(objectid,turnflag,oscurrentstepid,wfentryid)
	{
		var operObj = $("input[type=radio][name='select_id'][checked]");
		var url = turnflag.substring(0,1).toLowerCase()+turnflag.substring(1,turnflag.length)+"Action.do?method=confirmselect";
		var url2 = url+'&objectid='+objectid+'&selectdControlId='+operObj.val()+'&turnflag='+turnflag+'&peopleids='+$("#peopleids").val()+"&wfentryid="+wfentryid+"&controlId=${param.controlId}";
		if(typeof(operObj.val())=='undefined'){
			alert("请选择办理步骤");
		}else{
			if($("#peopleids").val()!=''){
			//alert(url2);
				document.forms[0].action=url2;
				document.forms[0].submit();
				return true;
			}else{
				alert("还未选择办理人！");
				return false;
			}
		}
		
	}
	function selectPasons(controlId){
	    
		var operObj = $("input[type=radio][name='select_id'][checked]");
		if(typeof(operObj.val())=='undefined'){
			alert("请选择办理步骤");
		}else if(operObj.val()!=controlId){
			alert("请点击对应的办理步骤下的办理对象按钮");
		}else{
			$('#peopleids').val("");
			$('#peopleidNames').val("");
		  var url = "${ctx}/oscurrentstepAction.do?method=workFlowPersons&controlId="+controlId;
		  art.dialog({id:'commonDialog1',title:'办理人信息', iframe:url, width:'750', height:'450',top:'0'});
		}
	}
	</script>
	</head>
	
	<body onload="initSelect()">
	<form action="oscurrentstepAction.do?method=upreport" method="post">
	<input id="peopleids" name="peopleids" type="hidden"  />
	<input id="opinion" name="opinion" type="hidden" value="${opinion}" />
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
			<ec:table sortable="false" showPagination="false" items="osstepcontrolList" var="osstepcontrol">
		    	<ec:row>
				 	<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="10%"/>
					<ec:column property="null" sortable="false" title="选择" width="6%">
						<input type="radio" name="select_id" value="${osstepcontrol.id}"  />
					</ec:column>
				     <ec:column property="xml_text" title="步骤名称" width="10%"/>
				     <ec:column property="null" sortable="false" title="操作" width="6%">
						<input id="${osstepcontrol.id}" type="button" value="办理对象" onclick="selectPasons('${osstepcontrol.id}')" class="button1"  />
					</ec:column>
				</ec:row>
		    </ec:table>
			</td>
		</tr>
	</table>
		</form>
<fieldset>
			<legend>
				办理人信息
			</legend>
			<table class="formTable">
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					</COLGROUP>
				<tr>
					<td>
						办&nbsp;&nbsp;理&nbsp;&nbsp;人：<span class="noRedSpan">*</span>
					</td>
					<td >
					<textarea rows="" cols="" id="peopleidNames" name="peopleidNames" readonly="readonly"></textarea>
					</td>
				</tr>
	</table>
	</fieldset>

<div align="center">
				<input type="button" value="确  定" onclick="checkform('${param.objectid}','${param.turnflag}','${param.oscurrentstepid}','${param.wfentryid}');" class="button1" />
				<input type="button" value="返  回" onclick="history.back(-1);" class="button1" />
	 	 </div>
	</body>
</html>

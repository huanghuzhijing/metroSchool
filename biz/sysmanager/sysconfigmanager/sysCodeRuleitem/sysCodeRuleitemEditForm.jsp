<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		var ruletype='${sysCodeRuleitem.ruletype}' ;
		//加载
		$(document).ready(function(){
			if(ruletype==1){
				$("#tr00 td").eq(1).show();
				$("#tr00 td").eq(2).hide();
				$("#tr00 td").eq(3).hide();
			}else if(ruletype==2){
				$("#tr00 td").eq(1).hide();
				$("#tr00 td").eq(2).show();
				$("#tr00 td").eq(3).hide();
			}else if(ruletype==3){
				$("#tr00 td").eq(1).hide();
				$("#tr00 td").eq(2).hide();
				$("#tr00 td").eq(3).show();
			}
			//
			$("#btn_save").click(function(){
				setRuleall();
				$("#btn_save").addClass("z-btn-dsb");
			 	$("#btn_save").attr("disabled","disabled");
				document.forms[0].submit();
			}); 
			//
			$("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
		});
		//显示设定规则示例
		function setRuleall(){
			var ruleall="";
			if(ruletype==2){
				ruleall+=typeTwo(1);
			}else if(ruletype==3){
				ruleall+=typeThree(1);
			}
			return false;
		}
		//第一种情况
		function typeOne(trCount){
			$("#rulecontent_"+trCount).val($("input[name='ruleInput_"+trCount+"']").val());
			return $("input[name='ruleInput_"+trCount+"']").val();
		}
		//第二种情况
		function typeTwo(trCount){
			var date="";
			var rulecontent_2="";
			if($("input[name='year_"+trCount+"']").attr("checked")==true){
				if(date==""){
					date='${year}';
				}else{
					date+=$("input[name='separator_"+trCount+"']").val()+'${year}';
				}
				rulecontent_2="yyyy";
			}
			if($("input[name='month_"+trCount+"']").attr("checked")==true){
				if(date==""){
					date='${month}';
				}else{
					date+=$("input[name='separator_"+trCount+"']").val()+'${month}';
				}
				
				if(rulecontent_2==""){
					rulecontent_2="MM";
				}else{
					rulecontent_2+=$("input[name='separator_"+trCount+"']").val()+"MM";
				}
			}
			if($("input[name='day_"+trCount+"']").attr("checked")==true){
				if(date==""){
					date='${day}';
				}else{
					date+=$("input[name='separator_"+trCount+"']").val()+'${day}';
				}
				
				if(rulecontent_2==""){
					rulecontent_2="dd";
				}else{
					rulecontent_2+=$("input[name='separator_"+trCount+"']").val()+"dd";
				}
			}
			if($("input[name='hour_"+trCount+"']").attr("checked")==true){
				if(date==""){
					date='${hour}';
				}else{
					date+=' '+'${hour}';
				}
				
				rulecontent_2+=" "+"HH";
			}
			if($("input[name='minute_"+trCount+"']").attr("checked")==true){
				if(date==""){
					date='${minute}';
				}else{
					date+=$("input[name='separator_"+trCount+"']").val()+'${minute}';
				}
				
				if(rulecontent_2==""){
					rulecontent_2="mm";
				}else{
					rulecontent_2+=":"+"mm";
				}
			}
			if($("input[name='second_"+trCount+"']").attr("checked")==true){
				if(date==""){
					date='${second}';
				}else{
					date+=$("input[name='separator_"+trCount+"']").val()+'${second}';
				}
				
				if(rulecontent_2==""){
					rulecontent_2="ss";
				}else{
					rulecontent_2+=":"+"ss";
				}
			}
			rulecontent_2=$("input[name='separator_"+trCount+"']").val()+","+rulecontent_2;
			$("input[name='rulecontent']").val(rulecontent_2);
			return date;
		}
		//第三种情况
		function typeThree(trCount){
			var beginNum=$("input[name='beginNum_"+trCount+"']").val();
			var numCount=$("input[name='numCount_"+trCount+"']").val();
			var temNum=1;
			if(beginNum!=""&&numCount!=""){
				for(var i=0;i<numCount;i++){
					temNum=10*temNum;
				}
				temNum=parseInt(temNum)+parseInt(beginNum);
				temNum+="";
				temNum=temNum.substring(1,temNum.length);
			}
			$("input[name='rulecontent']").val(beginNum+","+numCount);
			return temNum;
		}
		
	</script>
</head>
<body >
	<html:form enctype="multipart/form-data" action="sysCodeRuleitemAction.do" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id" />
		<fieldset >
		<legend>编码规则项-编辑</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne"  />
						</COLGROUP>
						<c:set var="trCount" value="1" ></c:set>
					  <tr>
					    <td >规则类型：<span class="noRedSpan">*</span></td>
					    <td >
					    	<ex:dicDisplay dictIdentify="RuleType" dictValue="${sysCodeRuleitem.ruletype}"/>
						</td>
					  </tr>	
					  <tr id="tr00">
					    <td >规则样式：<span class="redSpan">*</span></td>
					    <td >
					    	<html:text property="rulecontent" styleClass="inputText" maxlength="100" size="28"/>
						</td>
					  	<td>
					    	日期分隔符：<input name="separator_${trCount}"  value="${separator_1}" type="text" class="inputText ruleall" maxlength="50" size="14" onblur="setRuleall();"/> 
		  						<br/>
		  						<input name="year_${trCount}" type="checkbox"   class="ruleall" onblur="setRuleall();"
		  							<c:if test="${fn:contains(sysCodeRuleitem.rulecontent,'yyyy')==true}">checked="checked"</c:if>
		  						/>年 
		  						<input name="month_${trCount}" type="checkbox"   class="ruleall" onblur="setRuleall();"
		  							<c:if test="${fn:contains(sysCodeRuleitem.rulecontent,'MM')==true}">checked="checked"</c:if>
		  						/>月 
		  						<input name="day_${trCount}" type="checkbox"  class="ruleall" onblur="setRuleall();"
		  							<c:if test="${fn:contains(sysCodeRuleitem.rulecontent,'dd')==true}">checked="checked"</c:if>
		  						/>日 
		  						<input name="hour_${trCount}" type="checkbox" class="ruleall" onblur="setRuleall();"
		  							<c:if test="${fn:contains(sysCodeRuleitem.rulecontent,'HH')==true}">checked="checked"</c:if>
		  						/>时 
		  						<input name="minute_${trCount}" type="checkbox" class="ruleall" onblur="setRuleall();"
		  							<c:if test="${fn:contains(sysCodeRuleitem.rulecontent,'mm')==true}">checked="checked"</c:if>
		  						/>分 
		  						<input name="second_${trCount}" type="checkbox" class="ruleall" onblur="setRuleall();"
		  							<c:if test="${fn:contains(sysCodeRuleitem.rulecontent,'ss')==true}">checked="checked"</c:if>
		  						/>秒
					    </td>
					    <td>
					    	起始流水号：<input name="beginNum_${trCount}" value="${beginNum_1}" type="text" class="inputText" maxlength="50" size="14" onblur="setRuleall();"/> 
					    	<br/>
					    	位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：<input name="numCount_${trCount}" value="${numCount_1 }" type="text" class="inputText"  maxlength="50" size="14" onblur="setRuleall();"/>
					    </td>
					  </tr>
					  <tr>
						 <td >排序值：<span class="noRedSpan">*</span></td>
					    <td >
							<html:text property="orderno" styleClass="inputText" maxlength="100" size="28"/>
						</td>
					  </tr>
					</table>
   </fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>

			<div  class="saveDiv">
				<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
				<input id="btn_close" value="${texts['button.close']}" type="button"  icon="icon_close"/>
			</div>

	</html:form>
</body>
</html:html>

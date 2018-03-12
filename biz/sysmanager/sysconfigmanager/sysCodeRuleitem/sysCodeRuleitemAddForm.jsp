<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		//变量
		var count=1;
		//加载
		$(document).ready(function(){
			//
			$("#tr1 td").eq(3).hide();
			$("#tr1 td").eq(4).hide();
			contrlDeleteBtn();
			//
			$("#btn_save").click(function(){
				setRuleall();
				var errors = "";
				var focus= "";
				//规则样式
				var rulecontent = $("input[name='rulecontent']").val();
				if(rulecontent == ""){
					errors += "规则样式 为必填项!\n";
				  	focus += "rulecontent,";
				}
				//排序值
				var orderno = $("input[name='orderno']").val();
				if(orderno == ""){
					errors += "排序值 为必填项!\n";
				  	focus += "orderno,";
				}
				if(errors != ""){
					alert(errors);
					var focusStr = focus.substring(0,focus.indexOf(","));
					$("input[name='"+focusStr+"']").focus();
					return false;
				}
				$("input[name='trCount']").val(count);
				 $("#btn_save").addClass("z-btn-dsb");
				$("#btn_save").attr("disabled","disabled"); 
				document.forms[0].submit();
			});
			//
			$("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
			$("#btn_add").click(function(){
				if(count!=9){
					count++;
					$("#tr"+count).show();
					typeChange(1,count);
					contrlDeleteBtn();
					setRuleall();
				}else{
					alert("最多可以增加9行！");
				}
			});
			//
		});
		//显示设定规则示例
		function setRuleall(){
			var ruleall="";
			for(var i=1;i<=count;i++){
				if($("select[name='ruletype_"+i+"']").val()==1){
					ruleall+=typeOne(i);
				}else if($("select[name='ruletype_"+i+"']").val()==2){
					ruleall+=typeTwo(i);
				}else if($("select[name='ruletype_"+i+"']").val()==3){
					ruleall+=typeThree(i);
				}
			}
			$("#ruleall").val(ruleall);
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
					rulecontent_2+="-"+"MM";
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
					rulecontent_2+="-"+"dd";
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
					date+=':'+'${minute}';
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
					date+=':'+'${second}';
				}
				
				if(rulecontent_2==""){
					rulecontent_2="ss";
				}else{
					rulecontent_2+=":"+"ss";
				}
			}
			rulecontent_2=$("input[name='separator_"+trCount+"']").val()+","+rulecontent_2;
			$("#rulecontent_"+trCount).val(rulecontent_2);
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
			$("#rulecontent_"+trCount).val(beginNum+","+numCount);
			return temNum;
		}
		//下拉框改变事件
		function typeChange(type,trCount){
			if(type==1){
				$("#tr"+trCount+" td").eq(2).show();
				$("#tr"+trCount+" td").eq(3).hide();
				$("#tr"+trCount+" td").eq(4).hide();
			}else if(type==2){
				$("#tr"+trCount+" td").eq(2).hide();
				$("#tr"+trCount+" td").eq(3).show();
				$("#tr"+trCount+" td").eq(4).hide();
			}else if(type==3){
				$("#tr"+trCount+" td").eq(2).hide();
				$("#tr"+trCount+" td").eq(3).hide();
				$("#tr"+trCount+" td").eq(4).show();
			}
		}
		//删除按钮控制
		function contrlDeleteBtn(){
			$(".btn_delete").hide();
			$(".btn_delete").eq(count-1).show();
		}
		//删除
		function onDelete(trCount){
			$("select[name='ruletype_"+trCount+"']").val("1");
			$("#rulecontent_"+trCount).val("");
			$("input[name='ruleInput_"+trCount+"']").val("");
			$("input[name='separator_"+trCount+"']").val("/");
			$("input[name='year_"+trCount+"']").attr("checked","checked");
			$("input[name='month_"+trCount+"']").attr("checked","checked");
			$("input[name='day_"+trCount+"']").attr("checked","");
			$("input[name='hour_"+trCount+"']").attr("checked","");
			$("input[name='minute_"+trCount+"']").attr("checked","");
			$("input[name='second_"+trCount+"']").attr("checked","");
			$("input[name='beginNum_"+trCount+"']").val("1");
			$("input[name='numCount_"+trCount+"']").val("4");
			$("#tr"+trCount).hide();
			count--;
			setRuleall();
			contrlDeleteBtn();
		}
	</script>
	<style type="text/css">
	.rulecontent{
		text-align: left;
	}
	</style>
</head>
<body >
	<html:form enctype="multipart/form-data" action="sysCodeRuleitemAction.do" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id" />
		<html:hidden property="ruleid" value="${param.staticRuleid}"/>
		<fieldset >
			<legend>编码规则项-新增</legend>
			<table id="currentTable" class="formTable" >
				 <COLGROUP>
						<COL class="tdLeftOne" />
						<COL class="tdRightOne"  />
					</COLGROUP>
				<c:set var="trCount" value="0"/>
				<html:hidden property="trCount" />
			    <c:set var="trCount" value="${trCount+1}"/>
			     <tr>
				    <td >规则类型：<span class="redSpan">*</span></td>
				    <td >
				    	<ex:dictSelect property="ruletype_${trCount}" showSelect="false" type="RuleType" onchange="typeChange(this.value,'${trCount}');"/> 
			   		 	<input id="rulecontent_${trCount}" name="rulecontent" type="hidden"/>
					</td>
				  </tr>	
			   <tr id="tr1"> 
			   	<td style="display: none;"></td>
			   	<td >规则样式：<span class="redSpan">*</span></td>
			    <td style="text-align: left;">
			    	<input name="ruleInput_${trCount}" type="text" class="inputText" maxlength="50" size="30" onblur="setRuleall();"/>
			    </td>
			  	<td>
			    	日期分隔符：<input name="separator_${trCount}"  value="/" type="text" class="inputText ruleall" maxlength="50" size="14" onblur="setRuleall();"/> 
  						<br/>
  						<input name="year_${trCount}" type="checkbox"  checked="checked" class="ruleall" onblur="setRuleall();" />年 
  						<input name="month_${trCount}" type="checkbox"  checked="checked" class="ruleall" onblur="setRuleall();" />月 
  						<input name="day_${trCount}" type="checkbox"  class="ruleall" onblur="setRuleall();" />日 
  						<input name="hour_${trCount}" type="checkbox" class="ruleall" onblur="setRuleall();" />时 
  						<input name="minute_${trCount}" type="checkbox" class="ruleall" onblur="setRuleall();" />分 
  						<input name="second_${trCount}" type="checkbox" class="ruleall" onblur="setRuleall();" />秒
			    </td>
			    <td>
			    	起始流水号：<input name="beginNum_${trCount}" value="1" type="text" class="inputText" maxlength="50" size="14" onblur="setRuleall();"/> 
			    	<br/>
			    	位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：<input name="numCount_${trCount}" value="4" type="text" class="inputText"  maxlength="50" size="14" onblur="setRuleall();"/>
			    </td>
			  </tr>
			  <tr>
				 <td >排&nbsp;&nbsp;序&nbsp;&nbsp;值：<span class="redSpan">*</span></td>
			    <td >
					<html:text property="orderno" value="99" styleClass="inputText" maxlength="100" size="28"/>
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

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
	var static_id="";
	var oper_id="";
	//页面加载
	$(document).ready(function(){
		 initCont();
		 initReceives();
		var cmdIds='${userinfo.cmdIds}';
		$("#btn_view").hide();
		//控制按钮
		var ec_id='${param.ec_id}';
		var ec_auditStatus='${param.ec_auditStatus}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			ec_auditStatus='${ec_auditStatus}';
		}
		pullValue(ec_id,ec_auditStatus);
		//
		$("#btn_view").click(function(){ 
			showView(oper_id);
		});
	});
	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
		
	}
	//指令码判断
	function checkCmd(){
		var cmdIds='${userinfo.cmdIds}';
	}
	//详细页面
	function showView(id){
    	var url ='oaInformSMSAction.do?method=view'+'&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&staticOaInformCoteId=${param.staticOaInformCoteId}'+'&viewFlag=true'+'&ec_crd='+$("[name='ec_rd']").val(); 
		commonUrl(url);
  	}
  	function initCont() {
		$.each($(".sms_content"),function(index,item){
			var obj = $(item);
			obj.attr("title",obj.html());
			if(obj.html().lengthCheck()>30){
				obj.html(substr(obj.html(),30)+'...');
			}
		});
	}
	function initReceives() {
		$.each($(".sms_receives"),function(index,item){
			var obj = $(item);
			obj.attr("title",obj.html());
			if(obj.html().lengthCheck()>30){
				obj.html(substr(obj.html(),30)+'...');
			}
		});
	}
</script>
</head>
<content tag="heading">
短信信息
</content>  
<body > 
	<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
       <tr>
         <td valign="top">
	          <table class="queryTable" >
					<tr>
						<td class="queryTitle">
							<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td>
							<html:form action="oaInformSMSAction.do?method=list&ec_crd=${param.ec_crd}">
								<table class="queryContentTable">
									<tr>
										<td class="tdRight">
											发送人：
										</td>
										<td>
											<html:text property="qname" styleClass="inputText" maxlength="100"></html:text>
										</td>
										<td class="tdRight">
											接收人员：
										</td>
										<td>
											<html:text property="qreceives" styleClass="inputText" maxlength="100"></html:text>
										</td>
										<td class="tdRight">
											发送内容：
										</td>
										<td>
											<html:text property="qcontent" styleClass="inputText" maxlength="100"></html:text>
										</td>
									
											</tr>
										<tr>
											<td class="tdRight" >
											来源：
										</td>
									
										<td>
											<html:text property="qsource" styleClass="inputText" maxlength="100"></html:text>
										</td>
										<td class="tdRight">
											发送时间：
										</td>
											<td >
										     <html:text property="qbeginDate"   styleClass="inputText"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/>
											</td >
											<td align="center">到
											</td >
											<td >
											<html:text property="qendDate"  styleClass="inputText"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/>
											</td>
										<td >
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<input type="submit" value="${texts['button.query']}" icon="icon_query" />
										</td>
									</tr>
								</table>
							</html:form>
						</td>
					</tr>
				</table>
				<div  class="listButtonDiv">
					<input id="btn_view" value="${texts['button.detail']}" type="button" icon="icon_view"/>
				</div>
				<ec:table items="oaInformSMSs" var="oaInformSMS" 
					action="oaInformSMSAction.do" title=""  locale="zh_CN"
					sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
					retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
				>
					<ec:row highlightRow="true" ondblclick="showView('${oaInformSMS.id}');"
							onclick="pullValue('${oaInformSMS.id}','${oaInformSMS.auditStatus}');"
					>
						<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
						<ec:column property="null" sortable="false" title="选择" >
							<input name="select_id" value="${oaInformSMS.id}" type="radio"/>
						</ec:column>
						<ec:column property="source"  title="来源" />
						<ec:column property="recorder.employeeid.empname" title="发送人" >
						</ec:column>
						<ec:column property="recordDate" title="发送日期" >
							<fmt:formatDate value="${oaInformSMS.recordDate}" pattern="yyyy-MM-dd HH:mm"/>
						</ec:column>
						<ec:column property="receives" title="接收人员" calcTitle="receives" styleClass="sms_receives" >
						</ec:column>
						<ec:column property="content" title="发送内容" 	calcTitle="context" styleClass="sms_content" >
						</ec:column>
						<ec:column property="auditStatus" title="短信平台</br>发送状态" 	 >
							<ex:dicDisplay dictIdentify="SMS_STATE" dictValue="${oaInformSMS.auditStatus}"/>
						</ec:column>
					</ec:row>
				</ec:table> 
			</td>
		</tr>
	</table>
  </body>
</html:html>

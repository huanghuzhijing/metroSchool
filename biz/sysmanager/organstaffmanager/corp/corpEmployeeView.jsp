<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript">
	//加载
	$(document).ready(function(){
		$("#btn_back").click(function(){
		    document.forms[0].submit();
		}) 
	}); 
</script>
</head>
<content tag="heading">
参建单位员工
</content>
<body>
	<html:form enctype="multipart/form-data" action="corpEmployeeAction.do?method=viewBack&id=${param.corpid}&pageIndex=${param.pageIndex}&static_corptype=${param.static_corptype}" method="POST">
		<!--查询定位 开始-->
		<html:hidden property="id"/>
		<input name="pageIndex" value="${param.pageIndex}" type="hidden" />
		<html:hidden property="corpid" value="${corpid}"/>
		<html:hidden property="qcorpname"/>
		<html:hidden property="qempname"/>
		<input name="static_corptype" value="${static_corptype}" type="hidden" />
		<!--查询定位 结束-->
	</html:form>

<fieldset >
		<legend>参建单位员工-详细信息</legend>

         <table class="titleTable">
         	<COLGROUP>
	           	<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
				<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
	          </COLGROUP>
          <tr>
             <td>人员编号：<span class="noRedSpan">*</span></td>
             <td>${employee.empcode}&nbsp;</td>
             <td>姓名：<span class="noRedSpan">*</span></td>
             <td>${employee.empname}&nbsp;</td>
           </tr>
           <tr>
           	<td>
           		所属单位：<span class="noRedSpan">*</span>
           	</td>
           	<td colspan="3">
           		${corp.corpname}&nbsp;
           	</td>
           </tr>
           <tr>
             <td>性别：<span class="noRedSpan">*</span></td>
             <td><c:if test="${employee.sex==0}">男</c:if><c:if test="${employee.sex==1}">女</c:if>&nbsp;</td>
             <td>职务：<span class="noRedSpan">*</span></td>
             <td>${employee.empduty}&nbsp;</td>
           </tr>
           <tr>
             <td>电话：<span class="noRedSpan">*</span></td>
             <td>${employee.tel}&nbsp;</td>
             <td>手机：<span class="noRedSpan">*</span></td>
             <td>${employee.phone}&nbsp;</td>
           </tr>
           <tr>
             <td>QQ：<span class="noRedSpan">*</span></td>
             <td>${employee.qq}&nbsp;</td>
             <td>MSN：<span class="noRedSpan">*</span></td>
             <td>${employee.msn}&nbsp;</td>
           </tr>
           <tr>
             <td>出生年月：<span class="noRedSpan">*</span></td>
             <td><fmt:formatDate value="${employee.birthday}" pattern="yyyy-MM-dd"/>&nbsp;</td>
             <td>电子邮件：<span class="noRedSpan">*</span></td>
             <td>${employee.email}&nbsp;</td>
           </tr>
           <tr>
             <td>备注：<span class="noRedSpan">*</span></td>
             <td colspan="3">${employee.remark}&nbsp;</td>
           </tr>
           <c:if test="${sign_byte!=null}">
				<tr>
					<td>电子签名图片：<span class="noRedSpan">*</span></td>
					<td colspan="3">
						<img class="img_workFlowImage" src="personalInfoAction.do?method=image&id=${employee.id}">
					</td>
				</tr>
			</c:if>
           <tr>
             <td>登记人：<span class="noRedSpan">*</span></td>
             <td><ex:userName id="${employee.recorder}"/>&nbsp;</td>
             <td>登记日期：<span class="noRedSpan">*</span></td>
             <td><fmt:formatDate value="${employee.recorddate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
           </tr>
           <tr>
            
             <td>修改人：<span class="noRedSpan">*</span></td>
             <td><ex:userName id="${employee.updateman}"/>&nbsp;</td>
             <td>修改日期：<span class="noRedSpan">*</span></td>
             <td colspan="3"><fmt:formatDate value="${employee.updatedate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
           </tr>
         </table>
	</fieldset>
		<div class="saveDiv">
			<input id="btn_back" value="${texts['button.back']}" type="button" class="button1" icon="icon_back"/>
		</div>
  </body>
</html>



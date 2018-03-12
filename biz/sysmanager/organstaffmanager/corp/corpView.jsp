<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>

<script type="text/javascript">
	jQuery(document).ready(function(){
		//返回
       jQuery("#btn_back").click(function(){
       		history.back(-1);
       });
	 });
</script>
</head>
<content tag="heading">
参建单位-详细信息
</content>
<body>
<fieldset >
		<legend>详细信息</legend>

         <table class="titleTable">
	         <COLGROUP>
	           	<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
				<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
	          </COLGROUP>
          <tr>
             <td>参建单位编号：<span class="noRedSpan">*</span></td>
             <td>${corp.corpcode}&nbsp;</td>
             <td>参建单位名称：<span class="noRedSpan">*</span></td>
             <td>${corp.corpname}&nbsp;</td>
           </tr>
           <tr>
           	<td>
           		排序：<span class="noRedSpan">*</span>
           	</td>
           	<td>
           		${corp.orderno}&nbsp;
           	</td>
           	<td>
           		单位类型：<span class="noRedSpan">*</span>
           	</td>
           	<td>
           		${ctname}&nbsp;
           	</td>
           </tr>
           <tr>
             <td>组织机构代码：<span class="noRedSpan">*</span></td>
             <td>${corp.organcode}&nbsp;</td>
             <td>法人：<span class="noRedSpan">*</span></td>
             <td>${corp.chargeperson}&nbsp;</td>
           </tr>
           <tr>
             <td>地址：<span class="noRedSpan">*</span></td>
             <td>${corp.address}&nbsp;</td>
             <td>邮编：<span class="noRedSpan">*</span></td>
             <td>${corp.postcode}&nbsp;</td>
           </tr>
           <tr>
             <td>电话：<span class="noRedSpan">*</span></td>
             <td>${corp.tel}&nbsp;</td>
             <td>传真：<span class="noRedSpan">*</span></td>
             <td>${corp.fax}&nbsp;</td>
           </tr>
           
           <c:if test="${corp.corptype=='SG'}">
			<tr>
				<td>
					公司资质等级和资质证书编号：<span class="noRedSpan">*</span>
				</td>
				<td>
					${corp.corpLevel}&nbsp;
				</td>
				<td>
					公司安全生产许可证编号：<span class="noRedSpan">*</span>
				</td>
				<td>
					${corp.corpLicence}&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					项目经理：<span class="noRedSpan">*</span>
				</td>
				<td>
					${corp.corpPrjMan}&nbsp;
				</td>
				<td>
					安&nbsp;&nbsp;全&nbsp;&nbsp;员：<span class="noRedSpan">*</span>
				</td>
				<td>
					${corp.corpSafeMan}&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					施&nbsp;&nbsp;工&nbsp;&nbsp;员：<span class="noRedSpan">*</span>
				</td>
				<td>
					${corp.corpConstructMan}&nbsp;
				</td>
				<td>
					资&nbsp;&nbsp;料&nbsp;&nbsp;员：<span class="noRedSpan">*</span>
				</td>
				<td>
					${corp.corpMaterialMan}&nbsp;
				</td>
			</tr>
			</c:if>
			
			
			<c:if test="${corp.corptype=='JL'}">
			<tr>
				<td>
					资质等级和资质证书编号：<span class="noRedSpan">*</span>
				</td>
				<td>
					${corp.corpLevel}&nbsp;
				</td>
				<td>
					总监理工程师：<span class="noRedSpan">*</span>
				</td>
				<td>
					${corp.superHeadMan}&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					现场监理：<span class="noRedSpan">*</span>
				</td>
				<td colspan="3">
					${corp.corpSceneMan}&nbsp;
				</td>
			</tr>
			</c:if>
           
           
           <tr>
             <td>备注：<span class="noRedSpan">*</span></td>
             <td colspan="3">${corp.remark}&nbsp;</td>
           </tr>
           <tr>
             <td>登记人：<span class="noRedSpan">*</span></td>
             <td><ex:userName id="${corp.recorder}"/>&nbsp;</td>
             <td>登记日期：<span class="noRedSpan">*</span></td>
             <td><fmt:formatDate value="${corp.recorddate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
           </tr>
           <tr>
           	 <td>修改人：<span class="noRedSpan">*</span></td>
             <td><ex:empName id="${corp.updateman}"/>&nbsp;</td>
             <td>修改日期：<span class="noRedSpan">*</span></td>
             <td><fmt:formatDate value="${corp.updatedate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
           </tr>
         </table>
         </fieldset>
		<div class="saveDiv">
			<input type="button" icon="icon_back" id="btn_back" value="<fmt:message key="button.back"/>"  />
		</div>
  </body>
</html>



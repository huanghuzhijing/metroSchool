<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<script type="text/javascript">
	//加载	
   $(document).ready(function(){
   		//
	  	if('${flag}'==1){
	  		window.open('${ctx}/personalInfoAction.do?method=list&flag=1','_blank','fullscreen=1');opener=null;window.close();
	  	}
	  	//
	    $("#btn_save").click(function(){
		      sub();
		})
		$("#btn_fileClear").click(function(){ 
			 var content='<img src="${ctx}/styles/img/peo.png" class="people_img" />';
			 var path='<input id="photoAddr_"  type="file"  name="photoAddr_" />';
			  $("#fileContent").html("");
			  $("#fileContent").html(content);
			  $("#filePath").html("");
			  $("#filePath").html(path);
			  $("#photoAddrPath").val("");
	    });
	}); 
	//
	function sub(){
	   $("#employeeForm").submit();
	}
</script>
	    <html:form action="personalInfoAction.do" styleId="employeeForm" method="POST" 
				   styleClass="form" enctype="multipart/form-data">
		<input type="hidden" name="method" value="saveList"/>
		<html:hidden property="id" value="${employee.id}"/>
		<html:hidden property="flag" value="${param.flag}"/>
<br/>
	<!------test ------->
	<table  class="table_borwse" align="center">
<colgroup>
		<col width="15%" />
    <col width="35%" />
    <col width="15%" />
    <col width="35%" />
</colgroup>
 <tr>
 	<th colspan="4">基本信息</th>
 </tr>
  <tr>
    <td class="tr_title_edit">工  号：</td>
    <td class="tr_content_edit" >
		<input type="text" id="empcode" name="empcode" value="${employee.empcode}" readonly="readonly" class="showText" />
    </td>
    <td rowspan="4" align="center" id="fileContent" >
   		  <div id="fileContent">
   		 <c:choose>
   		 <c:when test="${employee.photoAddr==null}">
   		 <img src="${ctx}/styles/img/peo.png" class="people_img" />
   		 </c:when>
   		 <c:otherwise>
   		 <img src="${ctx}${employee.photoAddr}" class="people_img" />
   		 </c:otherwise>
   		 </c:choose>
    		
    	 </div>
    </td>
    <td   rowspan="4" class="tr_content_edit" >
   		 <div id="filePath">
   			 <input id="photoAddr_"  type="file"  name="photoAddr_" />
   			  <input id="photoAddrPath"  type="hidden"  name="photoAddrPath"  value="${employee.photoAddr}"/>
   		 </div>
        <br/><br/>
            <input type="button" id="btn_fileClear" value="清空照片" icon="icon_delete"/></td>
  </tr>
  <tr>
    <td  class="tr_title_edit">姓  名：</td>
    <td class="tr_content_edit">
      <input type="text" id="empname" name="empname" value="${employee.empname}" readonly="readonly" class="showText" />
    </td>
    </tr>
  <tr>
    <td  class="tr_title_edit">所属组织：</td>
    <td class="tr_content_edit">
  <input type="text" id="organname" name="organname" value="${organname}" readonly="readonly" class="showText" />
    </td>
    </tr>
  <tr>
    <td  class="tr_title_edit">职  务：</td>
    <td class="tr_content_edit">
     <input type="text" id="empduty" name="empduty" value="${employee.empduty}" readonly="readonly" class="showText" />
    </td>
    </tr>
  <tr>
    <td  class="tr_title_edit">性  别：</td>
    <td class="tr_content_edit">
			<input type="radio" name="sex" value="0" <c:if test='${employee.sex==0}'>checked</c:if>/>男
					<input type="radio" name="sex" value="1" <c:if test='${employee.sex==1}'>checked</c:if>/>女
    </td>
    <td class="tr_title_edit">出生年月：</td>
    <td class="tr_content_edit">
	<input type="text"  id="birthday" name="birthday" class="inputText" value='<fmt:formatDate value="${employee.birthday}" pattern="yyyy-MM-dd"/>' onfocus="WdatePicker()"/>    
    </td>
  </tr>
  	<tr>
    	<td class="tr_title_edit">身份证号：</td>
		<td  class="tr_content_edit">
			 <input type="text" id="idCardNo" name="idCardNo" value="${employee.idCardNo}" class="inputText" />
        </td>
      <td class="tr_title_edit">学  历：</td>
	  <td  class="tr_content_edit">
<ex:dictSelect property="education" showSelect="false" type="Education"/>
        </td>
    </tr>
  <tr>
    <td  class="tr_title_edit">政治面貌：</td>
    <td class="tr_content_edit">
		<input type="text" id="politicalStatus" name="politicalStatus" value="${employee.politicalStatus}" class="inputText" />
    </td>
    <td class="tr_title_edit">用工性质：</td>
    <td class="tr_content_edit">
 <ex:dictSelect property="usedProperty" showSelect="false" type="UsedProperty"/>
    </td>
  </tr>
</table>

<table  class="table_borwse"  align="center">
<colgroup>
		<col width="15%" />
    <col width="35%" />
    <col width="15%" />
    <col width="35%" />
</colgroup>
 <tr>
 	<th colspan="4">联系方式</th>
 </tr>
	<tr>
    	<td class="tr_title_edit">办公电话：</td>
<td  class="tr_content_edit" >
			<input type="text" id="tel" name="tel" value="${employee.tel}" class="inputText" />
        </td>
      <td class="tr_title_edit" >手  机：</td>
		<td  class="tr_content_edit" >
        		<input type="text" id="phone" name="phone" value="${employee.phone}" class="inputText" />
        </td>
    </tr>
    <tr>
    	<td class="tr_title_edit">QQ：</td>
      <td  class="tr_content_edit">
        		<input type="text" id="qq" name="qq" value="${employee.qq}" class="inputText" />
      </td>
        <td class="tr_title_edit">电子邮箱：</td>
      <td  class="tr_content_edit">
        <html:text maxlength="20" property="email" styleClass="inputText"  value="${employee.email}"/>
      </td>
    </tr>
</table>

<table  class="table_borwse"  align="center">
<colgroup>
	<col width="15%" />
    <col width="35%" />
    <col width="15%" />
    <col width="35%" />
</colgroup>
 <tr>
 	<th colspan="4">其他信息</th>
 </tr>
	<tr>
    	<td class="tr_title_edit">专业职称：</td>
      <td  class="tr_content_edit" >
        		<input type="text" id="positionalTitle" name="positionalTitle" value="${employee.positionalTitle}" class="inputText" />
      </td>
		  	<td class="tr_title_edit">工作岗位：</td>
      <td class="tr_content_edit">
        	<input type="text" id="jobPost" name="jobPost" value="${employee.jobPost}" class="inputText" />
      </td>
    </tr>
    <tr>
    	<td class="tr_title_edit">参加工作时间：</td>
      <td  class="tr_content_edit">
            <input type="text"  id="joinJobDate" name="joinJobDate" class="inputText" value='<fmt:formatDate value="${employee.joinJobDate}" pattern="yyyy-MM-dd"/>' onfocus="WdatePicker()"/> 
      </td>
        <td class="tr_title_edit">加入公司时间：</td>
      <td  class="tr_content_edit">
          <input type="text"  id="joinCorpDate" name="joinCorpDate" class="inputText" value='<fmt:formatDate value="${employee.joinCorpDate}" pattern="yyyy-MM-dd"/>' onfocus="WdatePicker()"/> 
      </td>
    </tr>
</table>
	
	
	
	<div class="saveDiv">
		<input type="button" id="btn_save" icon="icon_save" value="${texts['button.save']}" /> 
	</div>
	</html:form>
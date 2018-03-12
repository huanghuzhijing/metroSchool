<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp" %>

<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	var oper_id="";
	var selectPhones = ",";
	var selectIncepter = ",";
		$(document).ready(function(){
			initTable();
		/*	var manage_stations='${param.manage_stations}';
				$("[name='select_row']").each(function(){
				if(manage_stations.indexOf($(this).val())>-1){
				$(this).attr("checked",true);
				}
			});*/
			
		
			$("#btn_save").click(function(){
			parent.$("#manage_stations").val(selectPhones);
			parent.$("#stationName").val(selectIncepter);
			parent.art.dialog({id:'commonDialog1'}).close();
		
			})
		$("[name='select_row']").parent().parent().click(function(){
			//var select_row = $(this).find("[name='select_row']") ;
			//select_row.attr("checked","checked") ;
			//pullValue(select_row.get(0)) ;
		})
			$("#btn_back").click(function(){
			parent.art.dialog({id:'commonDialog1'}).close();
			})
			
			 var a='${supList}';
       var vqlineId='${vqlineId}';
		if(vqlineId==null||vqlineId==""){
		reSetSeg();
		$("#qsectionId").append("<option  value=''>"+"-请选择-"+"</option>");
		}else{ 
		
		    if(a!=""&&vqlineId!=""){
		           a=a.substring(2);
				   var sings= new Array();
				   var ids=new Array();
				   var names=new Array();
				   var SingList=new Array();
				   sings =a.split(","); 
				   for (i=0;i<sings.length ;i++ ){
                    if(i%2==0){
                    names.push(sings[i]);
                    }else{
                    ids.push(sings[i]);
                    } 
				  } 
						for(j=0;j<names.length ;j++){
						SingList.push({lable:names[j],value:ids[j]});
						} 
						$("#qsectionId").find("option").remove();
						$("#qsectionId").append("<option  value=''>"+"-请选择-"+"</option>");
						for(j=0;j<SingList.length;j++){
						if('${vqsectionId}'==SingList[j].value){
				          $("#qsectionId").append("<option selected value='"+SingList[j].value+"'>"+SingList[j].lable+"</option>");  
						}else{
						 $("#qsectionId").append("<option  value='"+SingList[j].value+"'>"+SingList[j].lable+"</option>");  
						}
						}
		    }
		 }
		});
		function initTable(){
		this.selectPhones = '${param.manage_stations}'; 
		this.selectIncepter ='${param.stationName}';
		if(this.selectPhones.length > 1){
			var allEmployees = document.getElementsByName("select_row");
			for(var i=0; i<allEmployees.length; i++){
				if(allEmployees[i].getAttribute("paramId") != "" && this.selectPhones.indexOf(","+allEmployees[i].getAttribute("paramId")+",") > -1){
					allEmployees[i].checked = true;
				}
			}
		}
	}
	//选中事件
	function employCheck(object){
		if(object.checked == true){//选中
				if(this.selectPhones.indexOf(","+object.value+",") <= -1){
		   			this.selectPhones += object.getAttribute("paramId") + ",";
		   			this.selectIncepter += object.getAttribute("paramName") + ",";
		   		}
		 
		}else{//取消
			if(this.selectPhones.indexOf(","+object.value+",") > -1){
	 			this.selectPhones = this.selectPhones.replace(","+object.getAttribute("paramId")+",",",");
	 			this.selectIncepter = this.selectIncepter.replace(","+object.getAttribute("paramName")+",",",");
		   	}
		}
		
	}
		//设置list页面id
	function pullValue(obj){
		oper_id=obj.value;
	}
		//全选或者全不选
		function selectCheck(type){
	    var allemployees = document.getElementsByName("select_row");
	    if(type == "all"){
		    for(var i=0;i<allemployees.length;i++){
	     		allemployees[i].checked = true;
	     		if(this.selectPhones.indexOf(","+allemployees[i].getAttribute("paramId")+",") <= -1){
	     			this.selectPhones += allemployees[i].getAttribute("paramId") + ",";
	     			this.selectIncepter += allemployees[i].getAttribute("paramName") + ",";
	     		}
		    }
	    }else if(type == "none"){
	    	 for(var i=0;i<allemployees.length;i++){
	    	 	if(allemployees[i].checked == true){
	    	 		allemployees[i].checked = false;
	    	 		if(this.selectPhones.indexOf(","+allemployees[i].getAttribute("paramId")+",") > -1){
	    	 			this.selectPhones = this.selectPhones.replace(","+allemployees[i].getAttribute("paramId")+",",",");
	    	 			this.selectIncepter = this.selectIncepter.replace(","+allemployees[i].getAttribute("paramName")+",",",");
		     		}
	    	 	}
		    }
	    }
	   
	}
	function setEmpPhone(){
		parent.selectPhones = this.selectPhones;
		parent.selectIncepter = this.selectIncepter;
		return true;
	}
		function reSetSeg(){
	      $.ajax({
				   type: "POST",
				   url: "${ctx}/dtaqStationAction.do?method=reSetSeg",	
                  data: "qlineId="+$("[name='qlineId']").val(),
				   success: function(msg){	 
				   msg=msg.substring(2);
				   var singles= new Array();
				   var ids=new Array();
				   var names=new Array();
				   var SingleList=new Array();
				   singles =msg.split(",");
				   for (i=0;i<singles.length ;i++ ){
                    if(i%2==0){
                    names.push(singles[i]);
                    }else{
                    ids.push(singles[i]);
                    } 
				  }
						 
						for(j=0;j<names.length ;j++){
						SingleList.push({lable:names[j],value:ids[j]});		
						}
						$("#qsectionId").find("option").remove();
						$("#qsectionId").append("<option  value=''>"+"-请选择-"+"</option>");  				
						for(j=1;j<SingleList.length ;j++){	
						 $("#qsectionId").append("<option  value='"+SingleList[j].value+"'>"+SingleList[j].lable+"</option>");  
						
						}

				   }
				 					
					});
	}
	</script>
</head>

<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
			<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dtaqStationAction.do?method=selectStations&ec_p=${param.ec_p}&ec_id=${param.station_id}&ec_crd=${param.ec_crd}">
				<html:hidden property="manage_stations" value="${param.manage_stations}"/>
				<html:hidden property="stationName" value="${param.stationName}"/>
					<table align="left">
						<tr>
								<td>线路：</td>
							    <td >
							    	<html:select property="qlineId" onchange="reSetSeg()">
										<c:forEach items="${lines}" var="line">
											<html:option value="${line.line_id}" >${line.line_name}</html:option>
										</c:forEach>
							       </html:select>
							    </td>
							     <td>标段：</td>
							    <td><select id="qsectionId" name="qsectionId" ></select>
							    </td>
					        	<td align="right">
									<input type="submit" value="查询" icon="icon_query" onclick="setEmpPhone()"/>
								</td>
					 	</tr>
					 	
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		<div  class="listButtonDiv">
			<input type="button" class="button1" icon="icon-checked" value="全选" onclick="selectCheck('all')">
	  	 	<input type="button" class="button1"  icon="icon-unchecked" value="全不选" onclick="selectCheck('none')">
			<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
			<input id="btn_back" value="关闭" type="button" icon="icon_back"/>
				
		</div>
	<ec:table items="dtaqStations" var="dtaqStation" 
			action="dtaqStationAction.do?method=selectStations" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
			<ec:row highlightRow="true" ondblclick="showView('${dtaqStation.station_id}');"
					onclick="pullValue('${dtaqStation.station_id}');">
				<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="10%"/>
				<ec:column property="segment_id.segment_name"  title="标段" width="10%"/>
				<ec:column property="station_code" title="工点编号" width="10%"/>
	        	<ec:column property="station_name" title="工点名称" width="20%"/>
				<ec:column property="null" sortable="false" title="选择"  width="8%">
					<input name="select_row" value="${dtaqStation.station_id}" type="checkbox" paramName="${dtaqStation.station_name}" paramId="${dtaqStation.station_id}" onclick="employCheck(this)"/>
				</ec:column>
				
			</ec:row>
		</ec:table> 
		
</body>
</html:html>


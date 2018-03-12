<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectBoardroom").click(function(){
				var meetingDate=$("[name='meetingDate']").val();
				var meetingEndDate=$("[name='meetingEndDate']").val();
				if(meetingDate!=''&&meetingEndDate!=''){
					if(dateLtCompareMin(meetingDate,meetingEndDate)){
						var url ='contentSelectAction.do?method=selectBoardroom&queryBrType=${queryBrType}'+'&meetingDate='+meetingDate+'&meetingEndDate='+meetingEndDate;
						art.dialog({id:'commonDialog1',title:'会议室信息', iframe:url, width:'600', height:'400',top:'0'}).close(function(){
						  	setParamBoardRoomValue($("#plug_br_id").val(),$("#plug_roomcode").val(),$("#plug_roomname").val());
						});	
					}else{
						alert("会议开始时间必须大于结束时间！");
					}
				}else{
					alert("会议时间必须填写！");
				}
			}); 
			//
	});
	//
	//两日期比较 (小于)	格式必须为为2012-10-08 11:05
	function dateLtCompareMin(arg1,arg2){
		var v1=getDateToMin(arg1);
		var v2=getDateToMin(arg2);
		if(v1<v2){
			 return true;
		}else{
			return false;
		}
	}
	//得到日期	格式必须为为2012-10-08 11:05
	function getDateToMin(str){
		var strArray=str.split(" ");   
		var strDate=strArray[0].split("-");   
		var strTime=strArray[1].split(":");   
		var a=new   Date(strDate[0],(strDate[1]-parseInt(1)),strDate[2],strTime[0],strTime[1]);
		return a;
	}
	
</script>
	<input id="plug_selectBoardroom" value="选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_br_id" type="text" />
	    <input id="plug_roomcode" type="text" />
	    <input id="plug_roomname" type="text" />
	</div>



	





	//获取线路
	function getLines(qlineId,qsectionId){	
		$.post("hcSolutionApproveAction.do?method=getLines",function(msg){
			fillJsonNoSelect($("#qlineId"),msg,qlineId,1,qsectionId);
		});
	}
	//获取标段
	function getSections(qlineId,qsectionId){
		getWokPoints('','');
		if(qlineId!=''){
			$.post("hcSolutionApproveAction.do?method=getSections&qlineId="+qlineId,function(msg){
				fillJsonNoSelect($("#qsectionId"),msg,qsectionId,2);
			});
		}else{
			fillJsonSelect($("#qsectionId"),"","");
		}
	}
	//获取工点
	function getWokPoints(qsectionId,qworkPointId){
		getTypes('','');
		if(qsectionId!=''){
			$.post("hcSolutionApproveAction.do?method=getWokPoints&qsectionId="+qsectionId,function(msg){
				fillJsonNoSelect($("#qworkPointId"),msg,qworkPointId,3);
			});
		}else{
			fillJsonSelect($("#qworkPointId"),"","");
		}
	}	
	function getTypes(station_id,type_id){
		if(station_id!=''){
			
		$.post("dtaqCheckpointAction.do?method=getType&station_id="+station_id,function(msg){
			fillJsonNoSelect($("#type_id"),msg,type_id,4);
		});
		}else{
			fillJsonSelect($("#type_id"),"","");
		}
	}
	
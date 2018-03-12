
	//获取线路
	function getLines(lineId,segmentId){	
		$.post("accidentReportAction.do?method=getLines",function(msg){
			fillJsonNoSelect($("#lineId"),msg,lineId,1,segmentId);
		});
	}
	//获取标段
	function getSections(lineId,segmentId){
		
		if(lineId!=''){
			$.post("accidentReportAction.do?method=getSections&lineId="+lineId,function(msg){
				fillJsonNoSelect($("#segmentId"),msg,segmentId,2);
			});
		}else{
			fillJsonSelect($("#segmentId"),"","");
		}
	}
	
	
	
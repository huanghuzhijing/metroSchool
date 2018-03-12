	//获取线路
		function restrictLines(qlineId,qsegmentId){
			$.post("dtaqDataInfoAction.do?method=restrictLines",function(msg){
				fillJsonNoSelect($("#qlineId"),msg,qlineId,1,qsegmentId);
			});
		}
		
		//获取标段
		function restrictSegments(qlineId,qsegmentId){
			if(qlineId!=''){
				$.post("dtaqDataInfoAction.do?method=restrictSegments&qlineId="+qlineId,function(msg){
					fillJsonNoSelect($("#qsegmentId"),msg,qsegmentId,2);
				});
			}else{
				fillJsonSelect($("#qsegmentId"),"","");
			}
		}
		
			//选择标段联动工点
		function segmentChanged(segment_id) {
			$.ajax({//施工单位监理单位
				type: "POST",
				url: "dtaqDataInfoAction.do?method=querySgjl",
				data: "segment_id="+segment_id,
				success: function(msg){
					responseSgjcList(msg);
				}
			});
		}	
		//施工单位监理单位
		function responseSgjcList(selResponse){
			var text = selResponse;
			if(text != ""){
				var textStr = text.split("@");
				jQuery("[name='eorg']").val(textStr[0]) ;
				jQuery("[name='eorgjl']").val(textStr[1]) ;
			}else{
				jQuery("[name='eorg']").val("") ;
				jQuery("[name='eorgjl']").val("") ;
			}
		}
		

		//获取工点
		function restrictStations(qsegmentId,qstationId){
			if(qsegmentId!=''){
				$.post("dtaqDataInfoAction.do?method=restrictStations&qsegmentId="+qsegmentId,function(msg){
					fillJsonNoSelect($("#qstationId"),msg,qstationId,3);
				});
			}else{
				fillJsonSelect($("#qstationId"),"","");
			}
		
		}
		
		//获取检测类型
		function restrictTypes(qstationId,qtypeId){
			if(qstationId!=''){
				$.post("dtaqDataInfoAction.do?method=restrictTypes&qstationId="+qstationId,function(msg){
					fillJsonNoSelect($("#qtypeId"),msg,qtypeId,4);
				});
			}else{
				fillJsonSelect($("#qtypeId"),"","");
			}
		}
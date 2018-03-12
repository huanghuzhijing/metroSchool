
	function getTypes(qlineId,qsectionId){
		$.post("dtaqCheckpointAction.do?method=getTypes",function(msg){
			exfillJsonNoSelect($("#qlineId"),msg,qlineId,1,qsectionId);
		});
	}
	function getParts(qlineId,qsectionId,stationid){
		if(qlineId!=''){
			$.post("dtaqCheckpointAction.do?method=getParts&station_id="+stationid+"&type_id="+qlineId,function(msg){
				exfillJsonNoSelect($("#qsectionId"),msg,qsectionId,2);
			});
		}else{
			fillJsonSelect($("#qsectionId"),"",2);
		}
	}
	function getCodes(qsectionId,qworkPointId){
		if(qsectionId!=''){
			$.post("dtaqCheckpointAction.do?method=getCodes&organ_type=O&part_id="+qsectionId,function(msg){
				exfillJsonNoSelect($("#qworkPointId"),msg,qworkPointId,3);
				
			});
		}else{
			fillJsonSelect($("#qworkPointId"),"",3);
		}
	}	
	function exfillJsonNoSelect(obj,jSonStr,setOb,type,section){
		var selectObj ;
			if(jSonStr != null && jSonStr != ""){
				
				var jSobj = JSON.parse(jSonStr);
				var count=jSobj.length;
				if(count==1){
					selectObj = initSelect(obj,"false") ;
				}else{
					selectObj = initSelect(obj,true) ;
				}
				var seleteId='';
				for(var i=0; i<count; i++){
					
					var setStr="";
					seleteId=jSobj[i].id;
					if(jSobj[i].id==$.trim(setOb)){
					    setStr="selected";
					   
					}
					
					selectObj.append("<option value='"+jSobj[i].id+"' "+setStr+">"+jSobj[i].name+"</option>") ;
				} 
				if(count==1){
					if(type==1){
						getParts(seleteId,section);
					}else if(type==2){
						getCodes(seleteId,'');

					}
				}
			}
			
		}

	function initSelect(selectObj,showNull){
		
		var flag = true ;
		if(showNull == null || showNull == "false"){
			
			flag = false ;
		}
		selectObj.find("option").remove();
		if(flag){
			
			selectObj.append("<option value=''>--请选择--</option>") ;
		}
		return selectObj ;
	}
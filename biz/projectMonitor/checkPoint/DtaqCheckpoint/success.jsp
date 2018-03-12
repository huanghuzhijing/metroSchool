<%@ page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">
if('${checkFlag}'=="t"){
var url='dtaqCheckpointHistoryAction.do?method=list&checkFlag=t&qorganType=${param.qorganType}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qpoint_code=${param.qpoint_code}&point_id=${param.point_id}&station_id=${param.station_id}&qstationId=${param.station_id}&type_id=${param.type_id}&qtypeId=${param.type_id}';
		 location.href=url;
}else{
location.href="dtaqCheckpointAction.do?method=index&organ_type=${param.organ_type}&qlineId=${param.qlineId}&station_id=${param.station_id}&qsectionId=${param.qsectionId}&type_id=${param.type_id}&part_id=${param.part_id}&station_state=${param.station_state}";

}
		
</script>

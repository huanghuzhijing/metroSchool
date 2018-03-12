<%@ page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">

if('${flagPage}'=='1'){
location.href='projectMaterialsAction.do?method=edit&flagPage=${flagPage}&materials_id=${materials_id}';
}
if('${flagPage}'=='2'){
if('${station_type}'=='P'){
location.href='blockStructureAction.do?method=edit&flagPage=${flagPage}&materials_id=${materials_id}';
}else{
location.href='stationStructureAction.do?method=edit&flagPage=${flagPage}&materials_id=${materials_id}';
}

}
if('${flagPage}'=='3'){
location.href='projectGeologyAction.do?method=edit&flagPage=${flagPage}&materials_id=${materials_id}';
}
if('${flagPage}'=='4'){
location.href='stratumRockAction.do?method=edit&flagPage=${flagPage}&materials_id=${materials_id}';
}
if('${flagPage}'=='5'){
location.href='undergroundPipelineAction.do?method=edit&flagPage=${flagPage}&materials_id=${materials_id}';
}
if('${flagPage}'=='6'){
location.href='peripheralBuildingAction.do?method=edit&flagPage=${flagPage}&materials_id=${materials_id}';
}

</script>
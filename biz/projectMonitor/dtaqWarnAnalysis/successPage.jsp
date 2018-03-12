<%@ page contentType="text/html;charset=UTF-8" %>
<script>
var url='dtaqWarnInfoAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qorganType=${param.qorganType}';
if('${param.info_id}'==''){
	url='dtaqWarnAnalysisAction.do?method=list&station_id=${param.station_id}&organ_type=${param.organ_type}';
	}

if('${param.reason}'==''){
url="dtaqWarnAnalysisAction.do?method=selectSignEmployee&orgflag=${param.orgflag}&deptid=${param.deptid}&economictype=${param.economictype}&orgid=${param.orgid}&qcode=${param.qcode}&qname=${param.qname}&qsex=${param.qsex}&data_ids=${param.data_ids}";
}
location.href=url;
</script>
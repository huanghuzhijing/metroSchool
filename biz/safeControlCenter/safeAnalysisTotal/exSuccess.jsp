<%@ page contentType="text/html;charset=UTF-8" %>

<script>
if('${dialog}'=="t"){
var url ="safeAnalysisTotalAction.do?method=viewAnalysisReport&forwardType=viewAnalysisReport&analyse_id=${analyse_id}&opinion=${opinion}&displayType=${displayType}";
location.href=url;
}else{
var url='safeAnalysisTotalAction.do?method=showAnalyseInfo&station_id=${station_id}&opinion=${opinion}';
location.href=url;
}
</script>
function print_viewA(base_url){
	var appletVar = '';
	appletVar += '<applet id="printerA" code="com.whmetro.extend.report.PrinterApplet.class" codebase = "'+base_url+'/applet" archive="jasperreport.jar" width="0" height="0">';
        appletVar += '<param name="code" value="com.whmetro.extend.report.PrinterApplet.class">';
        appletVar += '<param name="codebase" value="'+base_url+'/applet">';
        appletVar += '<param name="archive" value="jasperreport.jar">';
        appletVar += '<param name="type" value="application/x-java-applet">';
        appletVar += '<param name="scriptable" value="false">';
        appletVar += '<param name="REPORT_URL" value="'+base_url+'/dtaqSecurityAnalyseAction.do?method=printData">';
	appletVar += '</applet>';
	return appletVar;
}

function print_viewB(base_url) {
    var appletVar = '';
    appletVar += '<OBJECT id="myApplet" name="myApplet" ';
    appletVar += 'classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" WIDTH="0" HEIGHT="0" MAYSCRIPT name="myApplet" ';
    appletVar += 'codebase="'+base_url+'/applets/jre-6-windows-i586.exe">';
    appletVar += '<PARAM NAME="CODE" VALUE="com.whmetro.extend.report.PrinterApplet" >';
    appletVar += '<PARAM NAME="CODEBASE" VALUE="'+base_url+'/applets" >';
    appletVar += '<PARAM NAME="ARCHIVE" VALUE="jasperreport.jar" >';
    appletVar += '<PARAM NAME="type" VALUE="application/x-java-applet;version=1.5.0" >';
    appletVar += '<PARAM NAME="scriptable" VALUE="false" >';
    appletVar += '<PARAM NAME="REPORT_URL" VALUE="'+base_url+'/dtaqSecurityAnalyseAction.do?method=printData">';
    appletVar += 'no support java';
    appletVar += '<comment>';
    appletVar += '<embed type="application/x-java-applet;version=1.5.0" ';
    appletVar += 'CODE="com.whmetro.extend.report.PrinterApplet" ';
    appletVar += 'JAVA_CODEBASE="'+base_url+'/applets" ARCHIVE="jasperreport.jar" ';
    appletVar += 'scriptable=false ';
    appletVar += 'pluginspage="http://java.sun.com/products/plugin/1.1.2/plugin-install.html">';
    appletVar += '<noembed></noembed>';
    appletVar += '</embed>';
    appletVar += '</comment>';
    appletVar += '</OBJECT>';
    return appletVar;
}

function print_report(base_url) {
    var appletVar = '';
    appletVar += '<OBJECT id="myApplet" name="myApplet" ';
    appletVar += 'classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" WIDTH="0" HEIGHT="0" MAYSCRIPT name="myApplet" ';
    appletVar += 'codebase="'+base_url+'/applets/jre-6-windows-i586.exe">';
    appletVar += '<PARAM NAME="CODE" VALUE="com.whmetro.extend.report.JRPrinterJApplet" />';
    appletVar += '<PARAM NAME="CODEBASE" VALUE="'+base_url+'/applets" />';
    appletVar += '<PARAM NAME="ARCHIVE" VALUE="jasperreport.jar" />';
    appletVar += '<PARAM NAME="type" VALUE="application/x-java-applet;version=1.5.0" />';
    appletVar += '<PARAM NAME="scriptable" VALUE="false" />';
    appletVar += '<PARAM NAME="REPORT_URL" VALUE="'+base_url+'/dtaqSecurityAnalyseAction.do?method=printData">';
    appletVar += 'no support java';
    appletVar += '<comment>';
    appletVar += '<embed type="application/x-java-applet;version=1.5.0" ';
    appletVar += 'CODE="com.whmetro.extend.report.JRPrinterJApplet" ';
    appletVar += 'JAVA_CODEBASE="'+base_url+'/applets" ARCHIVE="jasperreport.jar" ';
    appletVar += 'scriptable=false ';
    appletVar += 'pluginspage="http://java.sun.com/products/plugin/1.1.2/plugin-install.html">';
    appletVar += '<noembed></noembed>';
    appletVar += '</embed>';
    appletVar += '</comment>';
    appletVar += '</OBJECT>';
    return appletVar;
}


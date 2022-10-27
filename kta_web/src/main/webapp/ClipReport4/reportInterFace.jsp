<%@page import="java.util.Enumeration"%>
<%@page import="com.clipsoft.clipreport.oof.OOFFile"%>
<%@page import="com.clipsoft.clipreport.oof.OOFDocument"%>
<%@page import="com.clipsoft.clipreport.oof.connection.*"%>
<%@page import="java.io.File"%>
<%@page import="com.clipsoft.clipreport.server.service.ReportUtil"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("EUC-KR");
String crfName = request.getParameter("crfName");
String crfData = request.getParameter("crfData");      

OOFDocument oof = OOFDocument.newOOF();
OOFFile file = oof.addFile("crfe.root", "%root%/crf/truck/"+crfName+".crf");
OOFConnectionMemo c = oof.addConnectionMemo("*", crfData);  
c.addContentParamXML("*", "urf-8", "{%dataset.xml.root%}");
%><%@include file="./Property.jsp"%><%
String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=800, user-scalable=yes" >
<link rel="stylesheet" type="text/css" href="./css/clipreport_png.css">
<link rel="stylesheet" type="text/css" href="./css/UserConfig.css">
<link rel="stylesheet" type="text/css" href="./css/font.css">
<script type='text/javascript' src='./js/jquery-1.11.1.js'></script>
<script type='text/javascript' src='./js/clipreport.js'></script>
<script type='text/javascript' src='./js/UserConfig.js'></script>
<script type='text/javascript'>
var urlPath = document.location.protocol + "//" + document.location.host;
	
function html2xml(divPath){	
    var reportkey = "<%=resultKey%>";

	 var report = createImportJSPReport(urlPath + "/ClipReport4/Clip.jsp", reportkey, document.getElementById(divPath));
	//report.setStyle("")
	
    report.view();
}
</script>
</head>
<body onload="html2xml('targetDiv1')">
<div id='targetDiv1' style='position:absolute;top:5px;left:5px;right:5px;bottom:5px;'></div>
</body>
</html>

<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="com.clipsoft.clipreport.server.service.*" %>
<%@ page import="com.clipsoft.clipreport.server.service.export.*" %>
<%@ page import="com.clipsoft.clipreport.server.service.export.save.SAVEReport" %>
<%@ page import="com.clipsoft.clipreport.server.service.html.PrintHTML" %>
<%@ page import="com.clipsoft.clipreport.server.service.reporteservice.*" %>
<%@page import="com.clipsoft.clipreport.server.service.eform.EFormUpdateDocument"%>
<%@page import="com.clipsoft.clipreport.server.service.eform.EFormPage"%>
<%@include file="Property.jsp"%><%
out.clear();
out=pageContext.pushBody();

//크로스 도메인 설정
//response.setHeader("Access-Control-Allow-Origin", "*");

//세션을 활용하여 리포트키들을 관리하지 않는 옵션
//request.getSession().setAttribute("ClipReport-SessionList-Allow", false);

String passName = request.getParameter("ClipID");
if(null != passName){
	if("R01".equals(passName)){
		NewReport newReport = new NewReport();
		newReport.doPost(request, response, propertyPath);
		//String responseValue = newReport.doPostToString(request, response, propertyPath);
	}
	else if("R02".equals(passName)){
		Page page1 = new Page();
		page1.doPost(request, response, propertyPath);
		//String responseValue = page1.doPostToString(request, response, propertyPath);
	}
	else if("R03".equals(passName)){
		PageCount pageCount = new PageCount();
		pageCount.doPost(request, response, propertyPath);
		//String responseValue = pageCount.doPostToString(request, response, propertyPath);
	}
	else if("R04".equals(passName)){
		DeleteReport deleteReport = new DeleteReport();
		deleteReport.doPost(request, response);
		//String responseValue = deleteReport.doPostToString(request, response, propertyPath);
	}
	else if("R05".equals(passName)){
		EXCELReport excelReport = new EXCELReport();
		excelReport.doPost(request, response);
	}
	else if("R06".equals(passName)){
		HTMLReport htmlReport = new HTMLReport();
		htmlReport.doPost(request, response);
	}
	else if("R07".equals(passName)){
		HWPReport hwpReport = new HWPReport();
		hwpReport.doPost(request, response);
	}
	else if("R08".equals(passName)){
		PDFReport pdfReport = new PDFReport();
		pdfReport.doPost(request, response);
	} 
	else if("R09".equals(passName)){
		SAVEReport saveReport = new SAVEReport();
		saveReport.doPost(request, response);
		
		//문서 암호화를 처리하기 위해서는 jsp forward 사용 합니다.
		//RequestDispatcher dispatcher = request.getRequestDispatcher("export/exportForEncryption.jsp");
		//dispatcher.forward(request, response);
		
	} 
	else if("R10".equals(passName)){
		PagePrint page1 = new PagePrint();
		page1.doPost(request, response);
	}
	else if("R11".equals(passName)){
		UpDatePage page1 = new UpDatePage();
		page1.doPost(request, response);
	}
	
//	else if("R15".equals(passName)){
//		PrintHTML printHTML = new PrintHTML();
//		printHTML.doPost(request, response);
//	}
	
	else if ("R16".equals(passName)) {
		FileDownLoadCheck fileCheck = new FileDownLoadCheck();
		fileCheck.doPost(request, response);
		//String responseValue = fileCheck.doPostToString(request, response, propertyPath);
	}
	else if ("R17".equals(passName)) {
		PageImage pageImage = new PageImage();
		pageImage.doPost(request, response);
	}
	else if("R30".equals(passName)){
		EFormPage eformPage = new EFormPage();
		eformPage.doPost(request, response, propertyPath);
	}
	else if("R31".equals(passName)){
		EFormUpdateDocument eformUpDate = new EFormUpdateDocument();
		eformUpDate.doPost(request, response);
	}

	else if ("R50".equals(passName)) {
		PrintLicense printLicense = new PrintLicense();
		printLicense.doPost(request, response, propertyPath);
	}
	else if ("R51".equals(passName)) {
		UpdateLicense updateLicense = new UpdateLicense();
		updateLicense.doPost(request, response, propertyPath);
	}
	else if ("R52".equals(passName)) {
		ConfigurationAuthorization authorization = new ConfigurationAuthorization();
		authorization.doPost(request, response, propertyPath);
	}
	else if("R97".equals(passName)){
		SVGExport svgExport = new SVGExport();
		svgExport.doZipPost(request, response);
	}
	else if("R98".equals(passName)){
		ImageBase64Export imageExport = new ImageBase64Export();
		imageExport.doPost(request, response);
	}
	else if("R99".equals(passName)){
		SVGExport svgExport = new SVGExport();
		svgExport.doPost(request, response);
	}
	else if ("S01".equals(passName)){
		StringBuffer sessionCookie = new StringBuffer();
	    Cookie[] cookies = request.getCookies();
	    if(cookies != null) {
	        for (int i = 0; i < cookies.length; i++) {
	            Cookie cookie = cookies[i];
	            sessionCookie.append(cookie.getName() + "=" + cookie.getValue() + ";");
	        }
	    }
	    
	    OutputStream outputStream = response.getOutputStream();
		outputStream.write(sessionCookie.toString().getBytes("UTF-8"));
		outputStream.flush();
		outputStream.close();
	}
	
	// Report
}
%>
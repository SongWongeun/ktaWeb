<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.InputStream,java.io.OutputStream,java.util.*,java.text.*,com.clipsoft.rextoolkit.*,com.clipsoft.rextoolkit.enumtype.*,com.clipsoft.rextoolkit.oof.*, com.clipsoft.rextoolkit.oof.enumtype.*,com.clipsoft.rextoolkit.parameter.*,com.clipsoft.rextoolkit.parameter.enumtype.* " %>

<%
for(int i=1; i<=7; i++){ 
	RexSOPToolkit rexSOPToolkit = new RexSOPToolkit();

	Oof oof = new Oof();
	
	oof.setTitle("테스트보고서");
	oof.setEnableLog(true);
	oof.setEnableThread(true);

	CsvContent csvContent = (CsvContent) ContentFactory.createContent(ContentType.CSV);
	csvContent.setRowDelim("|#|");
	csvContent.setColDelim("|*|");
	csvContent.setDataSetDelim("|@|");
	csvContent.setEncoding(EncodingType.UTF_8);

	HttpConnection httpConnection = (HttpConnection) ConnectionFactory.createConnection(ConnectionType.HTTP);
	httpConnection.setPath("http://192.1.60.6/exploded/RexServer30/rexservice.jsp");
	httpConnection.setMethod("post");
	httpConnection.setNamespace("*");
	httpConnection.addHttpParam(new HttpParam("Q1SQL", OofSpecialField.AUTO.getValue()));
	httpConnection.addHttpParam(new HttpParam("OE", "None"));
	httpConnection.addHttpParam(new HttpParam("CN", "oracle2"));
	httpConnection.addHttpParam(new HttpParam("ID", "SDCSV"));
	httpConnection.addHttpParam(new HttpParam("PE", "FALSE"));
	httpConnection.addHttpParam(new HttpParam("QC", "1"));
	httpConnection.addHttpParam(new HttpParam("OT", "DataOnly"));
	httpConnection.addHttpParam(new HttpParam("Q1Type", "SQL"));
	httpConnection.addContent(csvContent);
	



		
		com.clipsoft.rextoolkit.oof.File file = new com.clipsoft.rextoolkit.oof.File();
		file.setType(FileType.REB);
		file.setPath("http://192.1.60.6/RexServer30/rebfiles/car" + i + ".reb");
		file.setShowParameterDialog(true);
		oof.addFile(file);
	
	//oof.addFile(file);
	oof.addConnection(httpConnection);
	//oof.addFile(file);
	oof.addField(new Field("gijun_ymd", "20120601"));
    oof.addField(new Field("agent_no", "2006130001"));
	rexSOPToolkit.setRexEspUrl("http://192.1.60.3/RexESP/RexSOPServer");
	rexSOPToolkit.setSubmitEncodingType(SubmitEncodingType.UTF_8);

	HtmlExportParameter htmlExportParameter = ParameterFactory.createHtmlExportParameter();
	htmlExportParameter.setOof(oof.createOof());
	htmlExportParameter.setOofProcessType(OofProcessType.PATH);
	htmlExportParameter.setFilePath("d:/ThunderMail/intermail_template/");
	htmlExportParameter.setFileName("ymd_20120601" + i + ".html");
	htmlExportParameter.setMergeTable(false);    //테이블 머지하지 않음
	htmlExportParameter.setKeepPageHeight(false);  //용지높이설정 유지하지 않음
	htmlExportParameter.setDisplayPageLine(false); //페이지나눔 표시하지 않음
	htmlExportParameter.setPageSectionOncePrint(false); //머리글 바닥글 여러번 출력
	htmlExportParameter.setTextPropertyToEmptyCell(false); //공백셀에 텍스트 속성 설정하기
	htmlExportParameter.setTextOverflowHidden(false); //HTML Overflow 스타일 값을 fales 로 설정하기 
	htmlExportParameter.setPutTagIntoEmptyCell(false); //공백 셀에 "nbsp" 태그 넣기 (기본값 : true)
	htmlExportParameter.setHtmlEncodingType(2); //인코딩 (0: Unicode, 1: UTF-8, 2: EUC-KR(기본))
	
	
	RexToolkitResult result = rexSOPToolkit.export(htmlExportParameter);
	}
%>
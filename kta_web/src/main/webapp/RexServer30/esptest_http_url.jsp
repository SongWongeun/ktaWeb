<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.InputStream,java.io.OutputStream,java.util.*,java.text.*,com.clipsoft.rextoolkit.*,com.clipsoft.rextoolkit.enumtype.*,com.clipsoft.rextoolkit.oof.*, com.clipsoft.rextoolkit.oof.enumtype.*,com.clipsoft.rextoolkit.parameter.*,com.clipsoft.rextoolkit.parameter.enumtype.* " %>
<%

	RexSOPToolkit rexSOPToolkit = new RexSOPToolkit();
	
	Oof oof = new Oof();
	oof.setTitle("Test CSV URL");
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
	httpConnection.addHttpParam(new HttpParam("CN", "oracle1"));
	httpConnection.addHttpParam(new HttpParam("ID", "SDCSV"));
	httpConnection.addHttpParam(new HttpParam("PE", "FALSE"));
	httpConnection.addHttpParam(new HttpParam("QC", "1"));
	httpConnection.addHttpParam(new HttpParam("OT", "DataOnly"));
	httpConnection.addHttpParam(new HttpParam("Q1Type", "SQL"));
	httpConnection.addContent(csvContent);
	
	File file = new File();
	file.setType(FileType.REB);
	file.setPath("http://192.1.51.239:18080/RexServer30/rebfiles/test.reb");
	file.setShowParameterDialog(true);

	oof.addFile(file);
	oof.addConnection(httpConnection);
	
	//oof.addField(new Field("한 글 123 abc", "한 글 123 abc"));
    //oof.addField(new Field("bbbb", "22222"));
	
	//rexSOPToolkit.setRexEspUrl("http://192.1.60.3/RexESP/RexSOPServer");  
	rexSOPToolkit.setRexEspUrl("http://192.1.1.10:8080/RexESP/RexSOPServer");  
	rexSOPToolkit.setSubmitEncodingType(SubmitEncodingType.UTF_8);  
  
	PdfExportParameter pdfExportParameter = ParameterFactory.createPdfExportParameter();  
	pdfExportParameter.setOof( oof.createOof() );  
	pdfExportParameter.setOofProcessType(OofProcessType.PATH);  
	pdfExportParameter.setFilePath("C:/test/");  	pdfExportParameter.setFileName("truck.pdf");  
  
	RexToolkitResult result = rexSOPToolkit.export(pdfExportParameter);  
%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.InputStream,java.io.OutputStream,java.util.*,java.text.*,com.clipsoft.rextoolkit.*,com.clipsoft.rextoolkit.enumtype.*,com.clipsoft.rextoolkit.oof.*, com.clipsoft.rextoolkit.oof.enumtype.*,com.clipsoft.rextoolkit.parameter.*,com.clipsoft.rextoolkit.parameter.enumtype.* " %>
<%

	RexSOPToolkit rexSOPToolkit = new RexSOPToolkit();
	
	Oof oof = new Oof();
	oof.setTitle("Test XML Memo");
	oof.setEnableLog(true);
	oof.setEnableThread(true);
	
	XmlContent xmlContent = (XmlContent) ContentFactory.createContent(ContentType.XML);
	xmlContent.setRoot(OofSpecialField.DATASET_XML_ROOT.getValue());
	xmlContent.setPreservedWhitespace(true);
	xmlContent.setBindingMode(BindingModeType.NAME);
	
	
	MemoConnection memoConnection = (MemoConnection) 
	ConnectionFactory.createConnection(ConnectionType.MEMO);
	memoConnection.setNamespace("*");
	
	//DATA 부분
	memoConnection.setData("<root><row><f1><![CDATA[aaaa]]></f1><f2><![CDATA[1111]]></f2><f3><![CDATA[한글1]]></f3></row><row><f1><![CDATA[bbbb]]></f1><f2><![CDATA[2222]]></f2><f3><![CDATA[한글88882]]></f3></row></root>");
	memoConnection.addContent(xmlContent);
	
	File file = new File();
	file.setType(FileType.REB);
	file.setPath("http://192.1.51.239:18080/RexServer30/rebfiles/test3.reb"); //REB 파일명
	file.setShowParameterDialog(true);

	oof.addFile(file);
	oof.addConnection(memoConnection);
	
	//oof.addField(new Field("aaa", "0"));
    //oof.addField(new Field("bbbb", "22222"));
	
	rexSOPToolkit.setRexEspUrl("http://192.1.1.10:8080/RexESP/RexSOPServer");  //PDF Server
	rexSOPToolkit.setSubmitEncodingType(SubmitEncodingType.UTF_8);  
  
	PdfExportParameter pdfExportParameter = ParameterFactory.createPdfExportParameter();  
	pdfExportParameter.setOof( oof.createOof() );  
	pdfExportParameter.setOofProcessType(OofProcessType.PATH);  
	pdfExportParameter.setFilePath("C:/test/");  //PDF파일 저장 경로
	pdfExportParameter.setFileName("truck.pdf");  //PDF 파일 저장명
  
	RexToolkitResult result = rexSOPToolkit.export(pdfExportParameter);  
	
	out.print("<--");
	out.print(pdfExportParameter.getOof());
	out.print("-->");
	out.print(result.getMessage());
%>
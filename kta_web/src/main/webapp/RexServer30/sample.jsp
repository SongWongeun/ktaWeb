<%@ page language="java" contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>sampleall</title>
<script language="javascript" src="./rexscript/rexpert.js"></script>
<script language="javascript" src="./rexscript/rexpert_properties.js"></script>
</head>
<script language="JavaScript">

//--------------------------
// 기본적인 사용 예
//--------------------------
function fnOpen()
{
	// 필수 - 레포트 생성 객체
	var oReport = GetfnParamSet();
	// 여러 iframe에 레포트를 보여주기 위해 레포트객체id 명시할 수 있음.
	//var oReport = GetfnParamSet("0");

	// 필수 - 레포트 파일명
	oReport.rptname = "test";
	

	// 옵션 - 데이터타입(csv - 기본값, xml)
	//oReport.datatype= "xml";

	// 옵션 - 데이터베이스 연결 정보 (서버로 통해 데이터를 가져올 때)
	//oReport.connectname= "oracle1";

	// 옵션 - 레포트 파라메터
	//oReport.param("param1").value = "param1";
	//oReport.param("param2").value = "paramvalue2";
	//oReport.param("custid").value = "B";
	//oReport.param("custid").isnull = "1";
	//oReport.param("ename").value = "A";
	//oReport.param("ename").isnull = "1";
	//oReport.param("test").value = "가나다abc";

	// 옵션 - title
	//oReport.title = "리포트";

	//-------------------------------------
	// 1. xml file을 통해 데이터를 가져오는 방법
	//-------------------------------------
	/*
	oReport.type = "file";
	oReport.datatype = "xml";
	//oReport.xpath = "gubun/rpt1/rexdataset/rexrow";
	//oReport.path = "http://" + location.host + "/RexServer30/rebfiles/samples/oracle_emp.xml";
	oReport.path = "http://" + location.host + "/RexServer30/rebfiles/samples/sqlserver_customers_orders.xml";
	//oReport.path = "http://" + location.host + "/RexServer30/rebfiles/samples/oracle_emp.jsp?datatype=xml";
	//oReport.path = "D:\\rexpert30\\RexServer30\\rebfiles\\samples\\oracle_emp.xml";
	*/

	//-------------------------------------
	// 2. csv file을 통해 데이터를 가져오는 방법
	//-------------------------------------
	/*
	oReport.type = "file";
	oReport.datatype = "csv";
	oReport.path = "http://" + location.host + "/RexServer30/rebfiles/samples/oracle_emp.csv";
	//oReport.path = "http://" + location.host + "/RexServer30/rebfiles/samples/oracle_emp.jsp?datatype=csv";
	//oReport.path = "D:\\rexpert30\\RexServer30\\rebfiles\\samples\\oracle_emp.csv";
	*/

	//-----------------------------------------
	// 3. xml memo값을 통해 데이터를 가져오는 방법
	//-----------------------------------------
	/*
	var sData = "";
	sData += "<gubun><rpt1><rexdataset><rexrow><EMPNO><![CDATA[7369]]></EMPNO><ENAME><![CDATA[SMITH]]></ENAME><JOB><![CDATA[CLERK]]></JOB><MGR><![CDATA[7902]]></MGR><HIREDATE><![CDATA[1980-12-17 00:00:00.0]]></HIREDATE><SAL><![CDATA[800]]></SAL><COMM><![CDATA[null]]></COMM><DEPTNO><![CDATA[20]]></DEPTNO></rexrow>";
	sData += "<rexrow><EMPNO><![CDATA[8888]]></EMPNO><ENAME><![CDATA[honggil]]></ENAME><JOB><![CDATA[Tec]]></JOB><MGR><![CDATA[7788]]></MGR><HIREDATE><![CDATA[null]]></HIREDATE><SAL><![CDATA[200]]></SAL><COMM><![CDATA[null]]></COMM><DEPTNO><![CDATA[null]]></DEPTNO></rexrow></rexdataset></rpt1></gubun>";

	oReport.type = "memo";
	oReport.datatype = "xml";
	oReport.dataset("ADOSQLDS1").xpath = "gubun/rpt1/rexdataset/rexrow";
	//oReport.dataset("ADOSQLDS2").xpath = "gubun/rpt2/rexdataset/rexrow";
	//oReport.xpath = "gubun/rpt1/rexdataset/rexrow";
	oReport.data = sData;
	*/
	//-----------------------------
	// plugin - DRM
	//-----------------------------
	oReport.plugin.type = "markany";
	//oReport.plugin.type = "bcqure";


	//필수 - 레포트 실행
	//oReport.iframe(ifrmRexPreview1);
	
	//alert("oof:" + oReport);
	oReport.open();
	//oReport.print(false, 1, -1, 1, "");   // 다이얼로그표시유무, 시작페이지, 끝페이지, 카피수, 옵션
	//oReport.printdirect("HP LaserJet 3050" , 260, 1, -1, 1, "");	// [프린터명],[트레이아이디],[시작페이지],[끝페이지],[출력매수],[옵션]
	//oReport.save(false, "pdf", "c:\\test.pdf", 1, -1, "");	// 다이얼로그표시유무, 파일타입, 파일명, 시작페이지, 끝페이지, 카피수, 옵션
									// saveoption : "export.run=0"

}

// event handler 
function fnReportEvent(oRexCtl, sEvent, oArgs) {
	//alert(sEvent);

	if (sEvent == "init") {
		oRexCtl.SetCSS("appearance.canvas.offsetx=0");
		oRexCtl.SetCSS("appearance.canvas.offsety=0");
		oRexCtl.SetCSS("appearance.pagemargin.visible=0");

		oRexCtl.SetCSS("appearance.toolbar.button.open.visible=0");
		oRexCtl.SetCSS("appearance.toolbar.button.export.visible=0");
		oRexCtl.SetCSS("appearance.toolbar.button.refresh.visible=1");
		oRexCtl.SetCSS("appearance.toolbar.button.movefirst.visible=1");
		oRexCtl.SetCSS("appearance.toolbar.button.moveprev.visible=1");
		oRexCtl.SetCSS("appearance.toolbar.button.pagenumber.visible=1");
		oRexCtl.SetCSS("appearance.toolbar.button.pagecount.visible=1");
		oRexCtl.SetCSS("appearance.toolbar.button.movenext.visible=1");
		oRexCtl.SetCSS("appearance.toolbar.button.movelast.visible=1");
		oRexCtl.SetCSS("appearance.toolbar.button.zoom.visible=1");
		oRexCtl.SetCSS("appearance.toolbar.button.exportxls.visible=0");
		oRexCtl.SetCSS("appearance.toolbar.button.exportpdf.visible=0");
		oRexCtl.SetCSS("appearance.toolbar.button.exporthwp.visible=0");
		oRexCtl.SetCSS("appearance.toolbar.button.about.visible=0");

		//oRexCtl.SetCSS("appearance.pane.toc.visible=0");

		//oRexCtl.SetCSS("event.printfinishresult.enable=1");
		//<- 이 속성을 1로 설정해야 PrintFinishResult 이벤트가 발생합니다

		oRexCtl.UpdateCSS();
	} else if (sEvent == "finishdocument") {
		oRexCtl.Zoom("wholepage");
		//oRexCtl.SetCSS("appearance.toolbar.button.exportxls.option.sheetoption=2");
		//oRexCtl.UpdateCSS();
	} else if (sEvent == "finishprint") {
		
	} else if (sEvent == "finishexport") {
		//alert(oArgs.filename);

	} else if (sEvent == "finishprintresult") {
		//alert(oArgs.resultcode);
		/*
			0      : 성공
			1002 : 인쇄 작업이 일지정지
			1003 : 인쇄 작업중 오류 발생
			1004 : 인쇄 작업이 삭제중
			1005 : 프린터 오프라인상태
			1006 : 프린터 용지 부족
			1007 : 인쇄 작업이 삭제됨
			9999 : 알수 없는 오류 발생
		*/
	} else if (sEvent == "hyperlinkclicked") {
		//alert(oArgs.Path);
	} else if (sEvent == "buttonprintclickbefore") { 

	
	} else if (sEvent == "buttonprintclickafter") {  

	
	} else if (sEvent == "buttonexportclickbefore") { 

	
	} else if (sEvent == "buttonexportclickafter") { 

	
	} else if (sEvent == "buttonrefreshclickbefore") {

		
	} else if (sEvent == "buttonrefreshclickafter") { 

	
	} else if (sEvent == "buttonexportxlsclickbefore") {  

	
	} else if (sEvent == "buttonexportxlsclickafter") { 
	
	
	} else if (sEvent == "buttonexportpdfclickbefore") {

	
	} else if (sEvent == "buttonexportpdfclickafter") { 
	
	
	} else if (sEvent == "buttonexporthwpclickbefore") {  

	
	} else if (sEvent == "buttonexporthwpclickafter") {  

	
	} else if (sEvent == "cancelprint") { 

	
	} else if (sEvent == "buttonclosewindowclickbefore") { 

	
	} else if (sEvent == "buttonclosewindowclickafter") { 

	
	} else if (sEvent == "printpage") { 
		//alert("call:"  + "oArgs.totalpage:" + oArgs.totalpage + "   oArgs.page:" + oArgs.page);

	} else if (sEvent == "cancelexport") {  
		
	
	} else if (sEvent == "finishprintresult") {  
		//alert("call:"  + "finishprintresult" + "oArgs.resultcode:" + oArgs.resultcode);

	} else if (sEvent == "errorevent") {  
		//alert("call:"  + "errorevent" + "oArgs.errorxml:" + oArgs.errorxml);
	}

	//window.close();
}



</script>
<body>
	<button onclick="fnOpen();">레포트 보기</button>
	<iframe name="ifrmRexPreview1" id="ifrmRexPreview1" src='rexpreview.jsp' width="100%" height="400"></iframe>
</body>
</html>
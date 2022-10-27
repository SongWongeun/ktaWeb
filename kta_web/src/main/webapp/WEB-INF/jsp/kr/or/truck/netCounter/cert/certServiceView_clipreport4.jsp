<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>증명서발급</title>
<style type="text/css">
html{overflow:hidden;}
</style>
<!-- <script language="javascript" src="/RexServer30/rexscript/rexpert.js"></script>
<script language="javascript" src="/RexServer30/rexscript/rexpert_properties.js"></script> -->

<!-- <script type="text/javascript" src="/RexServer30/rexscript/getscript.jsp?f=rexpert"></script>
<script type="text/javascript" src="/RexServer30/rexscript/getscript.jsp?f=rexpert_properties"></script> -->


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
	oReport.rptname = "${rebFileName}";

	//-----------------------------------------
	// 3. xml memo값을 통해 데이터를 가져오는 방법
	//-----------------------------------------
	//서브리포트 포함이거나 여러건의 데이터일시..(분담금/보상정보조회)
	var rptname ="${rebFileName}";
	
	if(rptname == 'compenDetail2'){
	 var sData = "<gubun>";
	 sData += "<rpt>";
	 sData += "<rexdataset>";
	 sData += "${resultXML}";
	 sData += "</rexdataset>";
	 sData += "</rpt>";
	 sData += "</gubun>";
	oReport.type = "memo";
	oReport.datatype = "xml";
	oReport.dataset("XMLDS1").xpath = "gubun/rpt/rexdataset/rexrow";
	oReport.data = sData;
		
	}else if(rptname =='paymentList'){
		
		
	var sData = "<gubun>";
	 sData += "<rpt>";
	 sData += "<rexdataset>";
	 sData += "${resultXML}";
	 sData += "${resultXML2}";
	 sData += "${resultXML3}";
	 sData += "</rexdataset>";
	 sData += "</rpt>";
	 sData += "</gubun>";
	oReport.type = "memo";
	oReport.datatype = "xml";
	oReport.dataset("XMLDS1").xpath = "gubun/rpt/rexdataset/rexrow";
	/* oReport.dataset("XMLDS2").xpath = "gubun/rpt2/rexdataset/rexrow";
	oReport.dataset("XMLDS3").xpath = "gubun/rpt3/rexdataset/rexrow"; */
	//oReport.xpath = "gubun/rpt1/rexdataset/rexrow";
	oReport.data = sData;
	
	}else if(rptname == 'joinCert'){
	//서브리포트를 하지 않거나 단수의 리포트일경우..
	var sData = "<gubun>";
	 sData += "<rpt>";
	 sData += "<rexdataset>";
	 sData += "${resultXML}";
	 sData += "</rexdataset>";
	 sData += "</rpt>";
	 sData += "</gubun>";
	oReport.type = "memo";
	oReport.datatype = "xml";
	oReport.dataset("XMLDS1").xpath = "gubun/rpt/rexdataset/rexrow";
	oReport.data = sData;
	}else if(rptname == 'joinFactCert'){
	//가입사실 증명원(여러장 출력)	
	var sData = "<gubun>";
	 sData += "<rpt>";
	 sData += "<rexdataset>";
	 sData += "${resultXML}";
	 sData += "</rexdataset>";
	 sData += "</rpt>";
	 sData += "</gubun>";
	oReport.type = "memo";
	oReport.datatype = "xml";
	oReport.dataset("XMLDS1").xpath = "gubun/rpt/rexdataset/rexrow";
	oReport.data = sData;
	}else if(rptname == "carryCert"){
	//적재물 가입사실 증명원	
	var sData = "<gubun>";
	 sData += "<rpt>";
	 sData += "<rexdataset>";
	 sData += "${resultXML}";
	 sData += "</rexdataset>";
	 sData += "</rpt>";
	 sData += "</gubun>";
	oReport.type = "memo";
	oReport.datatype = "xml";
	oReport.dataset("XMLDS1").xpath = "gubun/rpt/rexdataset/rexrow";
	oReport.data = sData;	
		
	}else if(rptname =="carryCertJUSUN"){
	//적재물 가입사실 증명원(주선)	
	var sData = "<gubun>";
	 sData += "<rpt>";
	 sData += "<rexdataset>";
	 sData += "${resultXML}";
	 sData += "</rexdataset>";
	 sData += "</rpt>";
	 sData += "</gubun>";
	oReport.type = "memo";
	oReport.datatype = "xml";
	oReport.dataset("XMLDS1").xpath = "gubun/rpt/rexdataset/rexrow";
	oReport.data = sData;	
	}else if(rptname == "carryCertList"){
	//적재물 가입사실 증명원(다건)
	var sData = "<gubun>";
	 sData += "<rpt>";
	 sData += "<rexdataset>";
	 sData += "${resultXML}";
	 sData += "</rexdataset>";
	 sData += "</rpt>";
	 sData += "</gubun>";
	oReport.type = "memo";
	oReport.datatype = "xml";
	oReport.dataset("XMLDS1").xpath = "gubun/rpt/rexdataset/rexrow";
	oReport.data = sData;		
	}else if(rptname ==	"divideCert"){
		var sData = "<gubun>";
		 sData += "<rpt>";
		 sData += "<rexdataset>";
		 sData += "${resultXML}";
		 sData += "</rexdataset>";
		 sData += "</rpt>";
		 sData += "</gubun>";
		oReport.type = "memo";
		oReport.datatype = "xml";
		oReport.dataset("XMLDS1").xpath = "gubun/rpt/rexdataset/rexrow";
		oReport.data = sData;			
	}
	
	//-----------------------------
	// plugin - DRM
	//-----------------------------
	oReport.plugin.type = "markany";
	//oReport.plugin.type = "bcqure";

	// auto refresh time
	//oReport.autorefeshtime = 5;

	//필수 - 레포트 실행 

	oReport.event.init = fnReportEvent;
	//oReport.iframe(ifrmRexPreview1);


	form = document.fileSend;
	form.crfData.value = sData;
	form.target = "rex_ifrmRexPreview";
	form.submit();
	//location.replace("http://dev.truck.or.kr/ClipReport4/reportInterFace.jsp?crfName=joinFactCert&crfData="+ sData);
	//document.all["rex_ifrmRexPreview"].src="http://dev.truck.or.kr/ClipReport4/reportInterFace.jsp?crfName=joinFactCert&crfData="+ sData;//;${rebFileName}&crfData="+ sData;
	
	 //document.getElementById("rex_ifrmRexPreview").src = "/ClipReport4/reportInterFace.jsp?crfName=${rebFileName}&crfData="+ sData;
	/*
	var frm = createform("ClipReportViewerForm", "POST", "http://dev.truck.or.kr/ClipReport4/reportInterFace.jsp", "rex_ifrmRexPreview");	  
    frm = addinput(frm, "crfName",str);	
	frm = addinput(frm, "crfData",sData);
    document.body.insertBefore(frm, null);	   
    frm.submit();

	var createform = function(frmname, frmmethod, frmaction, frmtarget) {
	    var frm = document.createElement("form");
	    frm.name = frmname;
	    frm.method = frmmethod;
	    frm.action = frmaction;
	    frm.target = frmtarget;
	    
	    return frm;
	};
	*/
	
	/*
    var a = document.getElementById("rexviewer_area");
	var sCtl = "";
	sCtl +="<iframe id='rex_ifrmRexPreview' name='rex_ifrmRexPreview' src='/ClipReport4/reportInterFace.jsp?crfName=${rebFileName}&crfData="+ sData+ "' width='100%' height='1000' frameborder='0'></iframe>";
	a.innerHTML = sCtl;  
	
	var aIframe = document.createElement("iframe");

	aIframe.setAttribute("id","rex_ifrmRexPreview");
	aIframe.setAttribute("name","rex_ifrmRexPreview");

	aIframe.style.width = "100%";
	aIframe.style.height = "1000";
	aIframe.src = "/ClipReport4/reportInterFace.jsp?crfName=${rebFileName}&crfData="+ sData;

	document.getElementsByTagName("body")[0].appendChild(aIframe);
	*/
	//var $iFrm = sCtl;//$('<IFRAME id="iFrm" frameBorder="0" name="iFrm" scrolling="no"></IFRAME>');
	//$iFrm.appendTo('body');
	
	/*var frm = createform("ClipReportViewerForm", "POST", "/ClipReport4/reportInterFace.jsp", "ifrmRexPreview1");	  
	    frm = addinput(frm, "crfName",rptname);	
		frm = addinput(frm, "crfData",sData);
	    document.body.insertBefore(frm, null);	   
	    frm.submit();	
	    
	    <iframe name="ifrmRexPreview1" id="ifrmRexPreview1" src='/ClipReport4/reportInterFace.jsp?crfName=${rebFileName}&crfData=' width="100%" height="100%"></iframe>
	*/
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

//----------------------------------------------
// 커넥션별 데이터를 서로 다르게 각각 가져오는 예
// 디자인시 만든 커넥션에 따라 설정
//----------------------------------------------
function fnOpenEach()
{
	// 필수 - 레포트 생성 객체
	var oReport = GetfnParamSet();
	// 여러 iframe에 레포트를 보여주기 위해 레포트객체id 명시할 수 있음.
	//var oReport = GetfnParamSet("0");

	// 필수 - 레포트 파일명
	oReport.rptname = "samples/sqlserver_customers_orders";


	// 참고 - 서브레포트별 xpath 설정
	/* */
	oReport.con("ADO1").type = "file";
	oReport.con("ADO1").datatype = "xml";
	oReport.con("ADO1").path = "http://" + location.host + "/RexServer30/rebfiles/samples/sqlserver_customers_orders.xml";
	oReport.con("ADO1").dataset("ADOSQLDS1").xpath = "gubun/rpt1/rexdataset/rexrow";
	oReport.con("ADO1").dataset("ADOSQLDS2").xpath = "gubun/rpt2/rexdataset/rexrow";
	//oReport.con("ADO1").namespace = "ADO1";	// 생략하면, sub id를 사용
	/**/

	//필수 - 레포트 실행
	oReport.iframe(ifrmRexPreview1);

}

//----------------------------------------------
// 여러 레포트파일을 한번에 미리보기
//----------------------------------------------
function fnOpenMulti()
{
	// 필수 - 레포트 생성 객체
	var oReport = GetfnParamSet();
	// 여러 iframe에 레포트를 보여주기 위해 레포트객체id 명시할 수 있음.
	//var oReport = GetfnParamSet("0");

	// 필수 - reb 파일을 구분하기 위해 reb함수 사용(reb id는 파일별 구분자)
	oReport.reb("reb1").rptname = "samples/oracle_emp";
	oReport.reb("reb1").connectname = "oracle1";




	oReport.reb("reb2").rptname = "samples/sqlserver_customers_orders";
	oReport.reb("reb2").type = "file";
	oReport.reb("reb2").datatype = "xml";
	oReport.reb("reb2").path = "http://" + location.host + "/RexServer30/rebfiles/samples/sqlserver_customers_orders.xml";


	//필수 - 레포트 실행
	oReport.iframe(ifrmRexPreview1);

}

//----------------------------------------------
// 여러 레포트파일을 한번에 미리보기
// 메인 레포트에 서브레포트를 붙이기
//----------------------------------------------
function fnOpenMulti_MainSub()
{
	// 필수 - 레포트 생성 객체
	var oReport = GetfnParamSet();

	// 필수 - reb 파일을 구분하기 위해 reb함수 사용(reb id는 파일별 구분자)
	oReport.reb("reb1").rptname = "samples/multi_main";
	oReport.reb("reb1").con("XML1").type = "file";
	oReport.reb("reb1").con("XML1").datatype = "xml";
	oReport.reb("reb1").con("XML1").path = "http://" + location.host + "/RexServer30/rebfiles/samples/sqlserver_customers_orders.xml";
	//oReport.reb("reb1").con("XML1").dataset("XMLDS1").xpath = "gubun/rpt1/rexdataset/rexrow";
	oReport.reb("reb1").param("param1").value = "multi-main";

	oReport.reb("reb2").rptname = "samples/multi_sub";
	//--- config-param start ---
	oReport.reb("reb2").configparam("append.section").value  = "1";
	oReport.reb("reb2").configparam("append.option.target").value  = "데이터바닥글1";
	oReport.reb("reb2").configparam("append.option.mainfollow").value  = "1";
	//--- config-param end ---
	oReport.reb("reb2").con("XML1").type = "file";
	oReport.reb("reb2").con("XML1").datatype = "xml";
	oReport.reb("reb2").con("XML1").path = "http://" + location.host + "/RexServer30/rebfiles/samples/sqlserver_customers_orders.xml";
	oReport.reb("reb2").param("param1").value = "multi-sub";

	oReport.reb("reb3").rptname = "samples/multi_sub";
	//--- config-param start ---
	oReport.reb("reb3").configparam("append.section").value  = "1";
	oReport.reb("reb3").configparam("append.option.target").value  = "데이터머리글2";
	oReport.reb("reb3").configparam("append.option.mainfollow").value  = "1";
	//--- config-param end ---
	oReport.reb("reb3").con("XML1").type = "file";
	oReport.reb("reb3").con("XML1").datatype = "xml";
	oReport.reb("reb3").con("XML1").path = "http://" + location.host + "/RexServer30/rebfiles/samples/sqlserver_customers_orders.xml";
	oReport.reb("reb3").param("param1").value = "multi-sub";
	
	oReport.event.init = fnReportEvent;
	oReport.event.finishdocument = fnReportEvent;
	//oReport.event.finishprint = fnReportEvent;
	//oReport.event.finishexport = fnReportEvent;
	//oReport.event.hyperlinkclicked = fnReportEvent;
	
	//필수 - 레포트 실행
	oReport.iframe(ifrmRexPreview1);
	//oReport.open();
	//oReport.print(true, 1, -1, 1, "");   // 다이얼로그표시유무, 시작페이지, 끝페이지, 카피수, 옵션
   	//oReport.printdirect("HP LaserJet 3050" , 260, 1, -1, 1, "");	// [프린터명],[트레이아이디],[시작페이지],[끝페이지],[출력매수],[옵션]
	//oReport.save(true, "pdf", "c:\\test.pdf", 1, -1, "");	// 다이얼로그표시유무, 파일타입, 파일명, 시작페이지, 끝페이지, 카피수, 옵션
	//oReport.embed("RexCtl");     // 이벤트핸들링은 직접 이 페이지에서 해야 함
}

function fnMain()
{
	//fnopen();
	fnSimple1();
	fnSimple2();
}

function fnSimple1()
{
	var oReport = GetfnParamSet("0");
	oReport.rptname = "unitest";
	oReport.datatype = "xml";
	oReport.iframe(ifrmRexPreview1);
}

function fnSimple2()
{
	var oReport = GetfnParamSet("1");
	oReport.rptname = "unitest2";
	oReport.type = "file";
	oReport.path = "http://localhost:8088/rexpert3/rebfiles/data.csv";
	//oReport.datatype = "xml";
	oReport.iframe(ifrmRexPreview2);
}

function fnGetPrinterInfo()
{
	var printerCombo = document.all.printerCombo;
 	for(i = printerCombo.length-1 ; i >= 0 ; i--)
 		printerCombo.options[i] = null;
 		
 		
 	var sPrinterList;
	var listPrinter;	
	try
	{
		//******************************************************
		// 프린터 정보를 얻어 옵니다.
		//******************************************************
		sPrinterList = RexCtl.GetPrinterList("@");
		listPrinter = sPrinterList.split("@");
	}
	catch(e)
	{
		alert(e.message);
		return;
	}
	 		
 	for(i = 0; i < listPrinter.length; i++)
 	    printerCombo.options[i] = new Option(listPrinter[i], listPrinter[i]);	
}

function fnChangePrinter()
{
	var paperbinCombo = document.all.paperbinCombo;
 	for(i = paperbinCombo.length-1 ; i >= 0 ; i--)
 		paperbinCombo.options[i] = null;
	
	var sPrinterName = printerCombo.value;
	var sPaperBin;
	var listPaperBin;

  	//alert(sPrinterName);
	try
	{
		//******************************************************
		// 프린터 트레이 정보를 얻어 옵니다.
		//******************************************************
		sPaperBin = RexCtl.GetPrinterBinInfoList(sPrinterName, "@");
		//alert(sPaperBin);
		listPaperBin = sPaperBin.split("@");
	}
	catch(e)
	{
		alert(e.message);
		return;
	}

	//******************************************************
	// 동일한 배열안에 트레이번호와 이름이 같이 포함됨
	// [번호1][이름1][번호2][이름2].....
	//******************************************************
	
 	for(i = 0; i < listPaperBin.length; i=i+2)
 	{
 		var sBinCode = listPaperBin[i];
 		var sBinName = listPaperBin[i+1];
 	    paperbinCombo.options[i/2] = new Option(sBinCode + " - " + sBinName ,sBinCode);	
 	}
 	
 	

}

</script>
<body onload="fnOpen();">
<form name="fileSend" action="http://dev.truck.or.kr/ClipReport4/reportInterFace.jsp" method="POST">
<input type="hidden" name="crfName" value="${rebFileName}" />
<input type="hidden" name="crfData" value="" />
</form>
	<!-- <button onclick="fnOpen();">레포트 보기</button>
	<INPUT type="button" value="설치된 프린터목록" onClick="fnGetPrinterInfo()">
	<SELECT name="printerCombo" ID="printerCombo" OnChange="fnChangePrinter()">
  		<OPTION>========== 프린터 선택 ========== </OPTION>
  	</SELECT>
	<SELECT name="paperbinCombo" ID="paperbinCombo">
		<OPTION>========== 프린터 트레이 목록 ========== </OPTION>
	</SELECT>
  	<hr> -->
	<!-- <iframe name="ifrmRexPreview1" id="ifrmRexPreview1" src='/RexServer30/rexpreview.jsp' width="100%" height="100%"></iframe> -->
	<iframe name="rex_ifrmRexPreview" id="rex_ifrmRexPreview" src='' width="100%" height="100%"></iframe>
	<!--RexViewer 브라우져 체크-->
	<div id="rexviewer_area" name="rexviewer_area"></div>	
	<script type="text/javascript">
		//rex_writeRexCtl("RexCtl", "0", "0");
	</script>
<SCRIPT language=JavaScript SRC="/RexServer30/plugin/markany/js/viewer.js"></SCRIPT>
		
<!-- 	<SCRIPT language=JavaScript SRC="/RexServer30/plugin/bcqre/js/bcqre.js"></SCRIPT> -->
</body>
</html>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" />  -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/js/rmate/rMateGridH5/Assets/rMateH5.css"/>

<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/js/rmate/LicenseKey/rMateGridH5License.js"></script>
<script type="text/javascript" src="/js/rmate/rMateGridH5/JS/rMateGridH5.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	
});

function goPage(pageNo){
	
	var keyword = '${searchKeyword}';
	
	document.f.pageIndex.value = pageNo;
	document.f.submit();
}
function search(){
	if( $("#searchStartDetailDate").val() == '' && $("#searchEndDetailDate").val() == '' ){
	}else if( $("#searchStartDetailDate").val() != '' && $("#searchEndDetailDate").val() != '' ){
		
		if( $("#searchStartDetailDate").val() >= $("#searchEndDetailDate").val() ){
			alert('검색 시작일이 종료일보다 작아야합니다.  ');
			return false;
		}
		
	}else{
		alert('검색일자를 선택해주세요.');
		return false;
	}
	
	document.f.pageIndex.value = 1;
	document.f.submit();
}
function goBosang( car_no ){
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();
	if (month < 10) month = "0" + month;
    if (day < 10) day = "0" + day;

	document.f.pageIndex.value = 1;
	document.f.start_acdnt_ymd.value = (year-3) + "" + month + "" + day;
	document.f.end_acdnt_ymd.value = year + "" + month + "" + day;
	document.f.searchCondition.value = 'car_no';
	document.f.searchKeyword.value = car_no ;
	document.f.action = '/netCounter/inquiryService/accountInquiry/compenInfo.do' ;
	document.f.submit();
	return false;
}
$(document).ready(function(){
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	
	<%-- datepicker 설정--%>
	$("#searchStartDetailDate").datepicker({
			showOn : 'both',
			changeYear : true,
			changeMonth : true,
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
			      '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
			showMonthAfterYear : true,
			dateFormat : 'yymmdd',
			buttonImageOnly : true,
			buttonImage : '/images/truck/board/calendar.gif',
			yearRange : (sYear-20)+':'+sYear
	});
	$("#searchEndDetailDate").datepicker({
			showOn : 'both',
			defaultDate : "+1w",
			changeYear : true,
			changeMonth : true,
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
			      '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
			showMonthAfterYear : true,
			dateFormat : 'yymmdd',
			buttonImageOnly : true,
			buttonImage : '/images/truck/board/calendar.gif',
			yearRange : (sYear-20)+':'+sYear
	});
	
	$('form#f input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			search();
			return false;
		}
	});
	
	<%-- 조회 --%>	
	$('a#f_submit').on('click',function(event){
		event.preventDefault();
		search();
	});
	
	<%-- 초기화 --%>
	$('a#f_reset').on('click',function(event){
		$("#searchStartDetailDate").val('');
		$("#searchEndDetailDate").val('');
		goPage(1);
	});
	
	<%-- 보상정보조회 이동 --%>
	$('a#f_bosang').on('click',function(event){
		goBosang( $(this).attr('car_no') );
	});
	
	$('form#f input[name="searchKeyword"]').focus();
});

function printDocument(){
	document.pf.searchCondition.value=document.f.searchCondition.value;
	document.pf.searchStartDetailDate.value=document.f.searchStartDetailDate.value;
	document.pf.searchEndDetailDate.value=document.f.searchEndDetailDate.value;
	document.pf.searchKeyword.value=document.f.searchKeyword.value;
	document.pf.napip_yn.value=document.f.napip_yn.value;
	
	document.pf.action = "<c:url value='/netCounter/inquiryService/contractInquiry/carInquiryPrint.do'/>";
	document.pf.target="carInquiryPrintPopup";
	window.open("",'carInquiryPrintPopup','toolbar=no,location=no,status=no,menubar=no, scrollbars=yes,resizable=yes,width=1000,height=800 top=10 left=10');
   	document.pf.submit();
}


var jsVars = "rMateOnLoadCallFunction=gridReadyHandler";
var jsVars2 = "rMateOnLoadCallFunction=gridReadyHandler2";

rMateGridH5.create("grid1", "gridHolder", jsVars, "100%", "100%");
rMateGridH5.create("grid2", "gridHolder2", jsVars2, "100%", "100%");

function gridReadyHandler(id) {
	
	gridApp = document.getElementById(id);  // 그리드를 포함하는 div 객체
    gridRoot = gridApp.getRoot();   // 데이터와 그리드를 포함하는 객체
	
	document.getElementById(id).setLayout(layoutStr);
	document.getElementById(id).setData(gridData);
	
	var layoutCompleteHandler = function(event) {
        dataGrid = gridRoot.getDataGrid();  // 그리드 객체
    };
 
    gridRoot.addEventListener("layoutComplete", layoutCompleteHandler);
}

function gridReadyHandler2(id) {
	document.getElementById(id).setLayout(layoutStr2);
	document.getElementById(id).setData(gridData2);
	
	gridApp2 = document.getElementById("grid2");    // 데이터와 그리드를 포함하는 객체
    gridRoot2 = gridApp2.getRoot();
	
    var layoutCompleteHandler2 = function(event) {
        dataGrid2 = gridRoot2.getDataGrid();    // 그리드 객체
    };
    
    gridRoot2.addEventListener("layoutComplete", layoutCompleteHandler2);
}

var gridApp, gridRoot, dataGrid, collection;
var gridApp, gridRoot2, dataGrid2, collection2;



function styleAmount(item, column) {
    var value = column.getDataField();
    if (item[value] == "해지")
        return { color:"#FF0000", fontWeight:"bold" };
    if (item[value] == "최고기간")
        return { color:"#FF00FF", fontWeight:"bold" };
    return null;
}

function styleAmount2(item, column) {
	var value = column.getDataField();
	value = "계약상태";
    if (item[value] == "해지")
        return { color:"#FF0000", fontWeight:"bold" };
    if (item[value] == "최고기간")
        return { color:"#FF00FF", fontWeight:"bold" };
    return null;
}


var layoutStr =
	'<rMateGrid>\
		<NumberFormatter id="numfmt" useThousandsSeparator="true"/>\
		<PercentFormatter id="percfmt"/>\
		<NumberMaskFormatter id="datefmt" formatString="####.##.##"/>\
		<DataGrid id="dg1" sortableColumns="true" headerHeight="50" rowHeight="30" borderStyle="solid" borderColor="#CCCCCC" headerColors="[#E8ECF5,#D4E2E7]" headerStyleName="gridHeaderStyle"  showHeaders="true" horizontalScrollPolicy="auto" selectionMode="singleRow">\
		<groupedColumns>\
			<DataGridColumn id="dg1col1" dataField="CNT" headerText="순번" width="40" textAlign="center"/>\
			<DataGridColumn id="dg1col2" dataField="Carno" headerText="차량번호" width="90" textAlign="center"/>\
			<DataGridColumn id="dg1col3" dataField="차종" width="40" textAlign="center"/>\
			<DataGridColumn id="dg1col4" dataField="적재정량" headerText="적재\&lt\;br\&gt\;정량" width="50" textAlign="center"/>\
			<DataGridColumn id="dg1col5" dataField="담보" width="50" textAlign="center"/>\
			<DataGridColumn id="dg1col6" dataField="특별요율" headerText="특별\&lt\;br\&gt\;요율" width="40" textAlign="center"/>\
			<DataGridColumn id="dg1col7" dataField="보상한도" headerText="보상\&lt\;br\&gt\;한도" width="50" textAlign="center"/>\
			<DataGridColumn id="dg1col8" dataField="계약상태" width="60" textAlign="center" styleJsFunction="styleAmount"/>\
			<DataGridColumn id="dg1col9" dataField="납입구분" width="60" textAlign="center" styleJsFunction="styleAmount2"/>\
			<DataGridColumn id="dg1col10" dataField="계약기간" width="150" textAlign="center" styleJsFunction="styleAmount2"/>\
			<DataGridColumn id="dg1col11" dataField="유효기간" width="150" textAlign="center" styleJsFunction="styleAmount2"/>\
			<DataGridColumn id="dg1col12" dataField="차회납입일" headerText="차회\&lt\;br\&gt\;납입일" width="70" textAlign="center" formatter="{datefmt}" styleJsFunction="styleAmount2"/>\
			<DataGridColumn id="dg1col13" dataField="차회분담금" headerText="차회\&lt\;br\&gt\;분담금" width="60" textAlign="right" formatter="{numfmt}" styleJsFunction="styleAmount2"/>\
			<DataGridColumn id="dg1col14" dataField="최고기간" width="150" textAlign="center" styleJsFunction="styleAmount2"/>\
			<DataGridColumn id="dg1col15" dataField="보상조회" headerText="보상\&lt\;br\&gt\;조회" width="30" textAlign="center"/>\
		</groupedColumns>\
		</DataGrid>\
		<Style>\
		.gridHeaderStyle {\
			alternatingItemColors:#E8ECF5;\
			fontWeight:bold;\
			boder-style:solid;\
			border-color:#CCCCCC;\
			border-width:1px;\
		}\
        </Style>\
	</rMateGrid>';	
	
var gridData = '${jsonInfo}';

var layoutStr2 =
	'<rMateGrid>\
		<NumberFormatter id="numfmt" useThousandsSeparator="true"/>\
		<PercentFormatter id="percfmt"/>\
		<NumberMaskFormatter id="datefmt" formatString="####.##.##"/>\
		<DataGrid id="dg2" sortableColumns="true" headerHeight="50" rowHeight="30" borderStyle="solid" borderColor="#CCCCCC" headerColors="[#E8ECF5,#D4E2E7]" headerStyleName="gridHeaderStyle"  showHeaders="true" horizontalScrollPolicy="auto" selectionMode="singleRow">\
		<groupedColumns>\
			<DataGridColumn id="dg2col1" dataField="차량번호" width="95" textAlign="center"/>\
			<DataGridColumn id="dg2col2" dataField="계약번호" width="95" textAlign="center"/>\
			<DataGridColumn id="dg2col3" dataField="담보" width="50" textAlign="center"/>\
			<DataGridColumn id="dg2col4" dataField="계약상태" width="60" textAlign="center"/>\
			<DataGridColumn id="dg2col5" dataField="분담금1" width="70" textAlign="right" formatter="{numfmt}"/>\
			<DataGridColumn id="dg2col6" dataField="영수일자1" width="80" textAlign="center" formatter="{datefmt}"/>\
			<DataGridColumn id="dg2col7" dataField="분담금2" width="70" textAlign="right" formatter="{numfmt}"/>\
			<DataGridColumn id="dg2col8" dataField="영수일자2" width="80" textAlign="center" formatter="{datefmt}"/>\
			<DataGridColumn id="dg2col9" dataField="분담금3" width="70" textAlign="right" formatter="{numfmt}"/>\
			<DataGridColumn id="dg2col10" dataField="영수일자3" width="80" textAlign="center" formatter="{datefmt}"/>\
			<DataGridColumn id="dg2col11" dataField="분담금4" width="70" textAlign="right" formatter="{numfmt}"/>\
			<DataGridColumn id="dg2col12" dataField="영수일자4" width="80" textAlign="center" formatter="{datefmt}"/>\
			<DataGridColumn id="dg2col13" dataField="분담금5" width="70" textAlign="right" formatter="{numfmt}"/>\
			<DataGridColumn id="dg2col14" dataField="영수일자5" width="80" textAlign="center" formatter="{datefmt}"/>\
			<DataGridColumn id="dg2col15" dataField="분담금6" width="70" textAlign="right" formatter="{numfmt}"/>\
			<DataGridColumn id="dg2col16" dataField="영수일자6" width="80" textAlign="center" formatter="{datefmt}"/>\
		</groupedColumns>\
		</DataGrid>\
		<Style>\
		.gridHeaderStyle {\
			alternatingItemColors:#E8ECF5;\
			fontWeight:bold;\
			boder-style:solid;\
			border-color:#CCCCCC;\
			border-width:1px;\
		}\
        </Style>\
	</rMateGrid>';	
	
var gridData2 = '${jsonInfo2}';

	
	</script>
<style>
.tbWork_st01 td {height: auto !important;}
.tbWork_st01 tr.last td {border-bottom:1px solid #e4ebee !important;}
</style>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/contrac_tit.gif" alt="계약관리" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<a href="/netCounter/inquiryService/contractInquiry/carInquiry.do" >계약관리</a>
						<span>자동차공제조회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/contrac_con_tit02.gif" alt="고객님께서 가입하신 공제계약의 상세내용을 확인하실 수 있습니다" /></p>
					<!-- 계약관리 탭메뉴 -->
					<div class="tabGruop">
						<ul class="tab">
							<li class="on"><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><span>자동차공제조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/accInquiry.do"><span>재해공제조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/carryInquiry.do"><span>적재물공제조회</span></a></li>
						</ul>
					</div>
					<div class="conSection clfix">
						<h3 class="hide">자동차공제조회</h3>
						<!-- 차량조회검색 s -->
						<h4 class="netsubTit" ><span class="blueBul">자동차공제조회</span></h4>
						<form:form id="f" name="f" commandName="searchVO" method="post" action="/netCounter/inquiryService/contractInquiry/carInquiry.do" >
						<fieldset>
							<legend>계약정보조회</legend>
							<form:hidden path="pageIndex" />
							<form:hidden path="start_acdnt_ymd" /><%--보상정보조회용 --%>
							<form:hidden path="end_acdnt_ymd" /><%--보상정보조회용 --%>
							<input name="searchCondition" id="searchCondition" type="hidden" value="car_no" />
							<div class="searchBox02 clfix mB30">
								<!-- 기간검색 -->
								<div class="searchUp">
									<div class="searchL">
										<dl>
											<dt>기간검색</dt>
											<dd>
												<label for="startdate" class="hide">시작날짜</label>
												<form:input type="text" path="searchStartDetailDate" readonly="true" title="시작날짜" style="width:97px;" class="alC"/>
												&#126;
												<label for="searchEndDetailDate" class="hide">종료날짜</label>
												<form:input type="text" path="searchEndDetailDate" readonly="true" title="종료날짜" style="width:97px;" class="alC"/>
											</dd>
										</dl>
										<!-- <span class="noti" >기간을 설정하지 않으면 모든 차량이 조회됩니다.  &#46;</span>  -->
										<span class="napip" ><form:checkbox path="napip_yn" value="Y"  class="check" /><form:errors cssClass="formError" path="napip_yn" />
										<label for="napip_yn">체크시 차회 납입일 기준으로 조회됩니다&#46;</label></span>
									</div>
								</div>
								<!-- 차량번호검색 -->
								<div class="searchDown">
									<div class="searchL">
										<dl>
											<dt>차량번호</dt>
											<dd ><label for="keyword" class="hide">차량번호</label>
											<form:input path="searchKeyword" title="차량번호 입력해주세요" class="txt" style="width:275px"/></dd>
										</dl>
										<span class="noti">차량번호를 입력하지 않으면 모든 차량이 조회됩니다&#46;</span>
									</div>
									<!-- 검색버튼 -->
									<div class="btn_absol">
										<span class="btn_pack btn_type04"><a id="f_submit" href="#;"  class="bold">검색하기</a></span>
										<span class="btn_pack btn_type05"><a id="f_reset" href="#;" class="bold">검색초기화</a></span>
									</div>
								</div>
							</div>
						</fieldset>
						</form:form>
						<!-- 프린트 팝업을 위한 form -->
						<form id="pf" name="pf" method="post" >
							<input name="searchCondition" id="searchCondition" type="hidden" value="" />
							<input name="searchStartDetailDate" id="searchStartDetailDate" type="hidden" value="" />
							<input name="searchEndDetailDate" id="searchEndDetailDate" type="hidden" value="" />
							<input name="searchKeyword" id="searchKeyword" type="hidden" value="" />
							<input name="napip_yn" id="napip_yn" type="hidden" value="" />
						</form>					
						<%-- <div class="searchBox03">
							<form id="f" name="f" action="/netCounter/inquiryService/contractInquiry/carDeductInquiry.do" method="post">
								<p class="icoTit bold">조회 차량번호를 입력하세요&#46;</p>
								<label class="hide" for="find">차량번호조회</label>
								<input name="searchKeyword" class="txt" id="searchKeyword" type="text" value="${searchVO.searchKeyword }" />
								<input name="searchCondition" class="txt" id="searchCondition" type="hidden" value="car_no" />
								<a id="f_submit" href="#;" class="btn_pack btn_type11">
									<span>검색하기</span>
								</a>
							</form>
						</div> --%>
						<!--// 차량조회검색 e -->
						<!-- 차량조회검색결과 s --><!-- !검색 시 아래 style로 노출!-->
								<div class="netTitbox">
									<h4 class="netTit">${loginVO.agentNm} 고객님께서 가입하신 <span class="txtColor02">자동차공제</span> <span class="txtColor03">계약현황</span> 입니다&#46;</h4>
								</div>
								<!-- 인쇄하기버튼
								<div class="btn_absol" style="position: absolute; margin-left: 89%; margin-top: -2%;">
									<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="#;" onclick="printDocument();return false;"title="새창열림" >인쇄하기</a></span>
								</div> -->
								<h5 class="netsubTit" ><span class="greenBul">자동차공제 계약현황</span></h5>
								<!-- 가입중인차량현황 s -->
								<div class="tbWork11">
									<p class="etcTxt">&#40;기준일자 &#58; <fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> &#41;</p>
									<div id="gridHolder" style="width:900x; height:505px;"></div>
								</div><!--// 가입중인차량현황 e -->
								
								<div class="searchBox031 clfix mB10">
									<span class="btn_pack btn_type04"><a id="f_submit" href="#;"  class="bold">상세보기</a></span>
								</div>
								
								<div class="searchBox02 clfix mB10">
									<div class="searchL">
										<dl>
											<span class="noti2"><b>상세보기</b> : 분담금 납입내역 조회  &nbsp;&nbsp;&nbsp;<b>보상조회</b> : 최근 3년간 사고사항 조회가능</span>
											<span class="noti2"><b>특별요율</b> : 자동차의 구조나 운행실태가 동종차량과 상이한 자동차의 특별위험에 적용하는 요율</span>
										</dl>
										<div class="btn_absol">
									</div>
									</div>
								</div>
								<div id="gridHolder2" style="width:900x; height:170px;"></div>
						<!--// 차량조회검색결과 e-->
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>

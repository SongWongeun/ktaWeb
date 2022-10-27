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
<script src="/js/jquery/jquery-ui.js"></script>

<link rel="stylesheet" href="/webPonent-Grid/css/webponent.grid.css" />
<link rel="stylesheet" href="/webPonent-Grid/css/webponent.grid.flat.css" />
<script src="/webPonent-Grid/external/jquery-1.11.1.min.js"></script>
<script src="/webPonent-Grid/external/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/webPonent-Grid/external/jquery.mousewheel.min.js"></script>
<script src="/webPonent-Grid/external/underscore-min.js"></script>
<script src="/webPonent-Grid/webponent.grid.js"></script>
<script src="/webPonent-Grid/webponent.report.js"></script> <!-- 엑셀&pdf -->
<script src="/webPonent-Grid/external/json2.min.js"></script> <!-- 엑셀&pdf -->
<script src="/webPonent-Grid/external/lz-string.js"></script> <!-- 엑셀&pdf -->
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	
});


function goPage(pageNo){
	
	document.f.pageIndex.value = pageNo;
	document.f.submit();
}
function search() {
	
	if ($("#start_acdnt_ymd").val() == ''
			&& $("#end_acdnt_ymd").val() == '') {
	} else if ($("#start_acdnt_ymd").val() != ''
			&& $("#end_acdnt_ymd").val() != '') {

		if ($("#start_acdnt_ymd").val() >= $("#end_acdnt_ymd")
				.val()) {
			alert('검색 시작일이 종료일보다 작아야합니다.  ');
			return false;
		}

	} else {
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
    
	document.f.start_acdnt_ymd.value = (year-3) + "" + month + "" + day;
	document.f.end_acdnt_ymd.value = year + "" + month + "" + day;
	document.f.dambo.value = '2';
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
	$("#start_acdnt_ymd").datepicker({
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
	$("#end_acdnt_ymd").datepicker({
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
	/* $('a#f_reset').on('click',function(event){
		$("#saupja_no").val('');
		$("#gyeyak_jibu_cd").val('');
		$("#searchStartDetailDate").val('');
		$("#searchEndDetailDate").val('');
		goPage(1);
	}); */
	
	<%-- 보상정보조회 이동 --%>
	$('a#f_bosang').on('click',function(event){
		goBosang( $(this).attr('car_no') );
	});
	
	$('form#f input[name="searchKeyword"]').focus();
	<%-- 조회기간년도세팅 --%>
	$("#prevYear").click(function(){
		var prevY = $("#searchYear").html();
		console.log("이전버튼: "+prevY);
		if(prevY > sYear-3) {
			$("#searchYear").html(prevY-1);
		}else if(prevY == sYear-3){
			$("#searchYear").html(prevY);
		}
	});
	$("#nextYear").click(function(){
		var prevY = $("#searchYear").html();
		console.log("다음버튼: "+prevY);
		if(prevY == sYear) {
			$("#searchYear").html(prevY);
		}else if(prevY < sYear){
			$("#searchYear").html(parseInt(prevY)+1);
		}
	});
	
	<%-- 조회기간월 셋팅--%>
	$("#prevMonth").click(function(){
		var prevM = $("#searchMonth").html();
		console.log("이전버튼: "+prevM);
		if(prevM <= 12&&prevM>1) {
			$("#searchMonth").html(prevM-1);
		}else if(prevM ==1){
			$("#searchMonth").html(prevM);
		}
	});
	$("#nextMonth").click(function(){
		var prevM = $("#searchMonth").html();
		console.log("다음버튼: "+prevM);
		if(prevM >= 1&&prevM<12) {
			$("#searchMonth").html(parseInt(prevM)+1);
		}else if(prevM == 12){
			$("#searchMonth").html(prevM);
		}
	});
	
	<%-- 월별 조회 선택시 event --%>
	$("#monYearChange").click(function(){
		var y = $("#searchYear").html();
		var m = $("#searchMonth").html();
		if(m.length == 2){
			$("#start_acdnt_ymd").val(y+m+'01');
			$("#end_acdnt_ymd").val( y+m+new Date( y, m, '').getDate()	);
		}else{
			$("#start_acdnt_ymd").val( y+'0'+m+'01' );
			$("#end_acdnt_ymd").val( y+'0'+m+new Date( y, m, '').getDate()	);
		}
	});
	
	$("#f_reset").click(function(){
		$('select[name="gyeyak_jibu_cd"] option[value=""]').attr('selected','selected');
		$('select[name="agent_no"] option[value=""]').attr('selected','selected');
		setTerm('6');
		$("#searchKeyword").val("");
	});		
});
<%-- 개월수 선택시 --%>
function setTerm(num){
	var monthTerm = num;
	console.log(monthTerm);
	
	$.ajax({
		type: "post",
		async: true,
		url : "/netCounter/inquiryService/accountInquiry/compentInfoSearchTerm.do?monthTerm="+monthTerm,
		success : function(date) {
			console.log("ajax: "+date);
			$("#start_acdnt_ymd").val(date);
			$("#end_acdnt_ymd").val($.datepicker.formatDate('yymmdd', new Date()));
			$("#searchYear").html(date.substr(0,4));
			$("#searchMonth").html(date.substr(4,2));
		}
	});
}

function printDocument(){
	document.pf.searchCondition.value = document.f.searchCondition.value;
	document.pf.start_acdnt_ymd.value = document.f.start_acdnt_ymd.value;
	document.pf.end_acdnt_ymd.value = document.f.end_acdnt_ymd.value;
	document.pf.searchKeyword.value = document.f.searchKeyword.value;
	document.pf.saupja_no.value = document.f.saupja_no.value;
	document.pf.saupjang_seq.value = document.f.saupjang_seq.value;
	document.pf.agent_no.value = document.f.agent_no.value;
	
	document.pf.action = "<c:url value='/netCounter/inquiryService/contractInquiry/accInquiryPrint.do'/>";
	document.pf.target="carInquiryPrintPopup";
	window.open("",'carInquiryPrintPopup','toolbar=no,location=no,status=no,menubar=no, scrollbars=yes,resizable=yes,width=1000,height=800 top=10 left=10');
   	document.pf.submit();
}

function changeSelect(value){
	if(value==""){
		document.f.saupja_no.value = "";
		document.f.agent_no.value = "";
		document.f.saupjang_seq.value = "";
	}else{
		
	
	value_array = value.split("^");

	var value_0 = value_array[0];
	var value_1 = value_array[1];
	var value_2 = value_array[2];
	
	document.f.saupja_no.value = value_0;
	document.f.agent_no.value = value_1;
	document.f.saupjang_seq.value = value_2;
	}

}
</script>
<style>
.tbWork_st01 td {height: 32px !important;}
.tbWork_st01 tr.last td {border-bottom:1px solid #e4ebee !important;}
.CI-GRID-WRAPPER{
	width:99.8% !important;
	height:350px !important;
	padding-bottom:0px !important;
}

.CI-GRID-HEADER-TABLE-THEAD td{
	line-height:15px !important;
}

.CI-GRID-HEADER-TABLE-THEAD tr {
	height:40px !important;
}

.CI-GRID-BODY-TABLE-TBODY tr {
	line-height: 30px;
}

.right-align{
	text-align:right !important;
}
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
						<span>재해공제조회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/contrac_con_tit02.gif" alt="고객님께서 가입하신 공제계약의 상세내용을 확인하실 수 있습니다" /></p>
					<!-- 계약관리 탭메뉴 -->
					<div class="tabGruop">
						<ul class="tab">
							<li><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><span>자동차공제조회</span></a></li>
							<li class="on"><a href="/netCounter/inquiryService/contractInquiry/accInquiry.do"><span>재해공제조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/carryInquiry.do"><span>적재물공제조회</span></a></li>
						</ul>
					</div>
					<div class="conSection clfix">
						<h3 class="hide">재해공제조회</h3>
						<!-- 차량조회검색 s -->
						<h4 class="netsubTit" ><span class="blueBul">재해공제조회</span></h4>
						<form:form id="f" name="f" commandName="searchVO" method="post" action="/netCounter/inquiryService/contractInquiry/accInquiry.do" >
						<fieldset>
							<legend>계약정보조회</legend>
							<form:hidden path="pageIndex" />
							<%--<form:hidden path="start_acdnt_ymd" /> 보상정보조회용 --%>
							<%--<form:hidden path="end_acdnt_ymd" /> 보상정보조회용 --%>
							
							<form:hidden path="saupja_no" />
							<form:hidden path="agent_no" />
							<form:hidden path="saupjang_seq" />
							<form:hidden path="dambo"/>
							<input name="searchCondition" id="searchCondition" type="hidden" value="car_no" />
							<div class="searchBox02 type2 clfix mB5">	<!-- 20161208 수정 -->
								<!-- 20161208 추가 -->
								<!-- 지부선택 -->
								<div class="searchUp">
									<div class="searchL">
										<dl>
											<dt>지부선택</dt>
											<dd>
										<select id="gyeyak_jibu_cd" name="gyeyak_jibu_cd" >
											<option value="">지부전체</option>
											<c:forEach items="${saupjaList}" var="saupja">
											<c:if test="${saupja.gyeyak_jibu=='01'}" ><option value="01" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >본부</option></c:if>        
											<c:if test="${saupja.gyeyak_jibu=='02'}" ><option value="02" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >서울</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='03'}" ><option value="03" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >부산</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='04'}" ><option value="04" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >대구</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='05'}" ><option value="05" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >인천</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='06'}" ><option value="06" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >광주</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='07'}" ><option value="07" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >대전</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='08'}" ><option value="08" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >울산</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='09'}" ><option value="09" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >경기</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='10'}" ><option value="10" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >강원</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='11'}" ><option value="11" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >충북</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='12'}" ><option value="12" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >충남</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='13'}" ><option value="13" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >전북</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='14'}" ><option value="14" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >전남</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='15'}" ><option value="15" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >경북</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='16'}" ><option value="16" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >경남</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='17'}" ><option value="17" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >제주</option></c:if>
											<c:if test="${saupja.gyeyak_jibu=='18'}" ><option value="18" <c:if test="${saupja.gyeyak_jibu==searchVO.gyeyak_jibu_cd }">selected="selected"</c:if> >직할</option></c:if>
											</c:forEach>		
										</select>
											</dd>
										</dl>
										<dl style="padding-left:100px;">
											<dt>사업자선택</dt>
											<dd>
											<select onchange="changeSelect(this.value)">
												<option value="">사업자전체</option>
												<c:forEach items="${saupjaList }" var="saupja"><option value="${saupja.saupnum}^${saupja.agent_no}^${saupja.saupjang_seq}" 
												<c:if test="${searchVO.saupja_no ==saupja.saupnum}">
												selected="selected"
												</c:if> 
												>${saupja.agent_nm }</option></c:forEach>
											</select>	
											</dd>
										</dl>
									</div>
								</div>
								<!-- //20161208 추가 -->
								<!-- 기간검색 -->
								<!-- 20161208 수정 -->
									<div class="searchCenter">
										<!-- 20161208 수정 -->
										<div class="searchL">
											<dl>
												<dt>조회기간 선택</dt>
												<dd>
													<label for="startdate" class="hide">시작날짜</label>
													<input type="text" id="start_acdnt_ymd" name="start_acdnt_ymd" value="${searchVO.start_acdnt_ymd}" readonly="true" title="시작날짜" style="width:97px;" class="alC"/>
													&#126;
													<label for="searchEndDetailDate" class="hide">종료날짜</label>
													<input type="text" id="end_acdnt_ymd" name="end_acdnt_ymd" value="${searchVO.end_acdnt_ymd}" readonly="true" title="종료날짜" style="width:97px;" class="alC"/>
													<span class="btn_pack btn_type21 mL10"><a href="javascript:;" id="setTermMonth1" onclick="setTerm('1')">1개월</a></span>
													<span class="btn_pack btn_type21"><a href="javascript:;" id="setTermMonth3" onclick="setTerm('3')">3개월</a></span>
													<span class="btn_pack btn_type21"><a href="javascript:;" id="setTermMonth6" onclick="setTerm('6')">6개월</a></span>
													<span class="btn_pack btn_type21"><a href="javascript:;" id="setTermMonth12" onclick="setTerm('12')">12개월</a></span>
												</dd>
											</dl>
											<div class="napip mT10">
												<div class="searchBtn">
													<a href="javascript:;" class="btnPrev" id="prevYear"><img src="/images/truck/btn/btn_search_prev.gif" alt="이전 연도" /></a>
													<span id="searchYear">${fn:substring(searchVO.start_acdnt_ymd,0,4) }</span>년
													<a href="javascript:;" class="btnNext" id="nextYear"><img src="/images/truck/btn/btn_search_next.gif" alt="다음 연도" /></a>
												</div>
												<div class="searchBtn">
													<a href="javascript:;" class="btnPrev" id="prevMonth"><img src="/images/truck/btn/btn_search_prev.gif" alt="이전 달" /></a>
													<span id="searchMonth">${fn:substring(searchVO.start_acdnt_ymd,4,6) }</span>월
													<a href="javascript:;" class="btnNext" id="nextMonth"><img src="/images/truck/btn/btn_search_next.gif" alt="다음 달" /></a>
												</div>
												<span class="btn_pack btn_type21 mL10"><a href="javascript:;" id="monYearChange">월별선택</a></span>
											</div>
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
										<!-- 20161208 삭제
										<span class="noti">차량번호를 입력하지 않으면 모든 차량이 조회됩니다&#46;</span>
										//20161208 삭제 -->
									</div>
									<!-- 20161208 삭제 
									<div class="btn_absol">
										<span class="btn_pack btn_type04"><a id="f_submit" href="#;"  class="bold">검색하기</a></span>
										<span class="btn_pack btn_type05"><a id="f_reset" href="#;" class="bold">검색초기화</a></span>
									</div>
									//20161208 삭제 -->
								</div>
							</div>
							<!-- 20161208 추가 -->
							<!-- 검색버튼 -->
							<div class="btnboxR mT5">
								<span class="btn_pack btn_type04"><a id="f_submit" href="#;" class="bold">조회</a></span>
								<span class="btn_pack btn_type05"><a id="f_reset" href="#;" class="bold">검색초기화</a></span>
							</div>
							<!-- //20161208 추가 -->
						</fieldset>
						</form:form>		
						<!-- 프린트 팝업을 위한 form -->
						<form id="pf" name="pf" method="post">
							<input name="searchCondition" type="hidden" value="" /> 
							<input name="start_acdnt_ymd" type="hidden" value="" />
							<input name="end_acdnt_ymd" type="hidden" value="" /> 
							<input name="searchKeyword" type="hidden" value="" /> 
							<input name="saupja_no" type="hidden" value="" /> 
							<input name="saupjang_seq" type="hidden" value="" /> 
							<input name="agent_no" type="hidden" value="" /> 
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
								<!-- 20161208 삭제 
								<div class="netTitbox">
									<h4 class="netTit">${loginVO.agentNm} 고객님께서 가입하신 <span class="txtColor02">재해공제</span> <span class="txtColor03">계약현황</span> 입니다&#46;</h4>
								</div>
								//20161208 삭제 -->

								<!-- 20161208 수정 및 추가 -->
								<div class="tblTop mT25">
									<span style="margin-left:580px;">(금액단위:원)</span>
									<!-- 인쇄하기버튼 -->
									<div class="btn_absol">
										<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="#;" onclick="printDocument();return false;" title="새창열림" >인쇄하기</a></span>
										<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="#;" id="exportGridEx" title="새창열림" >EXCEL</a></span>
										<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="#;" onclick="printDocument();return false;" title="새창열림" >PDF</a></span>
									</div>
								</div>
								<form id="export-form" style="display: none;"></form>
								<!-- //20161208 수정 및 추가 -->

								<!-- 20161208 삭제 
								<h5 class="netsubTit" ><span class="greenBul">재해공제 계약현황</span></h5>
								//20161208 삭제 -->

								<!-- 그리드영역 -->
								<div id="grid-accInquiry">
									<table class="tbWork_st01 type2">
									<thead>
										<tr>
											<th scope="col" class="byss">순번</th>
											<th scope="col" class="byss">차가입번호</th>
											<th scope="col">조합원명</th>
											<th scope="col">차량번호</th>
											<th scope="col">상품종류</th>
											<th scope="col">이름</th>
											<th scope="col">계약번호</th>
											<th scope="col">계약상태</th>
											<th scope="col">계약기간</th>
											<th scope="col">분담금총액</th>
											<th scope="col">수납금액</th>
											<th scope="col">분납회차</th>
											<th scope="col">차회납입일<a href="#" class="mL5"><img
													src="/images/truck/board/btn_tbl_down.gif" alt="내림차순" />
												<!-- <img src="/images/truck/board/btn_tbl_up.gif" alt="오름차순" /> --></a></th>
											<th scope="col">차회분담금</th>
											<th scope="col">보상건수<br />(최근3년기준)
											</th>
											<th scope="col" class="byss"></th>
											<th scope="col" class="byss">에이전트NO</th>
											<th scope="col" class="byss">사업장SEQ</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${carStatusInquiryList!=null}">
											<c:forEach var="carStatusInquiry" items="${carStatusInquiryList}" varStatus="s">
												<tr>
													<td class="byss">${s.count }</td>
													<td class="byss">${carStatusInquiry.CAR_GAIP_NO }</td>
													<td>${carStatusInquiry.AGENT_NM }</td>
													<td><a href="#" class="link">${carStatusInquiry.CAR_NO }</a></td>
													<td>${carStatusInquiry.JAEHAE_CD}</td>
													<td>${carStatusInquiry.JONGSA_NM }</td>
													<td>${carStatusInquiry.GYEYAK_NO }</td>
													<td>${carStatusInquiry.GYEYAK_STATE_CD }</td>
													<td>${carStatusInquiry.GYEYAK_SYMD }~${carStatusInquiry.GYEYAK_EYMD }</td>
													<td>${carStatusInquiry.BUNDAM_AMT }</td>
													<td>${carStatusInquiry.TOT_NAPIP_AMT }</td>
													<td>${carStatusInquiry.BUNNAP_CNT }/${carStatusInquiry.NAPIP_GB_CD }</td>
													<td>${carStatusInquiry.YUHYO_SYMD }</td>
													<td>${carStatusInquiry.BUNNAP_AMT }</td>
													<td>${carStatusInquiry.BOSANG_CNT }건</td>
													<td class="byss">상세</td>
													<td class="byss">${carStatusInquiry.AGENT_NO }</td>
													<td class="byss">${carStatusInquiry.SAUPJANG_SEQ }</td>

												</tr>
											</c:forEach>
											</c:if>
									</tbody>
								</table>
								
								<div id="grid-accInquiryTemp">
								<table>
									<thead>
										<tr>
											<th name="index" align="center" width="0%" visibility="hidden" class="byss">순번</th>
											<th name="CAR_GAIP_NO" align="center" width="0%" visibility="hidden" class="byss">차가입번호</th>
											<th name="AGENT_NM" align="center" width="10%">조합원명</th>
											<th name="CAR_NO" align="center" width="9%">차량번호</th>
											<th name="JAEHAE_CD" align="center" width="4%">상품<br/>종류</th>
											<th name="JONGSA_NM" align="center" width="5%" sortable="false">이름</th>
											<th name="GYEYAK_NO" align="center" width="10%">계약번호</th>
											<th name="GYEYAK_STATE_CD" align="center" width="6%">계약<br/>상태</th>
											<th name="GYEYAK_YMD" align="center" width="15%">계약기간</th>
											<th name="BUNDAM_AMT" align="center" width="6%">분담금<br/>총액</th>
											<th name="TOT_NAPIP_AMT" align="center" width="6%">수납<br/>금액</th>
											<th name="BUNNAP_CNT" align="center" width="4%">분납<br/>회차</th>
											<th name="YUHYO_SYMD" align="center" width="8%">차회<br/>납입일</th>
											<th name="BUNNAP_AMT" align="center" width="6%">차회<br/>분담금</th>
											<th name="BOSANG_CNT" align="center" width="6%">보상<br/>건수</th>
											<th name="YOYAK" align="center" width="4.9%" sortable="false" class="byss">상세<br/>보기</th>
											<th name="AGENT_NO" align="center" width="0%" visibility="hidden" class="byss"></th>
											<th name="SAUPJANG_SEQ" align="center" width="0%" visibility="hidden" class="byss"></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td name="index" bind="index" visibility="hidden" class="byss"></td>
											<td name="CAR_GAIP_NO" bind="CAR_GAIP_NO" class="byss"></td>
											<td name="AGENT_NM" bind="AGENT_NM"></td>
											<td name="CAR_NO" bind="CAR_NO"></td>
											<td name="JAEHAE_CD" bind="JAEHAE_CD" visibility="hidden"></td>
											<td name="JONGSA_NM" bind="JONGSA_NM"></td>
											<td name="GYEYAK_NO" bind="GYEYAK_NO"></td>
											<td name="GYEYAK_STATE_CD" bind="GYEYAK_STATE_CD"></td>
											<td name="GYEYAK_YMD" bind="GYEYAK_YMD"></td>
											<td name="BUNDAM_AMT" bind="BUNDAM_AMT" class="right-align"></td>
											<td name="TOT_NAPIP_AMT" bind="TOT_NAPIP_AMT" class="right-align"></td>
											<td name="BUNNAP_CNT" bind="BUNNAP_CNT"></td>
											<td name="YUHYO_SYMD" bind="YUHYO_SYMD"></td>
											<td name="BUNNAP_AMT" bind="BUNNAP_AMT" class="right-align"></td>
											<td name="BOSANG_CNT" bind="BOSANG_CNT"></td>
											<td name="YOYAK" bind="YOYAK" class="byss"></td>
											<td name="AGENT_NO" bind="AGENT_NO" visibility="hidden" class="byss"></td>
											<td name="SAUPJANG_SEQ" bind="SAUPJANG_SEQ" visibility="hidden" class="byss"></td>											
										</tr>
									</tbody>
								</table>
							</div>
								<script type="text/javascript">
							    var table = $('#grid-accInquiry');
							    var template = $('#grid-accInquiryTemp');
							    
							    var table2 = table.clone();
							    var template2 = template.clone();
								
								table2.find(".byss").remove();
								template2.find(".byss").remove();
							    var grid2 = webponent.grid.init(table2, template2,null);
							    var bColor1 = "#FFFFFF";
	    						var bColor2 = "#F8F8F8";
						        var grid = webponent.grid.init(table, template, {
							        rowRendered: function(row, data, index) {
						                $(row).on('click', function(e) {
						                	var className =	$(".selectRow").prop("class");

											if(undefined!=className){
												
	 											if(className.split(" ")[0]=='CI-GRID-ODD'){
	 												$(".selectRow").css('background-color',bColor2);

	 											}else{
	 												$(".selectRow").css('background-color',bColor1);

	 											}
							                	
							                	$(".CI-GRID-EVEN").removeClass("selectRow");
							                	$(".CI-GRID-ODD").removeClass("selectRow");
											}
							                	$(this).css('background-color',"rgb(203,207,251)");
							                	$(this).addClass("selectRow");	
						                    e.preventDefault();
						                    e.stopPropagation();   

						                    $.ajax({
							                	  url:"/netCounter/inquiryService/contractInquiry/accInquirySummaryInfo.do"
							                	  ,dataType:"html"
							                	  ,async:true
							                	  ,contentType: "application/json; charset=UTF-8"
							                	  ,data:{
							                		  gyeyak_no:data.GYEYAK_NO
							                	  }
							                	  ,error:function(eLog){
							                		  alert(eLog);
							                	  }
							                	  ,success:function(data){
							                		
							                		  data = decodeURIComponent(data);
							                		  data = data.replace(/[+]/gi,"");

							                		  $("#tbody_summary").html("");
							                		  s="";
													  cash1 = 0;
													  cash2 = 0;
													  cash3 = 0;
													  cash4 = 0;
													  cash5 = 0;
													  cash6 = 0;
							                		  
							                		  $(JSON.parse(data)).each(function(){
							          					
							          					var GYEYAK_NO = this.GYEYAK_NO;
							          					var GYEYAK_STATE_CD = this.GYEYAK_STATE_CD;
							          					var BUNNAP_CNT = this.BUNNAP_CNT;
							          					//var YUHYO_SYMD1 = this.YUHYO_SYMD1;
							          					var BUNNAP_AMT1 = this.BUNNAP_AMT1;
							          					var YOUNGSU_YMD1 = this.YOUNGSU_YMD1;
							          					//var YUHYO_SYMD2 = this.YUHYO_SYMD2;
							          					var BUNNAP_AMT2 = this.BUNNAP_AMT2;
							          					var YOUNGSU_YMD2 = this.YOUNGSU_YMD2;
							          					//var YUHYO_SYMD3 = this.YUHYO_SYMD3;
							          					var BUNNAP_AMT3 = this.BUNNAP_AMT3;
							          					var YOUNGSU_YMD3 = this.YOUNGSU_YMD3;
							          					//var YUHYO_SYMD4 = this.YUHYO_SYMD4;
							          					var BUNNAP_AMT4 = this.BUNNAP_AMT4;
							          					var YOUNGSU_YMD4 = this.YOUNGSU_YMD4;
							          					//var YUHYO_SYMD5 = this.YUHYO_SYMD5;
							          					var BUNNAP_AMT5 = this.BUNNAP_AMT5;
							          					var YOUNGSU_YMD5 = this.YOUNGSU_YMD5;
							          					//var YUHYO_SYMD6 = this.YUHYO_SYMD6;
							          					var BUNNAP_AMT6 = this.BUNNAP_AMT6;
							          					var YOUNGSU_YMD6 = this.YOUNGSU_YMD6;
							          		
				                                           addSummaryInfo(
				                                        		   GYEYAK_NO
				                                                   ,GYEYAK_STATE_CD
				                                                   ,BUNNAP_CNT
				                                                   ,BUNNAP_AMT1
				                                                   ,YOUNGSU_YMD1
				                                                   ,BUNNAP_AMT2
				                                                   ,YOUNGSU_YMD2
				                                                   ,BUNNAP_AMT3
				                                                   ,YOUNGSU_YMD3
				                                                   ,BUNNAP_AMT4
				                                                   ,YOUNGSU_YMD4
				                                                   ,BUNNAP_AMT5
				                                                   ,YOUNGSU_YMD5
				                                                   ,BUNNAP_AMT6
				                                                   ,YOUNGSU_YMD6
				                                                   
				                                             );
							          				});
							                		  
							                		  $("#tbody_summary").html(s);
							                		  $("#cash1").text(commas(cash1));
							                		  $("#cash2").text(commas(cash2));
							                		  $("#cash3").text(commas(cash3));
							                		  $("#cash4").text(commas(cash4));
							                		  $("#cash5").text(commas(cash5));
							                		  $("#cash6").text(commas(cash6));
							                		  
							                		  $("#div_summary").show();
							                		  
							                	  }
							                  });  
						                    
						                    
						                });
						             
						              //상세보기 시작
						                var aTag = $('<span class="btn_pack btn_type24 type2"><a href="#">');

						                aTag.on('click', function (e) {

						                  e.preventDefault();
						                  e.stopPropagation();

						                   var GYEYAK_NO = (data.GYEYAK_NO).trim();
						                   var CAR_GAIP_NO = (data.CAR_GAIP_NO).trim();
						                   var AGENT_NO = (data.AGENT_NO).trim();
						                   var SAUPJANG_SEQ = (data.SAUPJANG_SEQ).trim();
						               		
						                   location.href ='/netCounter/inquiryService/contractInquiry/accDeductInquiry.do?car_gaip_no='+CAR_GAIP_NO+'&gyeyak_no='+GYEYAK_NO+'&agent_no='+AGENT_NO+'&saupjang_seq='+SAUPJANG_SEQ;
						                });
	

						                var IsuColumn = $(row).find('[data-name="YOYAK"]');

						                IsuColumn.wrapInner(aTag);
						              //상세보기 끝
						                
						                
						              //보상조회 시작 
						                var aTagBosang = $('<a href="#" bosang="bosang" style="color:blue;">');
						                
						                aTagBosang.on('click', function (e) {

							                  e.preventDefault();
							                  e.stopPropagation();
							                  var CAR_NO = (data.CAR_NO).trim();
							                  var BOSANG_CNT = data.BOSANG_CNT;
							                  if(BOSANG_CNT!='0건'){
							                	 	goBosang(CAR_NO);
							                  }  
							             });
						                
						                var CarNoColumn = $(row).find('[data-name="BOSANG_CNT"]');

						                CarNoColumn.wrapInner(aTagBosang);
						                //보상조회 끝
						                
						                
						                
						                //분담금 콤마
						                 var bundamColumn  =  $(row).find('[data-name="BUNDAM_AMT"]');
						                 var BUNDAM_AMT = commas(data.BUNDAM_AMT);
						                 bundamColumn.empty();
						                 bundamColumn.append(BUNDAM_AMT);
						                //분담금 콤마 끝
						                
						                //수납총액 콤마
						                 var TOT_NAPIP_AMTColumn  =  $(row).find('[data-name="TOT_NAPIP_AMT"]');
						                 var TOT_NAPIP_AMT = commas(data.TOT_NAPIP_AMT);
						                 TOT_NAPIP_AMTColumn.empty();
						                 TOT_NAPIP_AMTColumn.append(TOT_NAPIP_AMT);
						                //수납총액 콤마 끝
						                
						                //차회분담금 콤마
						                 var BUNNAP_AMTColumn  =  $(row).find('[data-name="BUNNAP_AMT"]');
						                 var BUNNAP_AMT = commas(data.BUNNAP_AMT);
						                 BUNNAP_AMTColumn.empty();
						                 BUNNAP_AMTColumn.append(BUNNAP_AMT);
						                //차회분담금콤마 끝
						                
						                 //계약기간 개행처리
						                 var GYEYAK_YMDTag = '';
						                var GYEYAK_YMDColumn  =  $(row).find('[data-name="GYEYAK_YMD"]');
						                var GYEYAK_YMD = data.GYEYAK_YMD;
						                var GYEYAK_YMDArray = GYEYAK_YMD.split('~');
						                if(GYEYAK_YMDArray.length==2){
						                	GYEYAK_YMDTag += GYEYAK_YMDArray[0]+'~'+GYEYAK_YMDArray[1];
						                }
						                GYEYAK_YMDColumn.empty();
						                GYEYAK_YMDColumn.append(GYEYAK_YMDTag);
						                //계약기간 개행처리 끝
						                
						                //계약상태 색깔
						                 var GYEYAK_STATE_CDColumn  =  $(row).find('[data-name="GYEYAK_STATE_CD"]');
						                 var GYEYAK_STATE_CD = data.GYEYAK_STATE_CD;
						                 if(GYEYAK_STATE_CD=="미도래"){
						                	 GYEYAK_STATE_CD='<span class="txtC02" style="font-weight: bolder;">미도래</span>';
										 }else if(GYEYAK_STATE_CD=="최고기간"){
											 GYEYAK_STATE_CD='<span class="txtC04" style="font-weight: bolder;">최고기간</span>';
										 }
						                 GYEYAK_STATE_CDColumn.empty();
						                 GYEYAK_STATE_CDColumn.append(GYEYAK_STATE_CD);
						                //계약상태 색깔 끝
							        },
							        
							        paging: {
							        	countPerPage : 10,
		                                paginationCount : 10,
		                                freezeScrollerY : 'hide',
		                               	freezeScrollerX : 'hide'
							        },

						        });

						        grid.makePageList();
						       /*  var columns = grid.settings.columns;

					            _.each(columns, function(column, index, list) {

					                column.displayingWidth = '*';
					            });

					            grid1.releaseScroll(); */
					            var s="";
					            var cash1 = 0;
					            var cash2 = 0;
					            var cash3 = 0;
					            var cash4 = 0;
					            var cash5 = 0;
					            var cash6 = 0;
					            
						        function addSummaryInfo(GYEYAK_NO
	          							,GYEYAK_STATE_CD
	          							,BUNNAP_CNT
	          							,BUNNAP_AMT1
	          							,YOUNGSU_YMD1
	          							,BUNNAP_AMT2
	          							,YOUNGSU_YMD2
	          							,BUNNAP_AMT3
	          							,YOUNGSU_YMD3
	          							,BUNNAP_AMT4
	          							,YOUNGSU_YMD4
	          							,BUNNAP_AMT5
	          							,YOUNGSU_YMD5
	          							,BUNNAP_AMT6
	          							,YOUNGSU_YMD6){
						        	
						        GYEYAK_NO   		  =         removeNull(GYEYAK_NO);
						        GYEYAK_STATE_CD  =			 removeNull(GYEYAK_STATE_CD);
      							BUNNAP_CNT         =  		 removeNull(BUNNAP_CNT);
      							BUNNAP_AMT1       = 		 removeNull(BUNNAP_AMT1);
      							YOUNGSU_YMD1     = 		 removeNull(YOUNGSU_YMD1);
      							BUNNAP_AMT2       = 		 removeNull(BUNNAP_AMT2);
      							YOUNGSU_YMD2     = 		 removeNull(YOUNGSU_YMD2);
      							BUNNAP_AMT3       = 		 removeNull(BUNNAP_AMT3);
      							YOUNGSU_YMD3     = 		 removeNull(YOUNGSU_YMD3);
      							BUNNAP_AMT4       = 		 removeNull(BUNNAP_AMT4);
      							YOUNGSU_YMD4     = 		 removeNull(YOUNGSU_YMD4);
      							BUNNAP_AMT5       = 		 removeNull(BUNNAP_AMT5);
      							YOUNGSU_YMD5     = 		 removeNull(YOUNGSU_YMD5);
      							BUNNAP_AMT6       = 		 removeNull(BUNNAP_AMT6);
      							YOUNGSU_YMD6     = 		 removeNull(YOUNGSU_YMD6);
						        
      							cash1+=parseInt(BUNNAP_AMT1);
      							cash2+=parseInt(BUNNAP_AMT2);
      							cash3+=parseInt(BUNNAP_AMT3);
      							cash4+=parseInt(BUNNAP_AMT4);
      							cash5+=parseInt(BUNNAP_AMT5);
      							cash6+=parseInt(BUNNAP_AMT6);
      													        
						        if(GYEYAK_STATE_CD=="미도래"){
						        	GYEYAK_STATE_CD='<span class="txtC02" style="font-weight: bolder;">미도래</span>';
						        }else if(GYEYAK_STATE_CD=="최고기간"){
						        	GYEYAK_STATE_CD='<span class="txtC04" style="font-weight: bolder;">최고기간</span>';
						        }
						        
						        s+="<tr><td>종사자재해</td>";	
						        s+="<td>"+GYEYAK_STATE_CD+"</td>";	
						        s+="<td>"+BUNNAP_CNT+"</td>";	
						        s+="<td class='alR'>"+commas(BUNNAP_AMT1)+"</td>";	
						        s+="<td>"+YOUNGSU_YMD1+"</td>";	
						        s+="<td class='alR'>"+commas(BUNNAP_AMT2)+"</td>";	
						        s+="<td>"+YOUNGSU_YMD2+"</td>";	
						        s+="<td class='alR'>"+commas(BUNNAP_AMT3)+"</td>";	
						        s+="<td>"+YOUNGSU_YMD3+"</td>";	
						        s+="<td class='alR'>"+commas(BUNNAP_AMT4)+"</td>";	
						        s+="<td>"+YOUNGSU_YMD4+"</td>";	
						        s+="<td class='alR'>"+commas(BUNNAP_AMT5)+"</td>";	
						        s+="<td>"+YOUNGSU_YMD5+"</td>";	
						        s+="<td class='alR'>"+commas(BUNNAP_AMT6)+"</td>";	
						        s+="<td>"+YOUNGSU_YMD6+"</td></tr>";	

					            }
					            
						        function removeNull(a){
						        	if(a==null||a=="null"){
						        		return "";
						        	}else{
						        		return a;
						        	}
						        }
					            function commas(x) {
						        	if(x=="") return "";
						            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						        }
					            
					            $("#exportGridEx").click(function(){
						            var option = {
						                fileName: '재해공제조회',
						                sheetName: $('select[name="gyeyak_jibu_cd"] option:selected').text()
						            };
						            webponent.report.excel(grid2, $('#export-form'), option);
						        });
					            var agentNm = '${loginVO.agentNm}';
						        $("#exportGridPdf").click(function () {
						            var option = {
						                kindCd:'2',
						                drawArea: grid,
						                agentName:agentNm,
						                fileName: '재해공제조회',
						                stylesheet: [
						                    '/webPonent-Grid/css/webponent.grid.css',
						                    '/webPonent-Grid/css/webponent.grid.flat.css',
						                    '/webPonent-Grid/css/report.view.css']
						            };
						            webponent.report.pdf($('#export-form'), option);
						        });
						        
						        $(".CI-GRID-BODY-TABLE-TBODY").children("tr").eq(0).click();
							</script>
							
									<!-- <div style="background-color:#e1e1e1;text-align:center;padding:50px 0;font-weight:bold;">그리드 영역입니다.</div>	그리드영역 표시용 스타일임 -->
						</div>
						<div id="div_summary" style="display:none; padding:30px 0px;">
						<table class="tbWork_st01" summary="분담금 납입정보 상세정보 테이블 입니다. 담보,계약상태,회차,분담금,영수일자,합계">
								<caption>분담금 납입정보에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:8%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:6%;" />
									<col style="width:7%;" />
									<col style="width:6%;" />
									<col style="width:7%;" />
									<col style="width:6%;" />
									<col style="width:7%;" />
									<col style="width:6%;" />
									<col style="width:7%;" />
									<col style="width:6%;" />
									<col style="width:7%;" />
									<col style="width:6%;" />
									<col style="width:7%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2">담보</th>
										<th scope="col" rowspan="2">계약상태</th>
										<th scope="col" rowspan="2">분납</th>
										<th scope="col" colspan="2" class="brB1">1회</th>
										<th scope="col" colspan="2" class="brB1">2회</th>
										<th scope="col" colspan="2" class="brB1">3회</th>
										<th scope="col" colspan="2" class="brB1">4회</th>
										<th scope="col" colspan="2" class="brB1">5회</th>
										<th scope="col" colspan="2" class="brB1">6회</th>
									</tr>
									<tr>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
										<th scope="col">분담금</th>
										<th scope="col">영수일자</th>
									</tr>
								</thead>
								<tbody id="tbody_summary">
									
								</tbody>
								<tfoot id="tfoot_summary">
									<tr>
										<td scope="col">합계</td>
										<td scope="col"></td>
										<td scope="col"></td>
										<td scope="col" class="alR" id="cash1">0</td>
										<td scope="col"></td>
										<td scope="col" class="alR" id="cash2">0</td>
										<td scope="col"></td>
										<td scope="col" class="alR" id="cash3">0</td>
										<td scope="col"></td>
										<td scope="col" class="alR" id="cash4">0</td>
										<td scope="col"></td>
										<td scope="col" class="alR" id="cash5">0</td>
										<td scope="col"></td>
										<td scope="col" class="alR" id="cash6">0</td>
										<td scope="col"></td>
									</tr>
								</tfoot>
							</table>
							</div>
								<!-- //그리드영역 -->
								<%-- <div class="tbWork1">
									<p class="etcTxt">&#40;기준일자 &#58; <fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> &#41;</p>
									<table class="tbWork_st01" summary="가입중인 차량현황 상세정보 테이블 입니다.">
										<caption>가입중인 차량현황에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:4%;" />
											<col style="width:11%;" />
											<col style="width:8%;" />
											<col style="width:8%;" />
											<col style="width:11%;" />
											<col style="width:8%;" />
											<col style="width:17%;" />
											<col style="width:9%;" />
											<col style="width:9%;" />
											<col style="width:9%;" /><!-- 94 -->
										</colgroup>
										<thead>
											<tr>
												<th scope="col">순번</th>
												<th scope="col">차량번호</th>
												<th scope="col">상품종류</th>
												<th scope="col">종사자성명</th>
												<th scope="col">종사자주민번호</th>
												<th scope="col">계약상태</th>
												<th scope="col">계약기간</th>
												<th scope="col">차회납입일</th>
												<th scope="col">차회분담금</th>
												<th scope="col">보상건수<p class="txt05">&#40;최근3년기준&#41;</p></th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${not empty carStatusList }">
													<c:forEach var="car" items="${carStatusList }" varStatus="varStatus">
														<c:set var="carRowspan" value="${fn:length(car.carDeductMapList)>0?(fn:length(car.carDeductMapList)):1 }"/>
															<tr>
																	<td rowspan="${rowspan }" >${paginationInfo.totalRecordCount  - ( ( paginationInfo.currentPageNo - 1 )  * paginationInfo.pageSize  ) - varStatus.index}</td>
																	<td >${varStatus.count + ( ( paginationInfo.currentPageNo - 1 )  * paginationInfo.recordCountPerPage ) }</td>
																	<td >
																		<a href="/netCounter/inquiryService/contractInquiry/accDeductInquiry.do?car_gaip_no=${car.CAR_GAIP_NO }&gyeyak_no=${car.GYEYAK_NO }" class="link">
																			${car.CAR_NO }
																		</a>
																	</td>
																	<td >${car.JAEHAE_GONGJE_NM }</td>
																	<td >${car.JONGSA_NM }</td>
																	<td >${car.JONGSA_JUMIN_NO }</td>
																	<td>
																		<c:choose>
																			<c:when test="${car.GYEYAK_STATE_NM == '유지' }">
																				<span >${car.GYEYAK_STATE_NM }</span>
																			</c:when>
																			<c:when test="${car.GYEYAK_STATE_NM == '미도래' }">
																				<span class="txtC02" style="font-weight:bolder;">${car.GYEYAK_STATE_NM }</span>
																			</c:when>
																			<c:when test="${car.GYEYAK_STATE_NM == '최고기간' }">
																				<span class="txtC04" style="font-weight:bolder;">${car.GYEYAK_STATE_NM }</span>
																			</c:when>
																			<c:otherwise>
																				${car.GYEYAK_STATE_NM }
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td>
																			${car.GAIP_YMD }
																	</td>
																	<td>
																			<c:if test="${not empty car.NEXT_BUNNAP_YMD}">
																				${fn:substring(car.NEXT_BUNNAP_YMD,0,4)}. 
																				${fn:substring(car.NEXT_BUNNAP_YMD,4,6)}. 
																				${fn:substring(car.NEXT_BUNNAP_YMD,6,8)}
																			</c:if>
																	</td>
																	<td class="alR"><fmt:formatNumber value="${car.NEXT_BUNNAP_AMT }" type="number" /> 원</td>
																	<td >
																		<c:choose>
																			<c:when test="${not empty car.BOSANG_CNT && car.BOSANG_CNT > 0}">
																				<a id="f_bosang" href="#;" class="link" car_no="${car.CAR_NO }">${car.BOSANG_CNT }건</a>
																			</c:when>
																			<c:otherwise>
																				0건 
																			</c:otherwise>
																		</c:choose>
																	</td>
																</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="10" >재해공제 계약 내용이 없습니다</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<!-- paging s -->
									<div class="paging">
										<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goPage" />
										상단 form에 <form:hidden path="pageIndex" /> 추가됨
									</div><!--// paging e -->
								</div> --%><!--// 가입중인차량현황 e -->
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
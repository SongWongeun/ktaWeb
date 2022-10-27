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

<link rel="stylesheet" href="/webPonent-Grid/css/webponent.grid.css" /> <!-- 그리드 -->
<link rel="stylesheet" href="/webPonent-Grid/css/webponent.grid.flat.css" /> <!-- 그리드 -->
<script src="/webPonent-Grid/external/jquery-1.11.1.min.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/external/jquery-ui-1.10.3.custom.min.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/external/jquery.mousewheel.min.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/external/underscore-min.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/webponent.grid.js"></script> <!-- 그리드 -->
<script src="/webPonent-Grid/webponent.report.js"></script> <!-- 엑셀&pdf -->
<script src="/webPonent-Grid/external/json2.min.js"></script> <!-- 엑셀&pdf -->
<script src="/webPonent-Grid/external/lz-string.js"></script> <!-- 엑셀&pdf -->

<!-- <script src="/js/jquery/jquery-ui.js"></script> -->
<script type="text/javaScript" language="javascript" defer="defer">

function search(){
	<%-- 기간 최근 5년 까지만 --%>
	if( $('form#f input#start_acdnt_ymd').val() == '' || 
			$('form#f input#end_acdnt_ymd').val() == '' ){
		
		alert('검색기간을 입력해주세요.');
		return false;
	}
	$('div#loading_page').show();
	document.f.submit();
}
function goPage(pageNo){
	document.f.searchKeyword.value = document.f.searched_searchKeyword.value;
	document.f.pageIndex.value = pageNo;
	document.f.submit();
}
$(document).ready(function(){
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
	
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
			yearRange : (sYear-5)+':'+sYear
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
			yearRange : (sYear-5)+':'+sYear
	});
	
	<%-- 월별검색 기본 셋팅 --%>
	$("#searchYear").html(sYear);
	$("#searchMonth").html(sMonth);
	
	<%-- 검색박스 엔터키 설정--%>
	$('form#f input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			search();
			return false;
		}
	});

	<%-- 조회기간년도세팅 --%>
	$("#prevYear").click(function(){
		var prevY = $("#searchYear").html();
		console.log("이전버튼: "+prevY);
		if(prevY > sYear-5) {
			$("#searchYear").html(prevY-1);
		}else if(prevY == sYear-5){
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
	/* $('form#f select[name="year"]')
		.append('<option value="'+sYear+'" >'+sYear+'</option>')
		.append('<option value="'+(sYear-1)+'">'+(sYear-1)+'</option>')
		.append('<option value="'+(sYear-2)+'">'+(sYear-2)+'</option>')
		.append('<option value="'+(sYear-3)+'">'+(sYear-3)+'</option>')
		; */
		
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
	/* for(var z=1;z<=12;z++){
		if(z == sMonth){
				$('form#f select[name="month"]')
					.append('<option value="'+z+'" >'+z+'</option>');
		}else{
				$('form#f select[name="month"]')
					.append('<option value="'+z+'">'+z+'</option>');
		}
	} */
	
	/* 
	$('select[name="gyeyak_jibu_cd"] option[value="${searchVO.gyeyak_jibu_cd}"]').attr('selected','selected');
	$('select[name="agent_no"] option[value="${searchVO.agent_no}"]').attr('selected','selected'); */
	$('select[name="dambo"] option[value="${searchVO.dambo}"]').attr('selected','selected');
	
	$('select[name="agent_no"]').on('change',function(){
		$('select[name="gyeyak_jibu_cd"] option[value=""]').attr('selected','selected');
	});
	
/* 	$('select[name="agent_no"]').on('change',function(){
		$('select[name="dambo"] option[value=""]').attr('selected','selected');
	}); */
	
	<%-- 조회된 기간 셋팅--%>
	/* $('form#f select[name="year"] option[value="${fn:substring(searchVO.start_acdnt_ymd,0,4) }"]').attr('selected','selected');
	$('form#f select[name="month"] option:eq(${fn:substring(searchVO.start_acdnt_ymd,4,6) })').attr('selected','selected'); */

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
	/* $('form#f select[name="year"], form#f select[name="month"]').on('change',function(event){
		var y = $('form#f select[name="year"] option:selected').val();
		var m = $('form#f select[name="month"] option:selected').val();
		if( y != '0000' && m != '00' ){
			if(m.length == 2){
				$("#start_acdnt_ymd").val( y+m+'01' );
				$("#end_acdnt_ymd").val( y+m+new Date( y, m, '').getDate()	);
			}else{
				$("#start_acdnt_ymd").val( y+'0'+m+'01' );
				$("#end_acdnt_ymd").val( y+'0'+m+new Date( y, m, '').getDate()	);
			}
		}
	}); */
	
	<%-- 조회 --%>
	$('a#f_submit').on('click',function(event){
		//event.preventDefault();
		search();
	});
	
	$('form#f input[name="searchKeyword"]').focus();
	
	<%-- 검색 초기화 2016.12.29 [H] 추가 --%>
/* 	$("#f_reset").click(function(){
		$("#searchJibu").val("").attr('selected','selected');
		$("#selectDambo").val("").attr('selected','selected');
		$("#searchSaupja").val("").attr('selected','selected');
		setTerm('6');
		$("#searchKeyword").val("");
	}); */
	
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
			if(date.substr(4,2)<10){
				$("#searchMonth").html(date.substr(5,1));
			}else{
				$("#searchMonth").html(date.substr(4,2));
			}
		}
	});
}

function printDocument(){
	document.pf.searchCondition.value=document.f.searchCondition.value;
	document.pf.start_acdnt_ymd.value=document.f.start_acdnt_ymd.value;
	document.pf.end_acdnt_ymd.value=document.f.end_acdnt_ymd.value;
	document.pf.searchKeyword.value=document.f.searched_searchKeyword.value;
	document.pf.agent_no.value=document.f.agent_no.value;
	document.pf.gyeyak_jibu_cd.value=document.f.gyeyak_jibu_cd.value;
	document.pf.dambo.value=document.f.dambo.value;
	
	document.pf.action = "<c:url value='/netCounter/inquiryService/contractInquiry/compenInfoPrint.do'/>";
	document.pf.target="compenInfoPrintPopup";
	window.open("",'compenInfoPrintPopup','toolbar=no,location=no,status=no,menubar=no, scrollbars=yes,resizable=yes,width=1000,height=800 top=10 left=10');
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
 						<h2><img src="/images/truck/net/repair_tit.gif" alt="보상정보조회" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<span>보상정보조회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/repair_con_tit.gif" alt="보상정보 및 처리 내역 조회 서비스 입니다 최근 3년 여간의 사고내역만 조회가 가능하며, 좀더 상세한 내용은 계약지부의 담당자에게 문의하시기 바랍니다" /></p>
					<div class="conSection clfix">
						<!-- 보상내역검색 s -->
						<h4 class="netsubTit" ><span class="blueBul">보상내역검색</span></h4>
						<form:form id="f" name="f" commandName="searchVO" method="post" action="/netCounter/inquiryService/accountInquiry/compenInfo.do">
						
						<fieldset>
							<legend>보상내역검색</legend>
								<form:hidden path="saupja_no"/>
								<form:hidden path="saupjang_seq"/>
								<form:hidden path="agent_no"/>
								
								<input name="searchCondition" id="searchCondition" type="hidden" value="car_no" />
								<input name="pageIndex" id="pageIndex" type="hidden" value="${searchVO.pageIndex }" />
								<input name="searched_searchKeyword" id="searched_searchKeyword" type="hidden" value="${searchVO.searchKeyword }" />
								<!-- <form:hidden path="dambo"/> -->
								<div class="searchBox02 type2 clfix mB5">	<!-- 20161208 수정 -->
									<!-- 20161208 추가 -->
									<!-- 지부선택 AND 사업자선택 -->
									
									<!-- 차량관리자 주선위험담보 계약조회 삭제 -->
									<!-- 차량관리자 보상정보조회 > 지부선택, 사업자선택 속성 삭제  -->
									<c:if test="${loginVO.agentCd == '1' or loginVO.agentCd == '3'}">
									<div class="searchUp">
										<div class="searchL">
											<dl>
												<dt>지부선택</dt>
												<dd>
													<select name="gyeyak_jibu_cd" id="searchJibu">
														<option value="">전체</option>
														<c:if test="${saupjaList != null}">
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
														</c:if>
													</select>
												</dd>
											</dl>
											<dl style="padding-left: 70px;">
												<dt>사업자선택</dt>
												<dd>
													<select onchange="changeSelect(this.value)">
														<option value="">전체</option>
														<c:if test="${saupjaList != null}">
															<c:forEach items="${saupjaList }" var="saupja"><option value="${saupja.saupnum}^${saupja.agent_no}^${saupja.saupjang_seq}" 
															<c:if test="${searchVO.agent_no == saupja.agent_no}">
															selected="selected"
															</c:if> 
															>${saupja.agent_nm }</option></c:forEach>
														</c:if>
													</select>
												</dd>
											</dl>
										</div>
									</div>
									<div class="searchCenter">
									</c:if>
									<c:if test="${loginVO.agentCd == '2'}">
									<div class="searchUp">
									</c:if>
										<div class="searchL">
											<dl>
												<dt>담보별선택</dt>
												<dd>
													<select name="dambo" id="selectDambo">
														<option value="">전체</option>
														<option value="1">자동차공제</option>
														<option value="2">재해공제</option>
														<option value="3">적재물공제(운송)</option>
														<c:if test="${loginVO.agentCd == '1' or loginVO.agentCd == '3'}">	
															<option value="4">적재물공제(주선)</option>
														</c:if>c
													</select>
												</dd>
											</dl>
										</div>
									</div>
									

									<!-- 기간검색 -->
									<div class="searchCenter">	<!-- 20161208 수정 -->
										<!-- 20161208 추가 -->
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
													<span id="searchYear"></span>년
													<a href="javascript:;" class="btnNext" id="nextYear"><img src="/images/truck/btn/btn_search_next.gif" alt="다음 연도" /></a>
												</div>
												<div class="searchBtn">
													<a href="javascript:;" class="btnPrev" id="prevMonth"><img src="/images/truck/btn/btn_search_prev.gif" alt="이전 달" /></a>
													<span id="searchMonth"></span>월
													<a href="javascript:;" class="btnNext" id="nextMonth"><img src="/images/truck/btn/btn_search_next.gif" alt="다음 달" /></a>
												</div>
												<span class="btn_pack btn_type21 mL10"><a href="javascript:;" id="monYearChange">월별선택</a></span>
											</div>
										</div>
										<!-- //20161208 추가 -->
									</div>
									<!-- 차량번호검색 -->
									<div class="searchDown">
										<div class="searchL">
											<dl>
												<dt>차량번호</dt>	<!-- 20161208 수정 -->
												<dd>
													<label for="searchKeyword" class="hide">차량번호</label>
													<input id="searchKeyword" name="searchKeyword" title="조회 차량번호를 입력하세요" class="txt" style="width:255px" type="text" value="${searchVO.searchKeyword }" />
												</dd>
											</dl>
										</div>
										<!-- 20161208 삭제 
										<div class="btn_absol">
											<span class="btn_pack btn_type04"><a id="f_submit" href="#;" class="bold">검색하기</a></span>
										</div>
										//20161208 삭제 -->
									</div>
								</div><!--// 보상내역검색 e-->
								<!-- 20161208 추가 -->
								<!-- 검색버튼 -->
								<div class="btnboxR mT5">
									<span class="btn_pack btn_type04"><a id="f_submit" href="javascript:;" class="bold">조회</a></span>
									<span class="btn_pack btn_type05"><a id="f_reset" href="javascript:;" class="bold">검색초기화</a></span>
								</div>
								<!-- //20161208 추가 -->
						</fieldset>
						</form:form>
						<%-- <form id="pf" name="pf" method="post" >
							<input name="searchCondition" id="searchCondition" type="hidden" value="" />
							<input name="start_acdnt_ymd" id="start_acdnt_ymd" type="hidden" value="" />
							<input name="end_acdnt_ymd" id="end_acdnt_ymd" type="hidden" value="" />
							<input name="searchKeyword" id="searchKeyword" type="hidden" value="" />
						</form> --%>
						<!-- 사고내역조회 s -->

						<!-- 프린트 팝업을 위한 form -->
						<form id="pf" name="pf" method="post">
							<input name="searchCondition" type="hidden" value="" /> 
							<input name="start_acdnt_ymd" type="hidden" value="" />
							<input name="end_acdnt_ymd" type="hidden" value="" /> 
							<input name="searchKeyword" type="hidden" value="" />
							<input name="dambo" type="hidden" value="" />  
							<input name="gyeyak_jibu_cd" type="hidden" value="" /> 
							<input name="agent_no" type="hidden" value="" /> 
						</form>	
						
						<!-- 20161208 수정 및 추가 -->
						<div class="alR mT25 mB5">
							<!-- 인쇄하기버튼 -->
							<div class="btn_absol">
								<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="javascript:;" onclick="printDocument();return false;"title="새창열림" >인쇄하기</a></span>
								<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="javascript:;" id="exportGridEx" title="새창열림" >EXCEL</a></span>
								<!-- <span class="btn_pack btn_type13 icon"><span class="print"></span><a href="javascript:;" id="exportGridPdf" title="새창열림" >PDF</a></span> -->
							</div>
						</div>
						<!-- //20161208 수정 및 추가 -->
						<form id="export-form" style="display: none;"></form>
						
						<!-- 그리드영역 -->
						<div id="grid-compenInfo">
							<!-- <div style="background-color:#e1e1e1;text-align:center;padding:50px 0;font-weight:bold;">그리드 영역입니다.</div> -->	<!-- 그리드영역 표시용 스타일임 -->
							<table>
								<thead>
									<tr>
										<th>조합원명</th>
										<th>사고번호</th>
										<th>상태</th>
										<th>차량번호</th>
										<th class="byss">가입번호</th>
										<th class="byss">계약번호</th>
										<th class="byss">조합원번호</th>
										<th class="byss">사업장</th>
										<th>운전자</th>
										<th>사고일시</th>
										<th>사고장소</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${carAccidentInquiryList!=null}">
										<c:forEach var="result" items="${carAccidentInquiryList}" varStatus="s">
											<tr>
												<td>${result.agent_nm }</td>
												<td>${fn:substring(result.acdnt_no,0,4) }-${fn:substring(result.acdnt_no,4,9) }</td>
												<td>${result.acdnt_stat }</td>
												<td>${result.car_no }</td>
												<td class="byss">${result.car_gaip_no}</td>
												<td class="byss">${result.gyeyak_no}</td>
												<td class="byss">${result.agent_no}</td>
												<td class="byss">${result.saupjang_seq}</td>
												<td>${result.drvr_nm }</td>
												<td>${result.acdnt_date }</td>
												<td>${result.acdnt_place }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<div id="grid-compenInfoTemp" style="display:none;">
								<table  width = "100%">
									<thead>
										<tr>
											<th name="agent_nm" align="center" width="12%">조합원명</th>
											<th name="acdnt_no" align="center" width="10%">사고번호</th>
											<th name="acdnt_stat" align="center" width="7%">상태</th>
											<th name="car_no" align="center" width="9%">차량번호</th>
											<th name="car_gaip_no" visibility="hidden" class="byss"></th>
											<th name="gyeyak_no" visibility="hidden" class="byss"></th>
											<th name="agent_no" visibility="hidden" class="byss"></th>
											<th name="saupjang_seq" visibility="hidden" class="byss"></th>
											<th name="drvr_nm" align="center" width="9%">운전자</th>
											<th name="acdnt_date" align="center" width="11%">사고일시</th>
											<th name="acdnt_place" align="left" width="42%">사고장소</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td name="agent_nm" bind="agent_nm"></td>
											<td name="acdnt_no" bind="acdnt_no"></td>
											<td name="acdnt_stat" bind="acdnt_stat"></td>
											<td name="car_no" bind="car_no"></td>
											<td name="car_gaip_no" bind="car_gaip_no" visibility="hidden" class="byss"></td>
											<td name="gyeyak_no" bind="gyeyak_no" visibility="hidden" class="byss"></td>
											<td name="agent_no" bind="agent_no" visibility="hidden" class="byss"></td>
											<td name="saupjang_seq" bind="saupjang_seq" visibility="hidden" class="byss"></td>
											<td name="drvr_nm" bind="drvr_nm"></td>
											<td name="acdnt_date" bind="acdnt_date"></td>
											<td name="acdnt_place" bind="acdnt_place" class="pad"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<script>
							    var table = $('#grid-compenInfo');
							    var template = $('#grid-compenInfoTemp');
							    template.find(".pad").css({'padding-left':'15px'});
						        var grid = webponent.grid.init(table, template, {
							        rowRendered: function(row, data, index) {
							        	
							        	var acdntTag = $('<a href="#" style="color:blue; font-weight:bold;">');
							        	acdntTag.on('click', function(e) {
						                    e.preventDefault();
						                    e.stopPropagation();
						                    
						                    var acdnt = (data.acdnt_no).trim();
						                    var acdnt_no = acdnt.replace("-","");
						                    var car_no = (data.car_no).trim().replace("-","");
						                    //if(car_no != '주선적재물'){
						                    	location.href = "/netCounter/inquiryService/accountInquiry/compenDetail.do?acdnt_no="+acdnt_no;
						                    //}
						                });
							        	
							        	var carNoTag = $('<a href="#" style="color:blue; font-weight:bold;">');
							        	carNoTag.on('click', function(e) {
						                    e.preventDefault();
						                    e.stopPropagation();
						                    
						                    var car_gaip_no = (data.car_gaip_no).trim();
						                    var gyeyak_no = (data.gyeyak_no).trim();
						                    var agent_no = (data.agent_no).trim();
						                    var saupjang_seq = (data.saupjang_seq).trim();
						                    if(car_gaip_no != '주선' && gyeyak_no != '주선' && agent_no != null && saupjang_seq != null){
						                    	
						                    	location.href = "/netCounter/inquiryService/contractInquiry/totalContractInquiry.do?car_gaip_no="+car_gaip_no+"&gyeyak_no="+gyeyak_no+"&agent_no="+agent_no+"&saupjang_seq="+saupjang_seq;
						                    }
						                });
							        	
						                var acdntColumn = $(row).find('[data-name="acdnt_no"]');
						                acdntColumn.wrapInner(acdntTag);
						                
						                var carNoColumn = $(row).find('[data-name="car_no"]');
						                carNoColumn.wrapInner(carNoTag);
						      
							        },
							        
							        paging: {
							        	countPerPage : 10,
		                                paginationCount : 10,
		                                freezeScrollerY : 'hide'
							        }
							        
						        });
						        grid.makePageList();
						        
						        var da = grid.getData();
							    console.log(da);
						        if(da.length == 0) {
						        	grid.markup.main.body.wrapper.style.display='none';
						        }
						        
						        var table2 = table.clone();
							    var template2 = template.clone();
								
								table2.find(".byss").remove();
								template2.find(".byss").remove();
							    var grid2 = webponent.grid.init(table2, template2,null);
						        
						        $("#exportGridEx").click(function(){
						            var option = {
						                fileName: $('select[name="agent_no"] option:selected').text(),
						                sheetName: $('select[name="gyeyak_jibu_cd"] option:selected').text()
						            };
						            webponent.report.excel(grid2, $('#export-form'), option);
						        });
						        
						        /* var agentNm = '${loginVO.agentNm}';
						        $("#exportGridPdf").click(function () {
						            var option = {
						                drawArea: grid,
						                agentName:agentNm,
						                fileName: '보상정보조회',
						                stylesheet: [
						                    '/webPonent-Grid/css/webponent.grid.css',
						                    '/webPonent-Grid/css/webponent.grid.flat.css',
						                    '/webPonent-Grid/css/report.view.css']
						            };
						            webponent.report.pdf($('#export-form'), option);
						        }); */
						        
							</script>
						</div>
						<span style ="align: left">※ 사고번호 또는 차량번호 클릭 시 상세정보 확인이 가능합니다.</span>	
						<!-- //그리드영역 -->
						

						<!-- <h4 class="netsubTit" ><span class="greenBul">사고내역조회</span></h4>
						<div class="userAlarm">
							<p class="mark">사고번호 또는 차량번호를 클릭하시면 상세한 사고 처리 현황을 보실 수 있습니다&#46;</p>
						</div> -->
						<%-- <div class="tbWork1" style="display: none;">
							<table class="tbWork_st01" summary="사고내역조회 목록 테이블 입니다.">
								<caption>사고내역조회 현황에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:15%;" />
									<col style="width:15%;" />
									<col style="width:13%;" />
									<col style="width:17%;" />
									<col style="width:40%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">사고번호</th>
										<th scope="col">차량번호</th>
										<th scope="col">운전자</th>
										<th scope="col">사고일시</th>
										<th scope="col">사고장소</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${ rCode == 'searched'}">
												<c:if test="${ not empty resultList }">
													<c:forEach var="result" items="${resultList }" varStatus="varStatus" >
														<tr>
															<td>
																<a href="/netCounter/inquiryService/accountInquiry/compenDetail.do?acdnt_no=${result.acdnt_no }" class="link txtC05">
																	${fn:substring(result.acdnt_no,0,4) }-${fn:substring(result.acdnt_no,4,9) }
																</a>
															</td>
															<td>
																<a href="/netCounter/inquiryService/accountInquiry/compenDetail.do?acdnt_no=${result.acdnt_no }" class="link txtC05">
																	${result.car_no }
																</a>
															</td>
															<td>${result.drvr_nm }</td>
															<td>${result.acdnt_date }</td>
															<td style="padding-left: 9px;" class="alL">${result.acdnt_place }</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${list != null}">
													<c:forEach var="result" items="${list}">
														<tr>
															<td>${fn:substring(result.acdnt_no,0,4) }-${fn:substring(result.acdnt_no,4,9) }</td>
															<td>${result.car_no }</td>
															<td class="byss">${result.car_gaip_no}</td>
															<td class="byss">${result.gyeyak_no}</td>
															<td>${result.drvr_nm }</td>
															<td>${result.acdnt_date }</td>
															<td>${result.acdnt_place }</td>
															<td class="byss">${result.agent_no}</td>
															<td class="byss">${result.saupjang_seq}</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${resultList == null || list == null }">
													<tr>
														<td colspan="5">사고내역조회 내용이 없습니다</td>
													</tr>
												</c:if>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5">검색해주세요.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<!--paging s -->
							<c:if test="${not empty paginationInfo}">
								<div class="paging">
									<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goPage" />
									 상단 form에 <form:hidden path="pageIndex" /> 추가됨 
								</div>
							</c:if>
						</div> --%>
					</div><!--// 사고내역조회 e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
	<div id="loading_page" style="width: 100%; position: fixed;top:0px; display: none;height: 100%;z-index: 1000;">
		<table style="width: 100%;height: 100%;z-index: 1001;position: fixed;"><tbody><tr><td>
			<img src="/images/ajax-loader.gif" id="loaderImg" style="left: 49%; position: absolute; "/>
		</td></tr></tbody></table>
		<div style="width: 100%;height: 100%;background-color: white;position: fixed; opacity: 0.5;filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=40);filter: alpha(opacity=50);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";" >
		</div>
	</div>
</body>
</html>
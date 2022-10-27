<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" />  -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	function search() {
<%-- 기간 최근 3년 까지만 --%>
	if ($('form#f input#start_acdnt_ymd').val() == ''
				|| $('form#f input#end_acdnt_ymd').val() == '') {

			alert('검색기간을 입력해주세요.');
			return false;
		}
		$('div#loading_page').show();
		document.f.submit();
	}
	function goPage(pageNo) {
		document.f.searchKeyword.value = document.f.searched_searchKeyword.value;
		document.f.pageIndex.value = pageNo;
		document.f.submit();
	}
	$(document)
			.ready(
					function() {
<%-- 전역변수 --%>
	var a = new Date();
						var sYear = a.getFullYear();
						var sMonth = a.getMonth() + 1;
<%-- datepicker 설정--%>
	$("#start_acdnt_ymd")
								.datepicker(
										{
											showOn : 'both',
											changeYear : true,
											changeMonth : true,
											monthNamesShort : [ '1월', '2월',
													'3월', '4월', '5월', '6월',
													'7월', '8월', '9월', '10월',
													'11월', '12월' ],
											dayNamesMin : [ "일", "월", "화", "수",
													"목", "금", "토", ],
											showMonthAfterYear : true,
											dateFormat : 'yymmdd',
											buttonImageOnly : true,
											buttonImage : '/images/truck/board/calendar.gif',
											yearRange : (sYear - 3) + ':'
													+ sYear
										});
						$("#end_acdnt_ymd")
								.datepicker(
										{
											showOn : 'both',
											defaultDate : "+1w",
											changeYear : true,
											changeMonth : true,
											monthNamesShort : [ '1월', '2월',
													'3월', '4월', '5월', '6월',
													'7월', '8월', '9월', '10월',
													'11월', '12월' ],
											dayNamesMin : [ "일", "월", "화", "수",
													"목", "금", "토", ],
											showMonthAfterYear : true,
											dateFormat : 'yymmdd',
											buttonImageOnly : true,
											buttonImage : '/images/truck/board/calendar.gif',
											yearRange : (sYear - 3) + ':'
													+ sYear
										});
<%-- 검색박스 엔터키 설정--%>
	$('form#f input[name="searchKeyword"]').on('keydown',
								function(event) {
									if (event.keyCode == 13) {

										search();
										return false;
									}
								});
<%-- 조회기간년도세팅 --%>
	$('form#f select[name="year"]').append(
								'<option value="'+sYear+'" >' + sYear
										+ '</option>').append(
								'<option value="' + (sYear - 1) + '">'
										+ (sYear - 1) + '</option>').append(
								'<option value="' + (sYear - 2) + '">'
										+ (sYear - 2) + '</option>').append(
								'<option value="' + (sYear - 3) + '">'
										+ (sYear - 3) + '</option>');
<%-- 조회기간월 셋팅--%>
	for ( var z = 1; z <= 12; z++) {
							if (z == sMonth) {
								$('form#f select[name="month"]').append(
										'<option value="'+z+'" >' + z
												+ '</option>');
							} else {
								$('form#f select[name="month"]').append(
										'<option value="'+z+'">' + z
												+ '</option>');
							}
						}
<%-- 조회된 기간 셋팅--%>
	$(
								'form#f select[name="year"] option[value="${fn:substring(searchVO.start_acdnt_ymd,0,4) }"]')
								.attr('selected', 'selected');
						$(
								'form#f select[name="month"] option:eq(${fn:substring(searchVO.start_acdnt_ymd,4,6) })')
								.attr('selected', 'selected');
<%-- 월별 조회 선택시 event --%>
	$(
								'form#f select[name="year"], form#f select[name="month"]')
								.on(
										'change',
										function(event) {
											var y = $(
													'form#f select[name="year"] option:selected')
													.val();
											var m = $(
													'form#f select[name="month"] option:selected')
													.val();
											if (y != '0000' && m != '00') {
												if (m.length == 2) {
													$("#start_acdnt_ymd").val(
															y + m + '01');
													$("#end_acdnt_ymd")
															.val(
																	y
																			+ m
																			+ new Date(
																					y,
																					m,
																					'')
																					.getDate());
												} else {
													$("#start_acdnt_ymd").val(
															y + '0' + m + '01');
													$("#end_acdnt_ymd")
															.val(
																	y
																			+ '0'
																			+ m
																			+ new Date(
																					y,
																					m,
																					'')
																					.getDate());
												}
											}
										});
<%-- 조회 --%>
	$('a#f_submit').on('click', function(event) {
							//event.preventDefault();
							search();
						});

						$('form#f input[name="searchKeyword"]').focus();

					});

	function printPdf() {
		var k = $("#printPdfDivision").html();
		var f = document.popForm;
		f.htmlData.value = k;
		f.submit();
	}
</script>
</head>
<body>
	<form name="popForm" method="post"
		action="/netCounter/inquiryService/contractInquiry/compenInfoPdf.do">
		<input type="hidden" name="htmlData" />
	</form>
	<div class="alR mB5" style="margin-top:15px; margin-right: 10px;">
		<div class="btn_absol">
			<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="javascript:;" onclick="window.print();return false;"title="새창열림" >인쇄하기</a></span>
			<span class="btn_pack btn_type13 icon"><span class="print"></span><a href="javascript:;" onclick="printPdf();return false;" title="새창열림" >PDF</a></span>
		</div>
	</div>
	<div id="printPdfDivision" style="margin: 0 auto; padding: 10px;">
		<!-- 사고내역조회 s -->
		<div class="netTitbox">
			<h4 class="netTit">
			<c:if test="${multiInfo != null && searchVO.agent_no != null}">
				<c:forEach var="saupja" items="${multiInfo}">
					<c:if test="${saupja.agent_no == searchVO.agent_no}">
						${saupja.agent_nm}&nbsp;고객님의 <span class="txtColor03">보상정보조회</span>입니다&#46;
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${multiInfo != null && empty searchVO.agent_no}">
				<span class="txtColor03">모든 조합원의 전체 보상정보조회</span>입니다&#46;
			</c:if>
			<%-- <c:if test="${multiInfo != null}">
				<c:forEach var="saupja" items="${multiInfo}">
					<c:if test="${saupja.agent_no == searchVO.agent_no}">
						${saupja.agent_nm}&nbsp;고객님의 <span class="txtColor03">사고내역</span>
				입니다&#46;
					</c:if>
				</c:forEach>
			</c:if> --%>
			</h4>
		</div>
		<!-- <div class="btn_absol" style="position: absolute; margin-left: 88%; margin-top:-3%;">
			<span class="btn_pack btn_type13 icon"><span class="print"></span><a
				href="#;" onclick="window.print();return false;" title="새창열림">인쇄하기</a></span>
			<span class="btn_pack btn_type13 icon"><span class="print"></span><a
				href="#;" onclick="printPdf();return false;" title="새창열림">PDF저장</a></span>
		</div> -->
		<!-- creator 막기  -2%;
		<h4 class="netsubTit">
			사고내역조회
		</h4>
		-->
		<p class='centerDate'>
			&#40;기준일자 &#58;
			<fmt:formatDate value="<%=new Date()%>" pattern="yyyy년 MM월 dd일" />
			&#41;
		</p>
		<table class="tbWork_st01" summary="사고내역조회 목록 테이블 입니다." style="margin-top: 20px;">
			<thead>
				<tr>
					<th scope="col" style='width: 15%;'>조합원명</th>
					<th scope="col" style='width: 13%;'>사고번호</th>
					<th scope="col" style='width: 14%;'>차량번호</th>
					<th scope="col" style='width: 13%;'>운전자</th>
					<th scope="col" style='width: 15%;'>사고일시</th>
					<th scope="col" style='width: 40%;'>사고장소</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${ rCode == 'searched'}">
						<c:choose>
							<c:when test="${ not empty eThing}">
								<c:forEach var="resultEvery" items="${eThing}">
									<c:forEach var="result" items="${resultEvery.value}">
											<tr>
												<td>${result.agent_nm }</td>
												<td>${fn:substring(result.acdnt_no,0,4) }-${fn:substring(result.acdnt_no,4,9) }</td>
												<td>${result.car_no }</td>
												<td>${result.drvr_nm }</td>
												<td>${result.acdnt_date }</td>
												<td style="text-align:left;">&nbsp;${result.acdnt_place }</td>
											</tr>
									</c:forEach>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:if test="${list != null}">
									<c:forEach var="result" items="${list}">
										<tr>
											<td>${result.agent_nm }</td>
											<td>${fn:substring(result.acdnt_no,0,4) }-${fn:substring(result.acdnt_no,4,9) }</td>
											<td>${result.car_no }</td>
											<td>${result.drvr_nm }</td>
											<td>${result.acdnt_date }</td>
											<td style="text-align:left;">&nbsp;${result.acdnt_place }</td>
										</tr>
									</c:forEach>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">사고내역조회 내용이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div style="text-align: right; margin-top: 10px;"> 전체 : ${count} 건</div>
	</div>
</body>
</html>
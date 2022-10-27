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
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	
	<%-- 전역변수 --%>
	if( $("#searchStartDetailDate").val() == '' && $("#searchEndDetailDate").val() == ''){
		var a = new Date();
		var sYear = a.getFullYear();
		var sMonth = a.getMonth()+1;
		if (sMonth < 10) sMonth = "0" + sMonth;
		$("#searchStartDetailDate").val( sYear+''+sMonth+'01' );
		$("#searchEndDetailDate").val( sYear+''+sMonth+''+new Date( sYear, sMonth, '').getDate()	);
	}
});


function goPage(pageNo){
	
	document.f.pageIndex.value = pageNo;
	document.f.submit();
}
function search(){
	if( $("#searchStartDetailDate").val() == '' && $("#searchEndDetailDate").val() == '' ){
	}else if( $("#searchStartDetailDate").val() != '' && $("#searchEndDetailDate").val() != '' ){
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
 						<h2><img src="/images/truck/net/contrac_tit.gif" alt="계약관리" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<a href="/netCounter/inquiryService/contractInquiry/accCarListInquiry.do" >계약관리</a>
						<span>계약정보조회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/contrac_con_tit02.gif" alt="고객님께서 가입하신 공제계약의 상세내용을 확인하실 수 있습니다" /></p>
					<!-- 계약관리 탭메뉴 -->
					<div class="tabGruop">
						<ul class="tab">
							<li><a href="/netCounter/inquiryService/contractInquiry/accCarListInquiry.do"><span>차량현황조회</span></a></li>
							<li class="on"><a href="/netCounter/inquiryService/contractInquiry/carDeductInquiry.do"><span>계약정보조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/divideInquiry.do"><span>분담금수납대상</span></a></li>
						</ul>
					</div>
					<div class="conSection clfix">
						<h3 class="hide">계약정보조회</h3>
						<!-- 차량조회검색 s -->
						<h4 class="netsubTit" ><span class="blueBul">차량조회</span></h4>
						<form:form id="f" name="f" commandName="searchVO" method="post" action="/netCounter/inquiryService/contractInquiry/carDeductInquiry.do" >
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
										<span class="noti" >기간을 설정하지 않으면 모든 차량이 조회됩니다.  &#46;</span>
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
						<!-- 버튼 -->
						<div class="btnboxR clfix mB15">
							<span class="btn_pack btn_type12 icon"><span class="check"></span><a href="/netCounter/inquiryService/contractInquiry/accCarListInquiry.do">차량현황조회 바로가기</a></span>
						</div>
						<!--// 차량조회검색 e -->
						<!-- 차량조회검색결과 s --><!-- !검색 시 아래 style로 노출!-->
						<c:if test="${ rCode == 'searched'}">
								<div class="netTitbox">
									<h4 class="netTit">${loginVO.agentNm} 고객님께서 가입하신 <span class="txtColor02">공제계약</span> <span class="txtColor03">차량현황</span> 입니다&#46;</h4>
								</div>
								<h5 class="netsubTit" ><span class="greenBul">가입중인 차량현황</span></h5>
								<!-- 가입중인차량현황 s -->
								<div class="tbWork1">
									<p class="etcTxt">&#40;기준일자 &#58; <fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> &#41;</p>
									<table class="tbWork_st01" summary="가입중인 차량현황 상세정보 테이블 입니다.">
										<caption>가입중인 차량현황에 대해서 나타낸 표</caption>
										<colgroup>
											<col style="width:4%;" />
											<col style="width:11%;" />
											<col style="width:17%;" />
											<col style="width:8%;" />
											<col style="width:8%;" />
											<col style="width:8%;" />
											<col style="width:17%;" />
											<col style="width:9%;" />
											<col style="width:9%;" />
											<col style="width:9%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">순번</th>
												<th scope="col">차량번호</th>
												<th scope="col">차대번호</th>
												<th scope="col">차명</th>
												<th scope="col" colspan="2">계약상태</th>
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
														<c:set var="carDeductRowspan" value="${fn:length(car.carDeductMapList)>0?(fn:length(car.carDeductMapList)):1 }"/>
														<c:set var="accDeductRowspan" value="${fn:length(car.accDeductMapList)>0?(fn:length(car.accDeductMapList)):1 }"/>
														<c:set var="carryDeductRowspan" value="${fn:length(car.carryDeductMapList)>0?(fn:length(car.carryDeductMapList)):1 }"/>
														<c:set var="rowspan" value="${carDeductRowspan + accDeductRowspan + carryDeductRowspan }"/>
														<%-- 통합계약 --%>
														<c:forEach var="carDeductMap" items="${car.carDeductMapList }"  varStatus="varStatus1">
															<tr>
																<c:if test="${varStatus1.index == 0 }">
																	<%-- <td rowspan="${rowspan }" class="brB2">${paginationInfo.totalRecordCount  - ( ( paginationInfo.currentPageNo - 1 )  * paginationInfo.pageSize  ) - varStatus.index}</td> --%>
																	<td rowspan="${rowspan }" class="brB2">${varStatus.count + ( ( paginationInfo.currentPageNo - 1 )  * paginationInfo.pageSize ) }</td>
																	<td rowspan="${rowspan }" class="brB2">
																		${car.CAR_NO }
																	</td>
																	<td rowspan="${rowspan }" class="brB2">${carDeductMap.CAR_BODY_NO }</td>
																	<td rowspan="${rowspan }" class="brB2">${carDeductMap.CAR_NM }</td>
																	<td rowspan="${carDeductRowspan }" class="link txtC01" >통합</td>
																</c:if>
																<td>
																	<c:choose>
																		<c:when test="${carDeductMap.GYEYAK_STATE_NM == '유지' }">
																			<span class="txtC04">${carDeductMap.GYEYAK_STATE_NM }</span>
																		</c:when>
																		<c:otherwise>
																			${carDeductMap.GYEYAK_STATE_NM }
																		</c:otherwise>
																	</c:choose>
																</td>
																<td>
																	<a href="/netCounter/inquiryService/contractInquiry/totalContractInquiry.do?car_gaip_no=${carDeductMap.CAR_GAIP_NO }&gyeyak_no=${carDeductMap.GYEYAK_NO }" class="link">
																		${carDeductMap.DAMBO_GAIP_YMD }
																	</a>
																</td>
																<td>
																		<c:if test="${not empty carDeductMap.NEXT_BUNNAP_YMD}">
																			${fn:substring(carDeductMap.NEXT_BUNNAP_YMD,0,4)}. 
																			${fn:substring(carDeductMap.NEXT_BUNNAP_YMD,4,6)}. 
																			${fn:substring(carDeductMap.NEXT_BUNNAP_YMD,6,8)}
																		</c:if>
																</td>
																<td class="alR"><fmt:formatNumber value="${carDeductMap.NEXT_BUNNAP_AMT }" type="number" /> 원</td>
																<c:if test="${varStatus1.index == 0 }">
																	<td  rowspan="${rowspan }">
																		<c:choose>
																			<c:when test="${not empty carDeductMap.BOSANG_CNT && carDeductMap.BOSANG_CNT > 0}">
																				<a id="f_bosang" href="#;" class="link" car_no="${car.CAR_NO }">${carDeductMap.BOSANG_CNT }건</a>
																			</c:when>
																			<c:otherwise>
																				0건 
																			</c:otherwise>
																		</c:choose>
																	</td>
																</c:if>
															</tr>
														</c:forEach>
														<%-- 재해 계약 --%>
														<c:choose>
															<c:when test="${fn:length(car.accDeductMapList)>0 }">
																<c:forEach var="accDeductMap" items="${car.accDeductMapList }"  varStatus="varStatus2">
																	<tr>
																		<c:if test="${varStatus2.index == 0 }">
																			<td rowspan="${accDeductRowspan }" class="txtC02" >재해</td>
																		</c:if>
																		<td >
																			<c:choose>
																				<c:when test="${accDeductMap.GYEYAK_STATE_NM == '유지' }">
																					<span class="txtC04">${accDeductMap.GYEYAK_STATE_NM }</span>
																				</c:when>
																				<c:otherwise>
																					${accDeductMap.GYEYAK_STATE_NM }
																				</c:otherwise>
																			</c:choose>
																		</td>
																		<td >
																			<a href="/netCounter/inquiryService/contractInquiry/accDeductInquiry.do?car_gaip_no=${accDeductMap.CAR_GAIP_NO }&gyeyak_no=${accDeductMap.GYEYAK_NO }" class="link">
																				${accDeductMap.GAIP_YMD }
																			</a>
																		</td>
																		<td>
																			<c:if test="${not empty accDeductMap.NEXT_BUNNAP_YMD}">
																				${fn:substring(accDeductMap.NEXT_BUNNAP_YMD,0,4)}. 
																				${fn:substring(accDeductMap.NEXT_BUNNAP_YMD,4,6)}. 
																				${fn:substring(accDeductMap.NEXT_BUNNAP_YMD,6,8)}
																			</c:if>
																		</td>
																		<td class="alR">
																			<c:choose>
																				<c:when test="${not empty accDeductMap.NEXT_BUNNAP_AMT && accDeductMap.NEXT_BUNNAP_AMT > 0}">
																					<fmt:formatNumber value="${accDeductMap.NEXT_BUNNAP_AMT}"  type="number" />
																				</c:when>
																				<c:otherwise>0</c:otherwise>
																			</c:choose>
																			원
																		</td>
																	</tr>																
																</c:forEach>
															</c:when>
															<c:otherwise>
																<tr>
																	<td>재해</td>
																	<td><span class="txtC04">&nbsp;</span></td>
																	<td>&nbsp;</td>
																	<td>&nbsp;</td>
																	<td>&nbsp;</td>
																</tr>
															</c:otherwise>
														</c:choose>
														<%-- 적재물 계약 --%>
														<c:choose>
															<c:when test="${fn:length(car.carryDeductMapList)>0 }">
																<c:forEach var="carryDeductMap" items="${car.carryDeductMapList }"  varStatus="varStatus3">
																	<tr>
																		<c:if test="${varStatus3.index == 0 }">
																			<td rowspan="${carryDeductRowspan }" class="txtC03">적재물</td>
																		</c:if>
																		<td >
																			<c:choose>
																					<c:when test="${carryDeductMap.GYEYAK_STATE_NM == '유지' }">
																						<span class="txtC04">${carryDeductMap.GYEYAK_STATE_NM }</span>
																					</c:when>
																					<c:otherwise>
																						${carryDeductMap.GYEYAK_STATE_NM }
																					</c:otherwise>
																				</c:choose>
																		</td>
																		<td >
																			<a href="/netCounter/inquiryService/contractInquiry/carryDeductInquiry.do?car_gaip_no=${carryDeductMap.CAR_GAIP_NO }&gyeyak_no=${carryDeductMap.GYEYAK_NO }" class="link">
																				${carryDeductMap.GAIP_YMD }
																			</a>
																		</td>
																		<td >
																			<c:if test="${not empty carryDeductMap.NEXT_BUNNAP_YMD}">
																				${fn:substring(carryDeductMap.NEXT_BUNNAP_YMD,0,4)}. 
																				${fn:substring(carryDeductMap.NEXT_BUNNAP_YMD,4,6)}. 
																				${fn:substring(carryDeductMap.NEXT_BUNNAP_YMD,6,8)}
																			</c:if>
																		</td>
																		<td  class="alR">
																			<c:choose>
																				<c:when test="${not empty carryDeductMap.NEXT_BUNNAP_AMT && carryDeductMap.NEXT_BUNNAP_AMT > 0}">
																					<fmt:formatNumber value="${carryDeductMap.NEXT_BUNNAP_AMT}"  type="number" />
																				</c:when>
																				<c:otherwise>0</c:otherwise>
																			</c:choose>
																			원
																		</td>
																	</tr>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<tr>
																	<td class="brB2">적재물</td>
																	<td class="brB2"><span class="txtC04">&nbsp;</span></td>
																	<td class="brB2">&nbsp;</td>
																	<td class="brB2">&nbsp;</td>
																	<td class="brB2">&nbsp;</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="10">적재물 공제 계약 내용이 없습니다</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<!-- paging s -->
									<div class="paging">
										<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goPage" />
										<%-- 상단 form에 <form:hidden path="pageIndex" /> 추가됨 --%>
									</div><!--// paging e -->
								</div><!--// 가입중인차량현황 e -->
						</c:if>
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

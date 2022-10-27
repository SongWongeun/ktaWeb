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
function goPage(pageNo){
	
	document.f.pageIndex.value = pageNo;
	document.f.submit();
}
function search(){
	if( $('input#searchStartDetailDate').val() == '' || 
			$('input#searchEndDetailDate').val() == '' ){
		
		alert('검색기간을 입력해주세요.');
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
	document.f.pageIndex.value = 1;
	document.f.action = '/netCounter/inquiryService/accountInquiry/compenInfo.do' ;
	document.f.submit();
	return false;
}
function goCar( car_no ){
    
	document.f.searchCondition.value = 'car_no';
	document.f.searchKeyword.value = car_no ;
	document.f.action = '/netCounter/inquiryService/contractInquiry/carDeductInquiry.do' ;
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
	
	<%-- 보상정보조회 이동 --%>
	$('a#f_car').on('click',function(event){
		goCar( $(this).attr('car_no') );
	});
	
	<%-- select 페이지 선택시 이동 --%>
	$('#selectPagination').on('change',function(event){
		var a = $('#selectPagination option:selected').val();
		if( a != '0'){
			goPage( a );
		}
	});
	
	<%-- 화면로딩시 선택된 select 페이지 번호가 보이게 함.  --%>
	$('#selectPagination option[value="${paginationInfo.currentPageNo }"]').attr('selected','selected');
	
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
						<span>차량현황조회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/contrac_con_tit01.gif" alt="고객님께서 가입하신 공제계약 차량현황 입니다" /></p>
					<!-- 계약관리 탭메뉴 -->
					<div class="tabGruop">
						<ul class="tab">
							<li class="on"><a href="/netCounter/inquiryService/contractInquiry/accCarListInquiry.do"><span>차량현황조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/carDeductInquiry.do"><span>계약정보조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/divideInquiry.do"><span>분담금수납대상</span></a></li>
						</ul>
					</div>
					<div class="conSection clfix">
						<h3 class="hide">차량현황조회</h3>
						<h5 class="netsubTit" ><span class="greenBul">적재물 공제 계약 &#40;주선&#41;</span></h5>
						<!-- 적재물공제계약 s -->
						<div class="tbWork1">
							<table class="tbWork_st01" summary="적재물 공제 계약 상세정보 테이블 입니다.">
								<caption>적재물 공제 계약에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:15%;" />
									<col style="width:10%;" />
									<col style="width:10%;" />
									<col style="width:25%;" />
									<col style="width:25%;" />
									<col style="width:15%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">자기부담금</th>
										<th scope="col">계약상태</th>
										<th scope="col">납입구분</th>
										<th scope="col">계약기간</th>
										<th scope="col">유효기간</th>
										<th scope="col">차회분담금</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${ not empty resultList}">
											<c:forEach var="result" items="${resultList}" varStatus="status">
											 	<tr>		  			    
											 		<td>${result.myunchaek_amt}</td>
											 		<td>${result.gyeyak_state_nm}</td>
											    	<td>${result.napip_gb}</td>
										      		<td><a class="link" href="/netCounter/inquiryService/contractInquiry/carryJsDeductInquiry.do?gyeyak_no=${result.gyeyak_no }">${result.gaip_ymd}</a></td>
												    <td>${result.yuhyo_ymd}</td>
											    	<td class="alR">${result.next_bunnap_amt} 원</td>	    			    
											  	</tr>
											 </c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">적재물 공제 계약 내용이 없습니다</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div><!--// 적재물공제계약 e -->
						
						<!--
							검색 추가 style inline으로 추가함.
						-->
						<h5 class="netsubTit" style="float: left;" ><span class="greenBul">가입중인 차량현황</span></h5>
						<p class="etcTxt" style="float: left;margin-top: 10px;margin-left: 5px;">&#40;기준일자 &#58; <fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> &#41;</p>
						<p class="etcTxt" style="float: right;">
							<select id="selectPagination">
								<option value="0">페이지선택</option>
								<c:forEach begin="1" end="${paginationInfo.totalPageCount }" var="tpc">
									<%-- <option value="${tpc }">${tpc * paginationInfo.recordCountPerPage}</option> --%>
									<option value="${tpc }">${tpc } page</option>
								</c:forEach>
							</select>
						</p>
						<form:form commandName="searchVO" name="f" method="post" action="/netCounter/inquiryService/contractInquiry/accCarListInquiry.do">
						<fieldset>
						<legend>보상정보조회</legend>
							<form:hidden path="pageIndex" />
							<form:hidden path="start_acdnt_ymd" /><%--보상정보조회용 --%>
							<form:hidden path="end_acdnt_ymd" /><%--보상정보조회용 --%>
							<form:hidden path="searchCondition" /><%--보상정보조회용 --%>
							<form:hidden path="searchKeyword" /><%--보상정보조회용 --%>
							<div class="searchBox02 clfix mB30" style="clear:both;margin-bottom:10px !important;">
								<!-- 차량번호검색 -->
								<div><!-- <div class="searchUp"> -->
									<div class="searchL">
										<dl>
											<dt>기간검색</dt>
											<dd>
												<label for="startdate" class="hide">시작날짜</label>
												<form:input type="text" path="searchStartDetailDate" readonly="true" title="시작날짜" style="width:95px;" />
												&#126;
												<label for="enddate" class="hide">종료날짜</label>
												<form:input type="text" path="searchEndDetailDate" readonly="true" title="시작날짜" style="width:95px;" />
											</dd>
										</dl>
									</div>
									<!-- 검색버튼 -->
									<div class="btn_absol">
										<span class="btn_pack btn_type04"><a id="f_submit" href="#;" class="bold">검색하기</a></span>
										<span class="btn_pack btn_type05"><a id="f_reset" href="#;" class="bold">검색초기화</a></span>
									</div>
								</div>
							</div>
						</fieldset>
						</form:form>
						<!-- 가입중인차량현황 s -->
						<div class="tbWork1">
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
											<c:forEach var="carDeduct" items="${carStatusList }" varStatus="varStatus">
												<%-- 통합계약 --%>
												<tr>
													<%-- <td rowspan="3" class="brB2">${paginationInfo.totalRecordCount  - ( ( paginationInfo.currentPageNo - 1 )  * paginationInfo.pageSize  ) - varStatus.index}</td> --%>
													<td rowspan="3" class="brB2">${varStatus.count + ( ( paginationInfo.currentPageNo - 1 )  * paginationInfo.pageSize ) }</td>
													<td rowspan="3" class="brB2">
														<a id="f_car" href="#;" class="link" car_no="${carDeduct.CAR_NO }" >${carDeduct.CAR_NO }</a>
													</td>
													<td rowspan="3" class="brB2">${carDeduct.CAR_BODY_NO }</td>
													<td rowspan="3" class="brB2">${carDeduct.CAR_NM }</td>
													<td><a href="/netCounter/inquiryService/contractInquiry/totalContractInquiry.do?car_gaip_no=${carDeduct.CAR_GAIP_NO }&gyeyak_no=${carDeduct.GYEYAK_NO }" class="link txtC01">통합</a></td>
													<td>
														<c:choose>
															<c:when test="${carDeduct.GYEYAK_STATE_NM == '유지' }">
																<span class="txtC04">${carDeduct.GYEYAK_STATE_NM }</span>
															</c:when>
															<c:otherwise>
																${carDeduct.GYEYAK_STATE_NM }
															</c:otherwise>
														</c:choose>
													</td>
													<td><a href="/netCounter/inquiryService/contractInquiry/totalContractInquiry.do?car_gaip_no=${carDeduct.CAR_GAIP_NO }&gyeyak_no=${carDeduct.GYEYAK_NO }" class="link">${carDeduct.DAMBO_GAIP_YMD }</a></td>
													<td>
														<c:if test="${not empty carDeduct.NEXT_BUNNAP_YMD}">
															${fn:substring(carDeduct.NEXT_BUNNAP_YMD,0,4)}.${fn:substring(carDeduct.NEXT_BUNNAP_YMD,4,6)}.${fn:substring(carDeduct.NEXT_BUNNAP_YMD,6,8)}
														</c:if>
													</td>
													<td class="alR"><fmt:formatNumber value="${carDeduct.NEXT_BUNNAP_AMT }" type="number" /> 원</td>
													<td rowspan="3" >
														<c:choose>
															<c:when test="${not empty carDeduct.BOSANG_CNT && carDeduct.BOSANG_CNT > 0}">
																<a id="f_bosang" href="#;" class="link" car_no="${carDeduct.CAR_NO }">${carDeduct.BOSANG_CNT }건</a>
															</c:when>
															<c:otherwise>
																0건 
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
												<%-- 재해 계약 --%>
												<c:choose>
													<c:when test="${not empty carDeduct.accDeductMap }">
														<tr>
															<td><a href="/netCounter/inquiryService/contractInquiry/accDeductInquiry.do?car_gaip_no=${carDeduct.CAR_GAIP_NO }&gyeyak_no=${carDeduct.GYEYAK_NO }" class="link txtC02">재해</a></td>
															<td>
																<c:choose>
																	<c:when test="${carDeduct.accDeductMap.GYEYAK_STATE_NM == '유지' }">
																		<span class="txtC04">${carDeduct.accDeductMap.GYEYAK_STATE_NM }</span>
																	</c:when>
																	<c:otherwise>
																		${carDeduct.accDeductMap.GYEYAK_STATE_NM }
																	</c:otherwise>
																</c:choose>
															</td>
															<td><a href="/netCounter/inquiryService/contractInquiry/accDeductInquiry.do?car_gaip_no=${carDeduct.CAR_GAIP_NO }&gyeyak_no=${carDeduct.GYEYAK_NO }" class="link">${carDeduct.accDeductMap.GAIP_YMD }</span></a></td>
															<td>
																<c:if test="${not empty carDeduct.accDeductMap.NEXT_BUNNAP_YMD}">
																	${fn:substring(carDeduct.accDeductMap.NEXT_BUNNAP_YMD,0,4)}.${fn:substring(carDeduct.accDeductMap.NEXT_BUNNAP_YMD,4,6)}.${fn:substring(carDeduct.accDeductMap.NEXT_BUNNAP_YMD,6,8)}
																</c:if>
															</td>
															<td> 
																<c:if test="${not empty carDeduct.accDeductMap.NEXT_BUNNAP_AMT && carDeduct.accDeductMap.NEXT_BUNNAP_AMT > 0}">
																	<fmt:formatNumber value="${carDeduct.accDeductMap.NEXT_BUNNAP_AMT}"  type="number" />원
																</c:if>
															</td>
														</tr>
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
													<c:when test="${not empty carDeduct.carryDeductMap }">
														<tr>
															<td class="brB2"><a href="/netCounter/inquiryService/contractInquiry/carryDeductInquiry.do?car_gaip_no=${carDeduct.CAR_GAIP_NO }&gyeyak_no=${carDeduct.GYEYAK_NO }" class="link txtC03">적재물</a></td>
															<td class="brB2">
																<c:choose>
																	<c:when test="${carDeduct.carryDeductMap.GYEYAK_STATE_NM == '유지' }">
																		<span class="txtC04">${carDeduct.carryDeductMap.GYEYAK_STATE_NM }</span>
																	</c:when>
																	<c:otherwise>
																		${carDeduct.carryDeductMap.GYEYAK_STATE_NM }
																	</c:otherwise>
																</c:choose>
															</td>
															<td class="brB2"><a href="/netCounter/inquiryService/contractInquiry/carryDeductInquiry.do?car_gaip_no=${carDeduct.CAR_GAIP_NO }&gyeyak_no=${carDeduct.GYEYAK_NO }" class="link">${carDeduct.carryDeductMap.GAIP_YMD }</span></a></td>
															<td class="brB2">
																<c:if test="${not empty carDeduct.carryDeductMap.NEXT_BUNNAP_YMD}">
																	${fn:substring(carDeduct.carryDeductMap.NEXT_BUNNAP_YMD,0,4)}.${fn:substring(carDeduct.carryDeductMap.NEXT_BUNNAP_YMD,4,6)}.${fn:substring(carDeduct.carryDeductMap.NEXT_BUNNAP_YMD,6,8)}
																</c:if>
															</td>
															<td class="brB2">
																<c:if test="${not empty carDeduct.carryDeductMap.NEXT_BUNNAP_AMT && carDeduct.carryDeductMap.NEXT_BUNNAP_AMT > 0}">
																	<fmt:formatNumber value="${carDeduct.carryDeductMap.NEXT_BUNNAP_AMT}"  type="number" />원
																</c:if>
															</td>
														</tr>
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
												<td scope="col" colspan="10">검색결과가 없습니다. 조회할 기간을 선택후 검색하여 주세요.</td>
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
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javascript">
function goPage(pageNo){
	
	location.href="/m/netCounter/contract/carStatus/list.do?pageIndex="+pageNo;
}
function goCar( car_no ){
    
	document.f.searchCondition.value = 'car_no';
	document.f.searchKeyword.value = car_no ;
	document.f.action = '/m/netCounter/contract/contractInfo/carStatus/list.do' ;
	document.f.submit();
	return false;
}

$(document).ready(function(){
	$('td.list.borrNone').on('click',function(){
		var dambo = $(this).attr('dambo');
		var car_gaip_no = $(this).attr('car_gaip_no');
		var dambo_gaip_ymd = $(this).attr('dambo_gaip_ymd');
		var next_bunnap_ymd = $(this).attr('next_bunnap_ymd');
		var next_bunnap_amt = $(this).attr('next_bunnap_amt');
		var bosang_cnt = $(this).attr('bosang_cnt');
		
		var detailEl = $('tr.gyeyakDetail[car_gaip_no="'+car_gaip_no+'"]');
		var p = $(this).find('p');<%-- 클릭 버튼 --%>
		<%-- 클릭시 이미 상세 화면이 열려있을 경우 닫기. --%>
		if( p.hasClass('on') ){
			p.removeClass('on');
			detailEl.hide();
			return false;
		}
		<%-- 데이터 복사 --%>
		detailEl.find('tr:eq(0) td:eq(0)').text(dambo_gaip_ymd);//계약기간
		detailEl.find('tr:eq(1) td:eq(0)').text(next_bunnap_ymd);//차회납입일
		detailEl.find('tr:eq(2) td:eq(0)').text(next_bunnap_amt+'');//차회분담금
		detailEl.find('tr:eq(2) td:eq(1)').text(bosang_cnt+'');//보상건수
		
		<%-- 화면 구성 --%>
		switch (dambo) {
			case '1':
				detailEl.find('td > div').removeClass().addClass('tbDiv01');
				break;
			case '4':
				detailEl.find('td > div').removeClass().addClass('tbDiv02');
				break;
			case '5':
				detailEl.find('td > div').removeClass().addClass('tbDiv03');
				break;
		}
		$('td.list.borrNone[car_gaip_no="'+car_gaip_no+'"] p').removeClass('on');
		p.addClass('on');
		detailEl.show();
	});
	
	<%-- 보상정보조회 이동 --%>
	$('a#f_car').on('click',function(event){
		goCar( $(this).attr('car_no') );
	});
});

</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path08">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/netCounter/index.do">인터넷창구</a></li>
			<li><a href="/m/netCounter/contract/carStatus/list.do">계약조회</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i08"><img alt="계약조회" src="/images/m_truck/subtop/08top_2.png" /></li>
				<li class="txt01">사업용 화물자동차의 교통사고 감소를 위한 다각적인 캠페인을 시행하고 있습니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="tabWrap">
			<!-- tab -->
			<div class="tabBox04">
				<ul >
					<li class="on"><a href="/m/netCounter/contract/carStatus/list.do">차량현황조회</a></li>
					<li><a href="/m/netCounter/contract/contractInfo/carStatus/list.do">계약정보조회</a></li>
					<li><a href="/m/netCounter/contract/divide/list.do">분담금수납대상</a></li>
				</ul>
			</div>
			<!-- tab contents -->
			<div class="basicCont02">
				<!-- 적재물 공제 계약 -->
				<div class="textTitle"><h2 class="txtTit03">적재물 공제 계약 (주선)</h2></div>
				<table class="tbSt06">
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">계약상태</th>
							<th scope="col" class="borrNone">계약기간</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ not empty resultList}">
								<c:forEach var="result" items="${resultList}" varStatus="status">
								 	<tr>		  			    
								 		<td><a href="/m/netCounter/contract/contractInfo/carryJs/detail.do?gyeyak_no=${result.gyeyak_no }">${result.gyeyak_state_nm}</a></td>
							      		<td><a href="/m/netCounter/contract/contractInfo/carryJs/detail.do?gyeyak_no=${result.gyeyak_no }">${result.gaip_ymd}</a></td>
								  	</tr>
								 </c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="2">적재물 공제 계약 내용이 없습니다</td>
								</tr>
							</c:otherwise>
						</c:choose>					
					</tbody>
				</table>
				<br/>
				<!-- 가입중인 차량현황 -->
				<div class="textTitle02"><h2 class="txtTit03">가입중인 차량현황</h2><p class="rightTxt"><fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> 기준</p></div>
				<table class="tbSt06">
					<colgroup>
						<col width="21%">
						<col width="21%">
						<col width="15%">
						<col width="16%">
						<col width="17%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">차량번호</th>
							<!-- 
							<th scope="col">차대번호</th>
							 -->
							<th scope="col" colspan="2">차명</th>
							<th scope="col" colspan="3" class="borrNone">계약상태</th>
						</tr>
					</thead>
					<tbody>
						<form:form commandName="searchVO" name="f" method="post" action="/m/netCounter/contract/contractInfo/carStatus/list.do">
							<form:hidden path="pageIndex" />
						
							<form:hidden path="start_acdnt_ymd" /><%--보상정보조회용 --%>
							<form:hidden path="end_acdnt_ymd" /><%--보상정보조회용 --%>
							<form:hidden path="searchCondition" /><%--보상정보조회용 --%>
							<form:hidden path="searchKeyword" /><%--보상정보조회용 --%>
						</form:form>
									<c:choose>
										<c:when test="${not empty carStatusList }">
											<c:forEach var="carDeduct" items="${carStatusList }" varStatus="varStatus">
												<%-- 통합계약 --%>
												<tr>
													<td rowspan="3" class="brB2">
														<a id="f_car" href="#;" class="link" car_no="${carDeduct.CAR_NO }" >${carDeduct.CAR_NO }</a>
													</td>
													<!-- 
													<td rowspan="3" class="brB2">${carDeduct.CAR_BODY_NO }</td>
													 -->
													<td rowspan="3" colspan="2" class="brB2">${carDeduct.CAR_NM }</td>
													<td class="list"><p class="color01"><a href="/m/netCounter/contract/contractInfo/total/detail.do?car_gaip_no=${carDeduct.CAR_GAIP_NO }" class="link txtC01">통합</a></p></td>
													<td >${carDeduct.GYEYAK_STATE_NM }</td>
													<td class="list borrNone" 
														DAMBO="1"
														CAR_GAIP_NO="${carDeduct.CAR_GAIP_NO }"
														CAR_NO="${carDeduct.CAR_NO }"
														DAMBO_GAIP_YMD="${carDeduct.DAMBO_GAIP_YMD }"
														NEXT_BUNNAP_YMD="<c:if test="${not empty carDeduct.NEXT_BUNNAP_YMD}">${fn:substring(carDeduct.NEXT_BUNNAP_YMD,0,4)}.${fn:substring(carDeduct.NEXT_BUNNAP_YMD,4,6)}.${fn:substring(carDeduct.NEXT_BUNNAP_YMD,6,8)}</c:if>"
														NEXT_BUNNAP_AMT="<fmt:formatNumber value="${carDeduct.NEXT_BUNNAP_AMT }" type="number" />원"
															<c:choose>
																<c:when test="${not empty carDeduct.BOSANG_CNT && carDeduct.BOSANG_CNT > 0}">
																	 BOSANG_CNT="${carDeduct.BOSANG_CNT } 건"
																</c:when>
																<c:otherwise>
																	 BOSANG_CNT="0 건"
																</c:otherwise>
															</c:choose>
														>
														<p class="av01"></p>
													</td>
												</tr>
												<%-- 재해 계약 --%>
												<c:choose>
													<c:when test="${not empty carDeduct.accDeductMap }">
														<tr>
															<td class="list"><p class="color02"><a href="/m/netCounter/contract/contractInfo/disaster/detail.do?car_gaip_no=${carDeduct.CAR_GAIP_NO }" class="link txtC02">재해</a></p></td>
															<td >${carDeduct.accDeductMap.GYEYAK_STATE_NM }</td>
															<td class="list borrNone"  
																DAMBO="4"
																CAR_GAIP_NO="${carDeduct.CAR_GAIP_NO }"
																CAR_NO="${carDeduct.CAR_NO }"
																DAMBO_GAIP_YMD="${carDeduct.accDeductMap.GAIP_YMD }"
																NEXT_BUNNAP_YMD="<c:if test="${not empty carDeduct.accDeductMap.NEXT_BUNNAP_YMD}">${fn:substring(carDeduct.accDeductMap.NEXT_BUNNAP_YMD,0,4)}.${fn:substring(carDeduct.accDeductMap.NEXT_BUNNAP_YMD,4,6)}.${fn:substring(carDeduct.accDeductMap.NEXT_BUNNAP_YMD,6,8)}</c:if>"
																NEXT_BUNNAP_AMT="<c:if test="${not empty carDeduct.accDeductMap.NEXT_BUNNAP_AMT && carDeduct.accDeductMap.NEXT_BUNNAP_AMT > 0}"><fmt:formatNumber value="${carDeduct.accDeductMap.NEXT_BUNNAP_AMT}"  type="number" />원</c:if>"
																	<c:choose>
																		<c:when test="${not empty carDeduct.BOSANG_CNT && carDeduct.BOSANG_CNT > 0}">
																			 BOSANG_CNT="${carDeduct.BOSANG_CNT } 건"
																		</c:when>
																		<c:otherwise>
																			 BOSANG_CNT="0 건"
																		</c:otherwise>
																	</c:choose>
															>
																<p class="av02"></p>
															</td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<td ><p class="color02">재해</p></td>
															<td ><span class="txtC04">&nbsp;</span></td>
															<td class="borrNone" DAMBO="4"  CAR_GAIP_NO="${carDeduct.CAR_GAIP_NO }" CAR_NO="${carDeduct.CAR_NO }"  >&nbsp;</td>
														</tr>
													</c:otherwise>
												</c:choose>
												<%-- 적재물 계약 --%>
												<c:choose>
													<c:when test="${not empty carDeduct.carryDeductMap }">
														<tr>
															<td class="list"><p class="color03"><a href="/m/netCounter/contract/contractInfo/carry/detail.do?car_gaip_no=${carDeduct.CAR_GAIP_NO }" class="link txtC02">적재물</a></p></td>
															<td >${carDeduct.carryDeductMap.GYEYAK_STATE_NM }</td>
															<td class="list borrNone" 
																DAMBO="5"
																CAR_GAIP_NO="${carDeduct.CAR_GAIP_NO }"
																CAR_NO="${carDeduct.CAR_NO }"
																DAMBO_GAIP_YMD="${carDeduct.carryDeductMap.GAIP_YMD }"
																NEXT_BUNNAP_YMD="<c:if test="${not empty carDeduct.carryDeductMap.NEXT_BUNNAP_YMD}">${fn:substring(carDeduct.carryDeductMap.NEXT_BUNNAP_YMD,0,4)}.${fn:substring(carDeduct.carryDeductMap.NEXT_BUNNAP_YMD,4,6)}.${fn:substring(carDeduct.carryDeductMap.NEXT_BUNNAP_YMD,6,8)}</c:if>"
																NEXT_BUNNAP_AMT="<c:if test="${not empty carDeduct.carryDeductMap.NEXT_BUNNAP_AMT && carDeduct.carryDeductMap.NEXT_BUNNAP_AMT > 0}"><fmt:formatNumber value="${carDeduct.carryDeductMap.NEXT_BUNNAP_AMT}"  type="number" />원</c:if>"
																	<c:choose>
																		<c:when test="${not empty carDeduct.BOSANG_CNT && carDeduct.BOSANG_CNT > 0}">
																			 BOSANG_CNT="${carDeduct.BOSANG_CNT } 건"
																		</c:when>
																		<c:otherwise>
																			 BOSANG_CNT="0 건"
																		</c:otherwise>
																	</c:choose>
															>
																<p class="av03"></p>
															</td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<td ><p class="color03">적재물</p></td>
															<td ><p class="color04">&nbsp;</p></td>
															<td class="borrNone" DAMBO="5" CAR_GAIP_NO="${carDeduct.CAR_GAIP_NO }" CAR_NO="${carDeduct.CAR_NO }" >&nbsp;</td>
														</tr>
													</c:otherwise>
												</c:choose>
												
												<!-- 여긴펼침 display:none -->
												<tr class="gyeyakDetail" style="display:none;" CAR_GAIP_NO="${carDeduct.CAR_GAIP_NO }" CAR_NO="${carDeduct.CAR_NO }" >
													<td colspan="6" class="pa0 boraNone">
														<div class="tbDiv01"><%-- class : 통합(tbDiv01), 재해(tbDiv02) , 적재물(tbDiv03) --%>
															<table>
																<colgroup>
																	<col width="27%">
																	<col width="23%">
																	<col width="27%">
																	<col width="23%">
																</colgroup>
																<tbody>
																	<tr>
																		<th>계약기간</th>
																		<td colspan="3" class="borrNone" ></td>
																	</tr>
																	<tr>
																		<th>차회납입일</th>
																		<td colspan="3" class="borrNone"></td>
																	</tr>
																	<tr>
																		<th class="borbNone">차회분담금</th>
																		<td class="borbNone"></td>
																		<th class="borbNone">보상건수<br/>최근6개월</th>
																		<td class="borrNone borbNone"></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</td>
												</tr>
												<!--// 여긴펼침 display:none -->
												
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">검색결과가 없습니다. </td>
											</tr>										
										</c:otherwise>
									</c:choose>
						
					</tbody>
				</table>
			</div>
		</article><!--// tabWrap -->
		<!-- pagenavi -->
		<article class="textCenter">
			<ul class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="mobileImage" jsFunction="goPage" />
			</ul>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
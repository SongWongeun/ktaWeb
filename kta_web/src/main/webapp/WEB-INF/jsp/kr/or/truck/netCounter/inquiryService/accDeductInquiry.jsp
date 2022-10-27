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
<script type="text/javaScript" language="javascript" defer="defer">
function goIndex() {
	document.location.href = "/main/index.do";
}
function bosangChk(no, chk) {
	if(chk == '0'){
		alert(no+"은(는) 최근 3년간 자동차공제관련 사고내역이 없습니다.")
	}
}
function detailList(car_gaip_no) {
	document.boardForm.car_gaip_no.value=car_gaip_no;
	document.boardForm.action = "<c:url value='/netCounter/inquiryService/contractInquiry/accDeductInquiryDetail.do'/>";
   	document.boardForm.submit();
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
				<div class="conTitle borderBn">
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
							<li><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><span>자동차공제조회</span></a></li>
							<li class="on"><a href="/netCounter/inquiryService/contractInquiry/accInquiry.do"><span>재해공제조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/carryInquiry.do"><span>적재물공제조회</span></a></li>
						</ul>

					</div>
					<div class="conSection clfix">
						<h3 class="hide">계약정보조회</h3>
						<div class="netTitbox">
							<h4 class="netTit">${loginVO.agentNm} 고객님께서 가입하신 <span class="txtColor02">공제계약</span>의 <span class="txtColor03">상세내용</span>을 확인하실 수 있습니다&#46;</h4>
						</div>
						<!-- 계약정보조회서브탭메뉴 s -->
						<div class="subtabGruop">
							<p class="tabTit"><span class="icoCar">차량번호</span> ${resultList[0].car_no}</p>
							<ul class="subTab"><!-- 탭 선택 시 class="on" 추가 -->
								<li class="on"><a href="#;"><span>재해공제계약</span></a></li>
								<%-- <li class="last "><a href="/netCounter/inquiryService/contractInquiry/totalContractInquiry.do?car_gaip_no=${resultList[0].car_gaip_no}"><span>통합계약</span></a></li>
								<li class="on"><a href="/netCounter/inquiryService/contractInquiry/accDeductInquiry.do?car_gaip_no=${resultList[0].car_gaip_no}"><span>재해계약</span></a></li>
								<c:if test="${not empty carryTotCnt && carryTotCnt > 0 }">
									<li><a href="/netCounter/inquiryService/contractInquiry/carryDeductInquiry.do?car_gaip_no=${resultList[0].car_gaip_no}"><span>적재물계약</span></a></li>
								</c:if> --%>
							</ul>
						</div>
						<!-- 재해계약 s -->
						<h4 class="hide">재해계약</h4>
						<h5 class="netsubTit" ><span class="greenBul">자동차정보</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st04" summary="자동차정보 상세정보 테이블 입니다.">
								<caption>자동차정보에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:30%;" />
									<col style="width:20%;" />
									<col style="width:30%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="borLeft">차량번호</th>
										<td>${resultList[0].car_gaip_no}</td>
										<th scope="row">차종</th>
										<td class="alR">${resultList[0].car_kind_nm}</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">차명</th>
										<td>${resultList[0].car_nm}</td>
										<th scope="row">차대번호</th>
										<td class="alR">${resultList[0].car_body_no}</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">년식</th>
										<td>${resultList[0].car_yy}년</td>
										<th scope="row">적재정량</th>
										<td class="alR">${resultList[0].proper_wg} kg</td>
									</tr>
									<tr>
										<th scope="row" class="borLeft">총 중 량</th>
										<td colspan="3">${resultList[0].tot_wg} kg</td>
									</tr>
								</tbody>
							</table>
						</div><!--// 자동차정보 e -->
						<h5 class="netsubTit" ><span class="greenBul">종사자정보</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st04" summary="종사자정보 상세정보 테이블 입니다.">
								<caption>종사자정보에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:15%;" />
									<col style="width:%;" />
									<col style="width:15%;" />
									<col style="width:%;" />
									<col style="width:15%;" />
									<col style="width:%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="borLeft">종사자이름</th>
										<td>${resultList[0].jongsa_nm}</td>
										<th scope="row">주민등록번호</th>
										<td>${resultList[0].jongsa_jumin_no}</td>
										<th scope="row">전화번호</th>
										<td>${resultList[0].tel_local_no} - ${resultList[0].tel_no}</td>
									</tr>
								</tbody>
							</table>
						</div><!--//종사자정보 e -->
						<h5 class="netsubTit" ><span class="greenBul">계약기간&#40;계약상태&#41;</span></h5>
						<div class="tbWork1">
							<table class="tbWork_st01" summary="계약기간계약상태 상세정보 테이블 입니다.">
								<caption>계약기간 계약상태에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:20%;" />
									<col style="width:30%;" />
									<col style="width:20%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상품종류</th>
										<th scope="col">계약상태</th>
										<th scope="col">계약기간</th>
										<th scope="col">납입구분</th> 
									</tr>
								</thead>
								<tbody>
									<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>		  			    
											<td >${result.jaehae_gongje_nm}</td>
											<td >${result.gyeyak_state_nm}</td>
											<td >${result.gaip_ymd}</td>
											<td >${result.napip_gb}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!--// 계약기간 e -->
						<!-- <h5 class="netsubTit" ><span class="greenBul">특별약관</span></h5>
						<div class="tbWork2">
							<p>&#45;&nbsp;법률비용지원 특별약관 ?????</p>
						</div> --><!--// 특별약관 e -->
						<h5 class="netsubTit" ><span class="greenBul">분담금 납입정보</span></h5>
						<div class="tbWork1">
							<p class="etcTxt">&#40;기준일자 &#58; 2013년 10월 10일&#41;</p>
							<table class="tbWork_st01" summary="분담금 납입정보 상세정보 테이블 입니다. 담보,계약상태,회차,분담금,영수일자,합계">
								<caption>분담금 납입정보에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:8%;" />
									<col style="width:8%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2">담보</th>
										<th scope="col" rowspan="2">계약상태</th>
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
								<tbody>
									<c:set var="bunnap_sum_1" value="0"/>
									<c:set var="bunnap_sum_2" value="0"/>
									<c:set var="bunnap_sum_3" value="0"/>
									<c:set var="bunnap_sum_4" value="0"/>
									<c:set var="bunnap_sum_5" value="0"/>
									<c:set var="bunnap_sum_6" value="0"/>
									<c:forEach var="detail" items="${detailList}" varStatus="status">
										<c:if test="${not empty detail.bunnap_amt1}">
											<c:set var="bunnap_sum_1" value="${bunnap_sum_1+detail.bunnap_amt1 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt2}">
											<c:set var="bunnap_sum_2" value="${bunnap_sum_2+detail.bunnap_amt2 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt3}">
											<c:set var="bunnap_sum_3" value="${bunnap_sum_3+detail.bunnap_amt3 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt4}">
											<c:set var="bunnap_sum_4" value="${bunnap_sum_4+detail.bunnap_amt4 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt5}">
											<c:set var="bunnap_sum_5" value="${bunnap_sum_5+detail.bunnap_amt5 }"/>
										</c:if>
										<c:if test="${not empty detail.bunnap_amt6}">
											<c:set var="bunnap_sum_6" value="${bunnap_sum_6+detail.bunnap_amt6 }"/>
										</c:if>
										<%-- 날짜 --%>
										<c:if test="${not empty detail.youngsu_ymd1}">
											<fmt:parseDate value="${detail.youngsu_ymd1}" var="dateFmt1" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd2}">
											<fmt:parseDate value="${detail.youngsu_ymd2}" var="dateFmt2" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd3}">
											<fmt:parseDate value="${detail.youngsu_ymd3}" var="dateFmt3" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd4}">
											<fmt:parseDate value="${detail.youngsu_ymd4}" var="dateFmt4" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd5}">
											<fmt:parseDate value="${detail.youngsu_ymd5}" var="dateFmt5" pattern="yyyymmdd"/>
										</c:if>
										<c:if test="${not empty detail.youngsu_ymd6}">
											<fmt:parseDate value="${detail.youngsu_ymd6}" var="dateFmt6" pattern="yyyymmdd"/>
										</c:if>
										
										<tr>		 		
											<td>종사자재해</td>		    	
											<td>${detail.gyeyak_state_nm}</td>
											<td><fmt:formatNumber value="${detail.bunnap_amt1 }" type="number" /></td>
											<td><fmt:formatDate value="${dateFmt1}" pattern="yy.mm.dd"/></td>
											<td><fmt:formatNumber value="${detail.bunnap_amt2 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt2}" pattern="yy.mm.dd"/></td>
											<td><fmt:formatNumber value="${detail.bunnap_amt3 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt3}" pattern="yy.mm.dd"/></td>
											<td><fmt:formatNumber value="${detail.bunnap_amt4 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt4}" pattern="yy.mm.dd"/></td>
											<td><fmt:formatNumber value="${detail.bunnap_amt5 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt5}" pattern="yy.mm.dd"/></td>
											<td><fmt:formatNumber value="${detail.bunnap_amt6 }" type="number" /></td>		    
											<td><fmt:formatDate value="${dateFmt6}" pattern="yy.mm.dd"/></td>    	
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2" scope="col">합계</td>
										<!-- <td scope="col"></td> -->
										<td scope="col" ><fmt:formatNumber value="${bunnap_sum_1 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" ><fmt:formatNumber value="${bunnap_sum_2 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" ><fmt:formatNumber value="${bunnap_sum_3 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" ><fmt:formatNumber value="${bunnap_sum_4 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" ><fmt:formatNumber value="${bunnap_sum_5 }" type="number" /></td>
										<td scope="col"></td>
										<td scope="col" ><fmt:formatNumber value="${bunnap_sum_6 }" type="number" /></td>
										<td scope="col"></td>
									</tr>
								</tfoot>
							</table>
						</div><!--// 분담금 납입정보 e -->
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




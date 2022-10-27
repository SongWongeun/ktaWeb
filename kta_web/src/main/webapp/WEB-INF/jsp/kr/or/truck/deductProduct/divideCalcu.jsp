<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	var hash = location.hash;
	

	if(hash == '#tab1'){
		$("a[name='tab1']").trigger('click');	
	}else if(hash == '#tab2'){
		$("a[name='tab2']").trigger('click');		
	}else if(hash == '#tab3'){
		$("a[name='tab3']").trigger('click');		
	}
	
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
						<h2><img src="/images/truck/dedu/devide_tit.gif" alt="분담금계산" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>					
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>
						<span>분담금계산</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/devide_con_tit.gif" alt="공제계약 분담금계산 안내 입니다." /></p>				
					<div class="conSection">
						<!-- tabs s -->
						<div class="tabs">
							<ul class="tabMenu">
								<li><a href="#tab1" name="tab1">자동차공제</a></li>
								<li><a href="#tab2" name="tab2">종사자재해</a></li>
								<li><a href="#tab3" name="tab3">적재물배상책임공제</a></li>
							</ul><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 자동차공제 -->
								<div id="tab1" class="tabCont">
									<h3 class="hide">자동차공제</h3>
									<div class="txtContent">
										<h4 class="decuh4Tit">분담금 적용상의 차종 구분</h4>
										<table class="tbDetail_st01" summary="분담금 적용상의 차종 구분 상세정보 테이블 입니다.">
											<caption>분담금 적용상의 차종 구분에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:16%;" />
												<col style="width:14%;" />
												<col style="width:14%;" />
												<col style="width:14%;" />
												<col style="width:14%;" />
												<col style="width:14%;" />
												<col style="width:14%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">차종</th>
													<th scope="col">1종</th>
													<th scope="col">2종</th>
													<th scope="col">3종</th>
													<th scope="col">4종</th>
													<th scope="col">특정</th>
													<th scope="col">특수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>적용구분</td>
													<td>적재정량<br/>5t 초과</td>
													<td>2&#46;5t 초과<br/>5t 이하</td>
													<td>1t 초과<br/>2&#46;5t 이하</td>
													<td>1t 이하<br/></td>
													<td>특정용도<br/>사용자동차</td>
													<td>특수사업<br/>구조자동차</td>
												</tr>
											</tbody>
										</table><!--// 분담금 적용상의 차종 구분 e -->
									</div>
									<div class="txtContent">
										<h4 class="decuh4Tit">적용분담금의 계산</h4>
										<p class="txtPoint">1&#41; 대인배상&#8544;&#40;책임공제&#41;</p>
										<p class="pB13"><img src="/images/truck/dedu/devideCal_img1.gif" alt="적용분담금=기본분담금*(할인·할증+과손할증)요율*신규진입업체 가산요율" /></p>
										<p class="txtPoint">2&#41; 대인배상&#8545;&#44; 대물배상</p>
										<p class="pB13"><img src="/images/truck/dedu/devideCal_img2.gif" alt="적용분담금=기본분담금*경영성과 요율*특별요율*(할인·할증+과손할증+특별할증)*신규진입업체 가산요율" /></p>
										<p class="txtPoint">3&#41; 자기신체사고</p>
										<p class="pB13"><img src="/images/truck/dedu/devideCal_img6.gif" alt="적용분담금=기본분담금*특별요율*(할인·할증요율+과손할증요율+특별할증)*신규진입업체 가산요율" /></p>
										<p class="txtPoint">4&#41; 차량공제</p>
										<p class="pB13"><img src="/images/truck/dedu/devideCal_img3.gif" alt="적용분담금=차량기준가액*새차요율*중고차요율*특별요율*(할인·할증요율+과손할증요율+특별할증)*신규진입업체 가산요율" /></p>
										<p class="txtPoint">5&#41; 공제조합과 손해보험사간 시행제도 비교</p>
										<table class="tbDetail_st01 mB0" summary="공제조합과 손해보험사간 시행제도 비교 상세정보 테이블 입니다.">
											<caption>공제조합과 손해보험사간 시행제도 비교에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:16%;" />
												<col style="width:16%;" />
												<col style="width:34%;" />
												<col style="width:34%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" colspan="2">구분</th>
													<th scope="col">공제조합</th>
													<th scope="col">손보사</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="2">기본성격</td>
													<td>비영리 공제조합</td>
													<td>이윤추구의 영리기업</td>
												</tr>
												<tr>
													<td colspan="2">할인&#183;할증 채택제도</td>
													<td>개별 할인&#183;할증</td>
													<td>단체 할인&#183;할증&#40;10대 이상&#41;</td>
												</tr>
												<tr>
													<td rowspan="2">최고적용율</td>
													<td>종합</td>
													<td>200&#37;&#40;특별할증&#44; 신규진입업체가산율 제외&#41;</td>
													<td>운전자 연령에 따라 보험료 차등적용</td>
												</tr>
												<tr>
													<td>책임</td>
													<td>100&#37;&#40;신규업체가산율 제외&#41;</td>
													<td>250&#37;</td>
												</tr>
												<tr>
													<td colspan="2">사고원인별 할증</td>
													<td>없음</td>
													<td>사고원인에 따라 10&#37;&#126;30&#37;까지 할증</td>
												</tr>
												<tr>
													<td rowspan="2" class="bB2">특별할증</td>
													<td>적용항목</td>
													<td>5개 그룹&#40;14개 항목&#41;대하여 적용</td>
													<td>4개 그룹&#40;16개 항목&#41; 대하여 적용</td>
												</tr>
												<tr>
													<td>적용기간</td>
													<td>2년간 적용</td>
													<td>3년간 적용</td>
												</tr>
											</tbody>
										</table><!--// 공제조합과 손해보험사간 시행제도 비교 e -->
										<p class="txtPoint02">우리 화물자동차공제조합은 영업용 화물운송사업을 영위하는 동업자간의 공생과 권익보호를 위하여 손보사의 종합보험과 차별화하여 사업용&#40;영업용&#41; 화물자동차의 특성에 맞는 제도를 개발 시행하고 있습니다&#46;</p>
									</div>
									<%-- <div class="txtContent pB0">
										<h4 class="decuh4Tit">법률비용지원 특별약관</h4>
										<p class="txtPoint">1&#41; 보상내용</p>
										<ul class="txtListst01">
											<li>조합은 조합원이 공제계약자동차를 운전하는 동안에 생긴 공제계약자동차의 사고로 인하여 남을 죽게 하거나 다치게 하여 형사적 책임을 지는 경우에 이 특별약관에서 정하는 바에 따라 보상하여 드립니다&#46;</li>
										</ul>
										<p class="txtPoint03 alR">&#40;단위 &#58; 만원&#41;</p>
										<table class="tbDetail_st01" summary="법률비용지원 특별약관 보상내용 상세정보 테이블 입니다.">
											<caption>법률비용지원 특별약관 보상내용에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:32%;" />
												<col style="width:34%;" />
												<col style="width:34%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">보상내용</th>
													<th scope="col">지급공제금</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>방어비용</td>
													<td>기소시 300</td>
													<td>구속영장에 의해 구속되거나 검사에 의해<br/>공소 제기된 경우 <span class="txtLine">정액지급</span></td>
												</tr>
												<tr>
													<td>형사합의 지원금</td>
													<td>사망 2&#44;000<br/>상해1급&#126;3급 500<br/>4급&#126;7급 300</td>
													<td>피해자에게 지급한 합의금을<br/><span class="txtLine">지급공제금 한도 내에서 실손보상</span></td>
												</tr>
												<tr>
													<td>벌금지원금</td>
													<td> 2&#44;000만원 한도</td>
													<td>타인의 신체에 상해를 입힘으로써 확정판결에 의하여<br /><span class="txtLine">정해진 벌금액을 지급공제금 한도 내에서 지급</span></td>
												</tr>
											</tbody>
										</table><!--// 법률비용지원 특별약관 보상내용 비교 e -->
										<p class="txtPoint">2&#41; 년간분담금 및 시행일</p>
										<ul class="txtListst01">
											<li>년간 46&#44;000원&#40;월 약3&#44;833원 수준&#41;</li>
											<li>시행일 &#58; 2014&#46;01&#46;01부터 시행</li>
										</ul>
									</div> --%>
								</div>
								<!-- 종사자재해공제 -->
								<div id="tab2" class="tabCont">
									<h3 class="hide">종사자재해</h3>
									<div class="txtContent">
										<h4 class="decuh4Tit">1&#41; 기본사항</h4>
										<p class="txtPoint">종사자재해 년간 기본분담금은 조합에서 미리 정한 분담금으로 계약자는 계약할 수 있습니다&#46;</p>
									</div>
									<div class="txtContent pB0">
										<h4 class="decuh4Tit">2&#41; 년간분담금 및 인정기준</h4>
										<table class="tbDetail_st01 mB0" summary="년간분담금 및 인정기준 상세정보 테이블 입니다.">
											<caption>년간분담금 및 인정기준에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:32%;" />
												<col style="width:34%;" />
												<col style="width:34%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" colspan="2">년간분담금</th>
													<th scope="col">328&#44;700원</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td rowspan="2" class="bB2">임금인정</td>
													<td>월</td>
													<td>1&#44;200&#44;000원</td>
												</tr>
												<tr>
													<td>1일</td>
													<td>40&#44;000원</td>
												</tr>
											</tbody>
										</table><!--// 년간분담금 및 인정기준 e -->
										<p class="txtPoint02">시행일 &#58; 2010&#46; 01&#46; 01일자 신규&#8901;갱신차량 적용</p>
									</div>
								</div>
								<!-- 적재물배상책임공제 -->
								<div id="tab3" class="tabCont">
									<h3 class="hide">적재물배상책임공제</h3>
									<div class="txtContent">
										<h4 class="decuh4Tit">적용분담금의 계산</h4>
										<p class="txtPoint">1&#41; 화물자동차운송위험담보</p>
										<p><img src="/images/truck/dedu/devideCal_img4.gif" alt="적용분담금=기본분담금*(할인·할증+과손할증)요율*신규진입업체 가산요율" /></p>
										<p class="txtPoint02 pB13">해당 기본분담금은 차종&#40;5톤 미만&#44; 5톤 이상 15톤 미만&#44; 15톤 이상&#41; 및 보상한도&#44; 자기부담금별로 달리 적용됨&#46;</p>
										<p class="txtPoint">2&#41; 화물자동차운송주선위험담보</p>
										<p><img src="/images/truck/dedu/devideCal_img5.gif" alt="적용분담금=기본분담금*(할인·할증+과손할증)요율*신규진입업체 가산요율" /></p>
										<p class="txtPoint02">해당 기본분담금은 매출액&#44; 자기부담금별로 달리 적용됨&#46;</p>
									</div>
								</div>
							</div><!--// tabContainer e -->
						</div><!--// tabs e -->
					</div><!--// conSection e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<!--// container e -->
		<hr />
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->

</body>
</html>
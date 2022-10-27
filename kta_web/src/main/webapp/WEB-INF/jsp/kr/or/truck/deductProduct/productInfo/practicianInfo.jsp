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
						<h2><img src="/images/truck/dedu/prodinfo_tit.gif" alt="상품안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/deductProductIndex.do" >상품안내</a>
						<span>종사자 재해</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/pracinfo_con_tit.gif" alt="공제계약 종사자 재해 상품안내 입니다." /></p>				
					<div class="conSection">
						<!-- 종사자 재해 -->
						<h3 class="deduh3Tit prodBg">종사자 재해</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea pracBg">
								<p class="lossTxt1">보상하는 손해</p>
								<p class="lossTxt2">종사자재해에서 조합은 조합원이 공제계약자동차를 소유 &#183; 사용 &#183; 관리하는 동안에 생긴<br/>종사자의 재해로 인해 발생한 손해를 보상하여 드립니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">보장 금액</h4>
							<p class="txtPoint">사망</p>
							<ul class="txtListst01 pB0">
								<li>사망&#40;유족&#41;공제금 &#58; 인정기준의 1&#44;300일분</li>
								<li>장의비 &#58; 인정기준의 120일분</li>
								<li>평균임금의 인정기준
									<ul class="txtListst02 pB0">
										<li>가&#46; 지급대상 &#45; 수탁관리자 겸 운전자 1인</li>
										<li>나&#46; 인정기준</li>
										<li>
											<table class="tbDetail_st01" summary="종사자 재해 사망 인정기준">
												<caption>종사자 재해 사망 인정기준에 대해서 나타낸 표</caption>
												<colgroup>
													<col style="width:50%;"><col style="width:50%;">
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="alC">구분</th>
														<th scope="col" class="alC">인정액</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1일 인정기준</td>
														<td>40&#44;000원</td>
													</tr>
												</tbody>
											</table>
										</li>
									</ul>
								</li>
							</ul>
							<p class="txtPoint">부상 &#58; 최고 &#40;1&#44;500만원&#41;</p>
							<p class="txtPoint">후유장해</p>
							<ul class="txtListst01 pB0">
								<li>장애공제금 &#58; 종사자가 재해로 인하여 입은 직접적인 결과로 치료를 받은 후에도 신체에 자동차손해배상보장법 시행령의 장애등급표에 의한 장애가 남은 때에는 아래와 같이 인정임금을지급한다&#46; 
									<ul class="txtListst02 pB0">
										<li>
											<table class="tbDetail_st01" summary="후유장해인정임금">
												<caption>후유장해인정임금에 대해서 나타낸 표</caption>
												<colgroup>
													<col span="4" style="width:25%;">
												</colgroup>
												<tbody>
													<tr>
														<td>1급</td>
														<td>1&#44;474일분</td>
														<td>8급</td>
														<td>495일분</td>
													</tr>
													<tr>
														<td>2급</td>
														<td>1&#44;309일분</td>
														<td>9급</td>
														<td>385일분</td>
													</tr>
													<tr>
														<td>3급</td>
														<td>1&#44;155일분</td>
														<td>10급</td>
														<td>297일분</td>
													</tr>
													<tr>
														<td>4급</td>
														<td>1&#44;012일분</td>
														<td>11급</td>
														<td>220일분</td>
													</tr>
													<tr>
														<td>5급</td>
														<td>869일분</td>
														<td>12급</td>
														<td>154일분</td>
													</tr>
													<tr>
														<td>6급</td>
														<td>737일분</td>
														<td>13급</td>
														<td>99일분</td>
													</tr>
													<tr>
														<td>7급</td>
														<td>616일분</td>
														<td>14급</td>
														<td>55일분</td>
													</tr>
												</tbody>
											</table>
										</li>
									</ul>
								</li>
							</ul>
						</div><!--// 종사자 재해 e -->
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
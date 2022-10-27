<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path03">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/joinInfo/index.do">가입안내</a></li>
			<li><a href="/m/joinInfo/productInfo/main.do">상품안내</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<!-- 종사자재해 -->
		<article class="basicCont04">
			<h2 class="productTit ico04">종사자재해</h2>
			<!-- 보상하는 손해  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보상하는 손해</h3>
				<ul class="pt14">
					<li><span class="bulSt01">종사자재해에서 조합은 조합원이 공제계약자동차를 소유 &#183; 사용 &#183; 관리하는 동안에 생긴 종사자의 재해로 인해 발생한 손해를 보상하여 드립니다.</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 보장 금액  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보장 금액</h3>
				<ul>
					<li class="line"><em>사망</em>
						<span class="bulSt01">유족공제금 : 인정기준의 1,300일분</span>
						<span class="bulSt01">장의비 : 인정기준의 120일분</span>
						<span class="bulSt01">평균임금의 인정기준<br/>가. 지급대상 : 수탁관리자 겸 운전자 1인<br/>나. 인정기준</span>
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="종사자 재해 사망 인정기준">
								<caption>종사자 재해 사망 인정기준에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:50%;">
									<col style="width:50%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="lineNo ">구분</th>
										<th scope="col">인정액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="lineNo">1일 인정기준</td>
										<td>40&#44;000원</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li class="line"><em>부상</em><span class="bulSt01">최고 (1,500만원), 최저 (60만원)</span></li>
					<li><em>후유장애</em>
						<span class="bulSt01">장애공제금 : 종사자가 재해로 인하여 입은 직접적인 결과로 치료를 받은 후에도 신체에 자동차손해배상보장법 시행령의 장애등급표에 의한 장애가 남은 때에는 아래와 같이 인정임금을지급한다. 다만, 최저 500만원으로 함.</span>
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="상해구분 및 급별 한도금액표">
								<caption>후유장해인정임금에 대해서 나타낸 표</caption>
								<colgroup>
									<col span="4" style="width:25%;">
								</colgroup>
								<tbody>
									<tr>
										<td class="lineNo">1급</td>
										<td>1&#44;474일분</td>
										<td>8급</td>
										<td>495일분</td>
									</tr>
									<tr>
										<td class="lineNo">2급</td>
										<td>1&#44;309일분</td>
										<td>9급</td>
										<td>385일분</td>
									</tr>
									<tr>
										<td class="lineNo">3급</td>
										<td>1&#44;155일분</td>
										<td>10급</td>
										<td>297일분</td>
									</tr>
									<tr>
										<td class="lineNo">4급</td>
										<td>1&#44;012일분</td>
										<td>11급</td>
										<td>220일분</td>
									</tr>
									<tr>
										<td class="lineNo">5급</td>
										<td>869일분</td>
										<td>12급</td>
										<td>154일분</td>
									</tr>
									<tr>
										<td class="lineNo">6급</td>
										<td>737일분</td>
										<td>13급</td>
										<td>99일분</td>
									</tr>
									<tr>
										<td class="lineNo">7급</td>
										<td>616일분</td>
										<td>14급</td>
										<td>55일분</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article>
		<ul class="productBox mb50">
			<li><a href="/m/joinInfo/productInfo/man/view.do">대인배상</a></li>
			<li><a href="/m/joinInfo/productInfo/obejct/view.do">대물배상</a></li>
			<li><a href="/m/joinInfo/productInfo/body/view.do">자기신체사고</a></li>
			<li><a href="/m/joinInfo/productInfo/myCar/view.do">자기차량손해</a></li>
			<li><a href="/m/joinInfo/productInfo/carry/view.do">적재물 배상</a></li>
			<li><a href="/m/joinInfo/productInfo/law/view.do">법률비용 지원특약</a></li>
		</ul>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
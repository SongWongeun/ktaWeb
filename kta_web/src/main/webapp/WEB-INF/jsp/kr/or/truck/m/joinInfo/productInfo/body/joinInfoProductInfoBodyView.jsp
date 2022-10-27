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
		<!-- 자기신체사고 -->
		<article class="basicCont04">
			<h2 class="productTit ico03">자기신체사고</h2>
			<!-- 보상하는 손해  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보상하는 손해</h3>
				<ul class="pt14">
					<li><span class="bulSt01">자기신체사고에서 에서 조합은 조합원이 공제계약자동차를 소유․사용․관리하는 동안에 생긴 공제계약자동차의 사고로 인하여 죽거나 다친 때 그로 인한 손해를 보상하여 드립니다.</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 보장 금액  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보장 금액</h3>
				<ul>
					<li class="line">
						<p class="txtst01">공제계약 금액<span class="txtsub01">(단위:만원)</span></p>
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="공제계약 금액">
								<caption>공제계약 금액</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="lineNo">항목</th>
										<th scope="col" colspan="4">공제계약금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row" class="lineNo">사망</th>
										<td>1천5백</td>
										<td>3천</td>
										<td>5천</td>
										<td>1억</td>
									</tr>
									<tr>
										<th scope="row" class="lineNo">부상</th>
										<td>1천5백</td>
										<td>1천5백</td>
										<td>1천5백</td>
										<td>1천5백</td>
									</tr>
									<tr>
										<th scope="row" class="lineNo">장해</th>
										<td>1천5백</td>
										<td>3천</td>
										<td>5천</td>
										<td>1억</td>
									</tr>
								</tbody>
							</table>
							<p class="bulSt05 pb0">위 공제계약금액은 조합원 1인당 한도액임</p>
						</div>
					</li>
					<li class="line">
						<em>상해구분 및 급별 공제계약 금액표</em>
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="상해구분 및 급별 공제계약 금액표">
								<caption>상해구분 및 급별 공제계약 금액표</caption>
								<colgroup>
									<col style="width:23%;" />
									<col style="width:27%;" />
									<col style="width:23%;" />
									<col style="width:27%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="lineNo">상해등급</th>
										<th scope="col">한도금액</th>
										<th scope="col">상해등급</th>
										<th scope="col">한도금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="lineNo">1급</td>
										<td>1,500만원</td>
										<td>8급</td>
										<td>180만원</td>
									</tr>
									<tr>
										<td class="lineNo">2급</td>
										<td>800만원</td>
										<td>9급</td>
										<td>140만원</td>
									</tr>
									<tr>
										<td class="lineNo">3급</td>
										<td>750만원</td>
										<td>10급</td>
										<td>120만원</td>
									</tr>
									<tr>
										<td class="lineNo">4급</td>
										<td>700만원</td>
										<td>11급</td>
										<td>100만원</td>
									</tr>
									<tr>
										<td class="lineNo">5급</td>
										<td>500만원</td>
										<td>12급</td>
										<td>60만원</td>
									</tr>
									<tr>
										<td class="lineNo">6급</td>
										<td>400만원</td>
										<td>13급</td>
										<td>40만원</td>
									</tr>
									<tr>
										<td class="lineNo">7급</td>
										<td>250만원</td>
										<td>14급</td>
										<td>20만원</td>
									</tr>
								</tbody>
							</table>
							<p class="bulSt05 pb0">상해등급은 자동차손해배상보장법 시행령 별표1에서 정한 상해 구분에 의함</p>
						</div>
					</li>
					<li>
						<p class="txtst01">후유장애 구분 및 급별 공제 계약금액표<span class="txtsub01">(단위:만원)</span></p>
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="후유장애 구분 및 급별 공제 계약금액 표">
								<caption>후유장애 구분 및 급별 공제 계약금액 표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:20%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="lineNo">장애<br/>등급</th>
										<th scope="col" colspan="4">공제<br/>계약금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="lineNo">1급</td>
										<td>1,500</td>
										<td>3.000</td>
										<td>5,000</td>
										<td>1억</td>
									</tr>
									<tr>
										<td class="lineNo">2급</td>
										<td>1,350</td>
										<td>2,700</td>
										<td>4,500</td>
										<td>9,000</td>
									</tr>
									<tr>
										<td class="lineNo">3급</td>
										<td>1,200</td>
										<td>2,400</td>
										<td>4,000</td>
										<td>8,000</td>
									</tr>
									<tr>
										<td class="lineNo">4급</td>
										<td>1,050</td>
										<td>2.100</td>
										<td>3,500</td>
										<td>7,000</td>
									</tr>
									<tr>
										<td class="lineNo">5급</td>
										<td>900</td>
										<td>1.800</td>
										<td>3,000</td>
										<td>6,000</td>
									</tr>
									<tr>
										<td class="lineNo">6급</td>
										<td>750</td>
										<td>1.500</td>
										<td>2,500</td>
										<td>5,000</td>
									</tr>
									<tr>
										<td class="lineNo">7급</td>
										<td>600</td>
										<td>1.200</td>
										<td>2,000</td>
										<td>4,000</td>
									</tr>
									<tr>
										<td class="lineNo">8급</td>
										<td>450</td>
										<td>900</td>
										<td>1,500</td>
										<td>3,000</td>
									</tr>
									<tr>
										<td class="lineNo">9급</td>
										<td>360</td>
										<td>720</td>
										<td>1,200</td>
										<td>2,400</td>
									</tr>
									<tr>
										<td class="lineNo">10급</td>
										<td>270</td>
										<td>540</td>
										<td>900</td>
										<td>1,800</td>
									</tr>
									<tr>
										<td class="lineNo">10급</td>
										<td>210</td>
										<td>420</td>
										<td>700</td>
										<td>1,400</td>
									</tr>
									<tr>
										<td class="lineNo">12급</td>
										<td>150</td>
										<td>300</td>
										<td>500</td>
										<td>1,000</td>
									</tr>
									<tr>
										<td class="lineNo">13급</td>
										<td>90</td>
										<td>180</td>
										<td>300</td>
										<td>600</td>
									</tr>
									<tr>
										<td class="lineNo">14급</td>
										<td>60</td>
										<td>120</td>
										<td>200</td>
										<td>400</td>
									</tr>
								</tbody>
							</table>
							<p class="bulSt05 pb0">상해등급은 자동차손해배상보장법 시행령 별표1에서 정한 상해 구분에 의함</p>
						</div>
					</li>
				</ul>
			</div>
		</article>
		<ul class="productBox mb50">
			<li><a href="/m/joinInfo/productInfo/man/view.do">대인배상</a></li>
			<li><a href="/m/joinInfo/productInfo/obejct/view.do">대물배상</a></li>
			<li><a href="/m/joinInfo/productInfo/acc/view.do">종사자재해</a></li>
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
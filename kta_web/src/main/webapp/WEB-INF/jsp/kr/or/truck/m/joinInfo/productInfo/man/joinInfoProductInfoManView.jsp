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
		<!-- 대인배상 -->
		<article class="basicCont04">
			<!-- 대인배상1 -->
			<h2 class="productTit ico01">대인배상 I</h2>
			<!-- 보상하는 손해  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보상하는 손해</h3>
				<ul class="pt14">
					<li><span class="bulSt01">대인배상Ⅰ에서 조합은 조합원이 공제계약자동차의 운행으로 인하여 다른 사람을 죽거나 다치게 하여 「자동차손해배상보장법」 제3조에 의한 손해배상책임을 짐으로써 입은 손해를 보상합니다</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 보장 금액  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보장 금액</h3>
				<ul>
					<li class="line"><em>사망</em><span class="bulSt01">사망한 경우에는 1억원의 범위에서 피해자에게 발생한 손해액. 다만, 그 손해액이 2천만원 미만인 경우에는 2천만원 으로 하여 보상해 드립니다.</span></li>
					<li class="line">
						<p class="txtst01">상해구분 및 급별 한도금액표 <span class="txtsub01">(대인배상Ⅰ부상 관련)</span></p>
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="상해구분 및 급별 한도금액표">
								<caption>상해구분 및 급별 한도금액표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:30%;" />
									<col style="width:20%;" />
									<col style="width:30%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="lineNo">등급</th>
										<th scope="col">한도금액</th>
										<th scope="col">등급</th>
										<th scope="col">한도금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="lineNo">1급</td>
										<td>3,000만원</td>
										<td>8급</td>
										<td>300만원</td>
									</tr>
									<tr>
										<td class="lineNo">2급</td>
										<td>1,500만원</td>
										<td>9급</td>
										<td>240만원</td>
									</tr>
									<tr>
										<td class="lineNo">3급</td>
										<td>1,200만원</td>
										<td>10급</td>
										<td>200만원</td>
									</tr>
									<tr>
										<td class="lineNo">4급</td>
										<td>1,000만원</td>
										<td>11급</td>
										<td>160만원</td>
									</tr>
									<tr>
										<td class="lineNo">5급</td>
										<td>900만원</td>
										<td>12급</td>
										<td>120만원</td>
									</tr>
									<tr>
										<td class="lineNo">6급</td>
										<td>700만원</td>
										<td>13급</td>
										<td>80만원</td>
									</tr>
									<tr>
										<td class="lineNo">7급</td>
										<td>500만원</td>
										<td>14급</td>
										<td>50만원</td>
									</tr>
								</tbody>
							</table>
							<p class="bulSt05 pb0">상해등급은 자동차손해배상보장법 시행령 별표1에서 정한 상해구분에 의함</p>
						</div>
					</li>
					<li>
						<p class="txtst01">후유장애 구분 및 급별 한도금액표 <span class="txtsub01">(대인배상Ⅰ후유장애 관련)</span></p>
						<div class="tableBox pa0">
							<table class="tbSt01 mb5" summary="후유장애 구분 및 급별 한도금액표">
								<caption>후유장애 구분 및 급별 한도금액표</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:30%;" />
									<col style="width:20%;" />
									<col style="width:30%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="lineNo">등급</th>
										<th scope="col">한도금액</th>
										<th scope="col">등급</th>
										<th scope="col">한도금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="lineNo">1급</td>
										<td>1억 5,000만원</td>
										<td>8급</td>
										<td>4,500만원</td>
									</tr>
									<tr>
										<td class="lineNo">2급</td>
										<td>1억 3,500만원</td>
										<td>9급</td>
										<td>3,800만원</td>
									</tr>
									<tr>
										<td class="lineNo">3급</td>
										<td>1억 2,000만원</td>
										<td>10급</td>
										<td>2,700만원</td>
									</tr>
									<tr>
										<td class="lineNo">4급</td>
										<td>1억 500만원</td>
										<td>11급</td>
										<td>2,300만원</td>
									</tr>
									<tr>
										<td class="lineNo">5급</td>
										<td>9,000만원</td>
										<td>12급</td>
										<td>1,900만원</td>
									</tr>
									<tr>
										<td class="lineNo">6급</td>
										<td>7,500만원</td>
										<td>13급</td>
										<td>1,500만원</td>
									</tr>
									<tr>
										<td class="lineNo">7급</td>
										<td>6,000만원</td>
										<td>14급</td>
										<td>1,000만원</td>
									</tr>
								</tbody>
							</table>
							<p class="bulSt05 pb0">등급은 자동차손해배상보장법 시행령 별표2에서 정한 후유장애 구분에 의함</p>
						</div>
					</li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 대인배상2 -->
			<h2 class="productTit ico01">대인배상 Ⅱ</h2>
			<!-- 보상하는 손해  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보상하는 손해</h3>
				<ul class="pt14">
					<li><span class="bulSt01">대인배상Ⅱ에서 조합은 조합은 조합원이 공제계약자동차를 소유&#183;사용&#183;관리하는 동안에 생긴 공제계약자동차의 사고로 인하여 다른 사람을 죽게 하거나 다치게 하여 법률상 손해배상책임을 짐으로써 입은 손해(대인배상Ⅰ에서 보상하는 손해를 초과하는 손해에 한함)를 보상합니다.</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 보장 금액  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보장 금액</h3>
				<ul class="pt14">
					<li><span class="bulSt01">피해자의 직업과 연령에 따라 고액의 공제금이 지급되어 질수도 있으므로 무한배상 으로 보상해 드립니다.</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article>
		<!-- 상품안내목록 -->
		<ul class="productBox mb50">
			<li><a href="/m/joinInfo/productInfo/obejct/view.do">대물배상</a></li>
			<li><a href="/m/joinInfo/productInfo/body/view.do">자기신체사고</a></li>
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













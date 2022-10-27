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
		<!-- 법률비용 지원특약 -->
		<article class="basicCont04">
			<h2 class="productTit ico07">법률비용 지원특약</h2>
			<!-- 보상하는 손해  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보상하는 손해</h3>
				<ul class="pt14">
					<li><span class="bulSt01">공제조합(이하 ‘조합’이라 함)은 조합원이 공제계약자동차를 "운전"하는 동안에 생긴 공제계약자동차의 사고로 인하여 남을 죽게 하거나 다치게 하여 형사적 책임을 지는 경우에 이 특별약관에서 정하는 바에 따라 보상해 드립니다..</span></li>
					<li>
						<div class="liBox">
							<h4 class="txtTit04">이 특별약관에서 "운전"이란?</h4>
							<p class="txt01 pb0">도로여부, 주정차여부, 엔진의 시동여부를 불문하고 조합원이 자동차 운전석에 탑승하여 핸들을 조작하거나 조작 가능한 상태에 있는 것을 말합니다.</p>
						</div>
					</li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 보장 금액  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보장 금액(실손보상)</h3>
				<h3 class="txtTit01" style="padding-left : 6px;">형사합의 지원금</h3>
				<ul>
					<li class="line"><em>사망</em><span class="bulSt01">2천만원 한도내 지급</span></li>
					<li class="line"><em>부상</em><span class="bulSt01">1 – 3급 (500만원 한도)<br/> 4 – 7급 (300만원 한도)내 지급</span></li>
					<li class="line"><em>벌금지원금</em><span class="bulSt01">2천만원 한도 내 지급</span></li>
					<li><em>방어비용</em><span class="bulSt01">300만원 한도 실손보상</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article>
		<ul class="productBox mb50">
			<li><a href="/m/joinInfo/productInfo/man/view.do">대인배상</a></li>
			<li><a href="/m/joinInfo/productInfo/obejct/view.do">대물배상</a></li>
			<li><a href="/m/joinInfo/productInfo/body/view.do">자기신체사고</a></li>
			<li><a href="/m/joinInfo/productInfo/acc/view.do">종사자재해</a></li>
			<li><a href="/m/joinInfo/productInfo/myCar/view.do">자기차량손해</a></li>
			<li><a href="/m/joinInfo/productInfo/carry/view.do">적재물 배상</a></li>
		</ul>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
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
		<!-- 상품안내메인 s -->
		 <article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i03"><img alt="상품안내" src="/images/m_truck/subtop/03top_1.png" /></li>
				<li class="txt01">믿을 수 있는 화물공제조합이 제공하는 자동차 보험 상품 안내 입니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<!-- 상품안내목록 -->
		<ul class="productBox">
			<li><a href="/m/joinInfo/productInfo/man/view.do">대인배상</a></li>
			<li><a href="/m/joinInfo/productInfo/obejct/view.do">대물배상</a></li>
			<li><a href="/m/joinInfo/productInfo/body/view.do">자기신체사고</a></li>
			<li><a href="/m/joinInfo/productInfo/acc/view.do">종사자재해</a></li>
			<li><a href="/m/joinInfo/productInfo/myCar/view.do">자기차량손해</a></li>
			<li><a href="/m/joinInfo/productInfo/carry/view.do">적재물 배상</a></li>
			<li><a href="/m/joinInfo/productInfo/law/view.do">법률비용 지원특약</a></li>
			<li><a href="/m/joinInfo/productInfo/guaranteeProduct.do">조합원 대출 보증사업</a></li>
		</ul>
		<!--// 상품안내메인 e -->	
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
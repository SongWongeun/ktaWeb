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
		<!-- 대물보상 -->
		<article class="basicCont04">
			<h2 class="productTit ico02">대물배상</h2>
			<!-- 보상하는 손해  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보상하는 손해</h3>
				<ul class="pt14">
					<li><span class="bulSt01">대물배상에서 조합은 조합원이 공제계약자동차를 소유&#183;사용&#183;관리하는 동안에 생긴 공제계약자동차의 사고로 인하여 다른 사람의 재물을 없애거나 훼손하여 법률상 손해배상책임을 짐으로써 입은 손해를 보상합니다.</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 보장 금액  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보장 금액</h3>
				<ul>
					<li class="line"><em>의무공제</em><span class="bulSt01">2천만원(자동차손해배상 보장법 시행령3조3항 근거)</span></li>
					<li><em>대물공제</em><span class="bulSt01">2천만원, 3천만원, 5천만원, 1억원, 2억원, 3억원, 4억원, 5억원 중 선택적으로 조합원이 가입한 금액 한도 내에서 보상해 드립니다. - 자기부담금 30만원</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article>
		<ul class="productBox mb50">
			<li><a href="/m/joinInfo/productInfo/man/view.do">대인배상</a></li>
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
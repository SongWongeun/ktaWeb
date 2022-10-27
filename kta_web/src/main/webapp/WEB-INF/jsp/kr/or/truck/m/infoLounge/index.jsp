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
	<!-- content s -->
	<section id="subIndex">
		<article class="subbgTop">
			<div class="subTit04"><h2>정보마당</h2></div>
		</article>
		<article class="subbgBot2">
			<div class="subliBox mb40">
				<ul class="subLi04">
					<li><a href="/m/infoLounge/deductNews/list.do">공제소식</a></li>
					<!-- <li><a href="/m/infoLounge/scholarship/info/view.do">장학사업</a></li> -->
					<li><a href="/m/infoLounge/recommandCompany/list.do">우수협력정비업체</a></li>
				</ul>
			</div>
		</article>
		<!-- main banner -->
			<article class="subbgTop">
				<a href="/m/joinInfo/productInfo/guaranteeProduct.do"><img src="/images/m_truck/main/bojeung_w1@2x.png" alt=" 조합원 사업용 화물자동차 구입자금 대출 보증사업 상품안내 바로가기" /></a>
			</article>
		<!--// main banner -->
		
	</section>
	
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
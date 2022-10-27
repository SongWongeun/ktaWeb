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
			<div class="subTit09"><h2>사이버홍보관</h2></div>
		</article>
		<article class="subbgBot">
			<div class="subliBox">
				<ul class="subLi09">
					<li><a href="/m/cyberPr/driverDay/list.do">운전자의날</a></li>
					<li><a href="/m/cyberPr/thirty/list.do">화물공제 30년사</a></li>
					<li><a href="/m/cyberPr/accidentPrevention/list.do">사고예방활동</a></li>
					<li><a href="/m/cyberPr/truckEcho/list.do">트럭메아리</a></li>
					<li><a href="/m/cyberPr/prMovie/list.do">홍보영상</a></li>
				</ul>
			</div>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
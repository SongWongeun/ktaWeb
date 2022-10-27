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
			<div class="subTit06"><h2>조합소개</h2></div>
		</article>
		<article class="subbgBot">
			<div class="subliBox mb120">
				<ul class="subLi06">
					<li><a href="/m/associationIntroduce/greeting/view.do">인사말</a></li>
					<li><a href="/m/associationIntroduce/vision/view.do">설립목적</a></li>
					<li><a href="/m/location/view.do">본부안내</a></li>
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
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
			<div class="subTit02"><h2>고객광장</h2></div>
		</article>
		<article class="subbgBot">
			<div class="subliBox mb120">
				<ul class="subLi02">
					<li><a href="/m/customer/inquiry/main/view.do">고객문의</a></li>
					<li><a href="/m/customer/praise/list.do">칭찬합시다</a></li>
					<li><a href="/m/customer/cleanCenter/view.do">클린센터</a></li>
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
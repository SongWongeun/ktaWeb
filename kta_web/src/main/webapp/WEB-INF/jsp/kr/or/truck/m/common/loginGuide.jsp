<%@page import="NiceID.Check.CPClient"%>
<%@page import="Kisinfo.Check.IPINClient"%>
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
	<section id="location" class="path07">
		<ul>
			<li class="depth02"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li><a href="/m/loginGuide.do">인터넷 창구 안내</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<form id="fIdpw" name="fIdpw" action="/actIdpwLogin.do" method="post">
				<input type="hidden" id="t" name="t" value="m"/>
				<article class="contentSubTitle">
					<div class="userB"><h2 class="user"><span class="userIcon"><img src="/images/m_truck/com/icon_30.png" alt="userIcon" /></span>인터넷 창구는 PC 홈페이지에 접속 후 이용해 주세요.</h2></div>
				</article><!--// 회원유형선택 -->

				<!-- 로그인설명 -->
				<article class="subdex">
					<p class="txt01">계약 및 보상, 지급내역 조회는 PC 홈페이지 로그인 후, 서비스 이용이 가능합니다</p>
				</article>
		</form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>










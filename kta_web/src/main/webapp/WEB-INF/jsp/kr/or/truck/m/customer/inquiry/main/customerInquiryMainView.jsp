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
	<section id="location" class="path02">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/customer/index.do">고객광장</a></li>
			<li><a href="/m/customer/inquiry/main/view.do">고객문의</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i02"><img alt="고객문의" src="/images/m_truck/subtop/02top_1.png" /></li>
				<li class="txt01">고객님께 알맞는 응대를 해드리기 위해 1:1 문의 서비스를 제공합니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont01">
			<p class="bulSt03"><span class="txtBlod">본인인증절차 이후,</span> 의견을 주시면 각 분야의 담당자에게 바로 접수 되어 조치해 드리고 있습니다.</p>
			<p class="bulSt03"><span class="txtBlod">1:1 문의 서비스는</span> 회신 받고자 하는 개인 이메일이나 홈페이지 본인인증을 통해 회신 내용 열람이 가능합니다.</p>
			<!-- 지원자격  -->
			<div class="txtGrabox">
				<h2 class="txtTit02"><i class="icon-chevron-right"></i>고객문의절차안내</h2>
				<ul class="stepBox">
					<li><span class="step">본인인증</span></li>
					<li><span class="flow"><img src="/images/m_truck/com/icon_arrow.png" /></span></li>
					<li><span class="step">문의등록</span></li>
					<li><span class="flow"><img src="/images/m_truck/com/icon_arrow.png" /></span></li>
					<li><span class="step">업무담당자<br/>답변등록</span></li>
					<li><span class="flow"><img src="/images/m_truck/com/icon_arrow.png" /></span></li>
					<li><span class="step">회신답변<br/>전달</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article><!--// basicCont  -->
		<article class="contentFoot">
			<ul>
				<li class="bulSt02">고민과 궁금증 해결?</li>
				<li class="bulSt02">등록한 문의글 답변?</li>
			</ul>
			<ul class="questBox liSt02">
				<li><a href="/m/customer/inquiry/mtm/regist.do"><em>1:1</em>문의</a></li>
				<li><a href="/m/customer/inquiry/mtm/list.do"><em>문의</em>확인</a></li>
			</ul>
		</article><!--// contentFoot -->
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
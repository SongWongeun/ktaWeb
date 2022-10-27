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
			<li class="depth02"><a href="/m/joinInfo/index.do">가입안내</a></li>
			<li><a href="/m/deductProduct/privateHwamul/mHwamulInfo.do">개인화물 공제가입 상담신청</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i02"><img alt="고객문의" src="/images/m_truck/subtop/02top_1.png" /></li>
				<li class="txt01">고객님께 알맞는 응대를 해드리기 위해<br>가입 상담 서비스를 제공합니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont01">
			<p class="bulSt03"><span class="txtBlod">본인인증절차 이후,</span> 가입과 관련된 상담을 신청하시면 각 지부 담당자에게 바로 접수 되어 답변해 드리고 있습니다.</p>
			<p class="bulSt03"><span class="txtBlod">가입상담 서비스는</span> 홈페이지 본인인증을 통해 답변 내용 열람이 가능합니다.</p>
			<!-- 지원자격  -->
			<div class="txtGrabox">
				<h2 class="txtTit02"><i class="icon-chevron-right"></i>가입상담 절차안내</h2>
				<ul class="stepBox">
					<li><span class="step">본인인증</span></li>
					<li><span class="flow"><img src="/images/m_truck/com/icon_arrow.png" /></span></li>
					<li><span class="step">상담등록</span></li>
					<li><span class="flow"><img src="/images/m_truck/com/icon_arrow.png" /></span></li>
					<li><span class="step">업무담당자<br/>답변등록</span></li>
					<li><span class="flow"><img src="/images/m_truck/com/icon_arrow.png" /></span></li>
					<li><span class="step">회신답변<br/>전달</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article><!--// basicCont  -->
		<article class="contentFoot">
			<ul>
				<li class="bulSt02">가입관련 문의?</li>
				<li class="bulSt02">상담에 대한 답변 확인?</li>
			</ul>
			<ul class="questBox liSt02">
				<li><a href="/m/deductProduct/privateHwamul/hwamulAddView.do"><em>상담</em>신청</a></li>
				<li><a href="/m/deductProduct/privateHwamul/hwamulList.do"><em>답변</em>확인</a></li>
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
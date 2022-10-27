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
	<section id="location" class="path04">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/infoLounge/index.do">정보마당</a></li>
			<li><a href="/m/infoLounge/scholarship/info/view.do">장학사업</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i04"><img alt="장학사업" src="/images/m_truck/subtop/04top_2.png" /></li>
				<li class="txt01">화물공제조합은 장학사업을 통해 따뜻한 나눔과 사랑을 실천하고 있습니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="tabWrap">
			<!-- tab -->
			<div class="tabBox">
				<ul >
					<li><a href="/m/infoLounge/scholarship/info/view.do">장학사업안내</a></li>
					<li><a href="/m/infoLounge/scholarship/notice/list.do">장학사업공지</a></li>
					<li class="on"><a href="/m/infoLounge/scholarship/auth/view.do">장학금지원내역</a></li>
				</ul>
			</div>
			<!-- tab contents -->
			<div class="tabCont">
				<!-- 장학금 미확정 -->
				<c:choose>
					<c:when test="${result eq 'Y' }">					
						<!-- 장학금 확정 -->
						<div class="scholarship">
							<img src="/images/m_truck/sub/schtit_04.png" alt="For a better tomorrow" />
							<h2>실천하는 나눔, 행복한 사회</h2>
							<div class="yesBox">
								<p>${name}님<br />장학금 지원을 축하드립니다.</p>
							</div>
						</div>
					</c:when>
					<c:when test="${result eq 'N' }">					
						<div class="scholarship">
							<img src="/images/m_truck/sub/schtit_04.png" alt="For a better tomorrow" />
							<h2>실천하는 나눔, 행복한 사회</h2>
							<div class="noBox">
								<p>죄송합니다.<br />장학금 지원 명단에 없습니다.</p>
							</div>
						</div>
					</c:when>
					<c:when test="${result eq 'ERROR' }">					
						<div class="scholarship">
							<img src="/images/m_truck/sub/schtit_04.png" alt="For a better tomorrow" />
							<h2>실천하는 나눔, 행복한 사회</h2>
							<div class="noBox">
								<p>관리자에게 문의해주시기 바랍니다.</p>
							</div>
						</div>
					
					</c:when>
				</c:choose>
			</div>
		</article><!--// tabWrap -->
		<!-- 하단공통사용 장학제도문의 -->
		<article class="contentFoot">
			<div class="questBox">
				<a href="/m/customer/inquiry/mtm/regist.do" class="questBg01">
					<p class="txtSt01"><span class="txtBlod">장학사업</span> 문의</p>
					<p class="txtSt02">화물공제조합에서 진행하는 장학사업이 궁금하신가요?<br />문의글을 남겨주시면 담당자가 직접 회신 드립니다.</p>
				</a>
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







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<link rel="stylesheet" type="text/css" href="/css/m_truck/m_main_v3.css" />
</head>
<body>
<div id="wrap" class="wrapMain_v03">
	<!-- header -->
	<header id="header_v03">
		<h1><a href="/m/main.do"><img src="/images/m_truck/main/mlogo_w@2x.png" alt="KTA전국화물자동차운송사업자공제조합" /></a></h1>
		<h2 class="btn_seach" ><img src="/images/m_truck/com/btn_search_2.png" alt="검색" /></h2>
		<div id="msearchConts">
			<p class="searchForm">
				<input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색 키워드를 입력해주세요.">
				<a class="btn" href="/m/search.do"><i class="icon-search"></i></a>
			</p>
		</div>
		<a href="#;" onclick="rightMenuOpen();" class="btn_navi"><img src="/images/m_truck/com/btn_navi_2.png" alt="메뉴전체보기" /></a>
	</header>
	<!--// header -->
	<!-- nav -->
	<nav id="navMain_v03">
		<ul>  
			<li>
				<c:choose>
					<c:when test="${noticeIcon!=null||!noticeIcon eq ''}">
						<c:choose>
							<c:when test="${noticeIcon.URL!=null||!noticeIcon.URL eq ''}">
								<a href="${noticeIcon.URL}" style="background: url('/images/m_truck/main/theme01/${noticeIcon.CODE}${noticeIcon.YEAR}.png');">공지사항</a>
							</c:when>
							<c:otherwise>
								<a href="/m/infoLounge/deductNews/list.do" style="background: url('/images/m_truck/main/theme03/${noticeIcon.CODE}${noticeIcon.YEAR}.png');">공지사항</a>	
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<a href="/m/infoLounge/deductNews/list.do">공지사항</a>
					</c:otherwise>
				</c:choose>
			</li>
			<li><a href="/m/customer/index.do">고객광장</a></li>
			<li><a href="/m/joinInfo/index.do">가입안내</a></li>
		</ul>
		<ul>
			<li><a href="/m/infoLounge/index.do">정보마당</a></li>
			<li><a href="/m/compensationInfo/index.do">보상안내</a></li>
			<li><a href="/m/associationIntroduce/index.do">조합소개</a></li>
		</ul>
		<ul>
			<li><a href="/m/associationIntroduce/office/view.do">지부안내</a></li>
			<li><a href="/m/loginGuide.do">인터넷창구</a></li>
			<li><a href="/m/cyberPr/index.do">사이버홍보관</a></li>
		</ul>
	</nav>
	<!--// nav -->
	<!-- main banner -->
	<div id="bannerMain_v03"><a href="tel:1577-8278"><img src="/images/m_truck/main/tel_w2@2x.png" alt="현장출동서비스 1577-8278" /></a></div>
	<!--// main banner -->
	<!-- footer -->
	<footer id="footer_v03">
		<div>
			<ul>
				<li class="footer01"><a href="/m/main.do">홈</a></li>
				<li class="footer02"><a href="http://www.truck.or.kr/main/index.do">PC버전</a></li>
				<li class="footer03"><a href="/m/terms.do">이용약관</a></li>
				<!--<c:choose>
					<c:when test="${not empty loginVO }">
						<li class="footer05"><a href="/m/logout.do">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="footer04"><a href="/m/login.do">로그인</a></li>
					</c:otherwise>
				</c:choose>-->
			</ul>
		</div>
		<address>Copyright  &copy; 2013 Korea Trucking Association Reserved</address>
	</footer>
	<!--// footer -->
</div>
<!--// wrapMain_v01 -->

<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->

</body>
</html>















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
			<div class="subTit08"><h2>인터넷창구</h2></div>
		</article>
		<article class="subbgBot">
			<div class="subliBox">
				<ul class="subLi08">
					<li class="netLi01">
						<a href="/m/netCounter/myPage/view.do">
							마이페이지
							<c:choose>
								<c:when test="${loginVO.agentCd ==  '1'}"></c:when>
								<c:when test="${loginVO.agentCd ==  '2'}"></c:when>
								<c:when test="${loginVO.agentCd ==  '3'}"></c:when>
							</c:choose>
						</a>
					</li>
					<c:choose>
						<c:when test="${loginVO.agentCd ==  '1' || loginVO.agentCd ==  '2'}">
							<li class="netLi02"><a href="/m/netCounter/contract/carStatus/list.do">계약조회</a></li>
							<li class="netLi03"><a href="/m/netCounter/compensation/accident/list.do">보상정보조회</a></li>
						</c:when>
						<c:when test="${loginVO.agentCd ==  '3'}">
							<li class="netLi04"><a href="/m/netCounter/pay/list.do">지급내역조회</a></li>
						</c:when>
					</c:choose>
					<li class="netLi05"><a href="/m/netCounter/userInfo/view.do">회원정보관리</a></li>
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
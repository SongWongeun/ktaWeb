<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 목록 화면 function */
function goList() {
   	document.boardForm.action = "<c:url value='/m/cyberPr/driverDay/list.do'/>";
   	document.boardForm.submit();
}
/* 이전/다음글 보기 화면 function */
function viewPreNexArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/m/cyberPr/driverDay/detail.do'/>";
   	document.boardForm.submit();		
}
</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path09">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/cyberPr/index.do">사이버홍보관</a></li>
			<li><a href="/m/cyberPr/driverDay/list.do">운전자의날</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">	
	<form:form commandName="searchVO" name="boardForm" method="post">
	<input type="hidden" name="articleNo"/>
	<form:input path="searchKeyword" type="hidden"/>
	<form:input path="searchCondition" type="hidden"/>
		<!-- 게시판 View -->
		<article class="defaultView">
			<div class="defaultTit">
				<h2><c:out value="${resultBoard.title}"/></h2>
				<span class="date"><c:out value="${fn:substring(resultBoard.createTime, 0, 11)}"/></span>
			</div>
			<!-- // viewTit -->
			<div class="article">
				<p>${resultBoard.contentHtml}</p>
			</div>
			<!-- // article -->
			<div class="btn_r_area">
				<a href="#;" onclick="goList(); return false;" class="btn btn-black">목록</a>
			</div>
			<!-- // btn_areas -->
			<div class="comment">
				<ul>
					<c:choose>
						<c:when test="${empty preArticle.articleNo}">
						<li>
							<span class="up">이전글</span>
							<span class="subject"><c:out value="${preArticle.title }"/></span>
						</li>
						<li>
							<span class="down">다음글</span>
							<span class="subject"><a href="#;" onclick="viewPreNexArticle('<c:out value="${nextArticle.articleNo}"/>')"><c:out value="${nextArticle.title}"/></a></span>
						</li>
						</c:when>
						<c:when test="${empty nextArticle.articleNo}">
						<li>
							<span class="up">이전글</span>
							<span class="subject"><a href="#;" onclick="viewPreNexArticle('<c:out value="${preArticle.articleNo}"/>')"><c:out value="${preArticle.title }"/></a></span>
						</li>
						<li>
							<span class="down">다음글</span>
							<span class="subject"><c:out value="${nextArticle.title }"/></span>
						</li>
						</c:when>
						<c:otherwise>
						<li>
							<span class="up">이전글</span>
							<span class="subject"><a href="#;" onclick="viewPreNexArticle('<c:out value="${preArticle.articleNo}"/>')"><c:out value="${preArticle.title }"/></a></span>
						</li>
						<li>
							<span class="down">다음글</span>
							<span class="subject"><a href="#;" onclick="viewPreNexArticle('<c:out value="${nextArticle.articleNo}"/>')"><c:out value="${nextArticle.title}"/></a></span>
						</li>						
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- // comment -->
		</article>
		<!--// 게시판 View -->
		</form:form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
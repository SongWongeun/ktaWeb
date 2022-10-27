<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 목록 화면 function */
function listOaoBoard() {
   	document.boardForm.action = "/m/netCounter/myQna/list.do";
   	document.boardForm.submit();
}
</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path08">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/netCounter/index.do">인터넷창구</a></li>
			<li><a href="/m/netCounter/myQna/list.do">나의문의내역</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<form:form commandName="searchVO" name="boardForm" method="post">
			<form:input path="searchKeyword" type="hidden"/>
			<form:input path="searchCondition" type="hidden"/>
			<!-- 게시판 View -->
			<article class="defaultView">
			<div class="defaultTit">
				<h2><c:out value="${resultBoard.title}"/></h2>
				<span class="date"><c:out value="${resultBoard.createTime}"/></span>
			</div>
			<!-- // viewTit -->
			<div class="article borbNone">
				<p><c:out value="${resultBoard.contentText}"/></p>
			</div>
			<!-- // article -->
			<c:choose>
				<c:when test="${resultBoard.replyAt == 'Y'}">
					<div class="answerBox">
						<div class="answerTit">
							<h3>답변</h3>
							<span class="date"> 등록일<c:out value="${resultBoard.replyTime}"/></span>
						</div><!--// 답변타이틀 -->
						<div class="answer">
							<p><c:out value="${resultBoard.replyContentText}"/></p>
						</div>
					</div>			
				</c:when>
				<c:otherwise>
					<div class="answerBox">
						<div class="answerTit">
							<h3>아직 답변이 등록되지 않았습니다.</h3>
						</div><!--// 답변타이틀 -->
					</div>
				</c:otherwise>
			</c:choose>
			<!-- // answer -->
				<!-- // article -->
				<div class="btn_r_area">
					<a href="#;" onclick="listOaoBoard(); return false;" class="btn btn-black">목록</a>
				</div>
				<!-- // btn_areas -->
				<!-- <div class="comment">
					<ul>
						<li>
							<span class="up">이전글</span>
							<span class="subject"><a href="#;">이전글</a></span>
						</li>
						<li>
						  <span class="down">다음글</span>
							<span class="subject"><a href="#;">다음글</a></span>
						</li>	
					</ul>
				</div> -->
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
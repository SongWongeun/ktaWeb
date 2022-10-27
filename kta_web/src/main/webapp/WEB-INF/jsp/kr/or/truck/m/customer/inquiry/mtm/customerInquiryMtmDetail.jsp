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
   	document.boardForm.action = "<c:url value='/m/customer/inquiry/mtm/list.do'/>";
   	document.boardForm.submit();
}
</script>
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
	<form:form commandName="searchVO" name="boardForm" method="post">
	<form:input path="searchKeyword" type="hidden"/>
	<form:input path="searchCondition" type="hidden"/>
	<form:hidden path="pageIndex" />
		<article class="lineTitle"><h2 class="txtTit03">문의결과</h2></article>
		<!-- 게시판 View -->
		<article class="defaultView">
			<div class="defaultTit">
				<h2><c:out value="${resultBoard.title}"/></h2>
				<span class="date"><c:out value="${resultBoard.createTime}"/></span>
			</div>
			<!-- // viewTit -->
			<div class="article borbNone">
				<p>${resultBoard.contentHtml}</p>
			</div>
			<!-- // article -->
			<c:if test="${resultBoard.replyAt eq 'Y'}">
			<div class="answerBox">
				<div class="answerTit">
					<h3>답변</h3>
					<span class="date">등록일<c:out value="${resultBoard.replyTime}"/></span>
				</div><!--// 답변타이틀 -->
				<div class="answer">
					<p><c:out value="${resultBoard.replyContentText}"/></p>
				</div>
			</div>
			</c:if>
			<c:if test="${resultBoard.replyAt eq 'N'}">
			<div class="answerBox">
				<div class="answerTit">
					<h3>미등록</h3>
					<span class="date"></span>
				</div><!--// 답변타이틀 -->
				<div class="answer">
					<p>아직 답변이 등록되지 않았습니다.</p>
				</div>
			</div>
			</c:if>
			<!-- // answer -->
			<div class="btn_r_area">
				<a href="#;" onclick="listOaoBoard(); return false;" class="btn btn-gray">이전</a>
			</div>
			<!-- // btn_areas -->
		</article>
		<!--// 게시판 View -->
		<!-- 하단공통사용 장학제도문의 -->
		<article class="contentFoot">
			<div class="questBox">
				<a href="/m/customer/inquiry/mtm/regist.do" class="questBg02">
					<p class="txtSt01"><span class="txtBlod">1:1 문의</span></p>
					<p class="txtSt02">추가 문의가 필요하신 분께서는 1:1문의로 재 문의해 주세요.</p>
				</a>
			</div>
		</article>
	</form:form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
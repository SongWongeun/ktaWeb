<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">

/* index function */
function listPrMovieBoard() {
	document.location.href = "/m/cyberPr/prMovie/list.do";
}
/* index function */
function goIndex() {
	document.location.href = "/m/main/index.do";
}
/* 글 검색 function */
function searchPrMovieBoard() {
	document.boardForm.action = "<c:url value='/m/cyberPr/prMovie/list.do'/>";
   	document.boardForm.submit();s
}
/* pagination 페이지 링크 function */
function paging_prMovieBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/m/cyberPr/prMovie/list.do'/>";
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
			<li><a href="/m/cyberPr/prMovie/list.do">홍보영상</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="searchVO" name="boardForm" method="post">
	<form:hidden path="searchCondition" value="0"/>
	<input name="articleNo" type="hidden" />
		<article class="contentRegistTitle">
			<ul class="subTitBox">
				<li class="subtit_i09"><img alt="홍보영상타이틀아이콘" src="/images/m_truck/subtop/09top_5.png" /></li>
				<li class="txt01">정부포상행사와 축하공연 등의 기념 행사를 실시하고 있습니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<p class="prPoint"><span class="bulSt02">3G/4G로 이용 시 데이터 요금이 부과되실 수 있습니다.</span></p>
		<article class="prMove">
			<ul>
			<c:if test="${not empty resultList}">
				<c:forEach var="result" items="${resultList}" varStatus="status" begin="0">
				<li>
					<a href="http://youtu.be/${result.videoFileId}" onclick="window.open(this.href, '_blank'); return false;">
					<span class="mthum"><img src="http://img.youtube.com/vi/${result.videoFileId}/0.jpg" alt="유트브썸네일"/></span>
					<span>
						<em class="txt01"><c:out value="${result.contentText}"/></em>
						<span class="txt02">등록일 : <c:out value="${fn:substring(result.createTime, 0, 11)}"/></span>
						<!-- <span class="txt02">조회수 : 1,000,000</span> -->
					</span>
					</a>
				</li>
				</c:forEach>
			</c:if>
			<c:if test="${empty resultList}">
				<li class="noContents">
						<span class="title">검색된 내용이 없습니다.</span>
					</li>
			</c:if>	
			</ul>
				<!-- <li>
					<a href="#;">
						<span class="mthum"><img src="/images/m_truck/sub/mthum.gif" alt="유트브썸네일" /></span>
						<span>
							<em class="txt01">홍보영상1 입니다. 제목이길면 두줄로 보여집니다</em>
							<span class="txt02">등록일 : 2013.10.20</span>
							<span class="txt02">조회수 : 1,000,000</span>
						</span>
					</a>
				</li> -->
		</article>
		<!-- 게시판검색 -->
		<div class="searchForm">
			<form:input type="text" id="searchKeyword" path="searchKeyword" placeholder="검색 키워드를 입력해주세요." />
			<a class="btn" href="#;" onclick="searchPrMovieBoard();"><i class="icon-search"></i></a>
		</div>		
		<!-- pagenavi -->
		<article class="textCenter">
			<ul class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="mobileImage" jsFunction="paging_prMovieBoard" />
				<form:hidden path="pageIndex" />
			</ul>
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
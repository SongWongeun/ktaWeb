<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" >
/* 글 보기 화면 function */
function viewDriverBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/m/cyberPr/driverDay/detail.do'/>";
   	document.boardForm.submit();		
}
/* 글 검색 function */
function searchDriverBoard() {
	document.boardForm.action = "<c:url value='/m/cyberPr/driverDay/list.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_driverBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/m/cyberPr/driverDay/list.do'/>";
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
	<form:hidden path="searchCondition" value="0"/>
	<input name="articleNo" type="hidden" />
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i09"><img alt="운전자의날" src="/images/m_truck/subtop/09top_2.png" /></li>
				<li class="txt01">화물자동차운전자의 노고를 격려하고 사기를 진작하기 위해 국토교통부 후원으로 2001년부터 정부포상행사와 축하공연 등의 기념 행사를 실시하고 있습니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<!-- 게시판목록 -->
		<article class="defaultList">
			<ul>
				<c:if test="${not empty resultList}">
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<li>
						<a href="#;" onclick="viewDriverBoard('<c:out value="${result.articleNo}"/>')">
							<span class="title">${fn:replace(result.title, keyword , highlight )}</span>
							<span class="txtDesc"><c:out value="${fn:substring(result.createTime, 0, 11)}"/><span class="divide">l</span>조회수<c:out value="${result.rdcount}"/></span>
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
		</article>
		<!-- 게시판검색 -->
		<div class="searchForm">
			<form:input path="searchKeyword" placeholder="검색 키워드를 입력해주세요." />
			<a class="btn" href="#;" onclick="searchDriverBoard();"><i class="icon-search"></i></a>
		</div>
		<!-- pagenavi -->
		<article class="textCenter">
			<ul class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="mobileImage" jsFunction="paging_driverBoard" />
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
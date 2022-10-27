<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 목록 화면 function */
function listBoard() {
	document.boardForm.pageIndex.value = "1";
	document.boardForm.action = "<c:url value='/m/customer/inquiry/mtm/list.do'/>";
   	document.boardForm.submit();
}
/* 글 보기 화면 function */
function viewArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/m/customer/inquiry/mtm/detail.do'/>";
   	document.boardForm.submit();		
}
/* pagination 페이지 링크 function */
function boardLinkPage(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/m/customer/inquiry/mtm/list.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function pagingInquiryBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/m/customer/inquiry/mtm/list.do'/>";
   	document.boardForm.submit();
}
</script>
<c:if test="${param.code == 'regist.success' }">
<script type="text/javascript">
$(document).ready(function(){
	alert('글등록이 완료되었습니다.');
});
</script>
</c:if>
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
	<form:hidden path="searchCondition" value="0"/>
	<input name="articleNo" type="hidden" />
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i02"><img alt="고객문의" src="/images/m_truck/subtop/02top_1.png" /></li>
				<li class="txt01">고객님께 알맞는 응대를 해드리기 위해 1:1 문의 서비스를 제공합니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="defaultList">
			<ul>
				<c:if test="${not empty resultList}">
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<li>
						<a href="#;" onclick="viewArticle('<c:out value="${result.articleNo}"/>')">
							<span class="title">${fn:replace(result.title, keyword , highlight )}</span>
							<span class="txtDesc"><c:out value="${fn:substring(result.createTime, 0, 11)}"/><span class="divide">l</span>조회수<c:out value="${result.rdCount}"/></span>
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
			<a class="btn" href="#;" onclick="listBoard(); return false;"><i class="icon-search"></i></a>
		</div>
		<!-- pagenavi -->
		<!-- pagenavi -->
		<article class="textCenter">
			<ul class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="mobileImage" jsFunction="pagingInquiryBoard" />
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
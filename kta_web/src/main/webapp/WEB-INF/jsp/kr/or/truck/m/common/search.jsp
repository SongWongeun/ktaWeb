<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	var hash = location.hash;
	
	if(hash == '#tab1'){
		$(".tab1").trigger('click');		
	}else if(hash == '#tab2'){
		$(".tab2").trigger('click');		
	}
});

function goPage(articleNo){
	var temp = articleNo.substr(0,5);
	if(temp == 'DEDUC'){
		window.location.href='/m/infoLounge/deductNews/detail.do?articleNo='+articleNo;
	}else if(temp == 'ENCOR'){
		window.location.href='/m/infoLounge/scholarship/notice/detail.do?articleNo='+articleNo;
	}else if(temp == 'PRAIS'){
		window.location.href='/m/customer/praise/detail.do?articleNo='+articleNo;
	}else if(temp == 'DRIVR'){
		window.location.href='/m/cyberPr/driverDay/detail.do?articleNo='+articleNo;
	}else if(temp == 'ACCPR'){
		window.location.href='/m/cyberPr/accidentPrevention/detail.do?articleNo='+articleNo;
	}else if(temp == 'EVENT'){
		window.location.href='/m/cyberPr/eventView.do?articleNo='+articleNo;
	}else if(temp == 'VIDEO'){
		window.location.href='/m/cyberPr/prMovieIndex.do';
	}else{
		window.location.href=articleNo;
	}
}

function searchForm(){
	document.boardForm.pageIndex.value = 1;
	document.boardForm.pageIndex2.value = 1;
	document.boardForm.action = "<c:url value='/m/search.do'/>";
   	document.boardForm.submit();
}

/* pagination 페이지 링크 function */
function paging_bbs(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/m/search.do#tab1'/>";
   	document.boardForm.submit();
}
function paging_web(pageNo){
	document.boardForm.pageIndex2.value = pageNo;
	document.boardForm.action = "<c:url value='/m/search.do#tab2'/>";
   	document.boardForm.submit();
}

</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path07">
		<ul>
			<li class="depth02"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li><a href="/m/login.do">검색결과</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="tabWrap01">
			<!-- tab -->
			<div class="tabmenu">
				<ul >
					<li class="tab1 on"><a href="#;">자료검색결과</a></li>
					<li class="tab2"><a href="#;">웹페이지검색결과</a></li>
				</ul>
			</div>
			<form:form commandName="searchVO" name="boardForm" method="post">
			<form:hidden path="searchKeyword"/>
			<!-- 자료검색결과 -->
			<div class="con1">
				<article class="contentRegistTitle"><p class="bulSt01">총 검색 결과 <span class="color">${paginationInfoBbs.totalRecordCount}</span> 건</p></article>
				<!-- 게시판목록 -->
				<article class="defaultList">
					<ul>
						<c:forEach items="${bbsList}" var="bbs">
							<li>
								<a href="#;" onclick="goPage('${bbs.ARTICLE_NO}')">
									<span class="title">${bbs.TITLE }<c:out value="${fn:substring(bbs.createTime, 0, 11)}"/></span>
									<span class="txtDesc">${fn:substring(bbs.CONTENT_TEXT,0,40)}...</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</article>
				<!-- pagenavi -->
				<article class="textCenter">
					<!-- paging s -->
					<c:if test="${not empty bbsList }">
					<ul class="pagination">
						<ui:pagination paginationInfo = "${paginationInfoBbs}" type="mobileImage" jsFunction="paging_bbs" />
						<form:hidden path="pageIndex" />
					</ul>
					</c:if>
					<c:if test="${empty bbsList }">
						<form:hidden path="pageIndex" />
					</c:if>
					<!--// paging e -->
				</article>
			</div>
			<!-- 웹페이지검색결과 -->
			<div class="con2"> 
				<article class="contentRegistTitle"><p class="bulSt01">총 검색 결과 <span class="color">${paginationInfoWeb.totalRecordCount}</span> 건</p></article>
				<!-- 게시판목록 -->
				<article class="defaultList">
					<ul>
						<c:forEach items="${webList}" var="web">
							<li>
								<a href="#;" onclick="goPage('${web.WEB_URL}')">
									<span class="title">${web.WEB_TITLE }<c:out value="${fn:substring(web.createTime, 0, 11)}"/></span>
									<span class="txtDesc">${fn:substring(web.WEB_CONTENT,0,40)}...</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</article>
				<!-- pagenavi -->
				<article class="textCenter">
					<!-- paging s -->
					<c:if test="${not empty webList }">
					<ul class="pagination">
						<ui:pagination paginationInfo = "${paginationInfoWeb}" type="mobileImage" jsFunction="paging_web" />
						<form:hidden path="pageIndex2" />
					</ul>
					</c:if>
					<c:if test="${empty webList }">
						<form:hidden path="pageIndex2" />
					</c:if>
					<!--// paging e -->
				</article>	
			</div>
			</form:form>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
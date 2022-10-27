<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 보기 화면 function */
function viewSite(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandSiteView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addSite() {
   	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandSiteAddView.do'/>";
   	document.boardForm.submit();		
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
/* 글 검색 function */
function searchSite(key) {
	document.boardForm.searchKeyword.value=key;
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandSite.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_recommandSite(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/infoLounge/dataCenter/recommandSite.do'/>";
   	document.boardForm.submit();
}

function openSite(site){
	window.open("http://"+site+"");
}

$(document).ready(function(){
});
</script>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/info/site_tit.gif" alt=관련사이트 /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<span>관련사이트</span>
					</div>
				</div><!--// conTitle e -->
				<form:form commandName="searchVO" name="boardForm" method="post" action="">
				<fieldset>
				<legend>게시글리스트</legend>
				<input type="hidden" name="articleNo" />
				<input type="hidden" name="searchKeyword" />
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/info/site_con_tit.gif" alt="관련사이트 안내 정보 입니다" /></p>
					<div class="conSection">
						<!-- tabs s -->
						<div class="tabs">
							<ul class="sitetabMenu">
								<li class="st02 last<c:if test="${searchVO.searchKeyword == 'gov'}"> on</c:if>"><a href="#;" onclick="searchSite('gov'); return false;">정부기관</a></li>
								<li class="st02<c:if test="${searchVO.searchKeyword == 'federation'}"> on</c:if>"><a href="#;" onclick="searchSite('federation'); return false;">연합회</a></li>
								<li class="st02<c:if test="${searchVO.searchKeyword == 'cooperative'}"> on</c:if>"><a href="#;" onclick="searchSite('cooperative'); return false;">공제조합</a></li>
								<li class="st01<c:if test="${searchVO.searchKeyword == 'johapwon'}"> on</c:if>"><a href="#;" onclick="searchSite('johapwon'); return false;">조합원</a></li>
								<li class="st02<c:if test="${searchVO.searchKeyword == 'traffic'}"> on</c:if>"><a href="#;" onclick="searchSite('traffic'); return false;">교통관련단체</a></li>
								<li class="st02<c:if test="${searchVO.searchKeyword == 'group'}"> on</c:if>"><a href="#;" onclick="searchSite('group'); return false;">보험관련단체</a></li>
								<li class="st02<c:if test="${searchVO.searchKeyword == 'speech'}"> on</c:if>"><a href="#;" onclick="searchSite('speech'); return false;">보험관련언론사</a></li>
							</ul><!-- sitetabMenu e -->
							<div class="tabContainer">
								<h3 class="hide">관련사이트</h3>
								<div class="siteCont">
									<c:if test="${searchVO.searchKeyword == 'johapwon'}">
										<p class="siteAb"><span class="desC mL0">홈페이지 등록을 원하시는 조합원께서는 회사 홈페이지 주소를 E&#45;mail로 보내서 신청해주세요&#46;</span></p>
									</c:if>
									<table class="tbSite" summary="관련사이트 상세정보 테이블 입니다.">
										<caption>관련사이트 안내 정보 테이블</caption>
										<colgroup>
											<col style="width:65%;" />
											<col style="width:35%;" />
										</colgroup>
										<tbody>
											 <c:forEach var="result" items="${resultList}" varStatus="status">
											  <tr>
											    <%-- <td>
											    <c:choose>
													<c:when test="${result.siteCategory == 'federation'}">연합회</c:when>
													<c:when test="${result.siteCategory == 'gov'}">정부기관</c:when>
													<c:when test="${result.siteCategory == 'group'}">보험관련단체</c:when>
													<c:when test="${result.siteCategory == 'speech'}">보험관련언론사</c:when>
													<c:when test="${result.siteCategory == 'cooperative'}">공제조합</c:when>
													<c:when test="${result.siteCategory == 'traffic'}">교통관련단체</c:when>
												</c:choose></td> --%>		    
												<td ><span style="cursor:pointer;" onclick="openSite('${result.siteURL}')">${result.siteName}</span></td>
										      	<td class="txtSt"><a href='http://<c:out value="${result.siteURL}"/>' target="_blank"  title="새창열림"><c:out value="${result.siteURL}"/></a></td>		    
											  </tr>
											 </c:forEach>
										</tbody>
									</table>
								</div>
							</div><!--// tabContainer e -->
						</div>
						<!--// tabs e -->
					</div>
				</div><!--// conaArea e -->
				</fieldset>
				</form:form>
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->



</body>
</html>


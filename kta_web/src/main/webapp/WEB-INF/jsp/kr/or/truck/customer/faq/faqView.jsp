<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String u1 = "http://" +request.getServerName();
	String u2 = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String thisUrl = u1+u2+"?articleNo="+request.getParameter("articleNo");
	String shareImage = u1+"/images/truck/jpg/thumb_fb_logo.jpg";
	//String shareImage = "http://www.truck.or.kr/img2009/kta_banner.gif";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>

<meta property="og:title" content="화물공제조합 - 자주하는 질문"/>
<meta property="og:url" content="<%=thisUrl%>"/>
<meta property="og:image" content="<%=shareImage%>"/>
<meta property="og:site_name" content="화물공제조합"/>
<meta property="og:description"
      content="${resultBoard.title}"/>     
      
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){

	var returnUrl = '<%=thisUrl%>';
	
	$("#url").html(returnUrl);
	
	$('a.urlCopy').on('click',function(){
		var temp;
		var IE=(document.all)?true:false;
		if (IE) {
		if(confirm("이 글의 트랙백 주소를 클립보드에 복사하시겠습니까?"))
		window.clipboardData.setData("Text", returnUrl);
		} else {
		temp = prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", returnUrl);
		}
	});
	
	$('a.twitterTb').on('click',function(){		
		var msg = '${fn:substring(resultBoard.title, 0,10)}...';
		window.open("https://twitter.com/intent/tweet?text=" + encodeURIComponent(msg)+"  "+encodeURIComponent( returnUrl ));//트위터추가
	});
	
	$('a.facebookTb').on('click',function(){		
		var url = 'https://www.facebook.com/sharer/sharer.php?u='+ encodeURIComponent( returnUrl );
	 	window.open( url );
	});
});
/* 글 수정 화면 function */
function updateFaqBoard(no) {
   	document.boardForm.action = "<c:url value='/kwa/customer/faqNoticeUpdate.do'/>";
   	document.boardForm.submit();		
}
/* 글 목록 화면 function */
function listFaqBoard() {
	document.boardForm.action = "<c:url value='/customer/faqNoticeIndex.do'/>";
   	document.boardForm.submit();
}
/* 글 삭제 화면 function */
function deleteFaqBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/customer/faqNoticeDelete.do'/>";
   	document.boardForm.submit();		
}
/* 이전/다음글 보기 화면 function */
function viewPreNexArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/customer/faqNoticeView.do'/>";
   	document.boardForm.submit();		
}
/* 카테고리 검색 function */
function searchCategory(text) {
	document.boardForm.pageIndex.value = "1";
	document.boardForm.searchCategory.value=text;
	document.boardForm.action = "<c:url value='/customer/faqNoticeIndex.do'/>";
   	document.boardForm.submit();
}
</script>
</head>
<%--
	http://192.1.51.242:8080/customer/faqNoticeView.do?articleNo=FAQST_00000000000007
 --%>
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
 						<h2><img src="/images/truck/cust/faq_tit.gif" alt="자주하는질문" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/customer/customerIndex.do">고객광장</a>
						<span>자주하는 질문</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/faq_con_tit.gif" alt="고객님들께서 자주 문의하시는 내용과 답변을 제공합니다 1:1 문의 이용하시기 전에 필히 참조하세요" /></p>
					<div class="conSection">
						<form:form commandName="searchVO" name="boardForm" method="post" action="">
						<fieldset>
						<legend>자주하는질문</legend>
						<input name="articleNo" type="hidden" />
						<form:input path="searchCategory" type="hidden"/>
						<form:input path="searchCondition" type="hidden"/>
						<form:input path="searchKeyword" type="hidden"/>
						<form:hidden path="pageIndex" />
						<!-- tabs s -->
						<div class="tabs">
							<ul class="faqMenu">
								<c:forEach items="${ctgList}" var="ctgIndex" varStatus="status">
									<li class="<c:if test='${status.last == true }'>last</c:if><c:if test='${ctgIndex.CATEGORY_ID ==searchVO.searchCategory}'> on</c:if>"><a href="javascript:searchCategory('${ctgIndex.CATEGORY_ID}')">${ctgIndex.CATEGORY_NM}</a></li>
								</c:forEach>
								<%-- <li class="<c:if test="${searchVO.searchCategory == '계약'}">on</c:if>"><a href="javascript:searchCategory('계약')">계약</a></li><!-- 선택시 class에 on 추가 -->
								<li class="<c:if test="${searchVO.searchCategory == '보상'}">on</c:if>"><a href="javascript:searchCategory('보상')">보상</a></li>                         
								<li class="last<c:if test="${searchVO.searchCategory == '홈페이지'}"> on</c:if>"><a href="javascript:searchCategory('홈페이지')">홈페이지</a></li>  --%>
							</ul><!-- faqMenu e -->
							<div class="tabContainer">
								<h3 class="hide">계약&#44;보상&#44;홈페이지 분류의 자주하는 질문 컨텐츠 자세히보기 입니다.</h3>
								<!-- table view s -->
								<!-- table view font&sns -->
								<div class="tbviewArea clfix">
									<!-- font -->
									<div class="font">
										<h3 class="hide">글자크기 조절</h2>
										<span><img src="/images/truck/btn/btn_font_tit.gif" alt="글자크기" /></span>
										<button type="button" class="btn_zoom1" title="글자 키우기" onclick="Field.zoomIn();return false;" onkeypress="Field.zoomIn();return false;">글자 키우기</button>
										<button type="button" class="btn_zoom2" title="기본 사이즈" onkeypress="Field.zoom100(100);" onclick="Field.zoom100(100);return false;">기본 사이즈</button>
										<button type="button" class="btn_zoom3" title="글자 줄이기" onclick="Field.zoomOut();return false;" onkeypress="Field.zoomOut();">글자 줄이기</button>
									</div>
									<!-- url sns -->
									<div class="viewRight">
										<span id="url" name="url" class="url"></span>
										<a title="url복사" class="urlCopy" href="#;"><span class="hide">url복사</span></a>
										<a title="트위터 공유하기" class="twitterTb" href="#;"><span class="hide">트위터</span></a>
										<a title="페이스북 공유하기" class="facebookTb" href="#;"><span class="hide">페이스북</span></a>
									</div>
								</div><!--// table view font&sns -->
								<div class="bbsView1">
									<!-- 테이블 s -->
									<table class="tbView_st03" summary="자주하는질문  상세보기 게시판입니다.">
										<caption>자주하는질문 게시판입니다.</caption>
										<colgroup>
											<col style="width:17%;" />
											<col style="width:83%;" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_q.gif" alt="질문아이콘" /></p><p class="type02">질문</p></th>
												<td><c:out value="${resultBoard.title}"/></td>
											</tr>
											<tr>
												<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_a.gif" alt="답변내용아이콘" /></p><p class="type02">답변</p></th>
												<td>${resultBoard.contentHtml}</td>
											</tr>
										</tbody>
									</table><!--// 테이블 e -->
									<c:if test="${preArticle != null && nextArticle != null }"> <!-- 2016.12.16[H] 추가 -->
									<!-- 이전글, 다음글 s -->
									<div class="nextprevBox">
										<dl>
										<c:choose>
											<c:when test="${empty preArticle.articleNo}">
												<dt class="btn_prev lineFrist">이전글</dt>
												<dd class="lineFrist"><c:out value="${preArticle.title }"/></dd>
												<dt class="btn_next lineLast">다음글</dt>
												<dd class="lineLast"><a href="javascript:viewPreNexArticle('<c:out value="${nextArticle.articleNo}"/>')"><c:out value="${nextArticle.title}"/></a></dd>
											</c:when>
											<c:when test="${empty nextArticle.articleNo}">
												<dt class="btn_prev lineFrist">이전글</dt>
												<dd class="lineFrist"><a href="javascript:viewPreNexArticle('<c:out value="${preArticle.articleNo}"/>')"><c:out value="${preArticle.title }"/></a></dd>
												<dt class="btn_next lineLast">다음글</dt>
												<dd class="lineLast"><c:out value="${nextArticle.title}"/></dd>
											</c:when>
											<c:otherwise>
												<dt class="btn_prev lineFrist">이전글</dt>
												<dd class="lineFrist"><a href="javascript:viewPreNexArticle('<c:out value="${preArticle.articleNo}"/>')"><c:out value="${preArticle.title }"/></a></dd>
												<dt class="btn_next lineLast">다음글</dt>
												<dd class="lineLast"><a href="javascript:viewPreNexArticle('<c:out value="${nextArticle.articleNo}"/>')"><c:out value="${nextArticle.title}"/></a></dd>
											</c:otherwise>
										</c:choose>
										</dl>
									</div><!--// 이전글, 다음글 e -->
									</c:if> <!-- 2016.12.16[H] 추가 -->
									<!-- 버튼 -->
									<div class="btnboxR clfix">
										<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="listFaqBoard();">목록</a></span>
									</div>
								</div>
								<!--// table view e -->
							</div><!--// tabContainer e -->
						</div>
						<!--// tabs e -->
						</fieldset>
						</form:form>
					</div>
				</div><!--// conaArea e -->
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
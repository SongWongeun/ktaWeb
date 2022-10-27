<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	//New이미지를 보여주기 위해 현재날짜 가져오기
 	GregorianCalendar calender = new GregorianCalendar();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
 	Date nowDate = calender.getTime();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">

/* 글 보기 화면 function */
function viewPrMovieBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/cyberPr/prMovieView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addPrMovieBoard() {
   	document.boardForm.action = "<c:url value='/cyberPr/prMovieAddView.do'/>";
   	document.boardForm.submit();		
}
/* index function */
function listPrMovieBoard() {
	document.location.href = "/cyberPr/prMovieIndex.do";
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
/* 글 검색 function */
function searchPrMovieBoard() {
	document.boardForm.action = "<c:url value='/cyberPr/prMovieIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_prMovieBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/cyberPr/prMovieIndex.do'/>";
   	document.boardForm.submit();
}
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
						<h2><img src="/images/truck/cyber/prmovie_tit.gif" alt="홍보영상" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/cyberPr/cyberPrIndex.do" >사이버홍보관</a>
						<span>홍보영상</span>
					</div>
				</div><!-- conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cyber/prmovie_con_tit.gif" alt="화물공제조합의 다양한 홍보영상 입니다." /></p>		
					<div class="conSection">
						<form:form commandName="searchVO" name="boardForm" method="post" action="">
						<fieldset>
						<legend>홍보영상 목록</legend>
						<input type="hidden" name="articleNo"/>
						<div class="prMovie">
							<h4 class="ktaMovie"><img src="/images/truck/cyber/movieGallery.gif" alt="KTA MOVIE GALLERY" /></h4>
							<ul class="mLine">
								<c:forEach var="result" items="${resultList}" varStatus="status" >
									<img src="/images/truck/btn/btn_play.png" class="play_${status.index}"/>			
								<c:set var="regDate">
								${fn:replace(result.createTime, '.', '')}
								</c:set>	
								<li class="mv${status.index}">
									<a href="http://youtu.be/${result.videoFileId}" onclick="window.open(this.href, '_blank'); return false;" title="${result.title}">
										<img src="http://img.youtube.com/vi/${result.videoFileId}/1.jpg" width="160" height="120" alt="홍보영상" />
										<p class="youtuBox" name="youtuBox" style="z-index:2;">
											<span class="youtuT">${result.title}</span>
											<span class="youtuD">${fn:substring(result.createTime,0,11)}
											<%
											String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
											Date regDate = dateFormat.parse(chkDate); 
											long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
											long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
											%>
											<%if(diffDays<5){ %>								
											<img style="width:12px; height:12px;" src="/images/truck/main/icon_new_org.png" alt="새글"/>
											<%}%>
											</span>
										</p>
									</a>
								</li>
								</c:forEach>
							</ul>
							<!-- paging s -->
							<div class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_prMovieBoard" />
								<form:hidden path="pageIndex" />
							</div>
							<!--// paging e -->
						</div>	
						</fieldset>
						</form:form>
					</div><!--// conSection e -->
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
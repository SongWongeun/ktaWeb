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
function viewEventBoard(no) {
	document.boardForm.tabCon.value="1";
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/cyberPr/eventView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addEventBoard() {
   	document.boardForm.action = "<c:url value='/cyberPr/eventAddView.do'/>";
   	document.boardForm.submit();		
}
/* index function */
function listEventBoard() {
	document.location.href = "/cyberPr/eventIndex.do";
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
/* 글 검색 function */
function searchEventBoard() {
	document.boardForm.action = "<c:url value='/cyberPr/eventIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_eventBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/cyberPr/eventIndex.do'/>";
   	document.boardForm.submit();
}

function changeTab(no){
	document.boardForm.tabCon.value= no;
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/cyberPr/eventIndex.do'/>";
   	document.boardForm.submit();
}
$(document).ready(function(){
	var tab = '${searchVO.tabCon}';
	
	if(tab == '2'){
		$("#tab1").attr('style','display:none');
		$("#tab2").attr('style','display:block');
		$(".tabMenu #toptab1").removeAttr("class");
		$(".tabMenu #toptab2").attr("class","active");
	}
	
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
						<h2><img src="/images/truck/cyber/event_tit.gif" alt="행사안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/cyberPr/cyberPrIndex.do" >사이버홍보관</a>
						<span>행사안내</span>
					</div>
				</div><!-- conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cyber/event_con_tit.gif" alt="화물공제조합의 다양한 행사 갤러리 입니다." /></p>			
					<div class="conSection eventBg">
						<div class="eventbgTop">
							<!-- tabs s -->
							<div class="eventtabs">
								<ul class="tabMenu">
									<li id="toptab1"><a href="#tab1" onclick="changeTab('1')" class="tabimg">이미지로만 보기</a></li>
									<li id="toptab2"><a href="#tab2" onclick="changeTab('2')" class="tabtxt">제목과 함께 보기</a></li>
								</ul><!--// tabMenu e -->
								<div class="tabContainer">
									<form:form commandName="searchVO" name="boardForm" method="post" action="">
									<fieldset>
									<legend>행사안내 목록</legend>
									<input type="hidden" name="articleNo" />
									<form:input type="hidden" path="tabCon" />
									<!-- 이미지로만 보기 -->
									<div id="tab1" class="tabCont">
										<h3 class="hide">이미지로만 보기</h3>
										<ul class="imgGallery">
										<c:forEach var="result" items="${resultList}" varStatus="status">
										      <c:if test="${!empty result.atchFileId}">
									         	 <li><a href="#;" onclick="viewEventBoard('<c:out value="${result.articleNo}"/>'); return false;">
									         	 <img src="/com/atch/getThumbImage.do?atchFileId=${result.atchFileId}" alt="<c:out value="${result.atchFileId}" /> 이미지" width="128" height="84"/></a></li>
									         </c:if>
									          <c:if test="${empty result.atchFileId}">
									         	  사진없음
									         </c:if>
										</c:forEach>
										</ul>																		
									</div>
									<!-- 제목과 함께 보기 -->
									<div id="tab2" class="tabCont">
										<h3 class="hide">제목과 함께 보기</h3>
										<ul class="evtxtList">
											<c:if test="${not empty resultList}">
											<c:forEach var="result" items="${resultList}" varStatus="status">		
											<c:set var="regDate">
											${fn:replace(result.createTime, '.', '')}
											</c:set>		
											<li>
										        <a href="#;" onclick="viewEventBoard('<c:out value="${result.articleNo}"/>'); return false;">
										        	<img src="/com/atch/getThumbImage.do?atchFileId=${result.atchFileId}" alt="<c:out value="${result.atchFileId}" /> 이미지" width="200"/>
													<span>${fn:replace(result.title, keyword , highlight )}
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
												</a>
											</li>
											</c:forEach>
											</c:if>
											<c:if test="${empty resultList}">
												<tr>
													<td class="tdnone" colspan="2">검색된 내용이 없습니다.</td>
												</tr>
											</c:if>	
										</ul>
									</div>
									<!-- paging s -->
									<div class="paging">
										<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_eventBoard" />
										<form:hidden path="pageIndex" />
									</div>
									<!--// paging e -->	
									</fieldset>
									</form:form>
								</div><!--// tabContainer e -->
							</div><!--// tabs e -->
						</div>
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

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
function viewFaqBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/customer/faqNoticeView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addFaqBoard() {
   	document.boardForm.action = "<c:url value='/customer/faqNoticeAddView.do'/>";
   	document.boardForm.submit();		
}
/* 글 검색 function */
function searchFaqBoard() {
	document.boardForm.action = "<c:url value='/customer/faqNoticeIndex.do'/>";
   	document.boardForm.submit();
}
/* 카테고리 검색 function */
function searchingCategory(text) {
	document.boardForm.pageIndex.value = "1";
	document.boardForm.searchCategory.value=text;
	document.boardForm.action = "<c:url value='/customer/faqNoticeIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_faqBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/customer/faqNoticeIndex.do'/>";
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
						<div class="roundBox">
							<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="findArea">
								<p class="findName"><img src="/images/truck/cust/faq_search_tit.gif" alt="편리하게 검색해보기" /></p>
								<div class="findForm pT20">
									<form:select path="searchCondition" name="searchCondition" title="검색옵션">
										<form:option value="0"  label="전체"/>
										<form:option value="1" label="제목" />
										<form:option value="2" label="본문" />
									</form:select>
									<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" title="검색어를 입력해주세요" style="width:270px" name="search" class="txt" />
									<a class="btn_search" href="#;" onclick="searchFaqBoard(); return false;"><img class="vaM" src="/images/truck/btn/btn_ksearch.gif" alt="검색" /></a>
								</div>
							</div>
							<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div><!--// roundBox e -->
						<!-- tabs s -->
						<div class="tabs">
							<ul class="faqMenu">
									<!-- <li class="<c:if test="${ '1'==searchVO.searchCategory}"> on</c:if>"><a href="#;" onclick="searchingCategory('1'); return false;">장학사업</a></li> -->
									<li class="<c:if test="${ '2'==searchVO.searchCategory}"> on</c:if>"><a href="#;" onclick="searchingCategory('2'); return false;">보상</a></li>
									<li class="last<c:if test="${ '3'==searchVO.searchCategory}"> on</c:if>"><a href="#;" onclick="searchingCategory('3'); return false;">홈페이지</a></li>
								
								<%-- <li class="<c:if test="${searchVO.searchCategory == '계약'}">on</c:if>"><a href="javascript:searchCategory('1')">계약</a></li><!-- 선택시 class에 on 추가 -->
								<li class="<c:if test="${searchVO.searchCategory == '보상'}">on</c:if>"><a href="javascript:searchCategory('2')">보상</a></li>                         
								<li class="last<c:if test="${searchVO.searchCategory == '홈페이지'}"> on</c:if>"><a href="javascript:searchCategory('3')">홈페이지</a></li> --%> 
							</ul><!-- faqMenu e -->
							<div class="tabContainer">
								<h3 class="hide">계약&#44;보상&#44;홈페이지 분류의 자주하는 질문 컨텐츠입니다.</h3>
								<!-- table list s -->
								<div class="bbsList1">
									<table class="tbList_st01" summary="자주하는질문 게시판입니다. 번호,구분,제목">
										<caption>자주하는질문 게시판</caption>
										<colgroup>
											<col width="7%">									
											<col width="9%">
											<col width="84%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first">번호</th>
												<th scope="col">구분</th>
												<th scope="col" class="last">제목</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty resultList}">
										<c:forEach var="result" items="${resultList}" varStatus="status">	
										<c:set var="regDate">
										${fn:replace(result.createTime, '.', '')}
										</c:set>			
											  <tr>
											    <td class="left"><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
											    <td class="left">
															${result.faqCategoryNm }
												</td>
											    <c:choose>
											    <c:when test="${fn:length(result.title) > 60 }">
											    <td class="alL ellipsis"><a href="#;" onclick="viewFaqBoard('<c:out value="${result.articleNo}"/>')"><c:out value="${fn:substring(result.title, 0, 60)}"/>...</a>
											    <%
												String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
												Date regDate = dateFormat.parse(chkDate); 
												long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
												long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
												%>
												<%if(diffDays<5){ %>								
												<img  src="/images/truck/main/icon_new_org.png" alt="새글"/>
												<%}%>
												</td>
											  	</c:when>
											  	<c:otherwise>
											  	<td class="alL ellipsis"><a href="#;" onclick="viewFaqBoard('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a>
											  	<%
												String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
												Date regDate = dateFormat.parse(chkDate); 
												long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
												long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
												%>
												<%if(diffDays<5){ %>								
												<img  src="/images/truck/main/icon_new_org.png" alt="새글"/>
												<%}%>
											  	</td>
											  	</c:otherwise>
											  	</c:choose>
											  </tr>
									 	</c:forEach>
									 	</c:if>
									 	<c:if test="${empty resultList}">
											<tr>
												<td class="tdnone" colspan="3">검색된 내용이 없습니다.</td>
											</tr>
										</c:if>	
										</tbody>
									</table>
									<!-- paging s -->
									<div class="paging">
										<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_faqBoard" />
										<form:hidden path="pageIndex" />
									</div>
									<!--// paging e -->
								</div>
								<!--// table list e -->
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
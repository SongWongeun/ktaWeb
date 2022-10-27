<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 목록 화면 function */
function listBoard() {
	document.boardForm.action = "<c:url value='/customer/cleanCenter/cleanCenterReportList.do'/>";
   	document.boardForm.submit();
}

/* 글 보기 화면 function */
function viewArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/customer/cleanCenter/cleanCenterResult.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function viewRegistBoard() {
   	document.boardForm.action = "<c:url value='/customer/cleanCenter/viewRegistBoard.do'/>";
   	document.boardForm.submit();		
} 

/* pagination 페이지 링크 function */
function boardLinkPage(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/customer/cleanCenter/leanCenterReportList.do'/>";
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
						<!-- <h2><img src="/images/truck/info/deducnews_tit.gif" alt="" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다.</p> -->
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/customer/qnaInfo.do" >고객광장</a>
						<span>제보하기</span>
					</div>
				</div><!-- conTitle e -->
				<div class="conaArea deducBg">
					<!-- <div class="deducContit"><p class="hide">화물공제조합 소식입니다. 보다 알찬 정보로 보답 드리겠습니다.</p></div> -->
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>클린센터 리스트</legend>
					<input type="hidden" name="articleNo" />
					<div class="conSection">
						<p class="infosearchWrap">
							<form:select path="searchCondition" title="제보하기검색옵션" name="" >
								<form:option selected="selected" value = "0">전체</form:option>
								<form:option value="1">제목</form:option>
								<form:option value="2">본문</form:option>
							</form:select>
							<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" type="text" title="검색어를 입력해주세요" style="width:173px" name="search" value=""/>
							<a class="btn_search" href="#;" onclick="listBoard(); return false;"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
						</p>
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="제보하기 게시판입니다. 번호,제목,작성일,조회수">
								<caption>제보하기 게시판</caption>
								<colgroup>
									<col width="9%">
									<col width="70%">
									<col width="12%">
									<col width="9%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col" class="last">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty resultList}">
									<c:forEach var="result" items="${resultList}" varStatus="status">
		  								<tr>
		    								<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
		    								<td class="alL ellipsis"><a href="#;" onclick="viewArticle('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a></td>
	      									<td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>	      									
		    								<td><c:out value="${result.rdCount}"/></td>
		  								</tr>
		 							</c:forEach>		
		 							</c:if>		
		 							<c:if test="${empty resultList}">
		 								<tr>
		 									<td class="tdnone" colspan="4">검색된 내용이 없습니다.</td>
		 								</tr>
		 							</c:if>				
								</tbody>
							</table>
							<!-- paging s -->							
								<div class="paging">
									<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="boardLinkPage" />
									<form:hidden path="pageIndex" />
								</div><!--// paging e -->
						</div>
						<!-- table list e -->
					</div>
					</fieldset>
					</form:form>
				</div><!-- conaArea e -->
			</div>
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>


<%-- <form:form commandName="searchVO" name="boardForm" method="post">
<input type="hidden" name="articleNo" />
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		1:1문의 게시판 (글 수 : <c:out value="${paginationInfo.totalRecordCount}"/>)
	</div>
	<!-- // 타이틀 -->
	 <div id="search">
		<ul>
		<li>
			<form:select path="searchCondition" cssClass="use">				
				<form:option value="0" label="Subject" />
				<form:option value="1" label="Content" />
			</form:select>
		</li>
		<li><form:input path="searchKeyword" cssClass="txt"/></li>
		<li><a href="javascript:listBoard();">검색</a></li></ul>		
	</div> 
	<!-- List -->
	<div id="table">		
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-bottom:2px solid lightgray;">
			<colgroup>
				<col width="20%">				
				<col width="5%">
				<col width="40%">
				<col width="10%">
				<col width="15%">
				<col width="10%">				
			</colgroup>		  
			<tr bgcolor="lightgray">
				<th align="center">articleNo</th>
				<th align="center">No</th>
				<th align="center">제목</th>
				<th align="center">등록시간</th>
				<th align="center">등록자</th>
				<th align="center">조회수</th>				
			</tr>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td align="center" class="listtd"><c:out value="${result.articleNo}"/></td>
				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
				<td align="center" class="listtd"><a href="javascript:viewArticle('<c:out value="${result.articleNo}"/>')"><c:out value="${result.title}"/></a></td>				
				<td align="center" class="listtd"><c:out value="${result.createTime}"/></td>
				<td align="center" class="listtd"><c:out value="${result.writerName}"/>&nbsp;</td>
				<td align="center" class="listtd"><c:out value="${result.rdCount}"/>&nbsp;</td>				
			</tr>
			</c:forEach>
		</table>
	</div>
	<div class="paging">	
		<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="boardLinkPage" />
		<form:hidden path="pageIndex" />
	</div>	
	
	
	<br><br>
	<div>				
		<a href="javascript:viewRegistBoard();">등록</a><br>
		<a href="/customer/cleanCenter/cleanCenterReportList.do">목록보기</a>		
	</div>
</div>
</form:form>
 --%></body>
</html>
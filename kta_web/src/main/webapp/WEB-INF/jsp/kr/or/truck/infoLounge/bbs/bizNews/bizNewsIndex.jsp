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
function viewBizBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/infoLounge/bizNewsView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addBizBoard() {
   	document.boardForm.action = "<c:url value='/infoLounge/bizNewsAddView.do'/>";
   	document.boardForm.submit();		
}


/* index function */
function listBizBoard() {
	document.location.href = "/infoLounge/bizNewsIndex.do";
}

/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}

/* 글 검색 function */
function searchBizBoard() {

	document.boardForm.action = "<c:url value='/infoLounge/bizNewsIndex.do'/>";
   	document.boardForm.submit();
}

/* pagination 페이지 링크 function */
function paging_bizBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/infoLounge/bizNewsIndex.do'/>";
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
						<h2><img src="/images/truck/info/biznews_tit.gif" alt="업계소식" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<a href="/infoLounge/bizNewsIndex.do" >업계소식</a>
						<span>업계소식</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea bizBg">
					<div class="infoContit01"><p class="hide">동종업계소식입니다. 보다 신속하고, 정확한 정보로 보답해 드리겠습니다.</p></div>				
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
						<legend>업계소식 목록</legend>
					<input type="hidden" name="articleNo" />
					<div class="conSection">
						<p class="infosearchWrap">
							<form:select path="searchCondition" title="업계소식검색옵션" name="" >
								<form:option selected="selected" value = "0">전체</form:option>
								<form:option value="1">제목</form:option>
								<form:option value="2">본문</form:option>
							</form:select>
							<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" title="검색어를 입력해주세요" style="width:173px" />
							<a class="btn_search" href="#;" onclick="searchBizBoard();"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
						</p>
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="업계소식 게시판입니다. 번호,제목,작성일,조회수">
								<caption>업계소식 게시판</caption>
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
									<c:forEach var="result" items="${resultList }" varStatus="status">
									 <tr>
									 	<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
									 	<td class="alL ellipsis"><a href="#;" onclick="viewBizBoard('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a></td>
									 	<td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>
									 	<td><c:out value="${result.rdcount}"/></td>
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
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_bizBoard" />
								<form:hidden path="pageIndex" />
							</div>
							<!--// paging e -->
						</div>
						<!--// table list e -->
					</div>
					</fieldset>
					</form:form>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>

<%-- <div id="border">
<a href="#;" onclick="listBizBoard()">업계소식 게시판</a>
<a href="#;" onclick="goIndex(); return false;">메인</a>
<form:form commandName="searchVO" name="boardForm" method="post">
<input type="hidden" name="articleNo" />
	<table width="100%" cellpadding="8" class="listTable" >
	 <thead>
	  <tr>
	    <!-- th class="title" width="3%" nowrap><input type="checkbox" name="all_check" class="check2"></th-->
	    <th scope="col" class="listTitle" width="10%" nowrap>번호</th>
	    <th scope="col" class="listTitle" width="64%" nowrap>제목</th>
	    <th scope="col" class="listTitle" width="15%" nowrap>작성일</th>
	    <th scope="col" class="listTitle" width="8%" nowrap>조회수</th>
	  </tr>
	 </thead>
	
	
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <td class="listCenter" nowrap><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
		    <td class="listLeft" nowrap><a href="#;" onclick="viewBizBoard('<c:out value="${result.articleNo}"/>')"><c:out value="${result.title}"/></a></td>
	      	<td class="listCenter" nowrap><c:out value="${result.createTime}"/></td>
		    <td class="listCenter" nowrap><c:out value="${result.rdcount}"/></td>
		  </tr>
		 </c:forEach>
	 </tbody>
	</table>

		<div class="paging">
			<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="paging_bizBoard" />
			<form:hidden path="pageIndex" />
		</div>
		
		<div align="right">
			<a href="#;" onclick="addBizBoard()">글쓰기</a>
		
		</div>
			 <div id="search">
		<ul>
		<li>
			<form:select path="searchCondition" cssClass="use">
				<form:option value=""  label="======="/>
				<form:option value="0" label="Subject" />
				<form:option value="1" label="Content" />
			</form:select>
		</li>
		<li><form:input path="searchKeyword" cssClass="txt"/></li>
		<li><a href="#;" onclick="searchBizBoard();">검색</a></li></ul>		
	</div> 
</form:form>
</div> --%>
</body>
</html>


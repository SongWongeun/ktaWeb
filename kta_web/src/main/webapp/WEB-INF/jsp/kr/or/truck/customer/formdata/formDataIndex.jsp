<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
function viewFormDataBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/customer/formDataView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addFormDataBoard() {
   	document.boardForm.action = "<c:url value='/customer/formDataAddView.do'/>";
   	document.boardForm.submit();		
}
/* 글 검색 function */
function searchFormDataBoard() {
	document.boardForm.action = "<c:url value='/customer/formDataIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_formDataBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/customer/formDataIndex.do'/>";
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
 						<h2><img src="/images/truck/cust/data_tit.gif" alt="자료실" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/customer/customerIndex.do">고객광장</a>
						<span>자료실</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/data_con_tit.gif" alt="각종 양식과 전문자료 입니다" /></p>
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>자료실</legend>
					<input type="hidden" name="articleNo" />
					<div class="conSection">
						<!-- 검색 -->
						<p class="infosearchWrap">
							<select id="searchCondition" name="searchCondition" title="칭찬합시다검색옵션">
								<option selected="selected" value="0">전체</option>
								<option value="1">제목</option>
								<option value="2">본문</option>
							</select>
							<label class="hide" for="search">검색어입력</label><form:input id="search" path="searchKeyword" title="검색어를 입력해주세요" style="width:173px" class="txt" value=""/>
							<a class="btn_search" href="#;" onclick="searchFormDataBoard(); return false;"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
						</p>
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="칭찬합시다 목록게시판 입니다.번호,제목,작성일,조회수">
								<caption>칭찬합시다 목록 게시판</caption>
								<colgroup>
									<col width="9%">
									<col width="61%">
									<col width="12%">
									<col width="9%">
									<col width="9%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col">첨부</th>
										<th scope="col" class="last">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty resultList}">
									<c:forEach var="result" items="${resultList }" varStatus="status">
									<tr>			
									<c:set var="regDate">
									${fn:replace(result.createTime, '.', '')}
									</c:set>										 
									 	<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
									 	<td class="alL ellipsis"><a href="/cmm/fms/FileDown.do?atchFileId=${result.atchFileId}&fileSn=0">${fn:replace(result.title, keyword , highlight )}</a>
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
									 	<td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>
									 	<td><c:if test="${!empty result.atchFileId}">
										<c:import url="/com/atch/selectFileInfsMain.do" charEncoding="utf-8">
											<c:param name="param_atchFileId" value="${result.atchFileId}" />
										</c:import></c:if></td>
									 	<td><c:out value="${result.rdcount}"/></td>
									 </tr>
									</c:forEach>
									</c:if>
									<c:if test="${empty resultList}">
										<tr>
											<td class="tdnone" colspan="6">검색된 내용이 없습니다.</td>
										</tr>
									</c:if>	
								</tbody>
							</table>
							<!-- paging s -->							
							<div class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_formDataBoard" />
								<form:hidden path="pageIndex" />
							</div><!--// paging e -->
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
	<!-- //wrap e -->
</body>


<%--
 <form:form commandName="searchVO" name="boardForm" method="post">
<input type="hidden" name="articleNo" />
<div class="conSection">
	<p class="infosearchWrap">
		<form:select path="searchCondition" title="자료실검색옵션" name="" >
			<form:option selected="selected" value = "0">전체</form:option>
			<form:option value="1">제목</form:option>
			<form:option value="2">본문</form:option>
		</form:select>
		<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" type="text" title="검색어를 입력해주세요" style="width:173px" name="search" value=""/>
		<a class="btn_search" href="javascript:searchFormDataBoard();"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
	</p>
	<!-- table list s -->
	<div class="bbsList1">
		<table class="tbList_st01" summary="자료실 게시판입니다. 번호,제목,작성일,조회수">
			<caption>자료실 게시판</caption>
			<colgroup>
				<col width="9%">
				<col width="63%">
				<col width="12%">
				<col width="9%">
				<col width="7%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" class="first">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
					<th scope="col">첨부</th>
					<th scope="col" class="last">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
 								<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
 								<td class="alL ellipsis"><a href="javascript:viewFormDataBoard('<c:out value="${result.articleNo}"/>')"><c:out value="${result.title}"/></a></td>
  									<td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>
  									<td><c:if test="${!empty result.atchFileId}">
								<c:import url="/com/atch/selectFileInfsMain.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${result.atchFileId}" />
								</c:import>
							</c:if>
						</td>
 								<td><c:out value="${result.rdcount}"/></td>
							</tr>
					</c:forEach>								
			</tbody>
		</table>
		<!-- paging s -->							
			<div class="paging">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="paging_formDataBoard" />
				<form:hidden path="pageIndex" />
			</div><!--// paging e -->
	</div>
	<!-- table list e -->
</div><!-- <a href="javascript:addFormDataBoard()">글쓰기</a> -->
</form:form>
--%>


<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/common/include/global.do"></c:import>
<c:import url="/common/include/customerSide.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 보기 화면 function */
function viewFormDataBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/customer/formDataView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addFormDataBoard() {
   	document.boardForm.action = "<c:url value='/customer/formDataAddView.do'/>";
   	document.boardForm.submit();		
}
/* index function */
function listFormDataBoard() {
	document.location.href = "/customer/formDataIndex.do";
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
/* 글 검색 function */
function searchFormDataBoard() {
	document.boardForm.action = "<c:url value='/customer/formDataIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_formDataBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/customer/formDataIndex.do'/>";
   	document.boardForm.submit();
}
</script>
</head>
<body>
<div id="border">
<a href="javascript:listFormDataBoard()">양식다운로드 게시판</a>
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
		    <td class="listLeft" nowrap><a href="javascript:viewFormDataBoard('<c:out value="${result.articleNo}"/>')"><c:out value="${result.title}"/></a></td>
	      	<td class="listCenter" nowrap><c:out value="${result.createTime}"/></td>
		    <td class="listCenter" nowrap><c:out value="${result.rdcount}"/></td>
		  </tr>
		 </c:forEach>
	 </tbody>
	</table>
		<div class="paging">
			<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="paging_formDataBoard" />
			<form:hidden path="pageIndex" />
		</div>	
		<div align="right">
			<a href="javascript:addFormDataBoard()">글쓰기</a>
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
		<li><a href="javascript:searchFormDataBoard();">검색</a></li></ul>		
	</div> 
</form:form>
</div>
</body>
</html>
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
	/* 글 보기 화면 function */
	function viewDeductBoard(no) {
		document.boardForm.articleNo.value = no;
	   	document.boardForm.action = "<c:url value='/infoLounge/deductNewsView.do'/>";
	   	document.boardForm.submit();		
	}
	/* 글 등록 화면 function */
	function addDeductBoard() {
	   	document.boardForm.action = "<c:url value='/infoLounge/deductNewsAddView.do'/>";
	   	document.boardForm.submit();		
	}
	
	/* index function */
	function listDeductBoard() {
		document.location.href = "/infoLounge/deductNewsIndex.do";
	}
	
	/* index function */
	function goIndex() {
		document.location.href = "/main/index.do";
	}
	
	/* 글 검색 function */
	function searchDeductBoard() {
	
		document.boardForm.action = "<c:url value='/infoLounge/deductNewsIndex.do'/>";
	   	document.boardForm.submit();
	}
	
	/* pagination 페이지 링크 function */
	function paging_deductBoard(pageNo){
		document.boardForm.pageIndex.value = pageNo;
		document.boardForm.action = "<c:url value='/infoLounge/deductNewsIndex.do'/>";
	   	document.boardForm.submit();
	}	
</script>
<%
	//New이미지를 보여주기 위해 현재날짜 가져오기
 	GregorianCalendar calender = new GregorianCalendar();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
 	Date nowDate = calender.getTime();
%>

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
						<h2><img src="/images/truck/info/deducnews_tit.gif" alt="공제소식" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<span>공제소식</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea deducBg">
					<div class="infoContit01"><p class="hide">화물공제조합 소식입니다. 보다 알찬 정보로 보답 드리겠습니다.</p></div>				
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>게시글리스트</legend>
					<input type="hidden" name="articleNo" />
					<div class="conSection">
						<p class="infosearchWrap">
							<form:select path="searchCondition" title="공제소식검색옵션" name="" >
								<form:option selected="selected" value = "0">전체</form:option>
								<form:option value="1">제목</form:option>
								<form:option value="2">본문</form:option>
							</form:select>
							<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" type="text" title="검색어를 입력해주세요" style="width:173px" name="search" value=""/>
							<a class="btn_search" href="#;" onclick="searchDeductBoard(); return false;"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
						</p>
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="공제소식 게시판입니다. 번호,제목,작성일,조회수">
								<caption>공제소식 게시판</caption>
								<colgroup>
									<col style="width:9%;" />
									<c:if test="${not empty ctgList }">
										<col style="width:9%;" />
										<col style="width:61%;" />
									</c:if>
									<c:if test="${empty ctgList }">
										<col style="width:70%;" />
									</c:if>
									<col style="width:12%;" />
									<col style="width:9%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<c:if test="${not empty ctgList }">
											<th scope="col">분류</th>
										</c:if>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col" class="last">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty resultList}">
									<c:forEach var="result" items="${resultList }" varStatus="status">									
									<c:set var="regDate">
									${fn:replace(result.createTime, '.', '')}
									</c:set>									
									 <tr>
									 	<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>									 	
										<c:if test="${not empty ctgList }">
										 	<td>
										    <c:forEach items="${ctgList}" var="ctgIndex">
												<c:if test="${ctgIndex.CATEGORY_ID == result.category}">${ctgIndex.CATEGORY_NM}</c:if>
											</c:forEach>
											</td>
										</c:if>
									 	<td class="alL ellipsis"><a href="#;" onclick="viewDeductBoard('<c:out value="${result.articleNo}"/>'); return false;">${fn:replace(result.title, keyword , highlight )}</a>
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
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_deductBoard" />
								<form:hidden path="pageIndex" />
							</div>
							<!--// paging e -->
						</div>
						<!--// table list e -->
					</div>
					</fieldset>
					</form:form>
				</div><!--// conaArea e -->
			</div><!--// contents e -->s
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>


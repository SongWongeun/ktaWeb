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
function viewEncourBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/infoLounge/encourNoticeView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addEncourBoard() {
   	document.boardForm.action = "<c:url value='/infoLounge/encourNoticeAddView.do'/>";
   	document.boardForm.submit();		
}
/* index function */
function listEncourBoard() {
	document.location.href = "/infoLounge/encourNoticeIndex.do";
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
/* 글 검색 function */
function searchEncourBoard() {
	document.boardForm.action = "<c:url value='/infoLounge/encourNoticeIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_encourBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/infoLounge/encourNoticeIndex.do'/>";
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
						<h2><img src="/images/truck/info/enconoti_tit.gif" alt="장학사업공지" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<a href="/infoLounge/encourIndex.do" >장학사업</a>
						<span>장학사업공지</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
				<p class="confirTit"><img src="/images/truck/info/enconoti_con_tit.gif" alt="고객님과 함께 나누는 행복한 미래!화물공제조합 장학사업공지안내입니다." /></p>	
				<div class="ennotiQ">
					<p>화물공제조합에서 진행하는 장학사업이 궁금하신가요&#63; 문의글을 남겨주시면 담당자가 직접 회신 드립니다&#46;</p>
					<a class="btn" href="/customer/inquiry/viewRegistBoard.do"><img src="/images/truck/info/btn_enconoti_con.gif" alt="장학사업문의"/></a>
				</div>	
				<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>게시글리스트</legend>
					<input type="hidden" name="articleNo" />
					<div class="conSection">
						<p class="infosearchWrap">
							<form:select path="searchCondition" title="장학사업공지 검색옵션" name="" >
								<form:option selected="selected" value = "0">전체</form:option>
								<form:option value="1">제목</form:option>
								<form:option value="2">본문</form:option>
							</form:select>
							<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" type="text" title="검색어를 입력해주세요" style="width:173px" name="search" value=""/>
							<a class="btn_search" href="javascript:searchEncourBoard();"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
						</p>
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="장학사업공지 게시판입니다. 번호,제목,작성일,조회수">
								<caption>장학사업공지 게시판</caption>
								<colgroup>
									<col width="9%">
									<col width="10%">
									<col width="60%">
									<col width="12%">
									<col width="9%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">구분</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
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
									 	<td>
									 	<c:forEach items="${ctgList}" var="ctgIndex">
											<c:if test="${ctgIndex.CATEGORY_ID == result.encourCategory}">${ctgIndex.CATEGORY_NM}</c:if>
										</c:forEach>
									 	</td>
									 	<td class="alL ellipsis"><a href="javascript:viewEncourBoard('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a>
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
											<td class="tdnone" colspan="5">검색된 내용이 없습니다.</td>
										</tr>
									</c:if>	
								</tbody>
							</table>
							<!-- paging s -->
							<div class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_encourBoard" />
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
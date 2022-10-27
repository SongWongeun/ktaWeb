<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	//New이미지를 보여주기 위해 현재날짜 가져오기
 	GregorianCalendar calender = new GregorianCalendar();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
 	Date nowDate = calender.getTime();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">

	/* 글 보기 화면 function */
	function viewDeductBoard(no) {
		document.boardForm.articleNo.value = no;
	   	document.boardForm.action = "<c:url value='/m/infoLounge/deductNews/detail.do'/>";
	   	document.boardForm.submit();		
	}
	
	/* index function */
	function listDeductBoard() {
		document.location.href = "/m/infoLounge/deductNews/list.do";
	}
	
	/* 글 검색 function */
	function searchDeductBoard() {
		document.boardForm.pageIndex.value = "1";
		document.boardForm.action = "<c:url value='/m/infoLounge/deductNews/list.do'/>";
	   	document.boardForm.submit();
	}
	
	/* pagination 페이지 링크 function */
	function paging_deductBoard(pageNo){
		document.boardForm.pageIndex.value = pageNo;
		document.boardForm.action = "<c:url value='/m/infoLounge/deductNews/list.do'/>";
	   	document.boardForm.submit();
	}	
</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path04">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/infoLounge/index.do">정보마당</a></li>
			<li><a href="/m/infoLounge/deductNews/list.do">공제소식</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="searchVO" name="boardForm" method="post">
	<form:input type="hidden" path="searchCondition" value="0" />
	<input type="hidden" name="articleNo" />
	<legend>공제소식</legend>
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i04"><img alt="공제소식" src="/images/m_truck/subtop/04top_1.png" /></li>
				<li class="txt01">화물공제조합 소식입니다. 보다 알찬 정보로 보답 드리겠습니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="defaultList">
			<ul>
			<c:if test="${not empty resultList}">
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<c:set var="regDate">
				${fn:replace(result.createTime, '.', '')}
				</c:set>	
				 <li>
				    <a href="#;" onclick="viewDeductBoard('<c:out value="${result.articleNo}"/>')">
				    <span class="title">
				     <%
						String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
						Date regDate = dateFormat.parse(chkDate); 
						long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
						long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
						%>
					<%if(diffDays<5){ %>								
						<img  src="/images/truck/main/icon_new_org.png" alt="새글"/>
					<%}%>
				    <c:out value="${fn:replace(result.title, keyword , highlight )}"/>
					</span>
				    <span class="txtDesc"><c:out value="${fn:substring(result.createTime, 0, 11)}"/><span class="divide">l</span>조회수 <c:out value="${result.rdcount}"/></span>
				    </a>
				 </li>
				</c:forEach>
			</c:if>
			<c:if test="${empty resultList}">
				<li class="noContents">
					<span class="title">검색된 내용이 없습니다.</span>
				</li>
			</c:if>	
			</ul>
		</article>
		<!-- 게시판검색 -->
		<div class="searchForm">
			<form:input type="text" id="searchKeyword" path="searchKeyword" placeholder="검색 키워드를 입력해주세요." />
			<a class="btn" href="#;" onclick="searchDeductBoard()"><i class="icon-search"></i></a>
		</div>
		<!-- pagenavi -->
		<article class="textCenter">
			<ul class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="mobileImage" jsFunction="paging_deductBoard" />
				<form:hidden path="pageIndex" />
			</ul>
		</article>
	</form:form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>	
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
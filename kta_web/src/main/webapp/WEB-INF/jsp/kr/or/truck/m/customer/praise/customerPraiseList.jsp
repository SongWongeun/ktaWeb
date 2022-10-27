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
function viewPraiseBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/m/customer/praise/detail.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addPraiseBoard() {
   	document.boardForm.action = "<c:url value='/m/customer/praise/regist.do'/>";
   	document.boardForm.submit();		
}
/* index function */
function listPraiseBoard() {
	document.location.href = "/m/customer/praise/list.do";
}
/* 글 검색 function */
function searchPraiseBoard() {
	document.boardForm.pageIndex.value = "1";
	document.boardForm.action = "<c:url value='/m/customer/praise/list.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function pagingPraiseBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/m/customer/praise/list.do'/>";
   	document.boardForm.submit();
}
</script>
<c:if test="${param.code == 'regist.success' }">
	<script type="text/javascript">
		$(document).ready(function(){
			alert('글등록이 완료되었습니다.');
		});
	</script>
</c:if>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path02">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/customer/index.do">고객광장</a></li>
			<li><a href="/m/customer/praise/list.do">칭찬합시다</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="searchVO" name="boardForm" method="post">
	<form:hidden path="searchCondition" value="0"/>
	<input type="hidden" name="articleNo" />
	<legend>칭찬합시다</legend>
		<article class="contentRegistTitle">
			<ul class="subTitBox">
				<li class="subtit_i02"><img alt="칭찬합시다" src="/images/m_truck/subtop/02top_2.png" /></li>
				<li class="txt01">소중한 칭찬글은 업무 담당자, 직원들에게 큰 힘이 됩니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<div class="btn_regist">
			<a href="/m/customer/praise/regist.do"><img src="/images/m_truck/com/btn_regist.png" alt="글쓰기" /></a>
		</div>
		<!--// 글쓰기버튼 -->
		<article class="defaultList">
			<ul>
			<c:if test="${not empty resultList}">
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<c:set var="regDate">
				${fn:replace(result.createTime, '.', '')}
				</c:set>
				 <li>
				    <a href="#;" onclick="viewPraiseBoard('<c:out value="${result.articleNo}"/>')">
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
						${fn:replace(result.title, keyword , highlight )}
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
			<form:input path="searchKeyword" placeholder="검색 키워드를 입력해주세요." />
			<a class="btn" href="#;" onclick="searchPraiseBoard(); return false;"><i class="icon-search"></i></a>
		</div>
		<!-- pagenavi -->
		<article class="textCenter">
			<ul class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="mobileImage" jsFunction="pagingPraiseBoard" />
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
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
function viewEchoBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/cyberPr/echoView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addEchoBoard() {
   	document.boardForm.action = "<c:url value='/cyberPr/echoAddView.do'/>";
   	document.boardForm.submit();		
}
/* index function */
function listEchoBoard() {
	document.location.href = "/cyberPr/echoIndex.do";
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
/* 지난년 월호 검색 */
function searchRecentEcho(){
	document.boardForm.action = "<c:url value='/cyberPr/echoIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_echoBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/cyberPr/echoIndex.do'/>";
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
						<h2><img src="/images/truck/cyber/truck_tit.gif" alt="트럭메아리" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/cyberPr/cyberPrIndex.do" >사이버홍보관</a>
						<span>트럭메아리</span>
					</div>
				</div><!-- conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cyber/truck_con_tit.gif" alt="디지털 공간에서 고객님들이 화물공제조합 소식을 보다 알차게 만날 수 있는 웹진 서비스 입니다." /></p>
					<div class="conSection">
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>트럭메아리</legend>
					<input type="hidden" name="articleNo" />
						<div class="truckEcho">
							<div class="thisMonth">
								<a href=<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=${recentBoard.atchFileId}&fileSn=0'/> target="new"><img src="/com/atch/getThumbPdfImage.do?atchFileId=${recentBoard.atchFileId}" width="345" height="480" style="margin-left: -20px; margin-top: -30px" border="0" alt="트럭메아리"/></a>
							</div>
							<div class="lastMonth">
								<p class="lastTitBox">
									<span class="lastTit">지난호 보기</span>
									<c:set var="recentDate">
									${fn:substring(recentBoard.publicDate, 0, 4)}
									</c:set>
									<span class="lastSelect" title="트럭메아리 지난호보기 검색옵션">	
										<form:select path="searchRecentDate" onchange="searchRecentEcho()">
										<% 	String year = (String)request.getAttribute("year");
											String recentDate = (String)pageContext.getAttribute("recentDate",PageContext.PAGE_SCOPE);
											for (int i=Integer.parseInt(recentDate) ; i>=2007 ; i--) { 
											%>
										<option value="<%= i %>" <%if(i==Integer.parseInt(year))out.print("selected"); %>><%= i %>년</option> 
										<% } %>
										</form:select>
									</span>
								</p>
								<ul class="lastPreview">
								<c:choose>
								<c:when test="${not empty resultList}">
								<c:forEach var="result" items="${resultList}" varStatus="status"> 			
								<c:set var="regDate">
								${fn:replace(result.createTime, '.', '')}
								</c:set>	
									<li>
										<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=${result.atchFileId}&fileSn=0'/>"target="new">
										<img src="/com/atch/getThumbPdfImage.do?atchFileId=${result.atchFileId}" width="60" height="80" border="0" alt="${result.title}"/>
										<span style=><c:out value="${result.title}"></c:out>
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
								</c:when>
								<c:otherwise>
									<li>
									<span>당해년도에는 아직 등록된 트럭메아리가 없습니다&#46;</span>
									</li>
								</c:otherwise>
								</c:choose>
								</ul>
							</div>
						</div>
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
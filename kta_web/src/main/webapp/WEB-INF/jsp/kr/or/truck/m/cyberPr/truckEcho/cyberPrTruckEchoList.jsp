<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">
/* index function */
function listEchoBoard() {
	document.location.href = "/m/cyberPr/truckEcho/list.do";
}
/* index function */
function goIndex() {
	document.location.href = "/m/main/index.do";
}
/* 지난년 월호 검색 */
function searchRecentEcho(){
	document.boardForm.action = "<c:url value='/m/cyberPr/truckEcho/list.do'/>";
   	document.boardForm.submit();
}
</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path09">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/cyberPr/index.do">사이버홍보관</a></li>
			<li><a href="/m/cyberPr/truckEcho/list.do">트럭메아리</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="searchVO" name="boardForm" method="post">
	<input type="hidden" name="articleNo" />
		<article class="contentRegistTitle">
			<ul class="subTitBox">
				<li class="subtit_i09"><img alt="트럭메아리" src="/images/m_truck/subtop/09top_4.png" /></li>
				<li class="txt01">디지털 공간에서 고객님들이 화물공제조합 소식을 보다 알차게 만날 수 있는 웹진 서비스 입니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<p class="prPoint"><span class="bulSt02">3G/4G로 이용 시 데이터 요금이 부과되실 수 있습니다.</span></p>
		<!-- 트럭메아리 연도 선택 -->
		<div class="selectYear">
			<form:select path="searchRecentDate" onchange="searchRecentEcho()" class="select">
				<% 	String year = (String)request.getAttribute("year");
					String toDate = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()); 
					for (int i=Integer.parseInt(year) ; i>=2007 ; i--) { 
					%>
				<option value="<%= i %>" <%if(i==Integer.parseInt(year))out.print("selected"); %>><%= i %>년</option> 
				<% } %>
			</form:select>
		</div>
		<ul class="truckEco">
			<c:choose>
			<c:when test="${resultList != null}">
			<c:forEach var="result" items="${resultList}" varStatus="status"> 
				<li>
					<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=${result.atchFileId}&fileSn=0'/>"target="new">
					<img alt="트럭메아리" src="/com/atch/getThumbPdfImage.do?atchFileId=${result.atchFileId}" border="0"/>
					<span class="txt01"><c:out value="${result.title}"></c:out></span>
					</a>
				</li>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<li>
				<span>등록된 트럭메아리가 없습니다&#46;</span>
				</li>
			</c:otherwise>
			</c:choose>
		</ul>
	</form:form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
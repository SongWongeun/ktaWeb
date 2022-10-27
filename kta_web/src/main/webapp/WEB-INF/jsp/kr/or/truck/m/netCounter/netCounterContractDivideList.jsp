<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" >
/* 토글 */
$(document).ready(function(){
	$(".list div").hide();
	$(".list h3").click(function() {
		$(this).next("div").slideToggle("fast")
			.siblings("div:visible").slideUp("fast");
		$(this).toggleClass("active")
			.siblings("h3").removeClass("active");
		});
	
	$('#fSubmit').on('click',function(){
		goPage('1');
	});
});
function goPage(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.submit();
}
</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path08">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/netCounter/index.do">인터넷창구</a></li>
			<li><a href="/m/netCounter/contract/carStatus/list.do">계약조회</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i08"><img alt="계약조회" src="/images/m_truck/subtop/08top_3.png" /></li>
				<li class="txt01">계약된 차량정보를 클릭하시면, 상세한 계약 정보 확인이 가능합니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="tabWrap">
			<!-- tab -->
			<div class="tabBox04">
				<ul >
					<li><a href="/m/netCounter/contract/carStatus/list.do">차량현황조회</a></li>
					<li><a href="/m/netCounter/contract/contractInfo/carStatus/list.do">계약정보조회</a></li>
					<li class="on"><a href="/m/netCounter/contract/divide/list.do">분담금수납대상</a></li>
				</ul>
			</div>
			<!-- tab contents -->
			<div class="basicCont02">
				<!-- 정보 -->
				<div class="carInfo pt0">
					<p class="carInfoBox">
						<span class="txt01">
							<c:choose>
								<c:when test="${loginVO.agentCd == '1'}">${loginVO.agentNm}</c:when>
								<c:when test="${loginVO.agentCd == '2'}">${loginVO.carmgrNm}</c:when>
								<c:when test="${loginVO.agentCd == '3'}">${loginVO.companyNm}</c:when>
							</c:choose> 
						</span> 님 <fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월dd일" /> <br/>
						현재 <span class="txt01">${paginationInfo.totalRecordCount }건</span>의 수납대상 건이 있습니다.
					</p>
				</div>
				<!-- 차량번호검색 -->
				<div class="searchBox space">
					<form:form commandName="searchVO" name="boardForm" method="post" action="/m/netCounter/contract/divide/list.do" >
						<input name="pageIndex" id="pageIndex" type="hidden" value="${searchVO.pageIndex }" />
						<%-- <form:hidden path="searchStartDetailDate" title="시작날짜" />
						<form:hidden path="searchEndDetailDate"  title="종료날짜" /> --%>
						<h2 class="bulSt10">조회 차량번호를 입력하세요.</h2>
						<div class="searchForm pa0 mb0">
							<form:input path="searchKeyword" placeholder="차량번호를 입력해주세요."/>
							<a id="fSubmit" class="btn abr0" href="#;"><i class="icon-search"></i></a>
						</div>
					</form:form>
				</div>
				<c:if test="${not empty resultList }">
					<!-- 두번째탭 -->
					<div class="subTab">
						<!-- <ul class="space02">
							<li class="on"><a href="/m/netCounter/contract/divide/total/detail.do">통합계약</a></li>
							<li class=""><a href="/m/netCounter/contract/divide/disaster/detail.do">재해계약</a></li>
							<li class=""><a href="/m/netCounter/contract/divide/carry/detail.do">적재물계약</a></li>
						</ul> -->
						<p class="rightTxt">기준일자 : <fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월dd일" /></p>
					</div>
					<div class="list">
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<%-- 날짜 --%>
							<c:if test="${not empty result.YUHYO_SYMD_1}">
								<fmt:parseDate value="${result.YUHYO_SYMD_1}" var="dateFmt1" pattern="yyyymmdd"/>
							</c:if>
							<c:if test="${not empty result.YUHYO_SYMD_2}">
								<fmt:parseDate value="${result.YUHYO_SYMD_2}" var="dateFmt2" pattern="yyyymmdd"/>
							</c:if>
							<c:if test="${not empty result.YUHYO_SYMD_5}">
								<fmt:parseDate value="${result.YUHYO_SYMD_5}" var="dateFmt5" pattern="yyyymmdd"/>
							</c:if>
							<c:if test="${not empty result.YUHYO_SYMD_6}">
								<fmt:parseDate value="${result.YUHYO_SYMD_6}" var="dateFmt6" pattern="yyyymmdd"/>
							</c:if>
							
							<h3 class="listTit"><span>${result.CAR_NO}</span></h3>
							<div class="listDiv">
								<table class="tbList">
									<colgroup>
										<col width="25%">
										<col width="30%">
										<col width="15%">
										<col width="30%">
									</colgroup>
									<tr>
										<th class="textCenter">담보</th>
										<th class="textCenter">분담금</th>
										<th class="textCenter">회차</th>
										<th class="borrNone textCenter">유효초일</th>
									</tr>
									<!-- 대인I -->
									<tr>
										<td class="textCenter">대인I</td>
										<td class="textCenter"><fmt:formatNumber value="${result.BUNNAP_AMT_1 }" type="number" />원</td>
										<td class="textCenter"><c:out value="${result.BUNNAP_CNT_1}"/></td>
										<td class="borrNone textCenter"><fmt:formatDate value="${dateFmt1}" pattern="yyyy.mm.dd"/></td>
									</tr>
									<!-- 일반공제 -->
									<tr>
										<td class="textCenter">일반공제</td>
										<td class="textCenter"><fmt:formatNumber value="${result.BUNNAP_AMT_2 }" type="number" />원</td>
										<td class="textCenter"><c:out value="${result.BUNNAP_CNT_2}"/></td>
										<td class="textCenter borrNone"><fmt:formatDate value="${dateFmt2}" pattern="yyyy.mm.dd"/></td>
									</tr>
									<!-- 재해 -->
									<tr>
										<td class="textCenter">재해</td>
										<td class="textCenter"><fmt:formatNumber value="${result.BUNNAP_AMT_5 }" type="number" />원</td>
										<td class="textCenter"><c:out value="${result.BUNNAP_CNT_5}"/></td>
										<td class="textCenter borrNone"><fmt:formatDate value="${dateFmt5}" pattern="yyyy.mm.dd"/></td>
									</tr>
									<!-- 적재물 -->
									<tr>
										<td class="textCenter">적재물</td>
										<td class="textCenter"><fmt:formatNumber value="${result.BUNNAP_AMT_6 }" type="number" />원</td>
										<td class="textCenter"><c:out value="${result.BUNNAP_CNT_6}"/></td>
										<td class="textCenter borrNone"><fmt:formatDate value="${dateFmt6}" pattern="yyyy.mm.dd"/></td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</div>
				</c:if><!--// list -->
			</div>
		</article><!--// tabWrap -->
		<!-- pagenavi -->
		<article class="textCenter">
			<ul class="pagination">
				<ui:pagination paginationInfo = "${paginationInfo}" type="mobileImage" jsFunction="goPage" />
			</ul>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>








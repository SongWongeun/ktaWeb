<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javascript">
/* 글 보기 화면 function */
function viewArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/m/netCounter/myQna/detail.do'/>";
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
			<li><a href="">마이페이지</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i08"><img alt="마이페이지" src="/images/m_truck/subtop/08top_1.png" /></li>
				<li class="txt01"><span class="color01">${loginVO.companyNm } 님</span>의<br/>현재 가입중인 정보 입니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont05">
			<!-- 분납금납입현황 -->
			<h2 class="netTit01 mico02"><a href="/m/netCounter/pay/list.do">지급처별 공제금 지급내역</a></h2>
			<div class="netBox">
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>현재 날짜 기준으로 수납대상 공제계약</h3>
					<div class="inBox">
						<p class="rightTxt"><fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> 기준</p>
						<div class="round">
							<table class="tbSt04" summary="현재 날짜 기준으로 수납대상 공제계약">
								<caption>현재 날짜 기준으로 수납대상 공제계약</caption>
								<colgroup>
									<col style="width:40%;">
									<col style="width:60%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="th03 borbNone">지급내역</th>
										<td class="borbNone borrNone"><span class="color01">${accountTotCnt }</span> 건</td>
									</tr>
								</tbody>
							</table>
						</div><!--// 테이블라운드박스 -->
					</div>
				</div><!--// 라운드 박스 컨텐츠 -->
			</div>
			<!-- 담당지부및직원 -->
			<!-- <h2 class="netTit03 mico04">담당지부 및 직원</h2>
			<div class="netBox">
				<div class="information">
					<div class="infoL">
						<img src="/images/m_truck/com/my_thum.png" alt="담당자사진" />
						<p class="txtDesc01">담당자</p>
						<p class="txtDesc02">홍길동</p>
					</div>
					<div class="infoR">
						<p class="txt01">안녕하십니까?<br/>서울지부 홍길동 입니다.<br />공제가입 및 계약과 관련한 내용을 보다 빠르고 편안하게 도와 드리겠습니다.</p>
						<ul>
							<li>02-123-4567</li>
							<li>02-123-4568</li>
							<li>truck@truck.or.kr</li>
						</ul>
					</div>
				</div>
			</div> -->
			<!-- 나의문의내역 -->
			<h2 class="netTit02 mico05"><a href="">나의 문의 내역</a></h2>
			<form:form commandName="searchVO" name="boardForm" method="post">
				<input type="hidden" name="articleNo" />
				<div class="netBox">
					<c:choose>
						<c:when test="${not empty oaoList  }">									
							<p class="leftTxt">최근 6개월간 문의 내역 입니다.</p>
							<ul class="myList">
								<c:forEach var="result" items="${oaoList}" varStatus="status">
										<li>
											<a href="#;" onclick="viewArticle('<c:out value="${result.articleNo}"/>'); return false;">
												<div class="subject">
													<p class="title"><c:out value="${result.title}"/></p>
													<p class="data"><c:out value="${fn:substring(result.createTime, 0, 11)}"/></p>
												</div>
												<c:if test="${result.replyAt eq 'Y'}">
													<div class="ansYes"><span class="ansSub">답변</span></div>
			 									</c:if>
			 									<c:if test="${result.replyAt eq 'N'}">
													<div class="ansNo"><span class="ansSub">미답변</span></div>
			 									</c:if>
												
											</a>
										</li>
							</c:forEach>
							</ul>
						</c:when>
						<c:otherwise>
							<p class="leftTxt">최근 6개월간 문의 내역이 없습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</form:form>
			<!-- 회원정보변경 -->
			<h2 class="netTit02 mico06"><a href="/m/netCounter/userInfo/view.do">회원정보변경</a></h2>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>












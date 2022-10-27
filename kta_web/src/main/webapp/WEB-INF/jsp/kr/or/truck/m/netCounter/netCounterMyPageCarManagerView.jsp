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
				<li class="txt01"><span class="color01">${loginVO.carmgrNm } 님</span>의<br/>현재 가입중인 정보 입니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont05">
			<!-- 계약조회 -->
			<h2 class="netTit01 mico01"><a href="/m/netCounter/contract/carStatus/list.do">계약조회</a></h2>
			<div class="netBox">
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>현재 유지 중인 공제 계약</h3>
					<div class="inBox">
						<p class="rightTxt"><fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> 기준</p>
						<div class="round">
							<table class="tbSt04" summary="현재 유지 중인 공제 계약">
								<caption>현재 유지 중인 공제 계약</caption>
								<colgroup>
									<col style="width:30%;">
									<col style="width:20%;">
									<col style="width:30%;">
									<col style="width:20%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="th01">가입차량</th>
										<td><span class="color01">${carTotCnt }</span> 대</td>
										<th scope="row">자동차공제</th>
										<td class="borrNone"><span class="color01">${carTotCnt }</span> 건</td>
									</tr>
									<tr>
										<th scope="row" class="th02 borbNone">재해공제</th>
										<td class="borbNone">${accTotCnt } 건</td>
										<th scope="row" class="borbNone">적재물공제</th>
										<td class="borbNone borrNone">${carrryTotCnt } 건</td>
									</tr> 
								</tbody>
							</table>
						</div><!--// 테이블라운드박스 -->
					</div>
				</div><!--// 라운드 박스 컨텐츠 -->
			</div>
			<!-- 분납금납입현황 -->
			<h2 class="netTit01 mico02"><a href="/m/netCounter/contract/divide/list.do">분납금 납입현황</a></h2>
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
										<th scope="row" class="th03 borbNone">당일수납대상</th>
										<td class="borbNone borrNone"><span class="color01">${divideTotCnt }</span> 건</td>
									</tr>
								</tbody>
							</table>
						</div><!--// 테이블라운드박스 -->
					</div>
				</div><!--// 라운드 박스 컨텐츠 -->
			</div>
			<!-- 보상정보 -->
			<h2 class="netTit01 mico03"><a href="/m/netCounter/compensation/accident/list.do">보상정보</a></h2>
			<div class="netBox">
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>최근 6개월간의 사고처리내역</h3>
					<div class="inBox">
						<p class="rightTxt"><fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> 기준</p>
						<div class="round">
							<table class="tbSt04" summary="최근 6개월간의 사고처리내역">
								<caption>최근 6개월간의 사고처리내역</caption>
								<colgroup>
									<col style="width:40%;">
									<col style="width:60%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="th03 borbNone">총 보상 건수</th>
										<td class="borbNone borrNone"><span class="color01">${carAccidentTotCnt }</span> 건</td>
									</tr>
								</tbody>
							</table>
						</div><!--// 테이블라운드박스 -->
					</div>
				</div><!--// 라운드 박스 컨텐츠 -->
			</div>
			<!-- 담당지부및직원 -->
			<h2 class="netTit03 mico04">담당지부 및 직원</h2>
			<div class="netBox">
				<div class="information">
					<div class="infoL">
						<img src="/netCounter/inquiryService/managerPicture.do?agent_no=${loginVO.agentNo }&saupjang_seq=${loginVO.saupjangSeq }" alt="담당자사진" />
						<p class="txtDesc01">담당자</p>
						<p class="txtDesc02">${manager.sawon_nm }</p>
					</div>
					<div class="infoR">
						<p class="txt01">안녕하십니까?<br/>${manager.jibu_nm } ${manager.sawon_nm } 입니다.<br />공제가입 및 계약과 관련한 내용을 보다 빠르고 편안하게 도와 드리겠습니다.</p>
						<ul>
							<li>${manager.tel_no }</li>
							<li>${manager.fax_no }</li>
							<li>truck@truck.or.kr</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 나의문의내역 -->
			<h2 class="netTit02 mico05"><a href="">나의 문의 내역</a></h2>
			<form:form commandName="searchVO" name="boardForm" method="post">
				<input type="hidden" name="articleNo" />
				<div class="netBox">
					<c:choose>
						<c:when test="${not empty oaoList }">									
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
			<!-- 전체계약조회 -->
			<h2 class="netTit02 mico07"><a href="/m/netCounter/contract/carStatus/list.do">전체계약조회</a></h2>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>












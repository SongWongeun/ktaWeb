<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path08">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/netCounter/index.do">인터넷창구</a></li>
			<li><a href="/m/netCounter/compensation/accident/list.do">보상정보조회</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="basicCont02 pb0">
			<!-- 사고내역 -->
			<div class="textTitle"><h2 class="txtTit03">사고내역</h2></div>
			<table class="tbSt05">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tbody>
					<c:forEach var="result" items="${resultList }" varStatus="varStatus" >
						<tr>
							<th scope="row">사고번호</th>
							<td>${fn:substring(result.acdnt_no,0,4) }-${fn:substring(result.acdnt_no,4,9) }</td>
						</tr>
						<tr>
							<th scope="row">차량번호</th>
							<td>${result.car_no }</td>
						</tr>
						<tr>
							<th scope="row">운전자</th>
							<td>${result.drvr_nm }</td>
						</tr>
						<tr>
							<th scope="row">사고일자</th>
							<td>${result.acdnt_date }</td>
						</tr>
						<tr>
							<th scope="row">사고장소</th>
							<td>${result.acdnt_place }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 사고보상내역 -->
			<div class="textTitle"><h2 class="txtTit03">사고보상내역</h2></div>
			<table class="tbSt06">
				<colgroup>
					<col width="12%">
					<col width="12%">
					<col width="11%">
					<col width="20%">
					<col width="23%">
					<col width="22%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">구분</th>
						<th scope="col">담보</th>
						<th scope="col">순번</th>
						<th scope="col">피해자/물</th>
						<th scope="col">병원/수리업체</th>
						<th scope="col" class="borrNone">보상금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="detail" items="${detailList }" varStatus="varStatus" >
						<tr>
							<td>
							<c:choose>
								<c:when test="${detail.gb == '1'}">
								사고접수
								</c:when>
								<c:when test="${detail.gb == '2'}">
								사고조사
								</c:when>
								<c:when test="${detail.gb == '3'}">
								진행중
								</c:when>
								<c:when test="${detail.gb == '4'}">
								종결
								</c:when>
								<c:when test="${detail.gb == '5'}">
								면책
								</c:when>
							</c:choose>
							</td>
							<td>${detail.dmbo_gb_nm }</td>
							<td>${detail.psn_num }</td>
							<td>${detail.dmgd_psn_nm }</td>
							<td>${detail.facto_hp_nm }</td>
							<td class="borrNone"><fmt:formatNumber value="${detail.jigub_amt }"  type="number" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 사고점수 -->
			<div class="accBox">
				<p class="acctit">사고점수</p>
				<table class="tbAcc">
					<colgroup>
						<col width="33%">
						<col width="34%">
						<col width="33%">
					</colgroup>
					<tr>
						<th>원인점수</th>
						<th>위장사고여부</th>
						<th>내용점수</th>
					</tr>
					<tr>
						<td>${point.acdnt_cause_points }</td>
						<td>${point.trick }</td>
						<td class="last">${point.acdnt_comment_points }</td>
					</tr>
				</table>
				<p class="txt">사고점수사항은 전일까지의 점수이며, 갱신계약시나 조회시점에 따라 할인,할증 및 특별할증 여부 등이 변동 될 수 있습니다.</p>
			</div>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
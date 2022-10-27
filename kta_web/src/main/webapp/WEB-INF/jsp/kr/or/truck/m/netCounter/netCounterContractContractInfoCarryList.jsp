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
});
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
					<li class="on"><a href="/m/netCounter/contract/contractInfo/carStatus/list.do">계약정보조회</a></li>
					<li><a href="/m/netCounter/contract/divide/list.do">분담금수납대상</a></li>
				</ul>
			</div>
			<!-- tab contents -->
			<div class="basicCont02">
				<!-- 적재물 공제 계약 -->
				<div class="textTitle02"><h2 class="txtTit03">적재물 공제 계약</h2></div>
				<!-- 차량정보 -->
				<div class="carInfo"><p class="carIcon"><span class="txt01">차량번호</span><span class="txt02">${resultList[0].car_no}</span></p></div>
				<!-- 두번째탭 -->
				<div class="subTab">
					<ul>
						<li class=""><a href="/m/netCounter/contract/contractInfo/total/detail.do?car_gaip_no=${resultList[0].car_gaip_no}">통합계약</a></li>
						<li class="">
							<c:choose>
								<c:when test="${not empty accTotCnt && accTotCnt > 0 }">
									<a href="/m/netCounter/contract/contractInfo/disaster/detail.do?car_gaip_no=${resultList[0].car_gaip_no}">재해계약</a>
								</c:when>
								<c:otherwise>
									<a style="color: #E7E7E7;cursor:default" href="#;">재해계약</a>
								</c:otherwise>
							</c:choose>
						</li>
						<li class="on">
							<c:choose>
								<c:when test="${not empty carryTotCnt && carryTotCnt > 0 }">
									<a href="/m/netCounter/contract/contractInfo/carry/detail.do?car_gaip_no=${resultList[0].car_gaip_no}">적재물계약</a>
								</c:when>
								<c:otherwise> 
									<a style="color: #E7E7E7;cursor:default" href="#;">적재물계약</a>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
				<div class="list">
					<!-- 자동차정보 -->
					<h3 class="listTit mt0"><span>자동차정보</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="23%">
								<col width="27%">
								<col width="23%">
								<col width="27%">
							</colgroup>
							<tr>
								<th>차량번호</th>
								<td colspan="3" class="borrNone">${resultList[0].car_gaip_no}</td>
							</tr>
							<tr>
								<th>차명</th>
								<td colspan="3" class="borrNone">${resultList[0].car_nm}</td>
							</tr>
							<tr>
								<th>차대번호</th>
								<td colspan="3" class="borrNone">${resultList[0].car_body_no}</td>
							</tr>
							<tr>
								<th class="borbNone">적재정량</th>
								<td class="borbNone">${resultList[0].proper_wg} kg</td>
								<th class="borbNone">총중량</th>
								<td class="borrNone borbNone">${resultList[0].tot_wg} kg</td>
							</tr>
						</table>
					</div>
					<!-- 공제계약기간 -->
					<h3 class="listTit "><span>공제계약기간</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="23%">
								<col width="77%">
							</colgroup>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr>
									<th>계약기간</th>
									<td class="borrNone">${result.gaip_ymd}</td>
								</tr>
								<tr>
									<th class="borbNone">계약일수</th>
									<td class="borrNone borbNone">${result.napip_gb}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- 청약조건 -->
					<h3 class="listTit "><span>청약조건</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="23%">
								<col width="27%">
								<col width="23%">
								<col width="27%">
							</colgroup>
							<tr>
								<th>계약구분</th>
								<td>${resultList[0].gyeyak_gubun_nm}</td>
								<th>차종</th>
								<td class="borrNone">${resultList[0].car_kind_nm}</td>
							</tr>
							<tr>
								<th>보상한도</th>
								<td>1사고당 ${resultList[0].jukjaemul_bosang_hando}</td>
								<th>자기부담금</th>
								<td class="borrNone">${resultList[0].myunchaek_amt}</td>
							</tr>
							<tr>
								<th>위험요소할증</th>
								<td colspan="3" class="borrNone">${resultList[0].tukbyul_rate1_nm} ${resultList[0].tukbyul_add_rate} %</td>
							</tr>
							<tr>
								<th>특약사항</th>
								<td colspan="3" class="borrNone">
									<c:set var="ty" value="초과적재허가범위확장특약"/>
									<c:if test="${resultList[0].tukyak_bunnap=='O'}">
										<c:if test="${ty!='' }"><c:set var="ty" value="${ty}<br/>"/></c:if>
										<c:set var="ty" value="${ty}분담금분납특약 "/>
									</c:if>
									<c:if test="${resultList[0].tukyak_a=='O'}">
										<c:if test="${ty!='' }"><c:set var="ty" value="${ty}<br/>"/></c:if>
										<c:set var="ty" value="${ty}구간운송위험 특약"/>
									</c:if>
									<c:if test="${resultList[0].tukyak_b=='O'}">
										<c:if test="${ty!='' }"><c:set var="ty" value="${ty}<br/>"/></c:if>
										<c:set var="ty" value="${ty}수탁화물확장담보 특약(Ⅰ)"/>
									</c:if>
									<c:if test="${resultList[0].tukyak_c=='O'}">
										<c:if test="${ty!='' }"><c:set var="ty" value="${ty}<br/>"/></c:if>
										<c:set var="ty" value="${ty}화물운송부수업무담보 특약"/>
									</c:if>
									<c:if test="${resultList[0].tukyak_d=='O'}">
										<c:if test="${ty!='' }"><c:set var="ty" value="${ty}<br/>"/></c:if>
										<c:set var="ty" value="${ty}대위권포기 특약"/>
									</c:if>
									<c:if test="${resultList[0].tukyak_e=='O'}">
										<c:if test="${ty!='' }"><c:set var="ty" value="${ty}<br/>"/></c:if>
										<c:set var="ty" value="${ty}냉동/냉장장치담보추가 특약"/>
									</c:if>
									<c:if test="${resultList[0].tukyak_g=='O'}">
										<c:if test="${ty!='' }"><c:set var="ty" value="${ty}<br/>"/></c:if>
										<c:set var="ty" value="${ty}안심운송 특약"/>
									</c:if>
									${ty }
								</td>
							</tr>
						</table>
					</div>
				</div><!--// list -->
			</div>
		</article><!--// tabWrap -->
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>








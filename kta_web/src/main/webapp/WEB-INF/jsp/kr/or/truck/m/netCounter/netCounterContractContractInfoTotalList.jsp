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
						<li class="on"><a href="/m/netCounter/contract/contractInfo/total/detail.do?car_gaip_no=${resultList[0].car_gaip_no}">통합계약</a></li>
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
						<li class="">
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
								<td>${resultList[0].car_no}</td>
								<th>자차공제가액</th>
								<td class="textRight borrNone"><fmt:formatNumber value="${resultList[0].car_amt}" type="number" /> 원</td>
							</tr>
							<tr>
								<th>차종</th>
								<td>${resultList[0].car_kind_nm}</td>
								<th>부속가액</th>
								<td class="textRight borrNone"><fmt:formatNumber value="${resultList[0].sub_unit_tot}" type="number" /> 원</td>
							</tr>
							<tr>
								<th>차명</th>
								<td>${resultList[0].car_nm}</td>
								<th>기계가액</th>
								<td class="textRight borrNone"><fmt:formatNumber value="${resultList[0].machine_unit_amt}" type="number" /> 원</td>
							</tr>
							<tr>
								<th>차대번호</th>
								<td>${resultList[0].car_body_no}</td>
								<th>탑탱크가액</th>
								<td class="textRight borrNone"><fmt:formatNumber value="${resultList[0].top_tank_amt}" type="number" /> 원</td>
							</tr>
							<tr>
								<th>년식</th>
								<td>${resultList[0].car_yy}년</td>
								<th>자차공제총가액</th>
								<td class="textRight borrNone"><fmt:formatNumber value="${resultList[0].total_car_amt}" type="number" /> 원</td>
							</tr>
							<tr>
								<th>적재정량</th>
								<td>${resultList[0].proper_wg} kg</td>
								<th rowspan="2" class="borbNone" >특요항목</th>
								<td rowspan="2" class="textRight borrNone">${resultList[0].tukbyul_rate1_nm}  ${resultList[0].tukbyul_rate2_nm}</td>
							</tr>
							<tr>
								<th class="borbNone">총중량</th>
								<td class="borbNone">${resultList[0].tot_wg} kg</td>
							</tr>
						</table>
					</div>
					<!-- 계약기간(계약상태) -->
					<h3 class="listTit"><span>계약기간(계약상태)</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="26%">
								<col width="24%">
								<col width="28%">
								<col width="22%">
							</colgroup>
							<tr>
								<th class="textCenter">담보</th>
								<th class="textCenter">계약상태</th>
								<th class="textCenter">계약기간</th>
								<th class="borrNone textCenter">납입구분</th>
							</tr>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr>		  			    
									<td >${result.dambo_kind_nm}</td>
									<td >${result.gyeyak_state_nm}</td>
									<td >${result.dambo_gaip_ymd}</td>
									<td >${result.napip_gb}</td>
								</tr>
							</c:forEach>
							<!-- <tr>
								<td class="borbNone">특약</td>
								<td class="borbNone">해지</td>
								<td class="borbNone">-</td>
								<td class="borbNone borrNone">0개월 / 0일</td>
							</tr> -->
						</table>
					</div>
					<!-- 특별약관 -->
					<h3 class="listTit"><span>특별약관</span></h3>
					<div class="listDiv">
						<p class="txt01">
							<!-- <span>- 법률비용지원 특별약관</span> -->
							<c:set var="tukyak" value=""/>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<c:if test="${result.napip_gb_cd > 1}">
									<c:set var="tukyak" value="&#45;&nbsp;법률비용지원 특별약관"/>
								</c:if>
								<c:if test="${result.dambo_kind_cd == '7'}">
									<c:if test="${tukyak!=''}">
										<c:set var="tukyak" value="${tukyak }<br/>"/>
									</c:if>
									<c:set var="tukyak" value="${tukyak }&#45;&nbsp;분담금 분할납입 특별약관"/>
								</c:if>
							</c:forEach>
							${tukyak}
						</p>
					</div>
					<!-- 계약사항 -->
					<h3 class="listTit"><span>계약사항</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="30%">
								<col width="45%">
								<col width="25%">
							</colgroup>
							<tr>
								<th class="textCenter">항목</th>
								<th class="textCenter">내용</th>
								<th class="borrNone textCenter">금액</th>
							</tr>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr>		  			    
									<td >${result.dambo_kind_nm}</td>
									<td >${result.dambo_hando}</td>
									<td class="textRight borrNone"><fmt:formatNumber value="${result.bundam_amt }" type="number" /> 원</td>
								</tr>
							</c:forEach>
							<!-- <tr>
								<td colspan="2" class="textCenter bg">합계</td>
								<td class="textRight borrNone ">260,000  원</td>
							</tr> -->
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








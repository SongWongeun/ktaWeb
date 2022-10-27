<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javascript">
function goPage(pageNo){
	
	location.href="/m/netCounter/contract/contractInfo/carStatus/list.do?pageIndex="+pageNo;
}
$(document).ready(function(){
	$('tr.gyeyakList').on('click',function(){
		var car_gaip_no = $(this).attr('car_gaip_no');
		
		
		<%-- toggle --%>
		if( $(this).hasClass('on') ){
			<%-- 초기화 --%>
			$('tr.gyeyakList').removeClass('on');
			$('tr.gyeyakDetail').hide();
			return false;
		}
		
		<%-- 초기화 --%>
		$('tr.gyeyakList').removeClass('on');
		$('tr.gyeyakDetail').hide();
		
		<%-- 상세화면 표시  --%>
		$(this).addClass('on');
		$('tr.gyeyakDetail[car_gaip_no="'+car_gaip_no+'"]').show();
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
				<!-- 가입중인 차량현황 -->
				<div class="textTitle02"><h2 class="txtTit03">가입중인 차량현황</h2><p class="rightTxt"><fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월 dd일" /> 기준</p></div>
				<table class="tbSt06">
					<colgroup>
						<col width="50%">
						<!-- <col width="40%"> -->
						<col width="50%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">차량번호</th>
							<!-- <th scope="col">차대번호</th> -->
							<th scope="col" class="borrNone">차명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="car" items="${carStatusList }" varStatus="varStatus">
							<!-- <tr class="on"> -->
							<tr class="gyeyakList" car_gaip_no="${car.CAR_GAIP_NO }">
								<td class="list">${car.CAR_NO }</td>
								<%-- <td class="list">${car.CAR_BODY_NO }</td> --%>
								<td class="list borrNone">${car.CAR_NM }</td>
							</tr>
							<tr class="gyeyakDetail" car_gaip_no="${car.CAR_GAIP_NO }" style="display:none;"><!-- 여긴펼침 display:none -->
								<td colspan="3" class="pa0 boraNone" ">
									<div class="tbDiv04">
										<table>
											<colgroup>
												<col width="20%">
												<col width="20%">
												<col width="60%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" colspan="2" >계약상태</th>
													<th scope="col" class="borrNone">계약기간</th>
												</tr>
											</thead>
											<tbody>
												<%-- 통합계약 --%>
												<c:forEach var="carDeductMap" items="${car.carDeductMapList }"  varStatus="varStatus1">
													<tr>
														<td><a href="/m/netCounter/contract/contractInfo/total/detail.do?car_gaip_no=${carDeductMap.CAR_GAIP_NO }" class="color01">통합</a></td>
														<td><a href="/m/netCounter/contract/contractInfo/total/detail.do?car_gaip_no=${carDeductMap.CAR_GAIP_NO }" >${carDeductMap.GYEYAK_STATE_NM }</a></td>
														<td class="borrNone"><a href="/m/netCounter/contract/contractInfo/total/detail.do?car_gaip_no=${carDeductMap.CAR_GAIP_NO }" >${carDeductMap.DAMBO_GAIP_YMD }</a></td>
													</tr>
												</c:forEach>
												<%-- 재해 계약 --%>
												<c:forEach var="accDeductMap" items="${car.accDeductMapList }"  varStatus="varStatus2">
													<tr>
														<td><a href="/m/netCounter/contract/contractInfo/disaster/detail.do?car_gaip_no=${accDeductMap.CAR_GAIP_NO }" class="color02">재해</a></td>
														<td><a href="/m/netCounter/contract/contractInfo/disaster/detail.do?car_gaip_no=${accDeductMap.CAR_GAIP_NO }" >${accDeductMap.GYEYAK_STATE_NM }</a></td>
														<td class="borrNone"><a href="/m/netCounter/contract/contractInfo/disaster/detail.do?car_gaip_no=${accDeductMap.CAR_GAIP_NO }" >${accDeductMap.GAIP_YMD }</a></td>
													</tr>												
												</c:forEach>
												<%-- 적재물 계약 --%>
												<c:forEach var="carryDeductMap" items="${car.carryDeductMapList }"  varStatus="varStatus3">
													<tr>
														<td><a href="/m/netCounter/contract/contractInfo/carry/detail.do?car_gaip_no=${carryDeductMap.CAR_GAIP_NO }" class="color03">적재물</a></td>
														<td><a href="/m/netCounter/contract/contractInfo/carry/detail.do?car_gaip_no=${carryDeductMap.CAR_GAIP_NO }" >${carryDeductMap.GYEYAK_STATE_NM }</a></td>
														<td class="borrNone"><a href="/m/netCounter/contract/contractInfo/carry/detail.do?car_gaip_no=${carryDeductMap.CAR_GAIP_NO }" >${carryDeductMap.GAIP_YMD }</a></td>
													</tr>												
												</c:forEach>
												
											</tbody>
										</table>
									</div>
								</td>
							</tr><!--// 여긴펼침 display:none -->
						</c:forEach>
						<!-- <tr class="">
							<td class="list">전북82사1427</td>
							<td class="list">XJKFDDJIFEFEF23F</td>
							<td class="list borrNone">현대 25톤</td>
						</tr> -->
					</tbody>
				</table>
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

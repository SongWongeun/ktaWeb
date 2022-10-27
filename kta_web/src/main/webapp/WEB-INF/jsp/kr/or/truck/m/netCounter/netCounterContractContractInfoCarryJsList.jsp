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
				<div class="carInfo"><p class="carIcon"><span class="txt01">조합원</span><span class="txt02">${resultList[0].agent_nm}</span></p></div>
				
				
				<div class="list">
					<!-- 조합원정보 -->
					<h3 class="listTit mt0"><span>조합원정보</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="23%">
								<col width="27%">
								<col width="23%">
								<col width="27%">
							</colgroup>
							<tr>
								<th>상호</th>
								<td colspan="3" class="borrNone">${resultList[0].agent_nm}</td>
							</tr>
							<tr>
								<th>대표자</th>
								<td colspan="3" class="borrNone">${resultList[0].daepyoja_nm}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td colspan="3" class="borrNone">${resultList[0].tel_local_no}-${fn:replace(resultList[0].tel_no,' ','-')}</td>
							</tr>
							<tr>
								<th>팩스번호</th>
								<td colspan="3" class="borrNone">${resultList[0].fax_local_no}-${fn:replace(resultList[0].fax_no,' ','-')}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3" class="borrNone">${resultList[0].addr1} ${resultList[0].addr2}</td>
							</tr>
						</table>
					</div>
					<!-- 공제계약기간 -->
					<h3 class="listTit "><span>공제계약기간</span></h3>
					<div class="listDiv">
						<table class="tbSt06">
							<colgroup>
								<col style="width:20%;" />
								<col style="width:60%;" />
								<col style="width:20%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">계약상태</th>
									<th scope="col">계약기간</th>
									<th scope="col">납입구분</th> 
								</tr>
							</thead>
							<tbody>
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<tr>		  			    
										<td >${result.gyeyak_state_nm}</td>
										<td >${result.gaip_ymd}</td>
										<td >${result.napip_gb}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- 계약사항 -->
					<h3 class="listTit "><span>계약사항</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="23%">
								<col width="27%">
								<col width="23%">
								<col width="27%">
							</colgroup>
							<tr>
								<th>매출액</th>
								<td>${resultList[0].jukjaemul_maechul_amt}</td>
								<th>보상한도</th>
								<td class="borrNone">
											<c:if test="${not empty resultList[0].jukjaemul_bosang_hando}">
												1사고당 ${resultList[0].jukjaemul_bosang_hando}
											</c:if>
											&nbsp;
								</td>
							</tr>
							<tr>
								<th>자기부담금</th>
								<td colspan="3" class="borrNone">${resultList[0].myunchaek_amt}</td>
							</tr>
							<tr>
								<th>특약사항</th>
								<td colspan="3" class="borrNone">
											<c:forEach items="${jsTukyakList }" var="tukyak" >
												${tukyak.tukyak_gubun_nm } , ${tukyak.tukyak_symd } , ${tukyak.tukyak_eymd }
											</c:forEach>
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








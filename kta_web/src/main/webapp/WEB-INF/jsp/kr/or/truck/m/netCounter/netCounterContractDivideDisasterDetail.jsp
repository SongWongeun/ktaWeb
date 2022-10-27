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
					<li><a href="/m/netCounter/contract/contractInfo/carStatus/list.do">계약정보조회</a></li>
					<li class="on"><a href="/m/netCounter/contract/divide/list.do">분담금수납대상</a></li>
				</ul>
			</div>
			<!-- tab contents -->
			<div class="basicCont02">
				<!-- 정보 -->
				<div class="carInfo pt0"><p class="carInfoBox"><span class="txt01">[경동택배]</span> 조합원님의 2013년 10월10일 현재 계약유지중인 차량은 <span class="txt01">총 28대</span>이며, <span class="txt01">30건</span>의 계약이 있습니다.</p></div>
				<!-- 차량번호검색 -->
				<div class="searchBox space">
					<h2 class="bulSt10">조회 차량번호를 입력하세요.</h2>
					<div class="searchForm pa0 mb0">
						<input type="text" id="searchKeyword" name="searchKeyword" placeholder="차량번호를 입력해주세요.">
						<a class="btn abr0" href="#;" onclick="searchDriverBoard();"><i class="icon-search"></i></a>
					</div>
				</div>
				<!-- 두번째탭 -->
				<div class="subTab">
					<ul class="space02">
						<li class=""><a href="/m/netCounter/contract/divide/total/detail.do">통합계약</a></li>
						<li class="on"><a href="/m/netCounter/contract/divide/disaster/detail.do">재해계약</a></li>
						<li class=""><a href="/m/netCounter/contract/divide/carry/detail.do">적재물계약</a></li>
					</ul>
					<p class="rightTxt">기준일자 : 2013.10.10</p>
				</div>
				<div class="list">
					<!-- 대인I (유지) -->
					<h3 class="listTit mt0"><span>대인I (유지)</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="15%">
								<col width="25%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<tr>
								<th class="textCenter">회차</th>
								<th class="textCenter">계약상태</th>
								<th class="textCenter">분담금</th>
								<th class="borrNone textCenter">영수일자</th>
							</tr>
							<tr>
								<td class="textCenter">6회</td>
								<td class="textCenter">유지</td>
								<td class="textCenter">147,790원</td>
								<td class="borrNone textCenter">2013.10.10</td>
							</tr>
							<tr>
								<td class="textCenter">5회</td>
								<td class="textCenter">유지</td>
								<td class="textCenter">147,790원</td>
								<td class="textCenter borrNone">2013.10.10</td>
							</tr>
							<tr>
								<td class="textCenter">4회</td>
								<td class="textCenter">유지</td>
								<td class="textCenter">147,790원</td>
								<td class="textCenter borrNone">2013.10.10</td>
							</tr>
							<tr>
								<td class="textCenter">3회</td>
								<td class="textCenter">유지</td>
								<td class="textCenter">147,790원</td>
								<td class="textCenter borrNone">2013.10.10</td>
							</tr>
							<tr>
								<td class="textCenter">2회</td>
								<td class="textCenter">유지</td>
								<td class="textCenter">147,790원</td>
								<td class="textCenter borrNone">2013.10.10</td>
							</tr>
							<tr>
								<td class="textCenter borbNone">1회</td>
								<td class="textCenter borbNone">유지</td>
								<td class="textCenter borbNone">147,790원</td>
								<td class="textCenter borbNone borrNone">2013.10.10</td>
							</tr>
						</table>
					</div>
					<!-- 대인II -->
					<h3 class="listTit"><span>대인II</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="15%">
								<col width="25%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<tr>
								<th class="textCenter">회차</th>
								<th class="textCenter">계약상태</th>
								<th class="textCenter">분담금</th>
								<th class="borrNone textCenter">영수일자</th>
							</tr>
							<tr>
								<td class="textCenter">2회</td>
								<td class="textCenter">유지</td>
								<td class="textCenter">147,790원</td>
								<td class="textCenter borrNone">2013.10.10</td>
							</tr>
							<tr>
								<td class="textCenter borbNone">1회</td>
								<td class="textCenter borbNone">유지</td>
								<td class="textCenter borbNone">147,790원</td>
								<td class="textCenter borbNone borrNone">2013.10.10</td>
							</tr>
						</table>
					</div>
					<!-- 대물 -->
					<h3 class="listTit"><span>대물</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="15%">
								<col width="25%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<tr>
								<th class="textCenter">회차</th>
								<th class="textCenter">계약상태</th>
								<th class="textCenter">분담금</th>
								<th class="borrNone textCenter">영수일자</th>
							</tr>
							<tr>
								<td class="textCenter">2회</td>
								<td class="textCenter">유지</td>
								<td class="textCenter">147,790원</td>
								<td class="textCenter borrNone">2013.10.10</td>
							</tr>
							<tr>
								<td class="textCenter borbNone">1회</td>
								<td class="textCenter borbNone">유지</td>
								<td class="textCenter borbNone">147,790원</td>
								<td class="textCenter borbNone borrNone">2013.10.10</td>
							</tr>
						</table>
					</div>
					<!-- 특약 -->
					<h3 class="listTit"><span>특약</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="15%">
								<col width="25%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<tr>
								<th class="textCenter">회차</th>
								<th class="textCenter">계약상태</th>
								<th class="textCenter">분담금</th>
								<th class="borrNone textCenter">영수일자</th>
							</tr>
							<tr>
								<td class="textCenter">2회</td>
								<td class="textCenter">유지</td>
								<td class="textCenter">147,790원</td>
								<td class="textCenter borrNone">2013.10.10</td>
							</tr>
							<tr>
								<td class="textCenter borbNone">1회</td>
								<td class="textCenter borbNone">유지</td>
								<td class="textCenter borbNone">147,790원</td>
								<td class="textCenter borbNone borrNone">2013.10.10</td>
							</tr>
						</table>
					</div>
					<!-- 자기차량공제 -->
					<h3 class="listTit"><span>자기차량공제</span></h3>
					<div class="listDiv">
						<table class="tbList">
							<colgroup>
								<col width="15%">
								<col width="25%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<tr>
								<th class="textCenter">회차</th>
								<th class="textCenter">계약상태</th>
								<th class="textCenter">분담금</th>
								<th class="borrNone textCenter">영수일자</th>
							</tr>
							<tr>
								<td class="textCenter">2회</td>
								<td class="textCenter">유지</td>
								<td class="textCenter">147,790원</td>
								<td class="textCenter borrNone">2013.10.10</td>
							</tr>
							<tr>
								<td class="textCenter ">1회</td>
								<td class="textCenter ">유지</td>
								<td class="textCenter ">147,790원</td>
								<td class="textCenter  borrNone">2013.10.10</td>
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








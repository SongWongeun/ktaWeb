<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javascript">
function search(){
	<%-- 기간 최근 3년 까지만 --%>
	if( $('form#f input#start_acdnt_ymd').val().trim() == '' || 
			$('form#f input#end_acdnt_ymd').val().trim() == '' ){
		
		alert('검색기간을 입력해주세요.');
		return false;
	}
	$('div#loading_page').show();
	document.f.submit();
}
function goPage(pageNo){
	document.f.searchKeyword.value = document.f.searched_searchKeyword.value;
	document.f.pageIndex.value = pageNo;
	document.f.submit();
}
$(document).ready(function(){
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
	
	
	<%-- 검색박스 엔터키 설정--%>
	$('form#f input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			search();
			return false;
		}
	});
	var selected = "${searchVO.start_acdnt_ymd }";
	if(selected == ""){
	<%-- 조회기간년도세팅 --%>
	$('form#f select[name="year"]')
		.append('<option value="'+sYear+'" selected>'+sYear+'</option>')
		.append('<option value="'+(sYear-1)+'">'+(sYear-1)+'</option>')
		.append('<option value="'+(sYear-2)+'">'+(sYear-2)+'</option>')
		;
	<%-- 조회기간월 셋팅--%>
	for(var z=1;z<=12;z++){
		if(z == sMonth+1){
		$('form#f select[name="month"]')
			.append('<option value="'+z+'">'+z+'</option>');
		}else{
		$('form#f select[name="month"]')
			.append('<option value="'+z+'" selected>'+z+'</option>');
		}
	}
	
	$("#start_acdnt_ymd").val( sYear+''+sMonth+'01' );
	$("#end_acdnt_ymd").val( sYear+''+sMonth+''+new Date( sYear, sMonth, '').getDate()	);
	
	}else{		
		$('form#f select[name="year"]')
		.append('<option value="'+sYear+'">'+sYear+'</option>')
		.append('<option value="'+(sYear-1)+'">'+(sYear-1)+'</option>')
		.append('<option value="'+(sYear-2)+'">'+(sYear-2)+'</option>')
		;
	<%-- 조회기간월 셋팅--%>
	for(var z=1;z<=12;z++){
		$('form#f select[name="month"]')
			.append('<option value="'+z+'">'+z+'</option>');
		}
		
	}
	
	<%-- 월별 조회 선택시 event --%>
	$('form#f select[name="year"], form#f select[name="month"]').on('change',function(event){
		var y = $('form#f select[name="year"] option:selected').val();
		var m = $('form#f select[name="month"] option:selected').val();
		if( y != '0000' && m != '00' ){
			if(m.length == 2){
				$("#start_acdnt_ymd").val( y+'-'+m+'-'+'01' );
				$("#end_acdnt_ymd").val( y+'-'+m+'-'+new Date( y, m, '').getDate()	);
			}else{
				$("#start_acdnt_ymd").val( y+'-'+'0'+m+'-'+'01' );
				$("#end_acdnt_ymd").val( y+'-'+'0'+m+'-'+new Date( y, m, '').getDate()	);
			}
		}
	});
	<%-- 조회 --%>
	$('a#f_submit').on('click',function(event){
		//event.preventDefault();
		search();
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
			<li><a href="/m/netCounter/compensation/accident/list.do">보상정보조회</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i08"><img alt="보상정보조회" src="/images/m_truck/subtop/08top_4.png" /></li>
				<li class="txt01">최근 3여 년간의 사고내역만 조회가 가능하며, 상세한 내용은 계약지부의 담당자에게 문의하시기 바랍니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont05">
			<!-- 내역검색 -->
			<div class="searchBox">
				<form id="f" name="f" action="/m/netCounter/compensation/accident/list.do" method="post">
						<input name="searchCondition" id="searchCondition" type="hidden" value="car_no" />
						<input name="pageIndex" id="pageIndex" type="hidden" value="${searchVO.pageIndex }" />
						<input name="searched_searchKeyword" id="searched_searchKeyword" type="hidden" value="${searchVO.searchKeyword }" />
						
						<table class="formType">
		           			<colgroup>
								<col width="25%">
								<col width="75%">
							</colgroup>
							<tr>
								<th><span class="bulSt07">월별</span></th>
								<td>
									<div class="cellFirst">
										<span class="cellw2">
											<select id="year" name="year" class="select" title="연도" style="width:100%;" >   
												<option selected="selected" value="0000">선택</option>
											</select>
										</span>
										<span class="cellDesh">년</span>
										<span class="cellw2">
											<select id="month" name="month" class="select" title="월" style="width:100%;" >  
												<option selected="selected" value="00">선택</option>
											</select>
										</span>
										<span class="cellDesh">월</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="bulSt07">기간별</span></th>
								<td>
									<input id="start_acdnt_ymd" name="start_acdnt_ymd" value="${searchVO.start_acdnt_ymd }" type="date" title="시작날짜" style="width:46%;" class="input" >~
									<input id="end_acdnt_ymd" name="end_acdnt_ymd" value="${searchVO.end_acdnt_ymd }" type="date" title="종료날짜" style="width:46%;" class="input" >
								</td>
							</tr>
							<tr>
								<th><span class="bulSt07">차량검색</span></th>
								<td>
									<input id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword }" type="text" title="차량검색" class="input" >
									<a id="f_submit" class="btn" href="#;"><i class="icon-search"></i></a>
								</td>
							</tr>
						</table>
				</form>
			</div>
			<c:choose>
				<c:when test="${ rCode == 'searched'}">
					<!-- 사고내역조회 -->
					<div class="textTitle"><h2 class="txtTit03">사고내역조회</h2></div>
					<div class="tip"><p class="bulSt09">사고번호 또는 차량번호를 클릭하시면 상세한 사고 처리 현황을 보실 수 있습니다.</p></div>
					<table class="tbSt06 mb20">
						<colgroup>
							<col width="26%">
							<col width="26%">
							<col width="22%">
							<col width="26%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">사고번호</th>
								<th scope="col">차량번호</th>
								<th scope="col">운전자</th>
								<th scope="col" class="borrNone">사고일자</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${ not empty resultList }">
									<c:forEach var="result" items="${resultList }" varStatus="varStatus" >
										<tr>
											<td>
												<a href="/m/netCounter/compensation/accident/detail.do?acdnt_no=${result.acdnt_no }" class="link txtC05">
													${fn:substring(result.acdnt_no,0,4) }-${fn:substring(result.acdnt_no,4,9) }
												</a>
											</td>
											<td>
												<a href="/m/netCounter/compensation/accident/detail.do?acdnt_no=${result.acdnt_no }" class="link txtC05">
													${result.car_no }
												</a>
											</td>
											<td>
												<a href="/m/netCounter/compensation/accident/detail.do?acdnt_no=${result.acdnt_no }" class="link txtC05">
													${result.drvr_nm }
												</a>
											</td>
											<td>
												<a href="/m/netCounter/compensation/accident/detail.do?acdnt_no=${result.acdnt_no }" class="link txtC05">
													${result.acdnt_date }
												</a>
											</td>
											<%-- <td style="padding-left: 9px;" class="alL">${result.acdnt_place }</td> --%>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">사고내역조회 내용이 없습니다</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					
					<!-- pagenavi -->
					<article class="textCenter">
						<ul class="pagination">
							<ui:pagination paginationInfo = "${paginationInfo}" type="mobileImage" jsFunction="goPage" />
						</ul>
					</article>
				</c:when>
			</c:choose>

			<%-- <div class="more"><a href="" class="btn"><span>5개 더보기</span></a></div>--%>
		</article>
		<c:choose>
			<c:when test="${ rCode == 'searched'}">
				
			</c:when>
		</c:choose>

	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>









<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
	
	if('${searchVO.searchRecentDate}' == 'six'){

		var b = new Date(sYear,sMonth-6,'');
		var searchYear = b.getFullYear();
		var searchMonth = b.getMonth()+1;
		if(searchMonth.toString().length == '2'){
			$("#start_datepicker").val( searchYear+'-'+''+searchMonth+'-'+'01' );
		}else{
			$("#start_datepicker").val( searchYear+'-'+'0'+searchMonth+'-'+'01' );
		}
		
		if(sMonth.toString().length == '2'){
		$("#end_datepicker").val( sYear+'-'+''+'-'+sMonth+'-'+''+new Date( sYear, sMonth, '').getDate()	);
		}else{
		$("#end_datepicker").val( sYear+'-'+'0'+sMonth+'-'+''+new Date( sYear, sMonth, '').getDate() );
		}
	}
	
	$("form#boardForm [name='searchRecentDate']").on('change',function(event){
		var cal = ($(this).val());

		if(sMonth.toString().length == '2'){
			$("#end_datepicker").val( sYear+'-'+''+sMonth+'-'+''+new Date( sYear, sMonth, '').getDate()	);
		}else{
			$("#end_datepicker").val( sYear+'-'+'0'+sMonth+'-'+''+new Date( sYear, sMonth, '').getDate() );
		}
		
		if(cal == 'one'){
			var b = new Date(sYear,sMonth-1,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+'-'+''+searchMonth+'-'+'01' );
			}else{
				$("#start_datepicker").val( searchYear+'-'+'0'+searchMonth+'-'+'01' );
			}
		}else if(cal == 'two'){
			var b = new Date(sYear,sMonth-2,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+'-'+''+searchMonth+'-'+'01' );
			}else{
				$("#start_datepicker").val( searchYear+'-'+'0'+searchMonth+'-'+'01' );
			}
			
		}else if(cal == 'three'){
			var b = new Date(sYear,sMonth-3,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+'-'+''+searchMonth+'-'+'01' );
			}else{
				$("#start_datepicker").val( searchYear+'-'+'0'+searchMonth+'-'+'01' );
			}
			
		}else if(cal == 'six'){
			var b = new Date(sYear,sMonth-6,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+'-'+''+searchMonth+'-'+'01' );
			}else{
				$("#start_datepicker").val( searchYear+'-'+'0'+searchMonth+'-'+'01' );
			}
			
		}else if(cal == 'year'){
			var b = new Date(sYear,sMonth-12,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				$("#start_datepicker").val( searchYear+'-'+''+searchMonth+'-'+'01' );
			}else{
				$("#start_datepicker").val( searchYear+'-'+'0'+searchMonth+'-'+'01' );
			}
			
		}
	});
	
	$('tr.j_list').on('click',function(){
		var j_index = $(this).attr('j_index');
		
		
		<%-- toggle --%>
		if( $(this).hasClass('on') ){
			<%-- 초기화 --%>
			$('tr.j_list').removeClass('on');
			$('tr.j_detail').hide();
			return false;
		}
		
		<%-- 초기화 --%>
		$('tr.j_list').removeClass('on');
		$('tr.j_detail').hide();
		
		<%-- 상세화면 표시  --%>
		$(this).addClass('on');
		$('tr.j_detail[j_index="'+j_index+'"]').show();
	});
});

function goIndex() {
	document.location.href = "/main/index.do";
}

function searchPaymentList(){
	
	var tSY = $("#start_datepicker").val().substr(0,4);
	//var tSM = $("#start_datepicker").val().substr(4,2);
	var tSM = $("#start_datepicker").val().substr(5,2);
	var tEY = $("#end_datepicker").val().substr(0,4);
	//var tEM = $("#end_datepicker").val().substr(4,2);
	var tEM = $("#end_datepicker").val().substr(5,2);
	
	var sDate = new Date(tSY,Number(tSM)-1);
	var eDate = new Date(tEY,Number(tEM)-1);
	var betweenMonth = ( eDate.getFullYear() - sDate.getFullYear()) * 12 + eDate.getMonth() - sDate.getMonth();
	
	if( (betweenMonth < 0) || (betweenMonth > 6)){
		alert("기간별 검색은 6개월 이내만 가능합니다.");
		
		return false;
	}
	
	
	document.boardForm.action = "<c:url value='/m/netCounter/pay/list.do'/>";
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
			<li><a href="kr/or/truck/m/netCounter/netCounterPayList.do">지급내역조회</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i08"><img alt="지급내역조회" src="/images/m_truck/subtop/08top_5.png" /></li>
				<li class="txt01">조회내용과 실지급 내역이 상이한 경우에는 해당지부 경리과로 문의하시기 바랍니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont05">
			<!-- 내역검색 -->
			<div class="searchBox">
				<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post">
						<table class="formType">
		           			<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr>
								<th><span class="bulSt07">기간별</span><br/></th>
								<td>
									<form:input type="date" path="junpyo_symd" id="start_datepicker" title="시작날짜" style="width:47%;" class="input" />~
									<form:input type="date" path="junpyo_eymd" id="end_datepicker" title="종료날짜" style="width:47%;" class="input" />
									<div class="cell02">
										<span class="cellw5"><form:radiobutton path="searchRecentDate" value="one" id="month1" name="month" type="radio" /><label for="month1">1개월</label></span>
										<span class="cellw5"><form:radiobutton path="searchRecentDate" value="two" id="month2" name="month" type="radio" /><label for="month2">2개월</label></span>
										<span class="cellw5"><form:radiobutton path="searchRecentDate" value="three" id="month3" name="month" type="radio" /><label for="month3">3개월</label></span>
										<span class="cellw5"><form:radiobutton path="searchRecentDate" value="six" id="month6" name="month" type="radio" /><label for="month6">6개월</label></span>
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="bulSt07">지부</span></th>
								<td>
									<p class="txt">
										<form:select path="jibu_cd"  title="조회 지부를 선택" class="select">
											<form:option selected="selected" value="">전체</form:option>
											<form:option value="0201">서울</form:option>
											<form:option value="0301">부산</form:option>
											<form:option value="0401">대구</form:option>
											<form:option value="0501">인천</form:option>
											<form:option value="0701">대전</form:option>
											<form:option value="0801">울산</form:option>
											<form:option value="0901">경기</form:option>
											<form:option value="1001">강원</form:option>
											<form:option value="1101">충북</form:option>
											<form:option value="1201">충남</form:option>
											<form:option value="1301">전북</form:option>
											<form:option value="1401">전남</form:option>
											<form:option value="1501">경북</form:option>
											<form:option value="1601">경남</form:option>
											<form:option value="1701">제주</form:option>
										</form:select>
									</p>
									<a class="btn" href="#;" onclick="searchPaymentList(); return false;"><i class="icon-search"></i></a>
								</td>
							</tr>
						</table>
						<p class="bulSt08">조회기간은 최대 6개월 이내로 가능 합니다.</p>
				</form:form>
			</div>
			<c:if test="${resultList != null }">
				<!-- 지급상세내역 -->
				<div class="textTitle"><h2 class="txtTit03">지급상세내역</h2></div>
				<table class="tbSt06">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">지급일자</th>
							<th scope="col">지부명</th>
							<th scope="col">사고번호</th>
							<th scope="col">사고일자</th>
							<th scope="col" class="borrNone">금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr class="j_list" j_index="${status.index }">
								<td class="list">${result.junpyo_ymd}</td>
								<td class="list">${result.jibu_nm}</td>
								<td class="list">${fn:substring(result.sago_no,0,4) }-${fn:substring(result.sago_no,4,9) }</td>
								<td class="list">${result.sago_ymd}</td>
								<td class="list borrNone">
									<c:if test="${not empty result.revenue}">
										<fmt:formatNumber value="${result.revenue}"  type="number" />원
									</c:if>
								</td>
							</tr>
							<tr class="j_detail" j_index="${status.index }" style="display:none;" ><!-- 여긴펼침 display:none -->
								<td colspan="5" class="pa0 boraNone">
									<div class="tbDiv04">
										<table>
											<colgroup>
												<col width="25%">
												<col width="35%">
												<col width="20%">
												<col width="20%">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">조합원명</th>
													<td>${result.johabwon}</td>
													<th scope="row">갑근세</th>
													<td class="borrNone">
														<c:if test="${not empty result.revenue}">
															<fmt:formatNumber value="${result.revenue}"  type="number" />원
														</c:if>	
													</td>
												</tr>
												<tr>
													<th scope="row">차량번호</th>
													<td>${result.car_no}</td>
													<th scope="row">주민세</th>
													<td class="borrNone">
														<c:if test="${not empty result.inhabit}">
															<fmt:formatNumber value="${result.inhabit}"  type="number" />원
														</c:if>	
													</td>
												</tr>
												<tr>
													<th scope="row" class="borbNone">피해자/물</th>
													<td colspan="3" class="borrNone borbNone">${result.pihaeja}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
							</tr><!--// 여긴펼침 display:none -->
							<%-- <tr>
								<td><c:out value="${result.junpyo_ymd}"/></td>
								<td><c:out value="${result.jibu_nm}"/></td>
								<td><c:out value="${result.sago_no}"/></td>
								<td><c:out value="${result.sago_ymd}"/></td>
								<td><c:out value="${result.johabwon}"/></td>
								<td><c:out value="${result.car_no}"/></td>
								<td><c:out value="${result.pihaeja}"/></td>
								<td><c:out value="${result.tot_amt}"/></td>
								<td><c:out value="${result.revenue}"/></td>
								<td><c:out value="${result.inhabit}"/></td> 
							</tr> --%>
							<!-- <tr class="on">
								<td class="list">2013.12.31</td>
								<td class="list">서울지부</td>
								<td class="list">0000-00000</td>
								<td class="list">0000.00.00</td>
								<td class="list borrNone">0,000,000 원</td>
							</tr>
							<tr>여긴펼침 display:none
								<td colspan="5" class="pa0 boraNone">
									<div class="tbDiv04">
										<table>
											<colgroup>
												<col width="25%">
												<col width="35%">
												<col width="20%">
												<col width="20%">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">조합원명</th>
													<td>협산특수렉카</td>
													<th scope="row">갑근세</th>
													<td class="borrNone">-</td>
												</tr>
												<tr>
													<th scope="row">차량번호</th>
													<td>서울33사 4897</td>
													<th scope="row">주민세</th>
													<td class="borrNone">-</td>
												</tr>
												<tr>
													<th scope="row" class="borbNone">피해자/물</th>
													<td colspan="3" class="borrNone borbNone">셔터문</td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
							</tr>// 여긴펼침 display:none
							<tr class="">
								<td class="list">2013.12.31</td>
								<td class="list">서울지부</td>
								<td class="list">0000-00000</td>
								<td class="list">0000.00.00</td>
								<td class="list borrNone">0,000,000 원</td>
							</tr> -->
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${resultList == null }">
				<tr>
					<!-- <td colspan="10">조회할 기간을 선택후 검색하여 주세요.</td> -->
				</tr>
			</c:if>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>











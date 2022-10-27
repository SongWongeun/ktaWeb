<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" />  -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
function goPage(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.submit();
}
$(document).ready(function(){


	
	<%-- 전역변수 --%>
	if( $("#start_datepicker").val() == '' && $("#end_datepicker").val() == ''){
		var a = new Date();
		var sYear = a.getFullYear();
		var sMonth = a.getMonth()+1;
		var sDay = a.getDate();
		a.setDate(sDay+1);
		var eDay = a.getDate();
		if (sMonth < 10) sMonth = "0" + sMonth;
		if (sDay < 10) sDay = "0" + sDay;
		if (eDay < 10) eDay = "0" + eDay;
		
		$("#start_datepicker").val( sYear+''+sMonth+''+sDay );
		$("#end_datepicker").val( sYear+''+sMonth+''+eDay	);
		
	}
	<%-- 임시 --%>
	
	//$("#start_datepicker").val( '20140110' );
	//$("#end_datepicker").val( '20140120'	); 
});

//검색일자 선택 
$(function() {
  $("#start_datepicker").datepicker({
		  showOn : 'both',
          changeYear : true,
          changeMonth : true,
          monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
                '7월', '8월', '9월', '10월', '11월', '12월' ],
          dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
          showMonthAfterYear : true,
          dateFormat : 'yymmdd',
          buttonImageOnly : true,
          buttonImage : '/images/truck/board/calendar.gif'
  		});
 });
$(function() {
 $("#end_datepicker").datepicker({
		  showOn : 'both',
	      changeYear : true,
	      changeMonth : true,
	      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	            '7월', '8월', '9월', '10월', '11월', '12월' ],
	      dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
	      showMonthAfterYear : true,
	      dateFormat : 'yymmdd',
	      buttonImageOnly : true,
	      buttonImage : '/images/truck/board/calendar.gif'
		});
});

function searchDivide(){
	if( $("#start_datepicker").val() == ''){
		alert("조회 시작일을 입력해주세요.");
		return false;
	}
	if( $("#end_datepicker").val() == ''){
		alert("조회 종료일을 입력해주세요.");
		return false;
	}
	var tSY = $("#start_datepicker").val().substr(0,4);
	var tSM = $("#start_datepicker").val().substr(4,2);
	var tSD = $("#start_datepicker").val().substr(6,2);
	var tEY = $("#end_datepicker").val().substr(0,4);
	var tEM = $("#end_datepicker").val().substr(4,2);
	var tED = $("#end_datepicker").val().substr(6,2);
	
	var nowDay = new Date();
	var testYear =  nowDay.getFullYear();
	var testMonth = Number(nowDay.getMonth())+1;
	var testDate =  nowDay.getDate();
	if(testDate < 10){
		testDate = "0"+testDate;
	}
	if (testMonth < 10) testMonth = "0" + testMonth;
	var testDay = testYear+""+testMonth+""+testDate;
	
	var selectDay = tSY+""+tSM+""+tSD;

	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
	var sDay = a.getDate();
	a.setDate(sDay+1);
	var eDay = a.getDate();
	if (sMonth < 10) sMonth = "0" + sMonth;
	if (sDay < 10) sDay = "0" + sDay;
	if (eDay < 10) eDay = "0" + eDay;
	
	if(selectDay < testDay){
		alert("현재일로부터 10일까지만 검색가능합니다.");
 		$("#start_datepicker").val(sYear+''+sMonth+''+sDay);
 		$("#end_datepicker").val(sYear+''+sMonth+''+eDay);
		return false;
	}
	
	var selectDay2 = tEY+""+tEM+""+tED;
	
	if(selectDay2 < selectDay && tEY != ""){
		alert("검색종료일자가 검색시작일보다 클 수 없습니다.");
 		$("#start_datepicker").val(sYear+''+sMonth+''+sDay);
 		$("#end_datepicker").val(sYear+''+sMonth+''+eDay);
		return false;
	}
	
	var testDate2 = new Date(testYear,Number(testMonth)-1,nowDay.getDate());
	//10일 후 타임스팸프 생성..
	var testDate3 = testDate2.valueOf()+1000*60*60*24*10;
	//10일 후 데이트 객체..
	var testDate4 = new Date(testDate3);
	
	var testYear2 =  testDate4.getFullYear();
	var testMonth2 = Number(testDate4.getMonth())+1;
	var testDate2 = testDate4.getDate();
	if(testMonth2 < 10){
		testMonth2 = "0"+testMonth2;
	}
	if(testDate2 < 10){
		testDate2 = "0"+testDate2;
	}
	var testDay2 = testYear2+""+testMonth2+""+testDate2;
	
	//임시삭제
 	if(testDay2 < selectDay2){
 		alert("현재일로부터 10일까지만 검색가능합니다.");
 		/* $("#start_datepicker").val("");
 		$("#end_datepicker").val(testDay2); */

 		$("#start_datepicker").val(sYear+''+sMonth+''+sDay);
 		$("#end_datepicker").val(sYear+''+sMonth+''+eDay);
 		return false;
 	}  
	
	document.boardForm.pageIndex.value = '1';
	document.boardForm.action = "<c:url value='/netCounter/inquiryService/contractInquiry/divideInquiry.do'/>";
   	document.boardForm.submit();
}
$(document).ready(function(){
	<%-- 검색박스 엔터키 설정--%>
	$('form#searchVO input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchDivide();
			return false;
		}
	});
	
});
</script>

</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/contrac_tit.gif" alt="계약관리" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<a href="/netCounter/inquiryService/contractInquiry/accCarListInquiry.do" >계약관리</a>
						<span>분담금수납대상</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/contrac_con_tit03.gif" alt="현재 날짜 기준으로 공제 가입차량의 분담금 수납대상을 확인하실 수 있습니다" /></p>
					<!-- 계약관리 탭메뉴 -->
					<div class="tabGruop">
						<ul class="tab">
							<li><a href="/netCounter/inquiryService/contractInquiry/accCarListInquiry.do"><span>차량현황조회</span></a></li>
							<li><a href="/netCounter/inquiryService/contractInquiry/carDeductInquiry.do"><span>계약정보조회</span></a></li>
							<li class="on"><a href="/netCounter/inquiryService/contractInquiry/divideInquiry.do"><span>분담금수납대상</span></a></li>
						</ul>
					</div>
					<div class="conSection clfix">
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
						<fieldset>
						<legend>게시글리스트</legend>
							<h3 class="hide">분담금수납대상</h3>
							<!-- <div class="netTitbox">
								<h4 class="netTit">현재 날짜 기준으로 공제 가입차량의 <span class="txtColor02">분담금</span> <span class="txtColor03">수납대상</span>을 확인하실 수 있습니다&#46;</h4>
							</div> -->
							<div class="userAlarm mB30">
								<p class="mark"><span class="bold">&#91;
								<c:choose>
									<c:when test="${loginVO.agentCd == '1'}">${loginVO.agentNm}</c:when>
									<c:when test="${loginVO.agentCd == '2'}">${loginVO.carmgrNm}</c:when>
									<c:when test="${loginVO.agentCd == '3'}">${loginVO.companyNm}</c:when>
								</c:choose> 
								&#93; 님 </span><fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 MM월dd일" /> 현재 ${paginationInfo.totalRecordCount }건의 수납대상 건이 있습니다&#46;</p>
							</div>
							<!-- 수납대상조회하기 s -->
							<h5 class="netsubTit" ><span class="blueBul">수납대상 조회하기</span></h5>
							<div class="searchBox02 clfix mB30">
								<!-- 기간검색 -->
								<div class="searchUp">
									<div class="searchL">
										<dl>
											<dt>기간검색</dt>
											<dd>
												<label for="start_datepicker" class="hide">시작날짜</label><form:input type="text" path="searchStartDetailDate" id="start_datepicker" name="startdate" readonly="true" title="시작날짜" style="width:97px;" class="alC"/>
												&#126;
												<label for="end_datepicker" class="hide">종료날짜</label><form:input type="text" path="searchEndDetailDate" id="end_datepicker" name="enddate" readonly="true" title="종료날짜" style="width:97px;" class="alC"/>
											</dd>
										</dl>
										<span class="noti">수납대상건의 기간설정은 최대 10일까지 가능합니다&#46; 현재 기간제한없이 조회가능( 임시 )</span>
									</div>
								</div>
								<!-- 차량번호검색 -->
								<div class="searchDown">
									<div class="searchL">
										<dl>
											<dt>차량번호</dt>
											<dd><label for="search" class="hide">차량번호</label><form:input path="searchKeyword" id="search" name="keyword" title="차량번호 입력해주세요" class="txt" style="width:275px" type="text" value="${searchKeyword }" /></dd>
										</dl>
										<span class="noti">차량번호를 입력하지 않으면 모든 차량이 조회됩니다&#46;</span>
									</div>
									<!-- 검색버튼 -->
									<div class="btn_absol">
										<span class="btn_pack btn_type04"><a href="#;" onclick="searchDivide();" class="bold">검색하기</a></span>
									</div>
								</div>
							</div><!--// 수납대상조회하기 e -->
							<!-- 수납대상 s -->
							<h5 class="netsubTit" ><span class="greenBul">수납대상</span></h5>
							<div class="tbWork1">
								<table class="tbWork_st01" summary="수납 대상 상세정보 테이블 입니다.">
									<caption>수납 대상 상세정보에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:4%;" />
										<col style="width:10%;" />
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:8%;" />
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:8%;" />
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:8%;" />
										<col style="width:7%;" />
										<col style="width:4%;" />
										<col style="width:8%;" />
										<col style="width:10%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">순번</th>
											<th scope="col">차량번호</th>
											<th scope="col">대인 &#8544;</th>
											<th scope="col">회차</th>
											<th scope="col">유효초일</th>
											<th scope="col">일반공제</th>
											<th scope="col">회차</th>
											<th scope="col">유효초일</th>
											<th scope="col">재해</th>
											<th scope="col">회차</th>
											<th scope="col">유효초일</th>
											<th scope="col">적재물</th>
											<th scope="col">회차</th>
											<th scope="col">유효초일</th>
											<th scope="col">합계</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty resultList }">
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<%-- 날짜 --%>
												<c:if test="${not empty result.YUHYO_SYMD_1}">
													<fmt:parseDate value="${result.YUHYO_SYMD_1}" var="dateFmt1" pattern="yyyymmdd"/>
												</c:if>
												<c:if test="${not empty result.YUHYO_SYMD_2}">
													<fmt:parseDate value="${result.YUHYO_SYMD_2}" var="dateFmt2" pattern="yyyymmdd"/>
												</c:if>
												<c:if test="${not empty result.YUHYO_SYMD_5}">
													<fmt:parseDate value="${result.YUHYO_SYMD_5}" var="dateFmt5" pattern="yyyymmdd"/>
												</c:if>
												<c:if test="${not empty result.YUHYO_SYMD_6}">
													<fmt:parseDate value="${result.YUHYO_SYMD_6}" var="dateFmt6" pattern="yyyymmdd"/>
												</c:if>
												<tr>
													<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
													<td><c:out value="${result.CAR_NO}"/></td>      	     
													<td class="alR"><fmt:formatNumber value="${result.BUNNAP_AMT_1 }" type="number" /></td>	
													<td><c:out value="${result.BUNNAP_CNT_1}"/></td>	       
													<td><fmt:formatDate value="${dateFmt1}" pattern="yy.mm.dd"/></td>	     
													<td class="alR"><fmt:formatNumber value="${result.BUNNAP_AMT_2 + result.BUNNAP_AMT_3 + result.BUNNAP_AMT_4 + result.BUNNAP_AMT_7}" type="number" /></td> 
													<td><c:out value="${result.BUNNAP_CNT_2}"/></td>
													<td><fmt:formatDate value="${dateFmt2}" pattern="yy.mm.dd"/></td>
													<td class="alR"><fmt:formatNumber value="${result.BUNNAP_AMT_5 }" type="number" /></td> 
													<td><c:out value="${result.BUNNAP_CNT_5}"/></td>
													<td><fmt:formatDate value="${dateFmt5}" pattern="yy.mm.dd"/></td>
													<td class="alR"><fmt:formatNumber value="${result.BUNNAP_AMT_6 }" type="number" /></td>
													<td><c:out value="${result.BUNNAP_CNT_6}"/></td>
													<td><fmt:formatDate value="${dateFmt6}" pattern="yy.mm.dd"/></td>
													<td class="alR"><fmt:formatNumber value="${result.BUNNAP_AMT_1 + result.BUNNAP_AMT_2 + result.BUNNAP_AMT_3 + result.BUNNAP_AMT_4 + result.BUNNAP_AMT_7 + result.BUNNAP_AMT_5 + result.BUNNAP_AMT_6}" type="number" /></td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty resultList }">
											<tr>
												<td colspan="15">검색결과가 없습니다. 조회할 기간을 선택후 검색하여 주세요.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
								<p class="txtPoint05"><span class="grenBar">일반공제에는 대인&#8545;&#44; 대물&#44; 자기차량&#44; 특약이 포함되어 있습니다&#46;</span></p>
								<!-- paging s -->
								<div class="paging">
									<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="goPage" />
									<label for="pageIndex" class="hide">페이지</label><input name="pageIndex" id="pageIndex" type="hidden" value="${searchVO.pageIndex }" />
								</div><!--// paging e -->
							</div><!--// 수납대상 e -->
							</fieldset>
						</form:form>
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>







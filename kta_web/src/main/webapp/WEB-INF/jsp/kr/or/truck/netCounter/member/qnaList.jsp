<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" />  -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
//검색일자 선택 
$(document).ready(function(){
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
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
 
<%-- 검색박스 엔터키 설정--%>
$('form#boardForm input[name="searchKeyword"]').on('keydown',function(event){
	if( event.keyCode == 13) {
		
		searchQnaBoard();
		return false;
	}
});

<%-- 조회기간년도세팅 --%>
$('form#boardForm select[name="year"]')
	.append('<option value="'+sYear+'">'+sYear+'</option>')
	.append('<option value="'+(sYear-1)+'">'+(sYear-1)+'</option>')
	.append('<option value="'+(sYear-2)+'">'+(sYear-2)+'</option>')
	;

<%-- 월별 조회 선택시 event --%>
$('form#boardForm select[name="year"], form#boardForm select[name="month"]').on('change',function(event){
	var y = $('form#boardForm select[name="year"] option:selected').val();
	var m = $('form#boardForm select[name="month"] option:selected').val();
	if( y != '0000' && m != '00' ){
		if(y != "" && m != ""){
		$("#start_datepicker").val( y+m+'01' );
		$("#end_datepicker").val( y+m+new Date( y, m, '').getDate()	);
		}
	}
});

$('form#boardForm input[name="recentMonth"]').bind('click',function(event){
	var monthR = $('form#boardForm input[name="recentMonth"]:checked').val();
	var nowDay = new Date();
	var testYear =  nowDay.getFullYear();
	var testMonth = Number(nowDay.getMonth())+1;
	var testDate =  nowDay.getDate();
	if(testDate < 10){
		testDate = "0"+testDate;
	}
	if (testMonth < 10) testMonth = "0" + testMonth;
	
	var testDay = testYear+""+testMonth+""+testDate;
	
	
	var testDate2 = new Date(testYear,Number(testMonth)-1,nowDay.getDate());
	//이전일자 후 타임스팸프 생성..
	var testDate3 = testDate2.valueOf()+1000*60*60*24*-Number(monthR);
	//이전일자 데이트 객체..
	var testDate4 = new Date(testDate3);
	
	var testYear2 =  testDate4.getFullYear();
	var testMonth2 = Number(testDate4.getMonth())+1;
	var testDate2 = testDate4.getDate();
	if(testDate2 < 10){
		testDate2 = "0"+testDate2;
	}
	var testDay2 = testYear2+""+testMonth2+""+testDate2;

	$("#end_datepicker").val(testDay);
	$("#start_datepicker").val(testDay2);
	
});


$('form#boardForm input[name="searchKeyword"]').focus();
});

/* 글 검색 화면 function */
function searchQnaBoard() {
	document.boardForm.action = "<c:url value='/netCounter/memberPage/myPage/qnaList.do'/>";
   	document.boardForm.submit();d
}
/* 글 보기 화면 function */
function viewArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/netCounter/memberPage/myPage/qnaView.do'/>";
   	document.boardForm.submit();		
}
/* pagination 페이지 링크 function */
function boardLinkPage(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/netCounter/memberPage/myPage/qnaList.do'/>";
   	document.boardForm.submit();
}
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
 						<h2><img src="/images/truck/net/myqna_tit.gif" alt="나의 문의 내역" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<a href="#;" >마이페이지</a><!-- 회원유형별 마이페이지 링크 걸러주세요 -->
						<span>나의 문의 내역</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/myqna_con_tit.gif" alt="회원님께서 문의하신 전체 내역 조회가 가능합니다 추가 문의 사항이 있으신 분께서는 1:1 문의 서비스를 이용해 주시기 바랍니다" /></p>
					<form:form commandName="searchVO" id="boardForm" name="boardForm" method="post" action="">
					<fieldset>
					<legend>문의결과 확인</legend>
					<input type="hidden" name="articleNo" />
					<div class="conSection">
						<h3 class="netsubTit" ><span class="blueBul">문의내역검색</span></h3>
						<!-- 문의내역검색 s -->
						<div class="searchBox02 clfix">
							<!-- 월별조회 -->
							<div class="searchUp">
								<div class="secYear">
									<dl>
										<dt><label for="year">월별조회</label></dt>
										<dd>
											<select name="year" id="year" title="조회기간 년도 선택" style="width:80px;">
												<option selected="selected" value="">선택</option>
												<option value="2013">2013</option>
												<option value="2012">2012</option>
												<option value="2011">2011</option>
											</select>
											년&nbsp;
											<select name="month" id="month" title="조회기간 월 선택" style="width:60px;">
												<option selected="selected" value="">선택</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
											월&nbsp;
										</dd>
									</dl>
								</div>
								<div class="beforeDate">
									<ul>
										<li><form:input path="recentMonth"  id="month1" type="radio" value="30" /><label for="month1">최근1개월</label></li>
										<li><form:input path="recentMonth"  id="month2" type="radio" value="60" /><label for="month1">최근2개월</label></li>
										<li><form:input path="recentMonth"  id="month3" type="radio" value="90" /><label for="month1">최근3개월</label></li>
									</ul>
								</div>
							</div>
							<!-- 기간별조회&검색어 -->
							<div class="searchDown">
								<div class="date">
									<dl>
										<dt>기간검색</dt>
										<dd>
											<label for="startdate" class="hide">시작날짜</label><form:input type="text" path="searchStartDetailDate" id="start_datepicker" name="start_datepicker" readonly="true" title="시작날짜" style="width:95px;" class="alC"/>
											&#126;
											<label for="enddate" class="hide">종료날짜</label><form:input type="text" path="searchEndDetailDate" id="end_datepicker" name="end_datepicker" readonly="true" title="종료날짜" style="width:95px;" class="alC"/>
										</dd>
									</dl>
									<!-- <span class="noti">수납대상건의 기간설정은 최대 10일까지 가능합니다&#46;</span> -->
								</div>
								<div class="keyword">
									<dl>
										<dt>문의명</dt>
										<dd><label for="keyword" class="hide">문의제목</label><form:input path="searchKeyword" id="search" name="keyword" title="공고명을 입력해주세요" class="txt" style="width:350px" type="text" value="" /></dd>
									</dl>
									<!-- 검색/초기화버튼 -->
									<div class="btn_srch">
										<span class="btn_pack btn_type04"><a href="#;" onclick="searchQnaBoard();" class="bold">검색하기</a></span>
									</div>
								</div>
							</div>
						</div><!--// 문의내역검색 e -->
						<div class="userAlarm">
							<p class="mark">회원님의 최근 3개월간의 문의내역입니다&#46; 문의 제목을 선택하시면 답변글 확인이 가능합니다&#46;</p>
						</div>
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="문의내역검색 게시판입니다. 번호,제목,작성일,상태">
								<caption>문의내역검색 목록 게시판</caption>
								<colgroup>
									<col style="width:9%;" />
									<col style="width:66%;" />
									<col style="width:15%;" />
									<col style="width:10%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col" class="last">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty resultList}">
									<c:forEach var="result" items="${resultList}" varStatus="status">
				  								<tr>
				  									<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
					    							<td class="alL ellipsis"><a href="#;" onclick="viewArticle('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a></td>
			      									<td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>	      									
				  									<c:if test="${result.replyAt eq 'Y'}">
				  									<td><img src="/images/truck/com/answer.gif" alt="답변" /></td>
				  									</c:if>
				  									<c:if test="${result.replyAt eq 'N'}">
				  									<td><img src="/images/truck/com/notanswer.gif" alt="미답변" /></td>
				  									</c:if>
				  								</tr>
				 					</c:forEach>
				 					</c:if>
				 					<c:if test="${empty resultList}">
										<tr>
											<td class="tdnone" colspan="4">검색된 내용이 없습니다.</td>
										</tr>
									</c:if>	
								</tbody>
							</table>
							<!-- paging s -->							
							<div class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="boardLinkPage" />
								<form:hidden path="pageIndex" />
							</div><!--// paging e -->
						</div>
						<!--// table list e -->
					</div>
					</fieldset>
					</form:form>
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
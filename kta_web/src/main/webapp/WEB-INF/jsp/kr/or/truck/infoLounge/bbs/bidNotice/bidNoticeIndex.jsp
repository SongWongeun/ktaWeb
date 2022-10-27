<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	//New이미지를 보여주기 위해 현재날짜 가져오기
 	GregorianCalendar calender = new GregorianCalendar();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
 	Date nowDate = calender.getTime();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" type="text/css"/> -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>

<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function(){
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
	
	/*
	if('${searchVO.searchRecentDate}' == ''){
		$("form#boardForm input[id='month3']").attr("checked",true);
		var b = new Date(sYear,sMonth-3,'');
		var searchYear = b.getFullYear();
		var searchMonth = b.getMonth()+1;
		if(searchMonth.toString().length == '2'){
			if(a.toString().length == '2'){
				$("#start_datepicker").val( searchYear+''+searchMonth+''+a.getDate() );	
			}else{
				$("#start_datepicker").val( searchYear+''+searchMonth+'0'+a.getDate() );
			}
		}else{
			if(a.toString().length == '2'){
				$("#start_datepicker").val( searchYear+'0'+searchMonth+''+a.getDate() );
			}else{
				$("#start_datepicker").val( searchYear+'0'+searchMonth+'0'+a.getDate() );
			}
		}3
		
		if(sMonth.toString().length == '2'){
			if(a.toString().length == '2'){
				$("#end_datepicker").val( sYear+''+sMonth+''+a.getDate());
			}else{
				$("#end_datepicker").val( sYear+''+sMonth+'0'+a.getDate());
			}
		}else{
			if(a.toString().length == '2'){
				$("#end_datepicker").val( sYear+'0'+sMonth+''+a.getDate() );
			}else{
				$("#end_datepicker").val( sYear+'0'+sMonth+'0'+a.getDate() );
			}
		}
	}
	*/
	
	$("form#boardForm [name='searchRecentDate']").on('change',function(event){
		var cal = ($(this).val());

		if(sMonth.toString().length == '2'){
			if(a.toString().length == '2'){
				$("#end_datepicker").val( sYear+''+sMonth+''+a.getDate());	
			}else{
				$("#end_datepicker").val( sYear+''+sMonth+'0'+a.getDate());
			}
			
		}else{
			if(a.toString().length == '2'){
				$("#end_datepicker").val( sYear+'0'+sMonth+''+a.getDate() );
			}else{
				$("#end_datepicker").val( sYear+'0'+sMonth+'0'+a.getDate() );
			}
			
		}
		
		if(cal == 'one'){
			var b = new Date(sYear,sMonth-1,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				if(a.toString().length == '2'){
					$("#start_datepicker").val( searchYear+''+searchMonth+''+a.getDate());	
				}else{
					$("#start_datepicker").val( searchYear+''+searchMonth+'0'+a.getDate());
				}
				
			}else{
				if(a.toString().length == '2'){
					$("#start_datepicker").val( searchYear+'0'+searchMonth+''+a.getDate());	
				}else{
					$("#start_datepicker").val( searchYear+'0'+searchMonth+'0'+a.getDate());
				}
				
			}
		}else if(cal == 'three'){
			var b = new Date(sYear,sMonth-3,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				if(a.toString().length == '2'){
					$("#start_datepicker").val( searchYear+''+searchMonth+''+a.getDate());	
				}else{
					$("#start_datepicker").val( searchYear+''+searchMonth+'0'+a.getDate());
				}
				
			}else{
				if(a.toString().length == '2'){
					$("#start_datepicker").val( searchYear+'0'+searchMonth+''+a.getDate());	
				}else{
					$("#start_datepicker").val( searchYear+'0'+searchMonth+'0'+a.getDate());
				}
				
			}
			
		}else if(cal == 'six'){
			var b = new Date(sYear,sMonth-6,'');
			var searchYear = b.getFullYear();
			var searchMonth = b.getMonth()+1;
			if(searchMonth.toString().length == '2'){
				if(a.toString().length == '2'){
					$("#start_datepicker").val( searchYear+''+searchMonth+''+a.getDate() );	
				}else{
					$("#start_datepicker").val( searchYear+''+searchMonth+'0'+a.getDate() );
				}
				
			}else{
				if(a.toString().length == '2'){
					$("#start_datepicker").val( searchYear+'0'+searchMonth+''+a.getDate() );	
				}else{
					$("#start_datepicker").val( searchYear+'0'+searchMonth+'0'+a.getDate() );
				}
				
			}
			
		}
	});
	
});
	
	
//검색일자 선택 
$(function() {
  $("#start_datepicker").datepicker({
		  showOn : 'both',
          defaultDate : "+1w",
          changeYear : true,
          changeMonth : true,
          monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
                '7월', '8월', '9월', '10월', '11월', '12월' ],
          dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
          showMonthAfterYear : true,
          selectOtherMonths: true,
          dateFormat : 'yymmdd',
          buttonImageOnly : true,
          buttonImage : '/images/truck/board/calendar.gif'
  		});
 });
 
$(function() {
 $("#end_datepicker").datepicker({
		  showOn : 'both',
	      defaultDate : "+1w",
	      changeYear : true,
	      changeMonth : true,
	      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	            '7월', '8월', '9월', '10월', '11월', '12월' ],
	      dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
	      showMonthAfterYear : true,
          selectOtherMonths: true,
	      dateFormat : 'yymmdd',
	      buttonImageOnly : true,
	      buttonImage : '/images/truck/board/calendar.gif'
		});
});
/* 글 보기 화면 function */
function viewBidBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/infoLounge/bidNoticeView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addBidBoard() {
   	document.boardForm.action = "<c:url value='/infoLounge/bidNoticeAddView.do'/>";
   	document.boardForm.submit();		
}
/* index function */
function listBidBoard() {
	document.location.href = "/infoLounge/bidNoticeIndex.do";
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
/* 글 검색 function */
function searchBidBoard() {
	document.boardForm.action = "<c:url value='/infoLounge/bidNoticeIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_bidBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/infoLounge/bidNoticeIndex.do'/>";
   	document.boardForm.submit();
}

function removeRecent(){
	$("input:radio").attr("checked", false).checkboxradio("refresh"); 
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
						<h2><img src="/images/truck/info/bid_tit.gif" alt="입찰공고" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<span>입찰공고</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/info/bid_con_tit.gif" alt="입찰사업명을 입력하거나 공고기간을 지정하면 해당기간의 입찰공고현황을 검색할 수 있습니다." /></p>				
					<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post" action="">
					<fieldset>
					<legend>게시글리스트</legend>
					<input type="hidden" name="articleNo" />
					<div class="conSection">
						<!-- 입찰공고검색 s -->
						<div class="searchBox01 clfix">
							<!-- 업무구분&공고명 -->
							<div class="searchUp">
								<div class="option">
									<dl>
										<dt>업무구분</dt>
										<dd>
										<form:select path="searchCondition" id="" name="" title="입찰공고업무구분" style="width:80px;">
										<form:option selected="selected" value="00">전체</form:option>
				 					   	<c:forEach items="${ctgList}" var="ctg">
											<form:option value="${ctg.CATEGORY_ID}">${ctg.CATEGORY_NM}</form:option>
				 					   	</c:forEach>  
										</form:select>
										</dd>
									</dl>
								</div>
								<div class="keyword">
									<dl>
										<dt>공고명</dt>
										<dd><label for="search" class="hide">공고명</label><form:input path="searchKeyword" id="search" name="keyword" title="공고명을 입력해주세요" class="txt" style="width:456px" type="text" onkeydown="if(event.keyCode==13)searchBidBoard()" /></dd>
									</dl>
								</div>
							</div>
							<!-- 날짜&기간검색 -->
							<div class="searchDown">
								<div class="date">
									<dl>
										<dt>기간검색</dt>
										<dd>
											<ul>
												<li onclick="removeRecent()"><label for="start_datepicker" class="hide">시작날짜</label><form:input type="text" path="searchStartDetailDate" id="start_datepicker" name="startdate" readonly="true" title="시작날짜" class="alC" /></li>
												<li>~</li>
												<li class="pR45" onclick="removeRecent()"><label for="end_datepicker" class="hide">종료날짜</label><form:input type="text" path="searchEndDetailDate" id="end_datepicker" name="enddate" readonly="true" title="종료날짜" class="alC" /></li>
												<li><form:radiobutton path="searchRecentDate" value="three" id="month3" type="radio"/><label for="month3">최근3개월</label></li>
												<li><form:radiobutton path="searchRecentDate" value="six" id="month6" type="radio" /><label for="month6">최근6개월</label></li>
											</ul>
										</dd>
									</dl>
								</div>
								<!-- 검색/초기화버튼 -->
								<div class="btn_srch">
									<span class="btn_pack btn_type04"><a href="#;" onclick="searchBidBoard(); return false;" class="bold">검색하기</a></span>
									<span class="btn_pack btn_type05"><a href="#;" onclick="listBidBoard(); return false;" class="bold">검색초기화</a></span>
								</div>
							</div>
						</div><!--// 입찰공고검색 e -->
						<!-- table list s -->
						<div class="bbsList1">
							<table class="tbList_st01" summary="입찰공고 게시판입니다. 번호,구분,공고명,첨부,공고일,조회수">
								<caption>입찰공고 게시판</caption>
								<colgroup>
									<col style="width:9%;" />
									<col style="width:10%;" />
									<col style="width:60%;" />
									<col style="width:12%;" />
									<col style="width:9%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">업무구분</th>
										<th scope="col">공고명</th>
										<th scope="col">공고일</th>
										<th scope="col" class="last">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty resultList}">
									<c:forEach var="result" items="${resultList}" varStatus="status">		
									<c:set var="regDate">
									${fn:replace(result.createTime, '.', '')}
									</c:set>		
									 <tr>
									 	<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
									    <td>
									    <c:forEach items="${ctgList}" var="ctgIndex">
											<c:if test="${ctgIndex.CATEGORY_ID == result.bbsCtg}">${ctgIndex.CATEGORY_NM}</c:if>
										</c:forEach>
										</td>
									    <td class="alL ellipsis"><a href="#;" onclick="viewBidBoard('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a>
									    <%
										String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
										Date regDate = dateFormat.parse(chkDate); 
										long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
										long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
										%>
										<%if(diffDays<5){ %>								
										<img  src="/images/truck/main/icon_new_org.png" alt="새글"/>
										<%}%>
									    </td>
									    <td><c:out value="${fn:substring(result.createTime, 0, 11)}"/></td>
									    <td><c:out value="${result.rdcount}"/></td>
									 </tr>
									</c:forEach>
									</c:if>
									<c:if test="${empty resultList}">
										<tr>
											<td class="tdnone" colspan="5">검색된 내용이 없습니다.</td>
										</tr>
									</c:if>	
								</tbody>
							</table>
							<!-- paging s -->
							<div class="paging">
								<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="paging_bidBoard" />
								<form:hidden path="pageIndex" />
							</div>
							<!--// paging e -->
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


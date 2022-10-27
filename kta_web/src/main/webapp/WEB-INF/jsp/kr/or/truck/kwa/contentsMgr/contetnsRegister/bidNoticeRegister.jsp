<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
<!-- Always force latest IE rendering engine or request Chrome Frame -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">
<title>KTA Admin page</title>

<link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<c:set var="registerFlag" value="${empty bidBoardVO.articleNo ? '등록' : '수정'}"/>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" /> -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/namo/js/namo_scripteditor.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
//검색일자 선택 
 	
$(function() {
  $("#start_datepicker").datepicker({
		  showOn : 'focus',
          defaultDate : "+1w",
          changeYear : true,
          changeMonth : true,
          monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
                '7월', '8월', '9월', '10월', '11월', '12월' ],
          dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
          showMonthAfterYear : true,
          dateFormat : 'yy/mm/dd',
          buttonImageOnly : true,
          buttonImage : '/images/truck/board/calendar.gif'
  		});
 });

$(function() {
 $("#end_datepicker").datepicker({
		  showOn : 'focus',
	      defaultDate : "+1w",
	      changeYear : true,
	      changeMonth : true,
	      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	            '7월', '8월', '9월', '10월', '11월', '12월' ],
	      dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
	      showMonthAfterYear : true,
	      dateFormat : 'yy/mm/dd',
	      buttonImageOnly : true,
	      buttonImage : '/images/truck/board/calendar.gif'
		});
});

$(function() {
	 $("#join_datepicker").datepicker({
			  showOn : 'focus',
		      defaultDate : "+1w",
		      changeYear : true,
		      changeMonth : true,
		      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
		            '7월', '8월', '9월', '10월', '11월', '12월' ],
		      dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
		      showMonthAfterYear : true,
		      dateFormat : 'yy/mm/dd',
		      buttonImageOnly : true,
		      buttonImage : '/images/truck/board/calendar.gif'
			});
	});
	
$(function() {
 $("#bid_datepicker").datepicker({
		  showOn : 'focus',
	      defaultDate : "+1w",
	      changeYear : true,
	      changeMonth : true,
	      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	            '7월', '8월', '9월', '10월', '11월', '12월' ],
	      dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
	      showMonthAfterYear : true,
	      dateFormat : 'yy/mm/dd',
	      buttonImageOnly : true,
	      buttonImage : '/images/truck/board/calendar.gif'
		});
});


$(function() {
 $("#explan_datepicker").datepicker({
		  showOn : 'focus',
	      defaultDate : "+1w",
	      changeYear : true,
	      changeMonth : true,
	      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
	            '7월', '8월', '9월', '10월', '11월', '12월' ],
	      dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
	      showMonthAfterYear : true,
	      dateFormat : 'yy/mm/dd',
	      buttonImageOnly : true,
	      buttonImage : '/images/truck/board/calendar.gif'
		});
});


/* 글 목록 화면 function */
function listBidBoard() {
   	document.boardForm.action = "<c:url value='/infoLounge/bidNoticeIndex.do'/>";
   	document.boardForm.submit();		
}


/* 글 등록 function */
function saveBidBoard() {	
	frm = document.boardForm;
    frm.action = "<c:url value="${registerFlag == '등록' ? '/kwa/infoLounge/bidNoticeAdd.do' : '/kwa/infoLounge/bidNoticeModify.do'}"/>";
    frm.submit();  
}

/* 글 삭제 funciton*/
function deleteBidBoard() {
   	document.boardForm.action = "<c:url value='/kwa/infoLounge/bidNoticeDelete.do'/>";
   	document.boardForm.submit();		
}

function clearFile(obj){
	obj.value="";
	obj.outerHTML = obj.outerHTML;
}

function checkFile(){	
	var checkFile = document.getElementById("checkFileForm").value-0;
	if(checkFile >= 11){
		alert("더이상 파일을 추가할 수 없습니다");
		return false;
	}
	document.getElementById("enenter_"+checkFile).style.display="";
	document.getElementById("checkFileForm").value = checkFile+1;
}
function backtoIndex(){
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();
}
function checkFileSize(path){
	var maxSize ='${fileSize}';
	var filesize;
	if(path.files.length == 0){
		return;
	}else{
		filesize = path.files[0].size;	
	}
	filesize = filesize/1024;
   	if(filesize > maxSize){
		alert("첨부파일은 ["+maxSize+"KB]이하만 업로드 가능합니다.");
		$(path).val("");
		return;
   	}
}
</script>
</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kwa/common/left.do"></c:import>
<!--// left e -->

	<div class="main-content"><!-- 
		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
					<div class="pull-left header">
						<h3 class="title">컨텐츠 관리</h3>
					</div>
				</div>
			</div>
		</div> -->
		<form:form commandName="bidBoardVO" name="boardForm" enctype="multipart/form-data"  class="fill-up">
			<input type="hidden" id="bmstNo" name="bmstNo" value="2"/>
			<form:hidden path="articleNo"/><br>
			<form:hidden path="atchFileId"/><br>
			<form:hidden path="modifyId"/><br>
			<form:hidden path="modifyName"/><br>
			<form:hidden path="modifyTime"/><br>
			<input type="hidden" name="content_html"/>
			<input type="hidden" name="content_text"/>
		<div class="container">
		<div class="row">
				<div class="col-md-12" >
						<div class="box">
							<form class="fill-up">
								<div class="box-header">
								<span class="title">입찰공고</span>
									<ul class="box-toolbar">
										<li>
										</li>
									</ul>
								</div>
								<div class="box-content">
									<div class="row box-section">
										<div class="col-md-2" >공고번호</div>
										<div class="col-md-4">
											<form:input path="bidNo" alt="공고번호" placeholder="공고번호" maxlength="30"   />
										</div>
									<div class="col-md-2" >카테고리</div>
									<div class="col-md-4">
										<form:select path="bbsCtg" >
										<c:forEach items="${ctgList}" var="ctg">
											<form:option value="${ctg.CATEGORY_ID}">${ctg.CATEGORY_NM}</form:option>
				 					   	</c:forEach>  
										</form:select>
									</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >공고시작일</div>
										<div class="col-md-4">
											<form:input id="start_datepicker" path="bidStartDate" alt="공고시작일" placeholder="공고시작일" value="${fn:substring(bidBoardVO.bidStartDate,0, 11)}" readonly="true" />
										</div>
										<div class="col-md-2" >공고종료일</div>
										<div class="col-md-4">
											<form:input id="end_datepicker" path="bidEndDate" alt="공고종료일" placeholder="공고종료일" value="${fn:substring(bidBoardVO.bidEndDate,0, 11)}" readonly="true"/>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >공고명</div>
										<div class="col-md-4">
											<form:input path="bidName" alt="공고명" placeholder="공고명" maxlength="100" />
										</div>
										<div class="col-md-2" >공고기관</div>
										<div class="col-md-4">
										화물공제조합
											<form:hidden path="bidAgency" alt="공고기관" placeholder="공고기관" maxlength="100" />
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >기초금액</div>
										<div class="col-md-4">
											<form:input path="baseAmount" alt="기초금액" placeholder="기초금액" maxlength="100"/>
										</div>
										<div class="col-md-2" >낙찰자 선정방법</div>
										<div class="col-md-4">
											<form:input path="bidWinRule" alt="낙찰자 선정방법" placeholder="낙찰자 선정방법" maxlength="100"/>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >입찰방식</div>
										<div class="col-md-4">
											<form:input path="bidRule" alt="입찰방식" placeholder="입찰방식" maxlength="20"/>
										</div>
										<div class="col-md-2" >계약방식</div>
										<div class="col-md-4">
											<form:select path="contractRule" alt="계약방식" placeholder="계약방식">
												<form:option value="일반"  label="일반"/>
												<form:option value="지명" label="지명" />
												<form:option value="수의" label="수의" />
											</form:select>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >입찰 참가자격</div>
										<div class="col-md-10">
											<form:textarea path="pq" placeholder="입찰 참가자격" maxlength="600"/>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >담당자명</div>
										<div class="col-md-4">
											<form:input path="bidManger" placeholder="담당자명"  maxlength="100" />
										</div>
										<div class="col-md-2" >담당자 연락처</div>
										<div class="col-md-4">
											<form:input path="managerCall" placeholder="담당자 연락처" maxlength="100"/>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >입찰참가 신청일시</div>
										<div class="col-md-4">
											<form:input path="joinDate" placeholder="입찰참가 등록일자" id="join_datepicker" value="${fn:substring(bidBoardVO.joinDate,0, 11)}" readonly="true" style="width:70%" />
											<form:input path="joinTime" placeholder="시간" value="${bidBoardVO.joinTime}" style="width:28%" maxlength="20"/>
										</div>
										<div class="col-md-2" >입찰참가 신청장소</div>
										<div class="col-md-4">
											<form:input path="joinPlace" placeholder="입찰참가 등록장소" maxlength="100" />
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >개찰(입찰)방식</div>
										<div class="col-md-4">
											<form:input path="detailBidRule" placeholder="개찰(입찰)방식" maxlength="100"/>
										</div>
										<div class="col-md-2" >개찰 장소</div>
										<div class="col-md-4">
											<form:input path="bidPlace" placeholder="개찰(입찰)장소" maxlength="100"/>
										</div>
									</div>
									<div class="row box-section">
										<%-- <div class="col-md-2" >사업설명회 일시</div>
										<div class="col-md-4">
											<form:input path="explanDate" placeholder="사업(현장)설명일자" id="explan_datepicker" value="${fn:substring(bidBoardVO.explanDate,0, 11)}" readonly="true" style="width:70%"/>
											<form:input path="explanTime" placeholder="시간" value="${bidBoardVO.explanTime}" style="width:28%" maxlength="20"/>
										</div> --%>
										<div class="col-md-2" >기타</div>
										<div class="col-md-10">
											<form:textarea path="explanPlace" placeholder="기타사항" maxlength="600"/>
										</div>
									</div>
									<form:hidden path="title" placeholder="공고제목" maxlength="100" />
									<div class="row box-section">
										<div class="col-md-2">첨부파일</div>
										<div class="col-md-10">
											<c:if test="${not empty bidBoardVO.atchFileId}">
												<c:import url="/com/atch/selectFileInfsForUpdate.do" charEncoding="utf-8">
												<c:param name="param_atchFileId" value="${bidBoardVO.atchFileId}" />
												</c:import>
								 			</c:if> 
								 			<c:if test="${empty bidBoardVO.atchFileId}">
								 				<c:forEach var="cnt" begin="1" end="${fileNo}" >
												<input name="file_${cnt}" id="file_${cnt}" type="file" title="첨부파일입력" onchange="checkFileSize(file_${cnt});"/>
								 				</c:forEach>
								 			</c:if> 
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
			<div class="col-md-12" >
			<ul class="padded separate-sections">
				<li align="right">
					<a href="#;" onclick="saveBidBoard()"  class="btn btn-blue">
					<c:out value="${registerFlag}"/>하기</a>
				  	<a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
				</li>
			</ul>
			</div>
		</div>
	</body>
</html>
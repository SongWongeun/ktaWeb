<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- Use title if it's in the page YAML frontmatter -->
<title>KTA Admin page</title>

<link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">
function backtoIndex(){
	document.boardForm.action = "<c:url value='/kwa/customerMgr/cleanCenter/list.do'/>";
   	document.boardForm.submit();
}

function viewCheck(){
	/*
	/kwa/customerMgr/praise/viewChange.do
	*/
	var articleNo = $("#articleNo").val();
	var writerName =$("#writerName").val();
	var email = $("#email").val();
	var phone = $("#phone").val();
	var email_yn = $("#email_yn").val();
	var phone_yn = $("#phone_yn").val();
	var replyAt = 'Y';
		if($("#replyAt").val()=='Y'){
			replyAt = 'N';
		}else{
			replyAt = 'Y';
		}
	var params ={'articleNo':articleNo,'replyAt':replyAt,'writerName':writerName,'email':email,'phone':phone,'email_yn':email_yn,'phone_yn':phone_yn};
	$.ajax({
		url:'/kwa/customerMgr/cleanCenter/viewChange.do', type:'POST',
		data : params, dataType:'JSON', timeout: 2000, async:false,
		error: function(data){
			/*
			Growl.fail({
		        title: '변경에 실패하였습니다.',
		        text: '표출여부 변경에 실패하였습니다.'
		      });
			*/
			alert('변경에 실패하였습니다.');
		},
		success: function(data){
			//console.log(data);
			/*
			Growl.success({
		        title: '표출여부 변경에 성공하였습니다.',
		        text: '칭찬합시다 글의 표출여부 변경을 성공하였습니다.'
		      });
			*/
			$('#replyAt').val(replyAt);
			if(replyAt=='Y'){
				$('#changViBtn').attr('class','btn btn-green');
				$('#changViBtn').text('처리');
			}else{
				$('#changViBtn').attr('class','btn btn-red');
				$('#changViBtn').text('미처리');
			}
			alert('표출여부 변경에 성공하였습니다.');
		}
	});

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

	<div class="main-content">
		<form name="boardForm" id="boardForm" method="post">
			<input type="hidden" id="articleNo" name="articleNo" value="${resultDetail.articleNo}"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
			<input type="hidden" id="searchCondition" name="searchCondition" value="${searchVO.searchCondition}"/>
			<input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}"/>
			<input type="hidden" id="replyAt" name="replyAt" value="${resultDetail.replyAt}"/>
			<input type="hidden" id="email" name="email" value="${resultDetail.email }">
			<input type="hidden" id="phone" name="phone" value="${resultDetail.phone }">
			<input type="hidden" id="email_yn" name="email_yn" value="${resultDetail.email_yn }">
			<input type="hidden" id="phone_yn" name="phone_yn" value="${resultDetail.phone_yn }">
			<input type="hidden" id="writerName" name="writerName" value="${resultDetail.writerName }">
		</form>
		
		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
					<div class="pull-left header">
						<h3 class="title">클린센터 관리</h3>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-md-12" >
					<div class="box">
						<form class="fill-up">
						<div class="row box-section">
							<div class="col-md-3" >제목</div>
							<div class="col-md-9">
							${resultDetail.title}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3">작성자 아이디</div>
							<div class="col-md-9">
								${resultDetail.writerId}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >신고자명</div>
							<div class="col-md-9">
							${resultDetail.writerName}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >연락처</div>
							<div class="col-md-9">
							${resultDetail.phone}<c:if test="${resultDetail.phone_yn=='Y' }"><b style="padding-left:30px">*회원이 SMS로 답변 받기를 원합니다.</b></c:if>
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >email</div>
							<div class="col-md-9">
							${resultDetail.email}<c:if test="${resultDetail.email_yn=='Y' }"><b style="padding-left:30px">*회원이 이메일로 답변 받기를 원합니다.</b></c:if>
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >
								주소
							</div>
							<div class="col-md-9">
								${resultDetail.addr}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >
								신주소
							</div>
							<div class="col-md-9">
								${resultDetail.newAddr}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3">내용</div>
							<div class="col-md-9" style="min-height: 92px;">
							${resultDetail.contentHtml}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3">첨부파일</div>
							<div class="col-md-9">
								<c:if test="${not empty resultDetail.atchFileId}">
									<c:import url="/com/atch/selectFileInfs.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${resultDetail.atchFileId}" />
									</c:import>
					 			</c:if> 
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >작성일자</div>
							<div class="col-md-9">
								${resultDetail.createTime}
							</div>
						</div>
						<div class="row box-section">
						
						<p align="right"><a id="changViBtn" name="changViBtn" class="btn btn-<c:if test='${resultDetail.replyAt=="Y"}'>green</c:if><c:if test='${resultDetail.replyAt=="N"}'>red</c:if>" href="#;" onclick="viewCheck();"><c:if test='${resultDetail.replyAt=="Y"}'>처리</c:if><c:if test='${resultDetail.replyAt=="N"}'>미처리</c:if></a>&nbsp;&nbsp;<a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a></p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
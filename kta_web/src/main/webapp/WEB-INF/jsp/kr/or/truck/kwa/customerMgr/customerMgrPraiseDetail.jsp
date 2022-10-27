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
	document.boardForm.action = "<c:url value='/kwa/customerMgr/praise/list.do'/>";
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
	var accntName = $("#accntName").val();
	var carNo = $("#carNo").val();
	var accntName = $("#accntName").val();
	var useAt = 'Y';
		if($("#useAt").val()=='Y'){
			useAt = 'N';
		}else{
			useAt = 'Y';
		}
	var params ={'articleNo':articleNo,'useAt':useAt,'writerName':writerName,'email':email,'phone':phone,'email_yn':email_yn,'phone_yn':phone_yn,'accntName':accntName,'carNo':carNo,'accntName':accntName};
	$.ajax({
		url:'/kwa/customerMgr/praise/viewChange.do', type:'POST',
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
			$('#useAt').val(useAt);
			if(useAt=='Y'){
				$('#changViBtn').attr('class','btn btn-green');
				$('#changViBtn').text('표출');
			}else{
				$('#changViBtn').attr('class','btn btn-red');
				$('#changViBtn').text('미표출');
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
			<input type="hidden" id="useAt" name="useAt" value="${resultDetail.useAt}"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}"/>
			<input type="hidden" id="searchCondition" name="searchCondition" value="${searchVO.searchCondition}"/>
			<input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}"/>
			<input type="hidden" id="writerName" name="writerName" value="${resultDetail.writerName }">
			<input type="hidden" id="email" name="email" value="${resultDetail.email }">
			<input type="hidden" id="phone" name="phone" value="${resultDetail.phone }">
			<input type="hidden" id="email_yn" name="email_yn" value="${resultDetail.email_yn }">
			<input type="hidden" id="phone_yn" name="phone_yn" value="${resultDetail.phone_yn }">
			<input type="hidden" id="accntName" name="accntName" value="${resultDetail.accntName }">
			<input type="hidden" id="carNo" name="carNo" value="${resultDetail.carNo }">
			<input type="hidden" id="accntName" name="accntName" value="${resultDetail.accntName }">
		</form>
		
		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
					<div class="pull-left header">
						<h3 class="title">칭찬합시다 관리</h3>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-md-12" >
					<div class="box">
						<form class="fill-up">
							<div class="box-header">
								<span class="title"></span>
									<ul class="box-toolbar">
									<li>
									
									</li>
								</ul>
							</div>
					<div class="box-content">
						<div class="row box-section">
							<div class="col-md-3" >제목</div>
							<div class="col-md-9">
							${resultDetail.title}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >작성자</div>
							<div class="col-md-9">
							${resultDetail.writerName}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3">작성자 아이디</div>
							<div class="col-md-9">
								${resultDetail.writerId}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >연락처</div>
							<div class="col-md-9">
							${resultDetail.phone}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >email</div>
							<div class="col-md-9">
							${resultDetail.email}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >
								사고번호
							</div>
							<div class="col-md-9">
								${resultDetail.accntNo}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >
								사고차량번호
							</div>
							<div class="col-md-9">
								${resultDetail.carNo}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >
								피해자명
							</div>
							<div class="col-md-9">
								${resultDetail.accntName}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3">게시여부</div>
							<div class="col-md-9">
								<a id="changViBtn" name="changViBtn" class="btn btn-<c:if test='${resultDetail.useAt=="Y"}'>green</c:if><c:if test='${resultDetail.useAt=="N"}'>red</c:if>" href="#;" onclick="viewCheck();"><c:if test='${resultDetail.useAt=="Y"}'>적용</c:if><c:if test='${resultDetail.useAt=="N"}'>미적용</c:if></a>
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3">내용</div>
							<div class="col-md-9" style="min-height: 92px;">
							${resultDetail.contentHtml}
							</div>
						</div>
						<div class="row box-section">
							<div class="col-md-3" >작성일자</div>
							<div class="col-md-9">
								${resultDetail.createTime}
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-12" >
		<ul class="padded separate-sections">
			<li align="right">
			  <a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>

			</li>
		</ul>
		</div>
	</div>
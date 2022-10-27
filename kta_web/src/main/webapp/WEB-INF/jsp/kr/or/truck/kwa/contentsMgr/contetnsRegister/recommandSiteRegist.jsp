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
<title>KTA Admin page</title>

<link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<c:set var="registerFlag" value="${empty recommandSiteVO.articleNo ? '등록' : '수정'}"/>
<title>관련사이트 등록<c:out value="${registerFlag}"/></title>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<script type="text/javascript" src="/namo/js/namo_scripteditor.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">


/* 글 등록 function */
function saveSite() {	
	f = document.boardForm;
	if(f.siteName.value == null || f.siteName.value == "") {
		alert("사이트 이름을 입력하세요.");
		f.siteName.focus();
		return;
	}
	if(f.siteURL.value == null || f.siteURL.value == "") {
		alert("사이트 주소를 입력하세요.");
		f.siteURL.focus();
		return;
	}
	if('${registerFlag}' == '등록') {
		f.action = '/kwa/infoLounge/dataCenter/registSite.do';
	} else if('${registerFlag}' == '수정') {
	f.action = '/kwa/infoLounge/dataCenter/updateSite.do';
	}
   	f.submit();	
}

/* 글 삭제 funciton*/
function deleteSite() {
   	document.boardForm.action = "<c:url value='/kwa/infoLounge/dataCenter/deleteSite.do'/>";
   	document.boardForm.submit();		
}

function backtoIndex(){
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();
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

		<form:form commandName="recommandSiteVO" name="boardForm">
			<form:hidden path="articleNo"/>
			<input type="hidden" id="bmstNo" name="bmstNo" value="3"/>
			<form:hidden path="bbsId" value="RECOMMAND_SITE"/>
			
		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
					<div class="pull-left header">
						<h3 class="title">컨텐츠 관리</h3>
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
									<span class="title">관련사이트</span>
										<ul class="box-toolbar">
										<li>
										
										</li>
									</ul>
								</div>
								<div class="box-content">
									<div class="row box-section">
										<div class="col-md-3" >카테고리</div>
										<div class="col-md-9">
					 					   	<form:select path="siteCategory" cssClass="use">
												<form:option value="federation" label="연합회" />
												<form:option value="gov" label="정부기관" />
												<form:option value="group" label="보험관련단체" />
												<form:option value="speech" label="보험관련언론사" />
												<form:option value="cooperative" label="공제조합" />	
												<form:option value="traffic" label="교통관련단체" />	
											</form:select>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >사이트명</div>
										<div class="col-md-9">
											<form:input path="siteName" value="${resultMap.SITE_NAME}" alt="사이트 명" placeholder="사이트 명" class="form-control" />
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >사이트 URL</div>
										<div class="col-md-9">
											<form:input path="siteURL" value="${resultMap.SITE_URL}" alt="사이트 URL" placeholder="사이트 URL" class="form-control" />
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			</form:form>
			<div class="col-md-12" >
			<ul class="padded separate-sections">
				<li align="right">
					<a href="#;" onclick="saveSite();"  class="btn btn-blue">
					<c:out value="${registerFlag}"/>하기</a>
				  	<a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
				</li>
			</ul>
			</div>
		</div>
	</body>
</html>   
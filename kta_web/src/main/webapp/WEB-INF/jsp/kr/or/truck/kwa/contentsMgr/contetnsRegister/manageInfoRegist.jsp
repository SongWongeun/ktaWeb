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
<c:set var="registerFlag" value="${empty manageInfoVO.ARTICLE_NO ? '등록' : '수정'}"/>
<title>관련사이트 등록<c:out value="${registerFlag}"/></title>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>

<validator:javascript formName="boardVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript" defer="defer">

/* 글 등록 function */
function saveInfo() {	
	f = document.boardForm;

	if('${registerFlag}' == '등록') {
		f.action = '/kwa/assocIntroduce/introduce/manageInfoRegist.do';
	} else if('${registerFlag}' == '수정') {
	f.action = '/kwa/assocIntroduce/introduce/manageInfoUpdate.do';
	}
   	f.submit();
	
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
	<form:form commandName="manageInfoVO" name="boardForm">
		<form:hidden path="ARTICLE_NO"/><br>
		<input type="hidden" id="bmstNo" name="bmstNo" value="17"/>
		<form:hidden path="BBS_ID" readonly="true" cssClass="txt" value="FAQ_NOTICE"/><br>
		
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
									<span class="title">경영정보</span>
										<ul class="box-toolbar">
										<li>
										
										</li>
									</ul>
								</div>
								<div class="box-content">
									<div class="row box-section">
										<div class="col-md-2" >경영년도</div>
										<div class="col-md-4">
											<form:input path="BBS_YEAR" alt="BBS_YEAR" placeholder="경영년도" class="form-control"/>
										</div>
										<div class="col-md-2" >유동자산</div>
										<div class="col-md-4">
											<form:input path="YUDONG_JASAN" alt="유동자산" placeholder="유동자산" class="form-control"/>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >당좌자산</div>
										<div class="col-md-4">
											<form:input path="DANGJUA_JASAN" alt="당좌자산" placeholder="당좌자산" class="form-control"/>
										</div>
										<div class="col-md-2" >현금 및 현금성 자산</div>
										<div class="col-md-4">
											<form:input path="HYUNGUM_JASAN" alt="현금 및 현금성자산" placeholder="현금및현금성자산" class="form-control"/>
										</div>
									</div>
									
									<div class="row box-section">
										<div class="col-md-2" >단기금융상품</div>
										<div class="col-md-4">
											<form:input path="DANGI_GUMYUNG" alt="단기금융상품" placeholder="단기금융상품" class="form-control"/>
										</div>
										<div class="col-md-2" >기타유동자산</div>
										<div class="col-md-4">
											<form:input path="ETC_YUDONG_JASAN" alt="기타유동자산" placeholder="기타유동자산" class="form-control"/>
										</div>
									</div>
									
									<div class="row box-section">
										<div class="col-md-2" >비유동자산</div>
										<div class="col-md-4">
											<form:input path="NOT_YUDNG_JASANG" alt="비유동자산" placeholder="비유동자산" class="form-control"/>
										</div>
										<div class="col-md-2" >투자자산</div>
										<div class="col-md-4">
											<form:input path="TOOJA_JASAN" alt="투자자산" placeholder="투자자산" class="form-control"/>
										</div>
									</div>
									
									<div class="row box-section">
										<div class="col-md-2" >장기금융상품</div>
										<div class="col-md-4">
											<form:input path="JANGI_GUMYUNG" alt="장기금융상품" placeholder="장기금융상품" class="form-control"/>
										</div>
										<div class="col-md-2" >기타투자자산</div>
										<div class="col-md-4">
											<form:input path="ETC_TOOJA_JASAN" alt="기타투자자산" placeholder="기타투자자산" class="form-control"/>
										</div>
									</div>
									
									<div class="row box-section">
										<div class="col-md-2" >유형자산</div>
										<div class="col-md-4">
											<form:input path="YOOHYUNG_JASAN" alt="유형자산" placeholder="유형자산" class="form-control"/>
										</div>
										<div class="col-md-2" >자산계</div>
										<div class="col-md-4">
											<form:input path="JASAN_AMT" alt="자산계" placeholder="자산계" class="form-control"/>
										</div>
									</div>
									
									<div class="row box-section">
										<div class="col-md-2" >유동부채</div>
										<div class="col-md-4">
											<form:input path="YUDONG_BOOCHAE" alt="유동부채" placeholder="유동부채" class="form-control"/>
										</div>
										<div class="col-md-2" >비유동부채</div>
										<div class="col-md-4">
											<form:input path="NOT_YUDNG_BOOCHAE" alt="비유동부채" placeholder="비유동부채" class="form-control"/>
										</div>
									</div>
									
									<div class="row box-section">
										<div class="col-md-2" >책임준비금</div>
										<div class="col-md-4">
											<form:input path="CHAECKIM_JUNBI" alt="책임준비금" placeholder="책임준비금" class="form-control"/>
										</div>
										<div class="col-md-2" >부채계</div>
										<div class="col-md-4">
											<form:input path="BOOCHAE_AMT" alt="부채계" placeholder="부채계" class="form-control"/>
										</div>
									</div>
									
									
									<div class="row box-section">
										<div class="col-md-2" >자본금</div>
										<div class="col-md-4">
											<form:input path="JABONE_AMT" alt="자본금" placeholder="자본금" class="form-control"/>
										</div>
										<div class="col-md-2" >비상위험준비금</div>
										<div class="col-md-4">
											<form:input path="BISANG_AMT" alt="비상위험준비금" placeholder="비상위험준비금" class="form-control"/>
										</div>
									</div>
									
									<div class="row box-section">
										<div class="col-md-2" >기타준비금</div>
										<div class="col-md-4">
											<form:input path="ETC_JUNBI" alt="기타준비금" placeholder="기타준비금" class="form-control"/>
										</div>
										<div class="col-md-2" >이익잉여금</div>
										<div class="col-md-4">
											<form:input path="EICK_AMT" alt="이익잉여금" placeholder="이익잉여금" class="form-control"/>
										</div>
									</div>
									
									<div class="row box-section">
										<div class="col-md-2" >자본계</div>
										<div class="col-md-4">
											<form:input path="JABONE_TOT_AMT" alt="자본계" placeholder="자본계" class="form-control"/>
										</div>
										<div class="col-md-2" >부채와 자본 계</div>
										<div class="col-md-4">
											<form:input path="TOTAL_AMT" alt="부채와 자본 계" placeholder="부채와 자본 계" class="form-control"/>
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
					<a href="#;" onclick="saveInfo();"  class="btn btn-blue">
					<c:out value="${registerFlag}"/>하기</a>
				  	<a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
				</li>
			</ul>
			</div>
		</div>
</body>
</html>
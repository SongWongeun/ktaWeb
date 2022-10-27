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
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();
}

function contentsModify(){
	document.boardForm.action = "<c:url value='/kwa/contentMgr/contentsModify.do'/>";
   	document.boardForm.submit();
}
function contentsDelete(){
	

	if(!confirm("정말로 게시글을 삭제하시겠습니까?")){
		return false;
	}
	
	document.boardForm.action = "<c:url value='/kwa/contentMgr/contentsDelete.do'/>";
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
		<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post">
			<input type="hidden" id="articleNo" name="articleNo" value="${resultMap.ARTICLE_NO}"/>
			<input type="hidden" id="bmstNo" name="bmstNo" value="${boardNo}"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}"/>
			<form:hidden path="searchCondition"/>
			<form:hidden path="searchWord"/>
			<form:hidden path="category"/>
		</form:form>
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
									<span class="title">${resultMap.BBS_NAME}</span>
										<ul class="box-toolbar">
										<li>
										
										</li>
									</ul>
								</div>
								<div class="box-content">
									<div class="row box-section">
										<div class="col-md-3" >게시판명</div>
										<div class="col-md-9">
											${resultMap.BBS_NAME}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3">카테고리</div>
										<div class="col-md-9">										
											<c:choose>
												<c:when test="${resultMap.CATEGORY == 'cooperative'}">
												공제조합
												</c:when>
												<c:when test="${resultMap.CATEGORY == 'federation'}">
												연합회
												</c:when>
												<c:when test="${resultMap.CATEGORY == 'gov'}">
												정부기관
												</c:when>
												<c:when test="${resultMap.CATEGORY == 'group'}">
												보험관련 단체
												</c:when>
												<c:when test="${resultMap.CATEGORY == 'johapwon'}">
												조합원
												</c:when>
												<c:when test="${resultMap.CATEGORY == 'speech'}">
												보험관련 언론사
												</c:when>
												<c:when test="${resultMap.CATEGORY == 'traffic'}">
												교통관련 단체
												</c:when>
											</c:choose>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3">등록일자</div>
										<div class="col-md-9">
											${fn:replace(resultMap.CREATE_TIME, '-' , '.' )}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3">사이트명</div>
										<div class="col-md-9">
											${resultMap.SITE_NAME}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3">사이트 URL</div>
										<div class="col-md-9">
											${resultMap.SITE_URL}
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-12" >
				<ul class="padded separate-sections">
					<li align="right">
					  <a id="basicmodify" class="btn btn-blue" href="#;" onclick="contentsModify();">수정하기</a>
					  <a id="basicmodify" class="btn btn-blue" href="#;" onclick="contentsDelete();">삭제하기</a>
					  <a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
		
					</li>
				</ul>
				</div>
			</div>
		</div>
</body>
</html>
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
		<form name="boardForm" id="boardForm">
			<input type="hidden" id="articleNo" name="articleNo" value="${resultMap.ARTICLE_NO}"/>
			<input type="hidden" id="bmstNo" name="bmstNo" value="${boardNo}"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}"/>
		</form>
		
		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
					<div class="pull-left header">
						<h3 class="title">홍보영상관리</h3>
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
										<div class="col-md-3" >제목</div>
										<div class="col-md-9">
											${resultMap.TITLE}
										</div>
									</div>								
									<div class="row box-section">
										<div class="col-md-3" >작성일자</div>
										<div class="col-md-9">
											${fn:replace(resultMap.CREATE_TIME, '-' , '.' )}
										</div>
									</div>								
									<div class="row box-section">
										<div class="col-md-3" >작성자ID</div>
										<div class="col-md-9">
											${resultMap.WRITER_ID}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3">내용</div>
										<div class="col-md-9">
										${resultMap.CONTENT_HTML}
										</div>
									</div>								
									<div class="row box-section">
										<div class="col-md-3" >영상 정보</div>
										<div class="col-md-9">
										<input type="text" value="http://youtu.be/${resultMap.VIDEO_FILE_ID}" alt="비디오파일 ID" placeholder="비디오파일 ID" disabled="true">
										</div>
									</div>					
									<div class="row box-section">
										<div class="col-md-3" >영상 썸네일</div>
										<div class="col-md-9">
											<a href="http://youtu.be/${resultMap.VIDEO_FILE_ID}" onclick="window.open(this.href, '_blank'); return false;">
											<img src="http://img.youtube.com/vi/${resultMap.VIDEO_FILE_ID}/1.jpg" style="width:200px; height:150px" alt="홍보영상" />
											</a>
										</div>
									</div>
								</div>
							</form>
						</div>
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
</body>
</html>

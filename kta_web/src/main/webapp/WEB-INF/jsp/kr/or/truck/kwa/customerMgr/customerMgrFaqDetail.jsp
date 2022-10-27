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
	document.boardForm.action = "<c:url value='/kwa/customerMgr/faq/list.do'/>";
   	document.boardForm.submit();
}

function contentsModify(){
	document.boardForm.action = "<c:url value='/kwa/customerMgr/faq/modify.do'/>";
   	document.boardForm.submit();
}
function contentsDelete(){
	if(confirm('글을 삭제 하시겠습니까?')){
		document.boardForm.action = "<c:url value='/kwa/customerMgr/faq/del.do'/>";
	   	document.boardForm.submit();
	}
}
</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}'
	if(param == 'regist.success'){
	 param = '등록이';
	}else if(param == 'update.success'){
		param='수정이';
	}else if(param == 'delete.success'){
		param ='삭제가';
	}
	alert('글'+param+' 완료되었습니다.');
});
</script>
</c:if>
<style type="text/css">
div.box-content div.col-md-3{ line-height:25px;}
</style>
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
			<input type="hidden" id="searchCondition2" name="searchCondition2" value="${searchVO.searchCondition2}"/>
			<input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}"/>
		</form>
		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
					<div class="pull-left header">
						<h3 class="title">자주하는 질문 관리</h3>
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
										<div class="col-md-3" >카테고리</div>
										<div class="col-md-9">
											${resultDetail.faqCategoryNm}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3">제목(질의)</div>
										<div class="col-md-9">
											${resultDetail.title}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3">작성자명</div>
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
										<div class="col-md-3">내용</div>
										<div class="col-md-9">
											${resultDetail.contentHtml}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3">작성일자</div>
										<div class="col-md-9">
											${resultDetail.createTime}
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
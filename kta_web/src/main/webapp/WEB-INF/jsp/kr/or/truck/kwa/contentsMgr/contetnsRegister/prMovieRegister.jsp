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
<c:set var="registerFlag" value="${empty videoBoardVO.articleNo ? '등록' : '수정'}"/>
<title>홍보영상<c:out value="${registerFlag}"/></title>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<script type="text/javascript" src="/namo/js/namo_scripteditor.js"></script>
<validator:javascript formName="boardVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">


/* 글 목록 화면 function */
function listPrMovieBoard() {
   	document.boardForm.action = "<c:url value='/cyberPr/prMovieIndex.do'/>";
   	document.boardForm.submit();		
}


/* 글 등록 function */
function savePrMovieBoard(html,text) {	
	f = document.boardForm;
	f.content_html.value = html.replace(/\n/g,'').replace(/\r/g,'');
	f.content_text.value = text;	
	if (f.title.value==null || f.title.value==""){
		alert("제목을 입력해 주세요");
		f.title.focus();
		return;
	}
	if(text=="" || text==null){ 
		alert("내용을 입력해 주세요");
		CrossEditor.SetFocusEditor(); 
		return;
	}
	
    f.action = "<c:url value="${registerFlag == '등록' ? '/kwa/cyberPr/prMovieAdd.do' : '/kwa/cyberPr/prMovieModify.do'}"/>";
    f.submit();  
}

/* 글 삭제 funciton*/
function deletePrMovieBoard() {
   	document.boardForm.action = "<c:url value='/kwa/cyberPr/prMovieDelete.do'/>";
   	document.boardForm.submit();		
}

function clearFile(obj){
	obj.value="";
	obj.outerHTML = obj.outerHTML;
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
	<form:form commandName="videoBoardVO" name="boardForm" enctype="multipart/form-data">
		<form:hidden path="articleNo"/>
		<form:hidden path="atchFileId"/>
		<form:hidden path="modifyId"/>
		<form:hidden path="modifyName"/>
		<form:hidden path="modifyTime"/>
		<input type="hidden" id="bmstNo" name="bmstNo" value="14"/>
		<input type="hidden" name="content_html"/>
		<input type="hidden" name="content_text"/>
		<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
		<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
		
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
									<span class="title">홍보영상</span>
										<ul class="box-toolbar">
										<li>
										
										</li>
									</ul>
								</div>
								<div class="box-content">
									<div class="row box-section">
										<div class="col-md-3" >비디오 단축 URL</div>
										<div class="col-md-9">
											<form:input path="VideoFileId" alt="비디오 단축 URL" placeholder="비디오 단축 URL" class="form-control"/>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >제목</div>
										<div class="col-md-9">
											<form:input path="title" value="${resultMap.TITLE}" alt="제목" placeholder="제목" class="form-control"/>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >내용</div>
										<div class="col-md-9">
										<code id="contentHtml" style="display:none;">${videoBoardVO.contentHtml}</code>
										<script type="text/javascript">
											var CrossEditor = new NamoSE("test");
											CrossEditor.params.Width = "100%";
											CrossEditor.EditorStart();
											CrossEditor.SetValue( $('code#contentHtml').html());
										</script>
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
						<a href="#;" onclick="savePrMovieBoard(CrossEditor.GetBodyValue(),CrossEditor.GetTextValue());"  class="btn btn-blue">
						<c:out value="${registerFlag}"/>하기</a>
					  	<a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
					</li>
				</ul>
			</div>
		</div>
</body>
</html>   
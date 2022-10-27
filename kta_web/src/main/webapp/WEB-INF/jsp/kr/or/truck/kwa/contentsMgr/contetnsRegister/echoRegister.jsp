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
<c:set var="registerFlag" value="${empty echoBoardVO.articleNo ? '등록' : '수정'}"/>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<script type="text/javascript" src="/namo/js/namo_scripteditor.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">


/* 글 목록 화면 function */
function listEchoBoard() {
   	document.boardForm.action = "<c:url value='/cyberPr/echoCustomIndex.do'/>";
   	document.boardForm.submit();		
}


/* 글 등록 function */
function saveEchoBoard(html,text) {
	f = document.boardForm;
	f.content_html.value = html.replace(/\n/g,'').replace(/\r/g,'');
	f.content_text.value = text;
	
	var year=document.getElementById("regYear").value;
	var month=document.getElementById("regMonth").value;
	var publicDate = year+month;
	f.title.value = year+"."+month;
	f.publicDate.value=publicDate;
	if (f.title.value==null || f.title.value==""){
		alert("제목을 입력해 주세요");
		f.title.focus();s
		return false;
	}
	if(text=="" || text==null){ 
		alert("내용을 입력해 주세요");
		CrossEditor.SetFocusEditor(); 
		return;
	}
	
    f.action = "<c:url value="${registerFlag == '등록' ? '/kwa/cyberPr/echoAdd.do' : '/kwa/cyberPr/echoModify.do'}"/>";
    f.submit();  
}

/* 글 삭제 funciton*/
function deleteEchoBoard() {
   	document.boardForm.action = "<c:url value='/kwa/cyberPr/echoDelete.do'/>";
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

<div class="main-content">
	<form:form commandName="echoBoardVO" name="boardForm" enctype="multipart/form-data">
		<form:hidden path="articleNo"/><br>
		<form:hidden path="atchFileId"/><br>
		<input type="hidden" id="bmstNo" name="bmstNo" value="12"/>
		<input type="hidden" name="content_html"/>
		<input type="hidden" name="content_text"/>
		<input type="hidden" name="publicDate"/>
		<input type="hidden" name="title"/>
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
									<span class="title">공제소식</span>
										<ul class="box-toolbar">
										<li>
										
										</li>
									</ul>
								</div>
								<div class="box-content">
									<div class="row box-section">
										<div class="col-md-3" >등록 월</div>
										<div class="col-md-9">
											<select id="regYear"> 
											<% 
											String toDate = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()); 
											for (int i=Integer.parseInt(toDate) ; i>=2006 ; i--) { 
											%> 
											<option value="<%= i %>" <%if(i==Integer.parseInt(toDate))out.print("selected"); %>><%= i %>년</option> 
											<% } %>
											</select>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >제목</div>
										<div class="col-md-9">
											<select id="regMonth">
												<option value="">등록월 선택</option>
												<option value="02">2월</option>
												<option value="04">4월</option>
												<option value="06">6월</option>
												<option value="08">8월</option>
												<option value="10">10월</option>
												<option value="12">12월</option>
											</select>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >내용</div>
										<div class="col-md-9">
										<code id="contentHtml" style="display:none;">${echoBoardVO.contentHtml}</code>
										<script type="text/javascript">
											var CrossEditor = new NamoSE("test");
											CrossEditor.params.Width = "100%";
											CrossEditor.EditorStart();
											CrossEditor.SetValue( $('code#contentHtml').html());
										</script>
										</div>
									</div>
									<c:if test="${not empty fileNo}">
									<div class="row box-section">
										<div class="col-md-3">첨부파일</div>
										<div class="col-md-9">
											<c:if test="${not empty echoBoardVO.atchFileId}">
												<c:import url="/com/atch/selectFileInfsForUpdate.do" charEncoding="utf-8">
												<c:param name="param_atchFileId" value="${echoBoardVO.atchFileId}" />
												</c:import>
								 			</c:if> 
								 			<c:if test="${empty echoBoardVO.atchFileId}">
								 				<c:forEach var="cnt" begin="1" end="${fileNo}" >
													<input name="file_${cnt}" id="file_${cnt}" type="file" title="첨부파일입력" onchange="checkFileSize(file_${cnt});"/>
								 				</c:forEach>
								 			</c:if> 
										</div>
									</div>
									</c:if>
								</div>
							</div>
						</div>
					</form:form>
				<div class="col-md-12" >
				<ul class="padded separate-sections">
					<li align="right">
						<a href="#;" onclick="saveEchoBoard(CrossEditor.GetBodyValue(),CrossEditor.GetTextValue())"  class="btn btn-blue">
						<c:out value="${registerFlag}"/>하기</a>
					  	<a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
					</li>
				</ul>
			</div>
		</div>
	</body>
</html>

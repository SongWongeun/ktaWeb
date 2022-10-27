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
<link href="/css/truck/admin.css" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchWord"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchList();
			return false;
		}
	});
});
/* pagination 페이지 링크 function */
function paging_Board(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();
}
function changeCategry(){
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();	
}
function changeBoardList(boardNo){
	document.boardForm.pageIndex.value ="1";
	document.boardForm.searchCondition.value = "0";
	document.boardForm.searchWord.value = "";
	document.boardForm.bmstNo.value=boardNo;
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();
}
function searchPaging(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();
}

function contentsDetail(articleNo){
	document.boardForm.articleNo.value = articleNo;
	document.boardForm.action = "<c:url value='/kwa/contentMgr/articleDetail.do'/>";
   	document.boardForm.submit();
}
function addArticle(){
	var board = $("select[name='boardList'] option:selected").val();
	if(board == "0"){
		alert("게시판을 선택해주세요");
		return false;
	}
	document.boardForm.action = "<c:url value='/kwa/contentMgr/contentsAdd.do'/>";
   	document.boardForm.submit();
}
function searchList(){
	
	if(document.boardForm.searchWord.value.trim() == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();	
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
	<input type="hidden" name="bmstNo" id="bmstNo" value="${boardNo}"/>
	<input type="hidden" name="articleNo" id="articleNo" />
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						컨텐츠 관리
					</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
			<div class="row">
				<div class="col-md-12" >
					<div class="box">
						<div class="box-header">
							<span class="title">게시판 선택</span>
						</div>
						<div class="box-content padded">
							<select class="chzn-select" name="boardList" onchange="changeBoardList(boardList.options[this.selectedIndex].value)">
							<option value="0">선택하세요</option>
							<c:forEach items="${boardList}" var="board">
							<option value="${board.HP_BOARD_MASTER_NO}" <c:if test="${board.HP_BOARD_MASTER_NO eq boardNo}">selected="selected"</c:if>>${board.BOARD_NM }</option>
							</c:forEach>
							</select>
						</div>
						<div class="box-content padded">
							<form:select path="category" onchange="changeCategry()" class="btn btn-default btn-sm">
							<form:option value="">전체</form:option>
							<form:option value="cooperative">공제조합</form:option>
							<form:option value="federation">연합회</form:option>
							<form:option value="johapwon">조합원</form:option>
							<form:option value="group">보험관련 단체</form:option>
							<form:option value="speech">보험관련 언론사 </form:option>
							<form:option value="gov">정부기관</form:option>
							<form:option value="traffic">교통관련 단체</form:option>
							</form:select>
							<form:select path="searchCondition" class="btn btn-default btn-sm">검색 유형
								<li class=""><span class="title"><form:option value="7" label="사이트명"/></span></li>
								<li class=""><span class="title"><form:option value="8" label="사이트 URL"/></span></li>
							</form:select>
							<form:input type="text" path="searchWord" class="search-query animated" placeholder="Search"></form:input>
						  	<a id="back" class="btn btn-primary btn-sm" onclick="searchList()" href="#;">검색</a>
						</div>
					</div>
				</div>
			</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
					<div class="box-content">
							<table class="table table-hover condensed">
							<colgroup>
								<col style="width:10%;" />
								<col style="width:50%;" />
								<col style="width:15%;" />
								<col style="width:15%;" />
							</colgroup>
							<thead>
							<tr>
							  <th><div>사이트번호</div></th>
							  <th><div>사이트 명</div></th>
							  <th><div>사이트 URL</div></th>
							  <th><div>카테고리</div></th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${not empty resultList}">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
								<td onclick="contentsDetail('${result.ARTICLE_NO}')">${result.SITE_NAME}</td>
								<td>${result.SITE_URL}</td>
								<td>							
									<c:choose>
										<c:when test="${result.CATEGORY == 'cooperative'}">
										공제조합
										</c:when>
										<c:when test="${result.CATEGORY == 'federation'}">
										연합회
										</c:when>
										<c:when test="${result.CATEGORY == 'gov'}">
										정부기관
										</c:when>
										<c:when test="${result.CATEGORY == 'group'}">
										보험관련 단체
										</c:when>
										<c:when test="${result.CATEGORY == 'johapwon'}">
										조합원
										</c:when>
										<c:when test="${result.CATEGORY == 'speech'}">
										보험관련 언론사
										</c:when>
										<c:when test="${result.CATEGORY == 'traffic'}">
										교통관련 단체
										</c:when>
									</c:choose>
								</td>
							</tr>				
							</c:forEach>	
							</c:if>
							<c:if test="${empty resultList }">
							<tr>
								<td colspan="6">검색결과가 없습니다.</td>
							</tr>
							</c:if>						
							</tbody>
							</table>			
							</div>
				</div>
				<!-- paging s -->
				<div class="text-center">
					<ul class="pagination pagination-sm">
						<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="searchPaging" />
					</ul>
					<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo}" />					
					<c:if test="${boardNo != '15' && boardNo != '9'}">
						<p align="right"><a id="back" class="btn btn-primary" href="#;" onclick="addArticle();">게시글 작성</a></p>
					</c:if>	
				</div>
			</div>
		</div>
	</div>
	</fieldset>
	</form:form>
	</div>
</body>
</html>
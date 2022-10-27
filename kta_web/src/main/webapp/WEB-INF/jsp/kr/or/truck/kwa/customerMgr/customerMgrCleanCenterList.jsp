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
/* pagination 페이지 링크 function */
function searchPaging(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kwa/customerMgr/cleanCenter/list.do'/>";
   	document.boardForm.submit();
}
function contentsDetail(articleNo){
	document.boardForm.articleNo.value = articleNo;
	document.boardForm.action = "<c:url value='/kwa/customerMgr/cleanCenter/detail.do'/>";
   	document.boardForm.submit();
}
function searchList(){
	document.boardForm.pageIndex.value = "1";
	document.boardForm.action = "<c:url value='/kwa/customerMgr/cleanCenter/list.do'/>";
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
	<form name="boardForm" method="post">
	<input type="hidden" name="articleNo" id="articleNo" />
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						클린센터 관리
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
						<span class="title">검색</span>
					</div>
					<div class="box-content padded">
						<select id="searchCondition" name="searchCondition" class="btn btn-default btn-sm">
							<li class=""><span class="title"><option value="0" label="전체" <c:if test="${searchVO.searchCondition==0}">selected="selected"</c:if>/></span></li>
							<li class=""><span class="title"><option value="1" label="제목" <c:if test="${searchVO.searchCondition==1}">selected="selected"</c:if>/></span></li>
							<li class=""><span class="title"><option value="2" label="내용" <c:if test="${searchVO.searchCondition==2}">selected="selected"</c:if>/></span></li>
							<li class=""><span class="title"><option value="3" label="작성자" <c:if test="${searchVO.searchCondition==3}">selected="selected"</c:if>/></span></li>
						</select>
						<input type="text" id="searchKeyword" name="searchKeyword" class="search-query animated" placeholder="Search" value="${searchVO.searchKeyword}"/>
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
								<col style="width:40%;" />
								<col style="width:15%;" />
								<col style="width:15%;" />
								<col style="width:10%;" />
								<col style="width:10%;" />
							</colgroup>
							<thead>
							<tr>
							  <th><div>글번호</div></th>
							  <th><div>제목</div></th>
							  <th><div>작성자</div></th>
							  <th><div>작성일</div></th>
							  <th><div>처리여부</div></th>
							  <th><div>조회수</div></th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${not empty resultList}">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
								<td onclick="contentsDetail('${result.articleNo}')"  class="title">${result.title}</td>
								<td>${result.writerName}</td>
								<td>${result.createTime}</td>
								<td><div id="changViBtn" name="changViBtn" class="btn btn-<c:if test='${result.replyAt=="Y"}'>green</c:if><c:if test='${result.replyAt=="N"}'>red</c:if>"  style="width: 59px;"><c:if test='${result.replyAt=="Y"}'>처리</c:if><c:if test='${result.replyAt=="N"}'>미처리</c:if></div></td>
								<td>${result.rdcount}</td>
							</tr>				
							</c:forEach>	
							</c:if>
							<c:if test="${empty resultList }">
							<tr>
								<td colspan="5">검색결과가 없습니다.</td>
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
				</div>
			</div>
		</div>
	</div>
	</fieldset>
	</form>
	</div>
</body>
</html>
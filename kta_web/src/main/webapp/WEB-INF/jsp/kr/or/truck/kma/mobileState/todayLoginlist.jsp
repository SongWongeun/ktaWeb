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
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/kma/mobileState/todayLoginlist.do'/>";
   	document.listForm.submit();
}
function FnList(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/kma/mobileState/todayLoginlist.do'/>";
   	document.listForm.submit();
}
</script>
</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kma/common/left.do"></c:import>
<!--// left e -->

<div class="main-content">
	<form name="listForm" method="post">
	<input type="hidden" name="articleNo" id="articleNo" />
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						당일로그인현황
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
						<select name="searchCondition"  id="searchCondition" class="btn btn-default btn-sm">
							<li class=""><span class="title"><option value="" label="전체" <c:if test="${searchVO.searchCondition==''}">selected="selected"</c:if> /></span></li>
							<li class=""><span class="title"><option value="1" label="이름" <c:if test="${searchVO.searchCondition==1}">selected="selected"</c:if> /></span></li>
							<li class=""><span class="title"><option value="2" label="사원번호" <c:if test="${searchVO.searchCondition==2}">selected="selected"</c:if> /></span></li>
						</select>
						<input type="text" name="searchKeyword"  id="searchKeyword" class="search" placeholder="Search" value="${searchVO.searchKeyword}"/>
						<a href="#;" onclick="FnList();return false;" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="search">조회</a>
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
								<col style="width:33%;" />
								<col style="width:33%;" />
								<col style="width:34%;" />
							</colgroup>
							<thead>
							<tr>
							  <th><div>사번</div></th>
							  <th><div>이름</div></th>
							  <th><div>로그인횟수</div></th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${not empty resultList}">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td>
									<c:out value="${result.USER_ID}"/>
								</td>
								<td>
									${result.NAME}
								</td>
								<td>
									${result.LOGIN_COUNT}
								</td>
							</tr>				
							</c:forEach>	
							</c:if>
							<c:if test="${empty resultList }">
							<tr>
								<td colspan="3">검색결과가 없습니다.</td>
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
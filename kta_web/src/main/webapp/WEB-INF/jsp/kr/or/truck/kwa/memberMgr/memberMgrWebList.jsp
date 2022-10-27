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
/* pagination 페이지 링크 function */
function paging_Board(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/web/list.do'/>";
   	document.boardForm.submit();
}
function webMemberDetail(id, agentCd){
	document.boardForm.id.value = id;
	document.boardForm.category.value = agentCd;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/web/detail.do'/>";
   	document.boardForm.submit();
}

function searchList(){
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/web/list.do'/>";
   	document.boardForm.submit();
}
function checkCategory(ctg){
	
	$("form#boardForm span[name*='category_']").attr('class','btn btn-default');
	$("form#boardForm span[name='category_"+ctg+"']").attr('class','btn btn-primary');
	document.boardForm.category.value=ctg;
	searchList();
	
}
$(document).ready(function(){
	var con1 ='${searchVO.category}';
	$("form#boardForm span[name='category_"+con1+"']").attr('class','btn btn-primary');
	document.boardForm.category.value=con1;
	
});
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
	<form:form commandName="searchVO" name="boardForm" method="post" id="boardForm">
	<form:hidden path="id" id="id"/>
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						웹 회원관리
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
								<!-- <span onclick="checkCategory('0');" class="btn btn-default"  name="category_0">전체</span> -->
								<span onclick="checkCategory('1');" class="btn btn-default"  name="category_1">조합원</span>
								<span onclick="checkCategory('2');" class="btn btn-default"  name="category_2">차량관리자</span>
								<span onclick="checkCategory('3');" class="btn btn-default"  name="category_3">거래처</span>
							<form:hidden path="category"/>
							<form:select path="searchCondition" class="btn btn-default">검색 유형
								<li class=""><span class="title"><form:option value="0" label="선택"/></span></li>
								<li class=""><span class="title"><form:option value="1" label="ID"/></span></li>
								<li class=""><span class="title"><form:option value="2" label="이름(상호)"/></span></li>
								<li class=""><span class="title"><form:option value="3" label="사업자 번호"/></span></li>
							</form:select>
							<form:input type="text" path="searchKeyword" class="search-query animated" placeholder="Search"></form:input>
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
							<table class="table table-hover">
							<colgroup>
								<col style="width:10%;" />
								<col style="width:15%;" />
								<col style="width:15%;" />
								<col style="width:15%;" />
								<col style="width:15%;" />
								<col style="width:15%;" />
								<col style="width:15%;" />
							</colgroup>
							<thead>
							<tr>
							  <th><div>번호</div></th>
							  <th><div>회원유형</div></th>
							  <th><div>아이디</div></th>
							  <th><div>회사명</div></th>
							  <th><div>대표자명</div></th>
							  <th><div>사업자번호</div></th>
							  <th><div>가입일</div></th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${not empty resultList }">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr onclick="webMemberDetail('${result.ID}','${result.AGENTCD}')">
								<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
								<c:if test="${result.AGENTCD == '1' }">
									<td class="center">조합원</td>
								</c:if>
								<c:if test="${result.AGENTCD == '2' }">
									<td class="center">차량관리자</td>
								</c:if>
								<c:if test="${result.AGENTCD == '3' }">
									<td class="center">거래처</td>
								</c:if>
								<td class="center">${result.ID}</td>
								<td class="center">${result.AGENTNM}</td>
								<td class="center">${result.DAEPYOJANM}</td>
								<td class="center">${fn:substring(result.SAUPJANO, 0, 3)}-${fn:substring(result.SAUPJANO, 3, 5)}-${fn:substring(result.SAUPJANO, 5, 10) }</td>
								<td class="center">${result.JOINDATE}</td>
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
							<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="paging_Board" />
						</ul>
						<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo}" />
					</div><!--// paging e -->
				</div>
			</div>
		</div></fieldset>
		</form:form>
	</div>
</body>
</html>
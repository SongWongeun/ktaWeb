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
function addArticle(){
	document.boardForm.action = "<c:url value='/kwa/customerMgr/faq/regist.do'/>";
   	document.boardForm.submit();
}
function searchList(){
	document.boardForm.pageIndex.value = "1";
	document.boardForm.action = "<c:url value='/kwa/customerMgr/faq/list.do'/>";
	document.boardForm.submit();
}
function searchPaging(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kwa/customerMgr/faq/list.do'/>";
   	document.boardForm.submit();
}
function contentsDetail(articleNo){
	document.boardForm.articleNo.value = articleNo;
	document.boardForm.action = "<c:url value='/kwa/customerMgr/faq/detail.do'/>";
   	document.boardForm.submit();
}
function checkCategory(ctg){
	
	if(ctg == 'all'){
		$("form#boardForm span[name*='category_']").attr('class','btn btn-default');
		$("form#boardForm span[name='category_all']").attr('class','btn btn-primary');
		document.boardForm.searchCondition.value='';
		searchList();
	}else{
		$("form#boardForm span[name*='category_']").attr('class','btn btn-default');
		$("form#boardForm span[name='category_"+ctg+"']").attr('class','btn btn-primary');
		document.boardForm.searchCondition.value=ctg;
		searchList();
	}
	
}
$(document).ready(function(){
	var con1 ='${searchVO.searchCondition}';
	if(con1 == ''){
		$("form#boardForm span[name='category_all']").attr('class','btn btn-primary');
	}else{
		$("form#boardForm span[name='category_"+con1+"']").attr('class','btn btn-primary');
	}
	document.boardForm.searchCondition.value=con1;
	
});
</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
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
	<form name="boardForm" method="post" id="boardForm">
	<input type="hidden" name="articleNo" id="articleNo" />
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						자주하는 질문 관리
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
						<span onclick="checkCategory('all');" class="btn btn-default" name="category_all">전체</span>
						<c:forEach var="category" items="${categoryList}" varStatus="status">
						<span onclick="checkCategory('${category.CATEGORY_ID}');" class="btn btn-default" name='category_${category.CATEGORY_ID}'>${category.CATEGORY_NM}</span>
						</c:forEach>
						<input type="hidden" name="searchCondition"/>
						<select id="searchCondition2" name="searchCondition2" class="btn btn-default">
							<li class=""><span class="title"><option value="0" label="전체" <c:if test="${searchVO.searchCondition2==0}">selected="selected"</c:if>/></span></li>
							<li class=""><span class="title"><option value="1" label="제목" <c:if test="${searchVO.searchCondition2==1}">selected="selected"</c:if>/></span></li>
							<li class=""><span class="title"><option value="2" label="내용" <c:if test="${searchVO.searchCondition2==2}">selected="selected"</c:if>/></span></li>
							<li class=""><span class="title"><option value="3" label="작성자" <c:if test="${searchVO.searchCondition2==3}">selected="selected"</c:if>/></span></li>
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
								<col style="width:8%;" />
								<col style="width:10%;" />
								<col style="width:72%;" />
								<%-- <col style="width:15%;" />
								<col style="width:15%;" /> --%>
								<col style="width:10%;" />
							</colgroup>
							<thead>
							<tr>
							  <th><div>글번호</div></th>
							  <th><div>카테고리</div></th>
							  <th><div>제목</div></th>
							  <!-- <th><div>작성자</div></th>
							  <th><div>작성일</div></th> -->
							  <th><div>조회수</div></th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${not empty resultList}">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
								<td>${result.faqCategoryNm}</td>
								<td onclick="contentsDetail('${result.articleNo}')"  class="title" >
								<c:choose>
										<c:when test="${fn:length(result.title) > 90}">
											<c:out value="${fn:substring(result.title,0,100)}" />..
										</c:when>
										<c:otherwise>
											${result.title}
										</c:otherwise>
									</c:choose>
								</td>
								<%-- <td>${result.writerName}</td>
								<td>${result.createTime}</td> --%>
								<td>${result.rdcount}</td>
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
					<p align="right">
				  		<a id="back" class="btn btn-primary" href="#;" onclick="addArticle();">게시글 작성</a>
				  	</p>
				</div>
			</div>
		</div>
	</div>
	</fieldset>
	</form>
	</div>
</body>
</html>
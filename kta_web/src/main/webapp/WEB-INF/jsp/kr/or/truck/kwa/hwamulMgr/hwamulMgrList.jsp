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
	document.listForm.action = "<c:url value='/kwa/hwamulMgr/list.do'/>";
   	document.listForm.submit();
}
function contentsDetail(articleNo){
	document.listForm.articleNo.value = articleNo;
	document.listForm.action = "<c:url value='/kwa/hwamulMgr/detail.do'/>";
   	document.listForm.submit();
}
function searchList(){
	document.listForm.pageIndex.value = "1";
	document.listForm.action = "<c:url value='/kwa/hwamulMgr/list.do'/>";
	document.listForm.submit();
}
/*
function paging_Board(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();
}
function changeBoardList(boardNo){
	document.boardForm.pageIndex.value ="1";
	document.boardForm.bmstNo.value=boardNo;
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
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
*/
</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}'
	if(param == 'update.success'){
		param='답변이';
	}
	alert(param+' 완료되었습니다.');
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
	<form name="listForm" method="post">
	<input type="hidden" name="articleNo" id="articleNo" />
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						개인화물 공제가입 상담신청 관리
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
						<%-- 카테고리 : 
						<select id="searchCondition" name="searchCondition" class="btn btn-default btn-sm">
							<li class=""><span class="title"><option value="" label="전체 카테고리"/></span></li>
							<c:forEach var="category" items="${categoryList}" varStatus="status">
								<li class=""><span class="title"><option value="${category.CATEGORY_ID}" label="${category.CATEGORY_NM}"  <c:if test="${searchVO.searchCondition==category.CATEGORY_ID}">selected="selected"</c:if>/></span></li>
							</c:forEach>
						</select> --%>
						&nbsp;&nbsp;&nbsp;&nbsp;
						답변상태 : 
						<select id="searchCondition2" name="searchCondition2" class="btn btn-default btn-sm">
							<li class=""><span class="title"><option value="" label="전체"/></span></li>
							<li class=""><span class="title"><option value="Y" label="완료" <c:if test="${searchVO.searchCondition2=='Y'}">selected="selected"</c:if>/></span></li>
							<li class=""><span class="title"><option value="N" label="미완료" <c:if test="${searchVO.searchCondition2=='N'}">selected="selected"</c:if>/></span></li>
						</select>
						&nbsp;&nbsp;&nbsp;
						<select id="searchCondition3" name="searchCondition3" class="btn btn-default btn-sm">
							<li class=""><span class="title"><option value="0" label="전체" <c:if test="${searchVO.searchCondition3==5}">selected="selected"</c:if>/></span></li>
							<li class=""><span class="title"><option value="1" label="차량번호" <c:if test="${searchVO.searchCondition3==1}">selected="selected"</c:if>/></span></li>
							<%-- <li class=""><span class="title"><option value="2" label="내용" <c:if test="${searchVO.searchCondition3==2}">selected="selected"</c:if>/></span></li> --%>
							<li class=""><span class="title"><option value="3" label="작성자" <c:if test="${searchVO.searchCondition3==3}">selected="selected"</c:if>/></span></li>
							<li class=""><span class="title"><option value="4" label="담당자"<c:if test="${searchVO.searchCondition3==4}">selected="selected"</c:if>/></span></li>
						</select>
						<input type="text" id="searchKeyword" name="searchKeyword" class="search-query animated" placeholder="Search" value="${searchVO.searchKeyword}"/>
					  	<a id="back" class="btn btn-primary btn-sm" onclick="searchList()" href="#;">검색</a>
					  	<input type="hidden" id="menuAuthCondition" name="menuAuthCondition" value="${searchVO.menuAuthCondition}" />
					</div>
				</div>
				<%-- <c:if test="${searchVO.menuAuthCondition eq 'd'}">
					<div class="note large" style="color: #FFA500;margin-left: 5px;"> 
							<i class="icon-warning-sign"></i> 메뉴관리자는 
					</div>
				</c:if>
				<c:if test="${searchVO.menuAuthCondition eq 'f'}">
					<div class="note large" style="color: #FFA500;margin-left: 5px;"> 
							<i class="icon-warning-sign"></i> 배당받은 1:1문의만 조회됩니다.
					</div>
				</c:if> --%>
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
								<col style="width:7%;" />
								<col style="width:30%;" />
								<col style="width:10%;" />
								<col style="width:10%;" />
								
								<col style="width:8%;" />
								<col style="width:15%;" />
							</colgroup>
							<thead>
							<tr style="height:40px">
							  <th><div>글번호</div></th>
							  <th><div>차량번호</div></th>
							  <th><div>작성자</div></th>
							  <th><div>접수일자</div></th>
							  
							  <th><div>담당자</div></th>
							  <th><div>답변상태</div></th>
							</tr>
							</thead>
							<tbody class="table-condensed">
							<c:if test="${not empty resultList}">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td>
									<c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/>
								</td>
								<td onclick="contentsDetail('${result.articleNo}')" class="title">${result.car_no}</td>
								<td>
									<c:choose>
										<c:when test="${!empty result.writerName}">
											${result.writerName}
										</c:when>
										<c:when test="${empty result.writerName}">
											${result.writerId}
										</c:when>
									</c:choose>
								</td>
								<td>${result.createTime}</td>
								
								<td>${result.forwardName}</td>
								<td>
									<c:if test="${empty result.forwardId}">
									
									 	<c:if test="${result.replyAt eq 'N' }">
									 		<div id="changViBtn" name="changViBtn" class="btn btn-red form-controll" style="width:70%; margin:-25px;" >미답변</div>
									 	</c:if>
									 	<c:if test="${result.replyAt eq 'Y' }">
									 		<div id="changViBtn" name="changViBtn" class="btn btn-green form-controll" style="width:70%; margin:-25px;" >답변완료</div>
									 	</c:if>
									</c:if>
									<c:if test="${not empty result.forwardId}">
									 	<c:if test="${result.replyAt eq 'Y' }">
									 		<div id="changViBtn" name="changViBtn" class="btn btn-green form-controll" style="width:70%; margin:-25px;" >답변완료</div>
									 	</c:if>
										<c:if test="${result.replyAt eq 'N' }">
											<div id="changViBtn" name="changViBtn" class="btn btn-blue form-controll" style="width:70%; margin:-25px;" >처리중</div>
									 	</c:if>
									</c:if>
								</td>
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
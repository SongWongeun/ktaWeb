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
$(document).ready(function(){
	
	
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchList();
			return false;
		}
	});
});

/* pagination 페이지 링크 function */
function paging_Board(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/admin/list.do'/>";
   	document.boardForm.submit();
}

function adminMemberDetail(id){
	document.boardForm.id.value = id;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/admin/detail.do'/>";
   	document.boardForm.submit();
}
function adminMemberDelete(id,name){
	document.boardForm.id.value = id;
	if(!confirm(name+"님의 관리자 권한을 삭제하시겠습니까?")){
		return false;
	}
	document.boardForm.action = "<c:url value='/kwa/memberMgr/admin/delete.do'/>";
   	document.boardForm.submit();
}
function searchList(){

	/* if(document.boardForm.searchKeyword.value.trim() == ""){
		alert("검색어를 입력해주십시오.");
		return;
	} */
	document.boardForm.pageIndex.value = 1;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/admin/list.do'/>";
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
	<form:form commandName="searchVO" name="boardForm" method="post">
	<form:hidden path="id" id="id"/>
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						어드민 관리
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
							<form:select path="searchCondition" class="btn btn-default btn-sm">
								<%-- <li class=""><span class="title"><form:option value="0" label="선택"/></span></li> --%>
								<li class=""><span class="title"><form:option value="1" label="이름(사원번호)"/></span></li>
								<li class=""><span class="title"><form:option value="2" label="관리메뉴명"/></span></li>
								<%-- <li class=""><span class="title"><form:option value="2" label="이름"/></span></li> --%>
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
							<table class="table table-hover condensed">
							<colgroup>
								<col style="width:5%;" />
								<col style="width:20%;" />
								<col style="width:25%;" />
								<col style="width:20%;" />
								<col style="width:20%;" />
								<col style="width:10%;" />
							</colgroup>
							<thead>
							<tr>
							  <th><div>번호</div></th>
							  <th><div>관리메뉴</div></th>
							  <th><div>권한유형</div></th>
							  <th><div>권한부여일자</div></th>
							  <th><div>사원정보</div></th>
							  <th><div>설정</div></th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${not empty resultList }">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td class="center">${paginationInfo.totalRecordCount  - ( ( paginationInfo.currentPageNo - 1 )  * paginationInfo.pageSize  ) - status.index}</td>
								<td class="center">${result.MENU_NM}</td>
								<td class="center">
									<c:forEach items="${authList}" var="auth">
										<c:if test="${auth.CODE == result.AUTH_TYPE}">${auth.CODE_NM}</c:if>
									</c:forEach>
								</td>
								<td class="center">${result.REGIST_DATE}</td>
								<td class="center">${result.AUTH_NAME}(${result.AUTH_ID})</td>
								<td class="center">
						          	<a href="#;" onclick="adminMemberDelete('${result.HP_MENU_AUTH_NO}','${result.AUTH_NAME}')" class="btn btn-default">권한삭제</a>
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
							<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="paging_Board" />
						</ul>
						<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo}" />
						<p align="right">
							<a id="back" class="btn btn-primary" href="/kwa/menuMgr/menulist.do">관리자 권한 부여</a>
						</p>
					</div><!--// paging e -->
				</div>
			</div>
		</div>
	</fieldset>
	</form:form>
</div>

</body>
</html>
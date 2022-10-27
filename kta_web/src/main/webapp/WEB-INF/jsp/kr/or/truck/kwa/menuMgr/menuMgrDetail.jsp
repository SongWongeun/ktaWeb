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
	document.boardForm.action = "<c:url value='/kwa/menuMgr/menulist.do'/>";
   	document.boardForm.submit();
}
function menuModify(){
	document.boardForm.action = "<c:url value='/kwa/menuMgr/menuModify.do'/>";
   	document.boardForm.submit();
}
function menuBasciModify(){
	document.boardForm.action = "<c:url value='/kwa/menuMgr/menuBasicModify.do'/>";
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
		<form name="boardForm" id="boardForm">
		<input type="hidden" id=menuNo name="menuNo" value="${resultMap.HP_MENU_NO}"/>
		</form>
		
		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
					<div class="pull-left header">
						<h3 class="title">메뉴관리</h3>
					</div>
				</div>
			</div>
		</div>
		
		<div class="box">
			<div class="box-header">
				<span class="title">${resultMap.MENU_NM}</span>
					<ul class="box-toolbar">
					<li>
					
					</li>
				</ul>
			</div>
			<div class="box-content">
				<form class="fill-up">
					<div class="col-lg-6">					
						<div class="row box-section">
							<div class="col-md-3" >게시판 명</div>
							<div class="col-md-9">
							${resultMap.MENU_NM}
								<input type="hidden" id="board_nm" name ="board_nm" value="${resultMap.MENU_NM}" disabled="true"/>
							</div>
						</div>					
						<div class="row box-section">
							<div class="col-md-3" >메뉴위치</div>
							<div class="col-md-9">
							${resultMap.MENU_DESC}
								<input type="hidden" id="desc" name ="desc" placeholder="메뉴위치" value="${resultMap.MENU_DESC}" disabled="true"/>
							</div>
						</div>					
						<div class="row box-section">
							<div class="col-md-3" >파일첨부제한</div>
							<div class="col-md-9">
							${resultMap.FILE_UPLOAD_LIMIT_SIZE}<c:if test='${not empty resultMap.FILE_UPLOAD_LIMIT_SIZE}'>KB</c:if>
								<input type="hidden" id="file_size" name ="file_size" placeholder="파일첨부제한 용량(KB)" value="${resultMap.FILE_UPLOAD_LIMIT_SIZE}<c:if test='${not empty resultMap.FILE_UPLOAD_LIMIT_SIZE}'>KB</c:if>" disabled="true" />
							</div>
						</div>		
						<c:if test="${resultMap.DISPLAY_TYPE != 'NULL'}">
						<c:if test="${not empty resultMap.DISPLAY_TYPE}">
						<div class="row box-section">
							<div class="col-md-3" >게시판 타입</div>
							<div class="col-md-9">
							${resultMap.DISPLAY_TYPE}
								<input type="text" id="hidden" name ="display_type" value="${resultMap.DISPLAY_TYPE}" disabled="true" />
							</div>
						</div>
						</c:if>
						</c:if>			
						<div class="row box-section">
							<div class="col-md-3" >기타 설정</div>
							<div class="col-md-9">	
							<%-- <input type="checkbox" class="icheck" id="adminOnly" name="adminOnly" value="Y" <c:if test='${resultMap.USE_ADMIN_YN eq "Y"}'>checked="checked"</c:if> readonly="readonly"/>
                					<label for="icheck1">관리자 전용</label>&nbsp;&nbsp;&nbsp; --%>
				        	<input type="checkbox" class="icheck"  id="fileYn" name="fileYn" value="Y"  <c:if test='${resultMap.USE_FILE_YN eq "Y"}'>checked="checked"</c:if> disabled="true"/>
                					<label for="icheck1">첨부파일 사용</label>&nbsp;&nbsp;&nbsp;
							<input type="checkbox" class="icheck" id="use_yn" name ="use_yn" <c:if test='${resultMap.USE_YN eq "Y"}'>checked="checked"</c:if> disabled="true" />
								<label for="icheck1">게시판 사용여부</label>&nbsp;&nbsp;&nbsp;
							</div>
						</div>			
					</div>				
					<div class="row box-section">	
					<div class="col-lg-3">
						<div class="panel panel-info">
						  <div class="panel-heading">카테고리</div>
						  <div class="panel-body">
						    <table cellpadding="0" cellspacing="0" border="0" class="table table-hover" id="ctgTbl">
									<tbody id="ctgBody">
									<c:if test="${not empty ctgList }">
										<c:forEach items="${ctgList}" var="ctg" >
										<tr>
										<td>${ctg.CATEGORY_ID}</td>
										<td>${ctg.CATEGORY_NM}</td>
										</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty ctgList }">
										<tr>
										<td>등록된 카테고리가 없습니다.</td>
										</tr>
									</c:if>
									</tbody>
								</table>
						  </div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="panel panel-info">
						  <div class="panel-heading">담당자</div>
						  <div class="panel-body">
						    <table cellpadding="0" cellspacing="0" border="0" class="table table-hover" id="admTbl">
									<tbody id="admBody">
									<c:if test="${not empty authList }">
									<c:forEach items="${authList}" var="adm" >
										<tr>
										<td>${adm.AUTH_NAME}(${adm.AUTH_ID})</td>
										<td>
										<c:forEach items="${auth}" var="auth">
											<c:if test="${auth.CODE == adm.AUTH_TYPE}">${auth.CODE_NM}</c:if>
										</c:forEach>
										</td>
									</tr>
									</c:forEach>
									</c:if>
									<c:if test="${empty authList }">
										<tr>
										<td>등록된 담당자가 없습니다.</td>
										</tr>
									</c:if>
									</tbody>
								</table>
						  	</div>
						</div>
					</div>
					</div>
				</form>
			</div>
		</div>
		
		<div class="col-md-12" >
			<c:choose>
			  <c:when test="${fn:substring(resultMap.HP_MENU_NO, 5, 7) != '00' and fn:substring(resultMap.HP_MENU_NO, 4, 7) != '000' and resultMap.MENU_TYPE eq 'add'}">
			  <p align="right" style="margin-right:20px">
				  <a id="modify" class="btn btn-blue" href="#;" onclick="menuModify();">수정하기</a>
				  <a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
			  </p>
			  </c:when>
			  <c:otherwise>
			  <p align="right" style="margin-right:20px">
				  <a id="basicmodify" class="btn btn-blue" href="#;" onclick="menuBasciModify();">수정하기</a>
				  <a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
			  </p>
			  </c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
	
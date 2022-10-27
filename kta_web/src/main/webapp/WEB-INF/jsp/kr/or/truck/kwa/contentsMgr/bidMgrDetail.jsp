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
	document.boardForm.action = "<c:url value='/kwa/contentMgr/boardList.do'/>";
   	document.boardForm.submit();
}

function contentsModify(){
	document.boardForm.action = "<c:url value='/kwa/contentMgr/contentsModify.do'/>";
   	document.boardForm.submit();
}
function contentsDelete(){
	
	if(!confirm("정말로 게시글을 삭제하시겠습니까?")){
		return false;
	}
	
	document.boardForm.action = "<c:url value='/kwa/contentMgr/contentsDelete.do'/>";
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
		<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post">
			<input type="hidden" id="articleNo" name="articleNo" value="${resultMap.ARTICLE_NO}"/>
			<input type="hidden" id="bmstNo" name="bmstNo" value="${boardNo}"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}"/>
			<form:hidden path="searchCondition"/>
			<form:hidden path="searchWord"/>
		</form:form>
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
							<div class="box">
							<form class="fill-up">
								<div class="box-header">
								<span class="title">입찰공고</span>
									<ul class="box-toolbar">
										<li>
										
										</li>
									</ul>
								</div>
								<div class="box-content">
									<div class="row box-section">
										<div class="col-md-2" >공고번호</div>
										<div class="col-md-4">
											${resultMap.BID_NO}
										</div>										
										<c:if test="${not empty ctgList}">
										<div class="col-md-2" >카테고리</div>
										<div class="col-md-4">
										<c:forEach items="${ctgList}" var="ctg">
											<c:if test="${ctg.CATEGORY_ID == resultMap.CATEGORY}">${ctg.CATEGORY_NM}</c:if>
										</c:forEach>
										</div>
										</c:if>
									</div>							
									<div class="row box-section">
										<div class="col-md-2" >공고시작일</div>
										<div class="col-md-4">
										${fn:replace(resultMap.BID_START_DATE, '-' , '.' )}
										</div>
										<div class="col-md-2" >공고종료일</div>
										<div class="col-md-4">
										${fn:replace(resultMap.BID_END_DATE, '-' , '.' )}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >공고명</div>
										<div class="col-md-4">
											${resultMap.BID_NAME}
										</div>
										<div class="col-md-2" >공고기관</div>
										<div class="col-md-4">
											${resultMap.BID_AGENCY}
										</div>
									</div>								
									<div class="row box-section">
										<div class="col-md-2" >기초금액</div>
										<div class="col-md-4">
											${resultMap.BASE_AMOUNT}
										</div>
										<div class="col-md-2" >낙찰자 선정방법</div>
										<div class="col-md-4">
											${resultMap.BID_WIN_RULE}
										</div>
									</div>									
									<div class="row box-section">
										<div class="col-md-2" >입찰방식</div>
										<div class="col-md-4">
											${resultMap.BID_RULE}
										</div>
										<div class="col-md-2" >계약방식</div>
										<div class="col-md-4">
											${resultMap.CONTRACT_RULE}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >입찰 참가자격</div>
										<div class="col-md-10">
											${resultMap.PQ}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >담당자명</div>
										<div class="col-md-4">
											${resultMap.BID_MANAGER}
										</div>
										<div class="col-md-2" >담당자 연락처</div>
										<div class="col-md-4">
											${resultMap.MANAGER_CALL}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >입찰참가 신청일시</div>
										<div class="col-md-4">
										${fn:replace(resultMap.JOIN_DATE, '-' , '.' )} ${resultMap.JOINTIME}
										</div>
										<div class="col-md-2" >입찰참가 신청장소</div>
										<div class="col-md-4">
											${resultMap.JOIN_PLACE}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >개찰(입찰)방식</div>
										<div class="col-md-4">
											${resultMap.DETAIL_BID_RULE}
										</div>
										<div class="col-md-2" >개찰장소</div>
										<div class="col-md-4">
											${resultMap.BID_PLACE}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2" >사업(현장)설명일시</div>
										<div class="col-md-10">
											${resultMap.EXPLAN_PLACE}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-2">첨부파일</div>
										<div class="col-md-10">
											<c:if test="${not empty resultMap.ATCH_FILE_ID}">
												<c:import url="/com/atch/selectFileInfs.do" charEncoding="utf-8">
													<c:param name="param_atchFileId" value="${resultMap.ATCH_FILE_ID}" />
												</c:import>
								 			</c:if> 
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12" >
			<ul class="padded separate-sections">
				<li align="right">
				  <a id="basicmodify" class="btn btn-blue" href="#;" onclick="contentsModify();">수정하기</a>
				  <a id="basicmodify" class="btn btn-blue" href="#;" onclick="contentsDelete();">삭제하기</a>
				  <a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>	
				</li>
			</ul>
			</div>
		</div>
	</body>
</html>
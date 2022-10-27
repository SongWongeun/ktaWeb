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
function backtoIndex(id){
	document.boardForm.action = "<c:url value='/kwa/memberMgr/staff/list.do'/>";
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
	<form:hidden path="pageIndex" />
	<form:hidden path="category" />
	<form:hidden path="searchKeyword" />
	<form:hidden path="searchCondition" />
	
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
				<div class="pull-left header">
					<h3 class="title">직원 관리</h3>
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
								<span class="title">${result.HANGEUL_NM}</span>
									<ul class="box-toolbar">
										<li>										
										<i class="icon-reply" onclick="backtoIndex();"></i>
										</li>
									</ul>									
								</div>
									<div class="box-content">
										<div class="row box-section">
											<div class="col-md-3" >사원번호 ID</div>
											<div class="col-md-9">
												${result.SAWON_NO}
											</div>
										</div>
										<div class="row box-section">
											<div class="col-md-3" >이름</div>
											<div class="col-md-9">
												 ${result.HANGEUL_NM}
											</div>
										</div>
										<div class="row box-section">
											<div class="col-md-3" >직위</div>
											<div class="col-md-9">
												${result.JICWI_CD}
											</div>
										</div>
										<div class="row box-section">
											<div class="col-md-3" >지부</div>
											<div class="col-md-9">
												 ${result.JIBU_NAME}
											</div>
										</div>
										<div class="row box-section">
											<div class="col-md-3" >주소</div>
											<div class="col-md-9">
												 ${result.SILGEOJU_POST_NO}   ${result.SILGEOJU_JUSO}
											</div>
										</div>
										<div class="row box-section">
											<div class="col-md-3" >지부</div>
											<div class="col-md-9">
												${result.JIBU_NAME}
											</div>
										</div>
										<div class="row box-section">
											<div class="col-md-3" >핸드폰번호</div>
											<div class="col-md-9">
												 ${result.SILGEOJU_TEL_NO}
											</div>
										</div>
										<div class="row box-section">
											<div class="col-md-3" >전화번호</div>
											<div class="col-md-9">
												 ${result.HP_NO}
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
</body>
</html>
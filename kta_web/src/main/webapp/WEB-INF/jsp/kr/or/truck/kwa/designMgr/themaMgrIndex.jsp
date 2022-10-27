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
function themaModify(){
	document.f.action = "<c:out value='/kwa/design/themaModify.do'/>"
	document.f.submit();	
}
</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'update.success'){
		alert('모바일 테마 변경이 완료되었습니다.');
	}	
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
<form:form name="f" id="f" commandName="designVO"  method="post"  enctype="multipart/form-data">
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						테마 관리
					</h3>
				</div>
			</div>
		</div>
	</div>
		<div class="container">
		<div class="col-md-12" >
			<div class="panel panel-primary">
 				<div class="panel-heading">홈페이지 테마 관리</div>
				<div class="panel-body">			
					<div class="row">
 						<div class="col-sm-4 col-lg-4">
							<div class="thumbnail ">
						      <img src="/images/m_truck/main/mobile1.png" style="width:360px;height:435px;"alt=""  class="thumbnail">
						      <div class="caption" id="banner">
						      	<p align="center"><form:radiobutton path="thema" value="1" type="radio"/></p>
						      </div>
						    </div>
					    </div>
 						<div class="col-sm-4 col-lg-4">
							<div class="thumbnail">
						      <img src="/images/m_truck/main/mobile2.png" style="width:360px;height:435px"alt="" class="thumbnail">
						      <div class="caption" id="banner">
						      	<p align="center"><form:radiobutton path="thema" value="2" type="radio"/></p>
						      </div>
						    </div>
					    </div>
 						<div class="col-sm-4 col-lg-4">
							<div class="thumbnail">
						      <img src="/images/m_truck/main/mobile3.png" style="width:360px;height:435px"alt="" class="thumbnail">
						      <div class="caption" id="banner">
						      	<p align="center"><form:radiobutton path="thema" value="3" type="radio"/></p>
						      </div>
							</div>
						</div>
					  </div>
				</div>					
			</div>
			<div class="col-md-2 col-lg-offset-10" >
				  <p align="right">
				  <a id="modify" class="btn btn-blue" href="#;" onclick="themaModify();">적용하기</a>
				  </p>
			</div>
		</div>
		</div>
</form:form>
</div>
</body>
</html>
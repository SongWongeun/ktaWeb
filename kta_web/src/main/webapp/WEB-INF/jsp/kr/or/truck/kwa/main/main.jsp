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

<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">
<meta charset="utf-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<title>KTA Web Admin</title>
<link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#fSubmit').on('click',function(e){
		e.preventDefault();
		if(document.f.id.value == ''){
			alert('id를 입력해주세요.');
			return false;
		}
		if(document.f.password.value == ''){
			alert('password를 입력해주세요.');
			return false;
		}
		document.f.submit();
	});
	
	<%-- 로그인 엔터키 설정--%>
	$('input#password').on('keydown',function(event){
		if( event.keyCode == 13) {
			$('#fSubmit').click();
			return false;
		}
	});
});
</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'password.noUser'){
		alert('아이디 또는 패스워드가 틀렸습니다.');
	}
});
</script>
</c:if>
</head>

<body>

	<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="#;">KTA Web Admin</a>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-md-4 col-md-offset-4"> 
			<div class="padded" style="margin-top: 80px;">
				<h2 style="text-align:center;">KTA Web Admin Login</h2>
			</div>
			<div class="padded" >
				<div class="login box" >
					<div class="box-header">
						<span class="title">로그인</span>
					</div>
					<div class="box-content padded">
						<form id="f" name="f" action="/kwa/actLogin.do" method="post" class="separate-sections">
							<div class="input-group addon-left">
								<span class="input-group-addon" >
									<i class="icon-user"></i>
								</span>
								<input id="id" name="id" type="text" placeholder="id">
							</div>
								<%-- <c:if test="${param.code == 'loginIDPWFail'}">
									<div style="color:red;">id를 입력</div> 
								</c:if> --%>
							<div class="input-group addon-left">
								<span class="input-group-addon" >
									<i class="icon-key"></i>
								</span>
								<input id="password" name="password" type="password" placeholder="password">
							</div>
							
							<div>
								<a id="fSubmit" class="btn btn-blue btn-block" href="#;">
									Login <i class="icon-signin"></i>
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

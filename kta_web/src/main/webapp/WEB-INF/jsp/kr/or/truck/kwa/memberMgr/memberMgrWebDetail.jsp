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
function backtoIndex(id){
	document.boardForm.action = "<c:url value='/kwa/memberMgr/web/list.do'/>";
   	document.boardForm.submit();
}
function initPwd(){
	if(!confirm("비밀번호가 아이디와 동일하게 초기화됩니다. 진행하시겠습니까?")){
		return false;
	}	
	/* var gb = document.boardForm.gb.value;
	if(gb == '조합원'){
		gb ='1';
	}else if(gb == '차량관리자'){
		gb ='2';
	}else{
		gb ='3';
	}
	document.boardForm.gb.value = gb; */
	document.boardForm.action = "<c:url value='/kwa/memberMgr/web/initPwd.do'/>";
   	document.boardForm.submit();
}
function infoModify(){
	//var name = document.boardForm.name.value;
	//var com =document.boardForm.company.value;
	var email =document.boardForm.email.value;
	//var gb = document.boardForm.gb.value;
	var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	/* if(gb == '조합원'){
		gb ='1';
	}else if(gb == '차량관리자'){
		gb ='2';
	}else{
		gb ='3';
	} 
	if(name == ''){
		alert("대표자 성명을 입력해주세요");
		return false;
	}

	if(gb != '2'){
		if(com == ''){
			alert("회사명을 입력해주세요");
			return false;
		}
	}*/
	if(email == ''){
		alert("email을 입력해주세요");
		return false;
	}
	if(email.length<6 || !re.test(email)){
		alert("잘못된 이메일 형식입니다.");
		return false;
	}	
	//document.boardForm.gb.value = gb;
	document.boardForm.action = "<c:url value='/kwa/memberMgr/web/update.do'/>";
   	document.boardForm.submit();
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'regist.success'){
		alert('회원정보 업데이트가 완료되었습니다.');
	}else if(param == 'init.success'){
		alert('비밀번호 초기화가 완료되었습니다.');
	}
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
	<form:form commandName="searchVO" name="boardForm" method="post">
	<form:hidden path="id" id="id"/>
	<form:hidden path="pageIndex" />
	<form:hidden path="category" />
	<form:hidden path="searchKeyword" />
	<form:hidden path="searchCondition" />
	<input type="hidden" name="gb" id="gb" value="${result.GB}"/>
	
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
				<div class="pull-left header">
					<h3 class="title">회원 관리</h3>
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
								<span class="title">${result.NAME }</span>
									<ul class="box-toolbar">
										<li>
										</li>
									</ul>
								</div>
								<div class="box-content">
									<div class="row box-section">
										<div class="col-md-3" >회원 ID</div>
										<div class="col-md-9">
											${result.ID}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >비밀번호</div>
										<div class="col-md-9">
											 <%-- <input type="password" placeholder="PASSWORD" value="${result.PASSWD}" class="form-control" disabled="true" style="width:80%" > --%>
											 <a id="modify" class="btn btn-blue btn-sm" href="#;" onclick="initPwd();">비밀번호초기화</a>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >성명</div>
										<div class="col-md-9">
											<%-- <input type="text" placeholder="NAME" value="${result.NAME}" name="name" id="name" class="form-control" maxlength="20" /> --%>
											${result.NAME}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >회원구분</div>
										<div class="col-md-9">
											<c:if test="${result.GB == '1'}">
												조합원
											</c:if>
											<c:if test="${result.GB == '2'}">
												차량관리자
											</c:if>
											<c:if test="${result.GB == '3'}">
												거래처
											</c:if>
										</div>
									</div>
									<c:if test="${not empty  result.COMNAME}">
									<div class="row box-section">
										<div class="col-md-3" >회사명</div>
										<div class="col-md-9">
											${result.COMNAME}
											<%-- <input type="text" placeholder="회사명" value="${result.COMNAME}" name="company" id="company"  class="form-control"  maxlength="40" readonly/> --%>
										</div>
									</div>
									</c:if>
									<c:if test="${empty  result.COMNAME}">
											<input type="hidden" name="company" id="company"  class="form-control" />
									</c:if>
									<div class="row box-section">
										<div class="col-md-3" >사업자번호</div>
										<div class="col-md-9">
											${fn:substring(result.SAUPNUM, 0, 3)}-${fn:substring(result.SAUPNUM, 3, 5)}-${fn:substring(result.SAUPNUM, 5, 10) }
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >주민등록번호</div>
										<div class="col-md-9">
											${fn:substring(result.JUMINNO,0,6)} - ${fn:substring(result.JUMINNO,6,9)}****
											<%-- ${result.JUMIN1} - ${fn:substring(result.JUMIN2, 0, 3)}**** --%>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >주소</div>
										<div class="col-md-9">
											${fn:substring(result.POST1,0,3)} - ${fn:substring(result.POST1,3,6)} <br/>${result.COMJUSO}
											<%-- ${result.POST1} - ${result.POST1}   ${result.COMJUSO} --%>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >E-Mail</div>
										<div class="col-md-9">
											<input type="text" placeholder="email" value="${result.MAIL}" id="email" name="email" class="form-control"  maxlength="50">
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >전화번호</div>
										<div class="col-md-9">
											<c:if test="${result.CELL1 != null && result.CELL2 != null && result.CELL3 != null}">
												${result.CELL1} ) ${result.CELL2} - ${result.CELL3}
											</c:if>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >휴대폰</div>
										<div class="col-md-9">
											<c:if test="${result.PHONE1 != null && result.PHONE2 != null && result.PHONE3 != null}">
												${result.PHONE1} - ${result.PHONE2} - ${result.PHONE3}
											</c:if>
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" >가입일</div>
										<div class="col-md-9">
											${result.JOINDATE}
										</div>
									</div>
									<div class="row box-section">
										<div class="col-md-3" ></div>
										<div class="col-md-9">
											<p align="right">
											<a id="modify" class="btn btn-blue" href="#;" onclick="infoModify();">회원정보수정</a>
			  								<a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
											</p>
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
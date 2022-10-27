<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	
	
	<%-- 수정 --%>
	$('a#formSubmit').on('click',function(e){
		e.preventDefault();
		
		var pass = $('form#f input#p_password').val();
		var confPass = $('form#f input#p_confirmPassword').val();	
		
		if(pass.length == 8 && confPass.length == 8){
			checkPass(pass,confPass);
		}else{
			alert("비밀번호는 8자리로 입력해주세요.");
		}	
	});
	
	<%-- 취소 --%>
	$('a#formCancel').on('click',function(e){
		e.preventDefault();
		location.href = '/main/index.do';
	});
});

function checkPass(pass,confPass){
	if(pass == confPass){
		savePass();
	}else{
		alert("비밀번호의 값이 동일하지 않습니다.");
		return false;
	}
}
function savePass(){
	document.f.p_password.value = $('form#f input#p_password').val();
	document.f.p_confirmPassword.value = 	$('form#f input#p_confirmPassword').val();	
	document.f.submit();
}
</script>
<style type="text/css">
.formError{display: block;margin: 10px 0px;color: #F00;font-weight: bolder;/* background-color: #FF7; */padding: 5px;}
</style>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s -->
		<c:import url="/common/include/subHeader.do"></c:import>
		<!--// header e -->
		
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2 style="font-size: 38px;font-weight: bolder;color: #143B8F;">만기안내 비밀번호변경</h2>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/mail/check.do" >만기안내 비밀번호 변경</a>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit">
						<br>· 8자의 영문 대소문자, 숫자, 특수문자를 조합하여 사용하실 수 있습니다.</br>
						<br>· 생년월일, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</br>
						<br>· 이전에 사용했던 비밀번호나 타 사이트와는 다른 비밀번호를 사용하고, 비밀번호는 주기적으로 변경해주세요.</br>
						<br>· 변경일 이전에 수신된 메일에는 적용되지 않습니다. </br>
					</p>		
					<p>
						<br/><br/>			
						Tip.비밀번호에 특수문자를 추가하여 사용하시면 기억하기도 쉽고, 비밀번호 안전도가 높아져 도용의 위험이 줄어듭니다.
					</p>
						<br/>
					<div class="conSection">
						<form id="f" name="f" method="post" action="/mail/savePwd.do">
							<input type="hidden" name="saupja_no" id="saupja_no" value="${result[0].SAUPJA_NO}"/>
							<input type="hidden" name="email" id="email" value="${result[0].EMAIL}"/>
							<fieldset>
								<legend>회원정보변경</legend>
								<table class="tbWork_st01" summary="">				
									<colgroup>
										<col width="11%" />
										<col width="14%" />
										<col width="15%" />
										<col width="12%" />
										<col width="15%" />
										<col width="12%" />
										<col width="8%" />
										<col width="13%" />
									</colgroup>
									<thead>
										<tr>
											<th align="center">사업자번호</th>
											<th align="center" >조합원명</th>
											<th align="center" >이메일</th>
											<th align="center" >적용시작일</th>
											<th align="center" >이메일통보사용여부</th>
											<th align="center" >메일수신자</th>
											<th align="center" >관계</th>
											<th align="center" >연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${result}" var="mail">
											<tr>
												<td>${fn:substring(mail.SAUPJA_NO,0,3)}-${fn:substring(mail.SAUPJA_NO,3,5)}-${fn:substring(mail.SAUPJA_NO,5,10)}</td>
												<td>${mail.AGENT_NM}</td>
												<td>${mail.EMAIL}</td>
												<td>${fn:substring(mail.EMAIL_APPLY_SYMD,0,4)}.${fn:substring(mail.EMAIL_APPLY_SYMD,4,6)}.${fn:substring(mail.EMAIL_APPLY_SYMD,6,8)}</td>
												<td><c:if test="${mail.EMAIL_OK_YN == '1'}">동의</c:if><c:if test="${mail.EMAIL_OK_YN == '0'}">미동의</c:if></td>
												<td>${mail.EMAIL_DAMDANG}</td>
												<td>${mail.JOHAP_REL}</td>
												<td>${mail.RPHONE1}-${mail.RPHONE2}- ${mail.RPHONE3}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>									
								<div style="margin-top:30px;" >
									<table class="tbWork_st03" summary="회원정보변경 테이블 입니다.">
										<caption>회원정보변경에 대해서 나타낸 표</caption>
										<colgroup>
											<col width="30%" />
											<col width="70%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">새 비밀번호</th>
												<td>
													<label class="hide" for="p_password">비밀번호</label>
													<input name="p_password" class="txt" id="p_password" type="password" style="width:150px" value=""/>
													<span class="desc02">8자 영문자&#47;숫자 혼용가능</span>
												</td>
											</tr>
											<tr>
												<th scope="row">새 비밀번호 확인</th>
												<td>
													<label class="hide" for="p_confirmPassword">비밀번호 확인</label>
													<input name="p_confirmPassword" class="txt" id="p_confirmPassword" type="password" style="width:150px" value=""/>
													<span class="desc02">비밀번호를 확인 하기 위해 입력하신 비밀번호를 다시 입력하세요</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- 버튼 -->
								<div class="btnboxR clfix">
									<span class="btn_pack btn_type01 icon"><span class="check"></span><a id="formSubmit" href="#;">확인</a></span>
									<span class="btn_pack btn_type10 icon"><span class="check"></span><a id="formCancel" href="#;">취소</a></span>
								</div>
						
							</fieldset>
						</form>
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
	
</body>
</html>
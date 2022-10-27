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
		var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		var saupjaNo = $("#saupja_no1").val().trim()+$("#saupja_no2").val().trim()+$("#saupja_no3").val().trim();
		var emailAdd = $("#email1").val().trim()+"@"+$("#email2").val().trim();
		
		if(saupjaNo.length<10){
			alert("사업자번호를 다시 입력해주세요");		
			return false;
		}     
		if(email.length<6 || !re.test(emailAdd)){
			alert("잘못된 이메일 형식입니다.");
			return false;
		}	
		
		document.f.saupja_no.value = saupjaNo;
		document.f.email.value = emailAdd;	
		document.f.submit();
	});
	
	<%-- 취소 --%>
	$('a#formCancel').on('click',function(e){
		e.preventDefault();
		location.href = '/main/index.do';
	});
});

function setEmailTail(emailValue) {   
	var emailTail = document.f.email2;    
	if ( emailValue == "notSelected" )
	 	return;
	else if ( emailValue == "etc" ) {
		 emailTail.readOnly = false;
		 emailTail.value = "";
		 emailTail.focus();
	} else {
		 emailTail.readOnly = true;
		 emailTail.value = emailValue;
	}    
  }

</script>

<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'user.null'){
		alert('회원정보를 찾을 수 없습니다. 사업자번호와 이메일을 다시확인해주세요');
	}else if(param == 'user.noNull'){
		alert('사업자 번호를 입력해주세요');
	}else if(param == 'user.emailNull'){
		alert('이메일을 입력해주세요');
	}else if(param =='update.success'){
		alert('비밀번호 변경이 완료되었습니다.');
	}
});
</script>
</c:if>
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
					<p class="confirTit" style="height: 150px; padding-bottom: 0px;">
						<img src="/images/truck/etc/email_cont_tit.gif" alt="만기안내 비밀번호 변경입니다. 사업자번호와 이메일주소를 입력하여 주세요" />
						<br>· 기존 사용중인 만기 안내 이메일 주소와 사업자번호를 확인 후 비밀번호를 변경할 수 있습니다.</br>
						<br>· 이메일 주소의 변경은 계약지부 담당자를 통해 가능합니다.</br>
					</p>
					<div class="conSection">
						<form id="f" name="f" method="post" action="/mail/checkUser.do">
						<input type="hidden" id="saupja_no" name="saupja_no" />
						<input type="hidden" id="email" name="email" />
						<fieldset>
						<legend>회원정보변경</legend>
						<table class="tbWork_st03" summary="">				
							<colgroup>
								<col width="30%" />
								<col width="70%" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">사업자번호</th>
									<td>
										<label class="hide" for="saupja_no">사업자번호</label>
										<input name="saupja_no1" class="txt alC" id="saupja_no1" type="text" value="" maxlength="3" style="width:40px;"/>
										<span>&#45;</span>
										<label class="hide" for="idn1">사업자번호 두번째</label>
										<input name="saupja_no2" class="txt alC" id="saupja_no2" type="text" value="" maxlength="2" style="width:30px;"/>
										<span>&#45;</span>
										<label class="hide" for="idn1">사업자번호 세번째</label>
										<input name="saupja_no3" class="txt alC" id="saupja_no3" type="text" value="" maxlength="5" style="width:50px;"/>
										<%-- <span class="desc02">6&#126;8자 영문자&#47;숫자 혼용가능</span>
										<form:errors cssClass="formError" path="password" /> --%>
									</td>
								</tr>
								<tr>
									<th scope="row">이메일주소</th>
									<td>
										<label class="hide" for="email">이메일주소</label>
										<input name="email1" id="email1" type="text"  value="" class="inputSt01" style="width:100px;" />&#64;
										<input name="email2" title="이메일 계정입력" id="email2" type="text"  value="" class="inputSt01" style="width:150px;" />
										<select name="email3" title="이메일 계정 선택" id="email3" onchange="setEmailTail(email3.options[this.selectedIndex].value)">
										    <option value="notSelected" >::선택하세요::</option>
										    <option value="etc">직접입력</option>
										    <c:forEach items="${emailList}" var="email">
										    	<option value="${email.CODE}">${email.CODE_NM}</option>
										    </c:forEach>
									    </select>
									<%-- <span class="desc02">비밀번호를 확인 하기 위해 입력하신 비밀번호를 다시 입력하세요</span>
									<form:errors cssClass="formError" path="confirmPassword" /> --%>
									</td>
								</tr>
							</tbody>
						</table>									
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
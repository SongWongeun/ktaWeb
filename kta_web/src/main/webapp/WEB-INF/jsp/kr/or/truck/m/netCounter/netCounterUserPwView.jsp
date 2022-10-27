<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javascript">
$(document).ready(function(){
	
	<%-- 취소 --%>
	$('a#formCancel').on('click',function(e){
		e.preventDefault();
		location.href = '/m/netCounter/userInfo/view.do';
	});
	
	<%-- 수정 --%>
	$('a#formSubmit').on('click',function(e){
		if(confirm('비밀번호를 변경하시겠습니까?')){
			var passwdConfirm = document.f.passwdConfirm.value;
			var newPasswd = document.f.newPasswd.value;
			var newPasswdConfirm = document.f.newPasswdConfirm.value;
			var agent_cd = document.f.agent_cd.value;
			var id = document.f.id.value;
			
			if(passwdConfirm==""){
				alert('현재 비밀번호 확인을 입력 해주세요.');
				return false;
			}
			if(newPasswd==""){
				alert('새 비밀번호를 입력 해주세요.');
				return false;
			}
			if(newPasswdConfirm==""){
				alert('새 비밀번호 확인을 입력 해주세요.');
				return false;
			}
			if(newPasswd!=newPasswdConfirm){
				alert("새 비밀번호와 새 비밀번호 확인의 값이 일치하지 않습니다.");
				return false;
			}
			$.ajax({
				url: '/netCounter/memberPage/myPage/updateAlterPw.do',
				dataType: "html",
				data : {
					"passwd": passwdConfirm
	    	       , "newPasswd" : newPasswd
	               , "newPasswdConfirm" : newPasswdConfirm
	               , "agent_cd" : agent_cd
	               , "id" : id
				},
				error: function( e) {
				},
				success : function( e ){
					//console.log(e);
					if(e=="false"){
						alert("비밀번호 변경에 실패하였습니다.");
					}else if(e=="true"){
						alert("비밀번호 변경에 성공하였습니다.");
						document.f.passwdConfirm.value = "";
						document.f.newPasswd.value = "";
						document.f.newPasswdConfirm.value = "";
						location.href = '/m/netCounter/userInfo/view.do';
					}else{
						alert(e);
					}
				}
			});
		}
	});
	
});


</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path08">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/netCounter/index.do">인터넷창구</a></li>
			<li><a href="/m/netCounter/userInfo/view.do">회원정보관리</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i08"><img alt="회원정보관리" src="/images/m_truck/subtop/08top_6.png" /></li>
				<li class="txt01">아래 내용을 확인 하신 후, 정확히 입력해 주시기 바랍니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont02 ">
		<form:form id="f" name="f" commandName="joinVO" action="/m/netCounter/userInfo/actUpdate.do">
		<form:hidden path="agent_cd" value="${loginVO.agentCd}"/>
		<form:hidden path="id" value="${loginVO.id}"/>
			<table class="tbSt05 mb0" summary="회원정보관리">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">현재 비밀번호</th>
						<td>
							<div class="cellFirst">
								<span class="cellw3">
								<input type="password" id="passwdConfirm" name="passwdConfirm" class="input" style="width:100%;"  title="현재 비밀번호"  value=""  />
								<form:errors cssClass="formError" path="password" />
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">새 비밀번호</th>
						<td>
							<div class="cellFirst">
								<span class="cellw3">
								<input type="password" id="newPasswd" name="newPasswd" class="input" style="width:100%;"  title="새 비밀번호"  value=""  />
								<form:errors cssClass="formError" path="newPasswd" />
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">새 비밀번호 확인</th>
						<td>
							<div class="cellFirst">
								<span class="cellw3">
								<input type="password" id="newPasswdConfirm" name="newPasswdConfirm" class="input" style="width:100%;"  title="새 비밀번호 확인"  value=""  />
								<form:errors cssClass="formError" path="newPasswdConfirm" />
								</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			</form:form>
			<div class="btn_r_area">
				<a href="#;" id="formCancel" class="btn btn-white">취소</a>
				<a href="#;" id="formSubmit" class="btn btn-black">변경</a>
			</div>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>

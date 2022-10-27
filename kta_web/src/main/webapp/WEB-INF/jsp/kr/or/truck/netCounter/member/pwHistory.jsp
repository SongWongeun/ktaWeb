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
	
	$('a#pwchgSubmit').on('click',function(e){
		if(confirm('비밀번호를 변경하시겠습니까?')){
			var passwdConfirm = document.f2.passwdConfirm.value;
			var newPasswd = document.f2.newPasswd.value;
			var newPasswdConfirm = document.f2.newPasswdConfirm.value;
			var agent_cd = document.f2.agent_cd.value;
			var id = document.f2.id.value;
			var passwd = document.f2.passwd.value;
			var ret=0;
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
			if(passwd != passwdConfirm){
				alert('현재 비밀번호 값이 일치하지 않습니다. 다시 확인하세요.');
			}
			if(newPasswd!=newPasswdConfirm){
				alert("새 비밀번호와 새 비밀번호 확인의 값이 일치하지 않습니다.");
				return false;
			}
			$.ajax({
				async : true
	          , type: 'POST'
	          , url: '/netCounter/memberPage/myPage/updatePw.do'
	          , dataType : 'json'
	          , data : {
	        	  	"passwd": passwdConfirm
	    	       , "newPasswd" : newPasswd
	               , "newPasswdConfirm" : newPasswdConfirm
	               , "agent_cd" : agent_cd
	               , "id" : id
				}
	          , success : function (data) {
	        	  ret=parseInt(data.ret);
					if(ret==0){
						alert("비밀번호 변경에 실패하였습니다.");
					}else if(ret==1){
						alert("비밀번호 변경에 성공하였습니다.");
						document.f2.passwdConfirm.value = "";
						document.f2.newPasswd.value = "";
						document.f2.newPasswdConfirm.value = "";
						$('#pwchgPopupLayer').hide();
						location.href="/login.do?reLoginYN=Y";
					}
			  }, error: function(response, error) {
				  
			  }
			});			
		}
	});
});

var loginId = '${loginVO.id }';
//레이어 팝업 부분
$(document).ready(function(){	
	<%-- 레이어팝업 닫기 --%>
	$('a#closePopup').on('click',function(){
		$('#pwchgPopupLayer').hide();
	});
	$('a#pwchgLayoutOpen').on('click',function(){
		$('#pwchgPopupLayer').show();
	});
	$('a#2weeks').on('click',function(){
		var expdate = new Date();
	    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 14에서 숫자를 조절하면 됨
	    expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 14); // 14일	    
	    setCookie("2weeks", loginId, expdate);
	    location.href="/netCounter/memberPage/myPage/myInfo.do";
	});	
});
</script>

<style type="text/css">
	#pwchgPopupLayer{
		background: url("/images/truck/com/overlay.png") repeat 0% 0%;
		position: fixed;
		left: 0px;
		top: 0px;
		text-align: center;
		z-index: 90000;
		width: 100%;
		height: 100%;
	}
	.changePW {color:#fc8403;font-size:20px;letter-spacing:-1px;font-family:'NanumGothicBold';margin-bottom:15px;}
</style>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/member_tit.gif" alt="비밀번호변경" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>						
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<table class="tbWork_st03" summary="비밀번호 변경안내 테이블 입니다.">
						<caption>비밀변호 변경안내</caption>						
						<tbody>
							<tr>
								<td style="font-size: 20px;">고객님께서는 <span class="changePW">6개월 이상</span> 비밀번호를 변경하지 않으셨습니다.</td>
							</tr>	
							<tr>
								<td style="font-size: 15px;">고객님의 개인정보를 보호하기 위해서는 주기적으로 비밀번호를 변경하는 것이 좋습니다.</td>
							</tr>
						</tbody>
					</table>					
					<div class="btnboxC clfix">
						<span class="btn_pack btn_type11"><a id="pwchgLayoutOpen" href="#;">지금 변경하기</a></span>
						<span class="btn_pack btn_type14"><a id="later" href="/netCounter/memberPage/myPage/myInfo.do?nextGb=N">다음에 변경하기</a></span>
						<span class="btn_pack btn_type14"><a id="2weeks" href="#;">2주간 표시안함</a></span>
					</div>	
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
		
		
		<!-- 비밀번호변경부분(레이어팝업) -->
		<div id="pwchgPopupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"><a id="closePopup" href="#;"><img src="/images/truck/com/close.gif" alt="팝업창닫기"></a></p>
					<p class="layerTit">비밀번호 변경</p>
					<p class="layerTxt">
						변경할 비밀번호를 입력해 주세요.&#46;<br/> 
					</p>
					<div class="layerA">
						<form id="f2" name="f2" method="post" action="/join/input/regist.do">
						<input type="hidden" id="agent_cd" name="agent_cd" value="${loginVO.agentCd}"/>
						<input type="hidden" id="id" name="id" value="${loginVO.id }"/>
						<input type="hidden" id="passwd" name="passwd" value="${loginVO.password }"/>
							<table class="tbIn_st01" style="">
								<caption>비밀번호 변경</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:70%;" />
								</colgroup>
								<tbody>
									<tr style="height: 40px;">
										<th>
											현재 비밀번호 확인
										</th>
										<td>
											<input name="passwdConfirm" class="txt" id="passwdConfirm" type="password" value="" style="width:90%;"/>
										</td>
									</tr>
									<tr id="cert_saup" style="height: 40px;">
										<th>
											새 비밀번호
										</th>
										<td>
											<input name="newPasswd" class="txt" id="newPasswd" type="password" value="" style="width:90%;"/>
										</td>
									</tr>
									<tr id="jibuSelect" style="height: 40px;">
										<th>
											새 비밀번호 확인
										</th>
										<td>
											<input name="newPasswdConfirm" class="txt" id="newPasswdConfirm" type="password" value="" style="width:90%;"/>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btnboxC clfix">
								<span class="btn_pack btn_type16"><a id="pwchgSubmit" href="#;">확인</a></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 비밀번호변경부분(레이어팝업) 종료 -->
		
	</div>
	<!-- //wrap e -->
	
</body>
</html>




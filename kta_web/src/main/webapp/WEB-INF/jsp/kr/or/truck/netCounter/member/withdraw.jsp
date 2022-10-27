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

<c:if test="${err != null}">
	<script>
		alert("비밀번호가 일치 하지 않습니다.");
	</script>
</c:if>
<script type="text/javascript">
	$(document).ready(function(){
		$("#withdrawCheckPasswd").on('click', function(){
			$('form#withdrawForm').submit();
		});
		
		<%-- 엔터키 설정--%>
		$('form#withdrawForm input[name="checkPasswd"]').on('keydown',function(event){
			if( event.keyCode == 13) {
				$('#withdrawCheckPasswd').click();
				return false;
			}
		});
	});	
</script>

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
				<!-- 20161201 신규 -->
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/join_out.gif" alt="회원탈퇴" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="#">인터넷창구</a>
						<a href="#">회원정보관리</a>
						<span>회원탈퇴</span>
					</div>
				</div><!--// conTitle e -->

				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/join_con_out.gif" alt="아래 내용을 확인하신 후, 정확히 입력해 주시기 바랍니다." /></p>

					<div class="roundBox mT35">
						<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
						<!-- 내용 -->
						<div class="outArea">
							<div class="txt">
								<h3>비밀번호를 입력하여 주세요.</h3>
								<span>본인확인을 위하여 비밀번호를 확인 후<br />탈퇴처리를 진행하고 있습니다.</span>
							</div>
							<div class="pw">
							<form id="withdrawForm" name="withdrawForm" action="/netCounter/memberPage/myPage/withdraw.do" method="post">
								<label>
									<strong>비밀번호</strong>
									<input name="checkPasswd" class="txt" id="checkPasswd" type="password" style="width:203px" />
								</label>
								<a href="#" id="withdrawCheckPasswd"><img src="/images/truck/btn/btn_comfirm.gif" alt="확인" /></a>
							</form>
							</div>
							<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
					</div>
					<div class="joinHelp">
						<span class="mB10">전국화물공제조합은 회원님의 개인정보 보호를 위해 항상 노력하고 있으며, 제3자에게 회원정보가 누출되지 않도록 노력하고 있습니다.</span>
						<span>회원 탈퇴 시 30일간 재가입이 불가능하며, 가입 시 입력한 고유정보(아이디 및 가입일자 등)는 30일 이후 완전 폐기 됩니다.</span>
					</div>
				</div><!--// conaArea e -->
				<!-- //20161201 신규 -->

			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>	
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>




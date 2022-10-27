<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
</head>
<body>
	<!---- 팝업크기 width700px height480px ----->
	<div id="guidePop">
		<div class="pinfoTit">
			<h2>고객정보보호 방법 안내</h2>
		</div>
		<div class="pinfoBox">
			<div class="roundBox">
				<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
				<!-- 내용 -->
				<div class="pinfoArea">
					<p>공인인증서&#44; 보안카드&#44; 비밀번호등을 인터넷 포탈사이트의 메일함이나 웹하드에 보관한경우&#44; 이 정보가 해킹당하여 금융사고가 발생할 수 있으므로 보다 안전한 전자금융거래를 위해 다음과 같이 금융감독원의 대응요령을 안내 드립니다&#46;</p>
				</div>
				<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
			</div><!--// roundBox e -->
			<ul class="pinfoLi clfix">
				<li>공인인증서&#44; 보안카드&#44; 비밀번호 등을 인터넷&#40;메일함&#44; 웹하드 등&#41;상에 보관하지 않음&#46;</li>
				<li>보관중인 경우 즉시 삭제하고&#44; 거래은행을 방문하여 보안카드 재발급&#46;</li>
				<li>공인인증서를 복사하거나 보안카드를 스캔 또는 촬영하여 인터넷상에 보관하지 않음&#46;</li>
				<li>공인인증서는 PC의 하드디스크보다 USB 등 이동식저장매체에 안전하게 보관&#46;</li>
				<li>인터넷뱅킹 ID&#44; 비밀번호는 일반 인터넷사이트의 ID&#44; 비밀번호와 다르게 설정하여 사용&#46;</li>
				<li>일회용비밀번호&#40;OTP&#41;&#44; 보안토큰&#40;HSM&#41;&#44; 전화인증등 보다 안전한 거래수단 사용&#46;</li>
				<li>발급받은 지 오래된 보안카드는 재발급하여 사용&#46;</li>
				<li>입출금 이체 &#183; 공인인증서 재발급 사실 등을 휴대폰으로 즉시 알려주는 휴대폰문자 서비스&#46;</li>
				<li>&#40;SMS&#41;를 가입하여 이용&#46;</li>
				<li>예금인출 사고를 당한 경우 즉시 해당 은행에 신고하고 출금정지 요청&#46;</li>
			</ul>
		</div>
	</div>
</body>
</html>
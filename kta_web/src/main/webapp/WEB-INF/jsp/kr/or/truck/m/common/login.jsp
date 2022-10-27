<%@page import="NiceID.Check.CPClient"%>
<%@page import="Kisinfo.Check.IPINClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<%

	/************************************
	휴대폰 본인인증 서비스 ( 안심본인인증)
	
	*********************************** */
    CPClient niceCheck = new  NiceID.Check.CPClient();
    
    String sSiteCodeHp = "G5143";				// NICE로부터 부여받은 사이트 코드
    String sSitePasswordHp = "WO2VPY6UTLBU";		// NICE로부터 부여받은 사이트 패스워드
    
    String sRequestNumberHp = "REQ0000000001";        	// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
                                                    	// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
    sRequestNumberHp = niceCheck.getRequestNO(sSiteCodeHp);
  	session.setAttribute("REQ_SEQ_HP" , sRequestNumberHp);	// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthTypeHp = "M";      	// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
   	
   	String popgubunHp 	= "N";		//Y : 취소버튼 있음 / N : 취소버튼 없음
	String customizeHp 	= "Mobile";			//없으면 기본 웹페이지 / Mobile : 모바일페이지
		
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
    //String sReturnUrl = "http://localhost:8080/checkplus_success.do";      // 성공시 이동될 URL
    //String sErrorUrl = "http://localhost:8080/checkplus_fail.do";          // 실패시 이동될 URL
    String sReturnUrlHp = "http://"+request.getServerName()+"/checkplus_success.do?t=m";      // 성공시 이동될 URL
    String sErrorUrlHp = "http://"+request.getServerName()+"/checkplus_fail.do?t=m";          // 실패시 이동될 URL

    // 입력될 plain 데이타를 만든다.
    String sPlainDataHp = "7:REQ_SEQ" + sRequestNumberHp.getBytes().length + ":" + sRequestNumberHp +
                        "8:SITECODE" + sSiteCodeHp.getBytes().length + ":" + sSiteCodeHp +
                        "9:AUTH_TYPE" + sAuthTypeHp.getBytes().length + ":" + sAuthTypeHp +
                        "7:RTN_URL" + sReturnUrlHp.getBytes().length + ":" + sReturnUrlHp +
                        "7:ERR_URL" + sErrorUrlHp.getBytes().length + ":" + sErrorUrlHp +
                        "11:POPUP_GUBUN" + popgubunHp.getBytes().length + ":" + popgubunHp +
                        "9:CUSTOMIZE" + customizeHp.getBytes().length + ":" + customizeHp;
    
    String sMessageHp = "";
    String sEncDataHp = "";
    
    int iReturnHp = niceCheck.fnEncode(sSiteCodeHp, sSitePasswordHp, sPlainDataHp);
    if( iReturnHp == 0 )
    {
        sEncDataHp = niceCheck.getCipherData();
    }
    else if( iReturnHp == -1)
    {
        sMessageHp = "암호화 시스템 에러입니다.";
    }    
    else if( iReturnHp == -2)
    {
        sMessageHp = "암호화 처리오류입니다.";
    }    
    else if( iReturnHp == -3)
    {
        sMessageHp = "암호화 데이터 오류입니다.";
    }    
    else if( iReturnHp == -9)
    {
        sMessageHp = "입력 데이터 오류입니다.";
    }    
    else
    {
        sMessageHp = "알수 없는 에러 입니다. iReturn : " + iReturnHp;
    }
%>

<%
	/********************************************************************************************************************************************
		NICE신용평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		서비스명 : 가상주민번호서비스 (IPIN) 서비스
		페이지명 : 가상주민번호서비스 (IPIN) 호출 페이지
	*********************************************************************************************************************************************/
	
	String sSiteCodeIpin				= "H708";			// IPIN 서비스 사이트 코드		(NICE신용평가정보에서 발급한 사이트코드)
	String sSitePwIpin					= "35320687";			// IPIN 서비스 사이트 패스워드	(NICE신용평가정보에서 발급한 사이트패스워드)
	
	
	/*
	┌ sReturnURL 변수에 대한 설명  ─────────────────────────────────────────────────────
		NICE신용평가정보 팝업에서 인증받은 사용자 정보를 암호화하여 귀사로 리턴합니다.
		따라서 암호화된 결과 데이타를 리턴받으실 URL 정의해 주세요.
		
		* URL 은 http 부터 입력해 주셔야하며, 외부에서도 접속이 유효한 정보여야 합니다.
		* 당사에서 배포해드린 샘플페이지 중, ipin_process.jsp 페이지가 사용자 정보를 리턴받는 예제 페이지입니다.
		
		아래는 URL 예제이며, 귀사의 서비스 도메인과 서버에 업로드 된 샘플페이지 위치에 따라 경로를 설정하시기 바랍니다.
		예 - http://www.test.co.kr/ipin_process.jsp, https://www.test.co.kr/ipin_process.jsp, https://test.co.kr/ipin_process.jsp
	└────────────────────────────────────────────────────────────────────
	*/
	String sReturnURLIpin				= "http://"+request.getServerName()+"/ipin_process.do?t=m";
	
	
	/*
	┌ sCPRequest 변수에 대한 설명  ─────────────────────────────────────────────────────
		[CP 요청번호]로 귀사에서 데이타를 임의로 정의하거나, 당사에서 배포된 모듈로 데이타를 생성할 수 있습니다.
		
		CP 요청번호는 인증 완료 후, 암호화된 결과 데이타에 함께 제공되며
		데이타 위변조 방지 및 특정 사용자가 요청한 것임을 확인하기 위한 목적으로 이용하실 수 있습니다.
		
		따라서 귀사의 프로세스에 응용하여 이용할 수 있는 데이타이기에, 필수값은 아닙니다.
	└────────────────────────────────────────────────────────────────────
	*/
	String sCPRequestIpin				= "";
	
	
	
	// 객체 생성
	IPINClient pClient = new IPINClient();
	
	
	// 앞서 설명드린 바와같이, CP 요청번호는 배포된 모듈을 통해 아래와 같이 생성할 수 있습니다.
	sCPRequestIpin = pClient.getRequestNO(sSiteCodeIpin);
	
	// CP 요청번호를 세션에 저장합니다.
	// 현재 예제로 저장한 세션은 ipin_result.jsp 페이지에서 데이타 위변조 방지를 위해 확인하기 위함입니다.
	// 필수사항은 아니며, 보안을 위한 권고사항입니다.
	session.setAttribute("CPREQUEST" , sCPRequestIpin);
	
	
	// Method 결과값(iRtn)에 따라, 프로세스 진행여부를 파악합니다.
	int iRtnIpin = pClient.fnRequest(sSiteCodeIpin, sSitePwIpin, sCPRequestIpin, sReturnURLIpin);
	
	String sRtnMsgIpin					= "";			// 처리결과 메세지
	String sEncDataIpin					= "";			// 암호화 된 데이타
	
	// Method 결과값에 따른 처리사항
	if (iRtnIpin == 0)
	{
	
		// fnRequest 함수 처리시 업체정보를 암호화한 데이터를 추출합니다.
		// 추출된 암호화된 데이타는 당사 팝업 요청시, 함께 보내주셔야 합니다.
		sEncDataIpin = pClient.getCipherData();		//암호화 된 데이타
		
		sRtnMsgIpin = "정상 처리되었습니다.";
	
	}
	else if (iRtnIpin == -1 || iRtnIpin == -2)
	{
		sRtnMsgIpin =	"배포해 드린 서비스 모듈 중, 귀사 서버환경에 맞는 모듈을 이용해 주시기 바랍니다.<BR>" +
					"귀사 서버환경에 맞는 모듈이 없다면 ..<BR><B>iRtn 값, 서버 환경정보를 정확히 확인하여 메일로 요청해 주시기 바랍니다.</B>";
	}
	else if (iRtnIpin == -9)
	{
		sRtnMsgIpin = "입력값 오류 : fnRequest 함수 처리시, 필요한 4개의 파라미터값의 정보를 정확하게 입력해 주시기 바랍니다.";
	}
	else
	{
		sRtnMsgIpin = "iRtn 값 확인 후, NICE신용평가정보 개발 담당자에게 문의해 주세요.";
	}

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" >
window.name ="Parent_window";

$(document).ready(function(){
	<%-- IPIN 로그인 submit event --%>
	$('a#alinkIpin').on('click',function(e){
		e.preventDefault();
		var agentCd = $('section#content div.userCh input#agentCd:checked').val();
		if( !/[1|2|3]/g.test( agentCd ) ) {
			alert('회원유형을 선택해 주세요.');
			return false;
		}
		
		window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_ipin.target = "popupIPIN2";
		document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
		document.form_ipin.param_r1.value = agentCd;
		document.form_ipin.submit();
	});
	
	<%-- hp 로그인 submit event --%>
	$('a#alinkHp').on('click',function(e){
		e.preventDefault();
		var agentCd = $('section#content div.userCh input#agentCd:checked').val();
		if( !/[1|2|3]/g.test( agentCd ) ) {
			alert('회원유형을 선택해 주세요.');
			return false;
		}
		window.open('', 'popupChkHp', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChkHp";
		document.form_chk.param_r1.value = agentCd;
		document.form_chk.submit();
	});
	
	<%-- id/pw 로그인 submit event --%>
	$('a#loginSubmit').on('click',function(e){
		e.preventDefault();
		
		var agentCd = $('section#content div.userCh input#agentCd:checked').val();
		if( !/[1|2|3]/g.test( agentCd ) ) {
			alert('회원유형을 선택해 주세요.');
			return false;
		}
		if( $('#fIdpw #id').val() == '' ) {
			alert('ID를 입력해주세요.');
			return false;
		}
		if( $('#fIdpw #password').val() == '' ) {
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		if(document.fIdpw.loginIdSaveAt.checked){
			setCookie('loginIdSaveAt', 'true', 365);
			setCookie('loginIdSaveId', $('#fIdpw #id').val(), 365);
		}else{
			setCookie('loginIdSaveAt', '', -1);
			setCookie('loginIdSaveId', '', -1);
		}
		$('form#fIdpw').submit();
	});
	
	<%-- 임시
	$('#fIdpw #agentCd').on('change',function(){
		var a = $('#fIdpw #agentCd:checked').val();
		
		switch (a) {
		case '1':
			$('#fIdpw input#id').val('yyctsco');
			$('#fIdpw input#password').val('yyctsco');
			break;
		case '2':
			$('#fIdpw input#id').val('lake1492');
			$('#fIdpw input#password').val('11co2p');
			break;
		case '3':
			$('#fIdpw input#id').val('handw0');
			$('#fIdpw input#password').val('8654001');
			break;
		}
	}); --%>
	
	
	if(getCookie('loginIdSaveAt')=='true'){
		document.fIdpw.loginIdSaveAt.checked = 'true';
		document.fIdpw.id.value = getCookie('loginIdSaveId');
	}
	
});
</script>
<c:if test="${param.code == 'noLegacy'}">
<script type="text/javascript">
$(window).load(function(){
	alert('가입된 조합원정보와 홈페이지정보가 \n일치하지 않습니다.\n\n[홈페이지 문의] \n02-3483-3800 \nweb_master@truck.or.kr');
});
</script>
</c:if>
<c:if test="${param.code == 'loginIPINFail' || param.code == 'loginHPFail' || param.code == 'loginNAMEFail'}">
<script type="text/javascript">
$(window).load(function(){
	alert('화물공제조합에 등록되지 않은 사용자입니다.');
});
</script>
</c:if>
<c:if test="${param.code == 'loginIDPWFail'}">
<script type="text/javascript">
$(window).load(function(){
	alert('화물공제조합에 등록되지 않은 아이디이거나, \n아이디 또는 비밀번호를 잘못 입력하셨습니다.');
});
</script>
</c:if>
<c:if test="${param.code == 'certFail'}">
<script type="text/javascript">
$(window).load(function(){
	alert('공인인증서 로그인 오류입니다.');
});
</script>
</c:if>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path07">
		<ul>
			<li class="depth02"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li><a href="/m/login.do">로그인</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<form id="fIdpw" name="fIdpw" action="/actIdpwLogin.do" method="post">
				<input type="hidden" id="t" name="t" value="m"/>
				<article class="contentSubTitle">
					<div class="userB"><h2 class="user"><span class="userIcon"><img src="/images/m_truck/com/icon_30.png" alt="userIcon" /></span>회원유형을 먼져 선택 하신 후, 인증해 주세요.</h2></div>
					<div class="userCh">
						<span class="cellw6"><input id="agentCd" name="agentCd" value="1" type="radio" class="" ><label for="">조합원</label></span>
						<span class="cellw6"><input id="agentCd" name="agentCd" value="2" type="radio" class="" ><label for="">차량관리자</label></span>
						<span class="cellw6"><input id="agentCd" name="agentCd" value="3" type="radio" class="" ><label for="">거래처</label></span>
					</div>
				</article><!--// 회원유형선택 -->
				<article class="tabWrap">
					<!-- tab -->
					<div class="tabmenu">
						<ul >
							<!-- <li class="tab1 on"><a href="#;">핸드폰인증</a></li>
							<li class="tab2"><a href="#;">아이핀인증</a></li> -->
							<li class="tab1"><a href="#;">웹로그인</a></li>
						</ul>
					</div>

					<!-- 웹로그인 -->
					<div class="con1">
						<div class="loginBox">
							<p class="txt">
								<input type="text" id="id" name="id" style="width:100%;" class="input" placeholder="아이디">
							</p>
							<p class="txt">
								<input id="password" name="password" title="비밀번호" style="width:100%;" class="input" type="password"  placeholder="비밀번호">
							</p>
							<a id="loginSubmit" class="btn" href="#;">로그인</a>
							<div class="cellFirst"><input name="loginIdSaveAt" id="loginIdSaveAt" value="Y" type="checkbox" class=""><label for="">아이디 저장</label>
							</div>
						</div>
					</div>
					<!-- 아이핀인증 -->
					<div class="con2">
						<div class="userLogin">
							<p class="authBox02"><a id="alinkIpin" href="#;">아이핀 인증</a></p>
							<p class="txtSt02">공제계약 회원님께서는 인증서 로그인을 권장합니다.<br>다소 번거로우시더라도 양해 부탁 드립니다.</p>
						</div>
					</div>
					<!-- 핸드폰인증 -->
					<div class="con3">
						<div class="userLogin">
							<p class="authBox"><a id="alinkHp" href="#;">휴대폰 인증</a></p>
							<p class="txtSt02">공제계약 회원님께서는 인증서 로그인을 권장합니다.<br>다소 번거로우시더라도 양해 부탁 드립니다.</p>
						</div>
					</div>
			
				</article>
				<!-- 로그인설명 -->
				<article class="subdex">
					<p class="txt01">기존의 웹사이트 로그인 (아이디,비밀번호)를 보유하고 계신 고객님께서는 기존 로그인 정보로 인증 후, 서비스 이용이 가능하십니다</p>
					<p class="txt01">회원가입, 아이디찾기, 비밀번호 재설정은 PC버전을 이용해 주세요.</p>
				</article>
		</form>
	</section>
	<!--// content e -->
	<%-- hp 인증 팝업에서 사용 --%>
	<form id="fHpResult" name="fHpResult" method="post" >
		<input type="hidden" name="EncodeData">								<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
	    <input type="hidden" name="param_r1" value="">
	    <input type="hidden" name="param_r2" value="">
	    <input type="hidden" name="param_r3" value="">
	</form>
	<form id="form_chk" name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		<input type="hidden" name="EncodeData" value="<%= sEncDataHp %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	    <input type="hidden" name="param_r1" value="">
	    <input type="hidden" name="param_r2" value="">
	    <input type="hidden" name="param_r3" value="">
	</form>
	<%-- ipin 인증 팝업에서 사용 --%>
	<form name="form_ipin" method="post">
		<input type="hidden" name="m" value="pubmain" />						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	    <input type="hidden" name="enc_data" value="<%= sEncDataIpin %>" />		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	    <input type="hidden" name="param_r1" value="" />
	    <input type="hidden" name="param_r2" value="" />
	    <input type="hidden" name="param_r3" value="" />
	</form>
	<form name="vnoform" method="post">
		<input type="hidden" name="enc_data" />								<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
	    <input type="hidden" name="param_r1" value="" />
	    <input type="hidden" name="param_r2" value="" />
	    <input type="hidden" name="param_r3" value="" />
	</form>
	
	
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>










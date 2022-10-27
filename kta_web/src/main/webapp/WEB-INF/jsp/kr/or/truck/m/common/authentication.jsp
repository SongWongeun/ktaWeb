<%@page import="NiceID.Check.CPClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<%

	String rURL = (String)request.getParameter("rURL");// 본인인증 후 이동할 URL.  url encoding 되어있음.
	
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

<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" >
window.name ="Parent_window";

$(document).ready(function(){
	<%-- hp 로그인 submit event --%>
	$('a#alinkHp').on('click',function(e){
		e.preventDefault();
		window.open('', 'popupChkHp', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChkHp";
		document.form_chk.param_r1.value = 'authenticate';
		document.form_chk.param_r2.value = '<%=rURL%>';
		document.form_chk.param_r3.value = 'HP';
		document.form_chk.submit();
	});
});
</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!-- content s -->
	<section id="content">
		<!-- 본인인증 -->
		<div class="userLogin">
			<h2>회원인증</h2>
			<p class="txtSt01">본 서비스는 본인 인증 후,<br/>이용 가능합니다.</p>
			<p class="authBox"><a id="alinkHp" href="#;">휴대폰 인증</a></p>
			<p class="txtSt02">고객님의 의견을 잘 반영하기 위한<br/>실명확인절차 입니다.<br/>다소 번거로우시더라도 양해 부탁 드립니다.</p>
		</div>
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
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
<%@page import="crosscert.Hash"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="Kisinfo.Check.IPINClient"%>
<%@page import="NiceID.Check.CPClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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
	String customizeHp 	= "";			//없으면 기본 웹페이지 / Mobile : 모바일페이지
		
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
    //String sReturnUrl = "http://localhost:8080/checkplus_success.do";      // 성공시 이동될 URL
   	//String sErrorUrl = "http://localhost:8080/checkplus_fail.do";          // 실패시 이동될 URL
    //String sReturnUrlHp = "https://localhost:8080/checkplus_success.do";      // 성공시 이동될 URL
    //String sErrorUrlHp = "https://localhost:8080/checkplus_fail.do";          // 실패시 이동될 URL
    

     String sReturnUrlHp = "https://"+request.getServerName()+"/checkplus_success.do";      // 성공시 이동될 URL
     String sErrorUrlHp = "https://"+request.getServerName()+"/checkplus_fail.do";          // 실패시 이동될 URL


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
	String sReturnURLIpin				= "https://"+request.getServerName()+"/ipin_process.do";
	//String sReturnURLIpin				= "https://localhost:8080/ipin_process.do";
	
	
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


<%
// 공인인증서 관련 


	Calendar cal = Calendar.getInstance();
	Date currentTime=cal.getTime();
	
	/* 서명시 서명원본을 구성하기 현재 시간을 구해옴.
	   구해진 현재시간에서 해쉬값을 추출함.
	*/
	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd-hh:mm:ss");
	String timestr=formatter.format(currentTime);
	//out.print("출력결과 : "+timestr);

	
	int nRet;
	String Origin_data = ""; 
	if( "m.truck.or.kr".equals( request.getServerName() ) || "www.truck.or.kr".equals( request.getServerName() ) || "210.92.214.206".equals( request.getServerName() ) || "192.1.60.6".equals( request.getServerName() )){
		Hash hash = new Hash();
		nRet = hash.GetHash(timestr.getBytes(), timestr.getBytes().length);		
		if(nRet==0) 
		{
			Origin_data = new String(hash.contentbuf);
		}
		else
		{
			Origin_data = "abcdefghijklmnopqrstuvwxyz1234567890"; 
		}
	}
	  String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
	  response.setHeader("Pragma-directive", "no-cache");
	  response.setHeader("Cache-directive", "no-cache");
	  response.setHeader("Pragma", "no-cache");
	  response.setHeader("Cache-Control", "no-cache");
	  response.setDateHeader("Expires",0);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript" src="/js/commonFunction.js" ></script>
<script language="javascript" src="/cert/init.js"></script>

<c:choose>
	<c:when test="${param.idpwFailCount != null}">
		<script type="text/javascript">
			var idpwFailCount = ${param.idpwFailCount};
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			var idpwFailCount = 0;
		</script>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
window.name ="Parent_window";

$(document).ready(function(){
	
	//$('div.supportCont.clfix.cert').show();
	$('div.supportCont.clfix.cert').hide();
	$('div.supportCont.clfix.idpw').hide();
	//$('div.supportCont.clfix.idpw').hide();
	
	/* -- 2016.12.08 [HYEON] 추가 -- */
	if(idpwFailCount >=1){
		$("#idpwFailCount").val(idpwFailCount);
	}
	
	if(idpwFailCount >=3){
		changeCaptcha(); //Captcha Image 요청
		$('div.capchaBox').show();
		  
		$('#reLoad').click(function(){ changeCaptcha(); }); //'새로고침'버튼의 Click 이벤트 발생시 'changeCaptcha()'호출
		$('#soundOn').click(function(){ audioCaptcha(); }); //'음성듣기'버튼의 Click 이벤트 발생시 'audioCaptcha()'호출 
	} else {
		$('div.capchaBox').hide();
	}/*-- 2016.12.08 [HYEON] -- */
	
	/* -- 2016.12.16 [HYEON] 추가 -- */
	$("#memTarger").click(function(){
		document.faqNoticeView.articleNo.value='FAQST_00000000000033';
		document.faqNoticeView.submit();
	});
	$("#noJoin").click(function(){
		document.faqNoticeView.articleNo.value='FAQST_00000000000034';
		document.faqNoticeView.submit();
	});
	$("#howContact").click(function(){
		document.faqNoticeView.articleNo.value='FAQST_00000000000035';
		document.faqNoticeView.submit();
	});
	
	
	<%-- IPIN 로그인 submit event --%>
	$('a#alinkIpin').on('click',function(e){
		e.preventDefault();
		/* 2016.12.07 [HYEON] 주석처리함
		var agentCd = $('div.supportCont.clfix.cert input#agentCd:checked').val();
		if( !/[1|2|3]/g.test( agentCd ) ) {
			alert('회원유형을 선택해 주세요.'); 
			return false;
		}*/
		
		window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_ipin.target = "popupIPIN2";
		document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
		//document.form_ipin.param_r1.value = agentCd; -- 2016.12.07 [HYEON] 주석처리함
		document.form_ipin.submit();
	});
	
	<%-- hp 로그인 submit event --%>
	$('a#alinkHp').on('click',function(e){
		e.preventDefault();
		/*  2016.12.02 [H] 주석처리함
		var agentCd = $('div.supportCont.clfix.cert input#agentCd:checked').val();
		if( !/[1|2|3]/g.test( agentCd ) ) {
			alert('회원유형을 선택해 주세요.');
			return false;
		} */
		window.open('', 'popupChkHp', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChkHp";
		// document.form_chk.param_r1.value = agentCd; -- 2016.12.02 [H] 주석처리함
		document.form_chk.submit();
	});
	
	<%-- id/pw 로그인 submit event --%>
	$('#fIdpw div.logCont02 p.btn_login a').on('click',function(e){
		e.preventDefault();
		
		
		/* 2016.12.01 [H]  주석처리
		if( !/[1|2|3]/g.test( $('#fIdpw #agentCd:checked').val() ) ) {
			alert('회원유형을 선택해 주세요.');
			return false;
		}  */
		
		if( $('#fIdpw #id').val() == '' ) {
			alert('ID를 입력해주세요.');
			return false;
		}
		if( $('#fIdpw #password').val() == '' ) {
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		
		if( $('div.capchaBox').is(':hidden')){
			$('form#fIdpw').submit();
		}
		
		/* -- 2016.12.08 [HYEON] captcha 부분 끌어옴 -- */	
		if( $('div.capchaBox').is(':visible')){
	      if ( !$('#answer').val() ) {
	           alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
	      } else {
	           $.ajax({
	               url: '/CaptchaSubmit.do',
	               type: 'POST',
	               dataType: 'text',
	               data: 'answer=' + $('#answer').val(),
	               async: false,  
	               success: function(resp) {
	                    //alert(resp);
	                    
	                    if (resp.trim() == 'Y') {
	                    	$('form#fIdpw').submit(); /* -- 2016.12.08 [HYEON] SUCCESS 부분 & CaptchaSubmit.jsp "일치하지않습니다" -> "N" 이런식으로 수정 -- */
	                    }else{
		                   $('#reLoad').click();
			               $('#answer').val('');
	                    }
	              }
	         });
	      }
		}
		
	/* 	if(document.fIdpw.loginIdSaveAt.checked){
			setCookie('loginIdSaveAt', 'true', 365);
			setCookie('loginIdSaveId', $('#fIdpw #id').val(), 365);
		}else{
			setCookie('loginIdSaveAt', '', -1);
			setCookie('loginIdSaveId', '', -1);
		} */
		
	});

	<%-- 공인인증서 로그인 submit event --%>
	$('a#alinkCert').on('click',function(e){
		e.preventDefault();
		var agt = navigator.userAgent.toLowerCase();
		if (agt.indexOf("msie") != -1 || agt.indexOf("trident") != -1 ) {
			if (CC_Object_id.object == null) {
				location="/cert/manual_install.jsp" //수동설치
			}
		}else{
			alert('Internet Explorer에서만 사용하실 수 있습니다.');
			return false;
		}
		

		
		/* 2016.12.07 [HYEON] 주석처리함
		var agentCd = $('div.supportCont.clfix.cert input#agentCd:checked').val();
		if( !/[1|2|3]/g.test( agentCd ) ) {
			alert('회원유형을 선택해 주세요.');
			return false;
		} */

		$('#certPopupLayer').show();
	});
	$('a#certSubmit').on('click',function(e){
		e.preventDefault();
		// var agentCd = $('div.supportCont.clfix.cert input#agentCd:checked').val(); -- 2016.12.07 [HYEON] 주석처리함
		var idn = $('input#idn1').val()+$('input#idn2').val();
		var selectCert = $('input[name="selectCert"]:checked').val();
		
	/* 2016.12.07 [HYEON] 주석처리함
	if( !/[1|2|3]/g.test( agentCd ) ) {
			alert('회원유형을 선택해 주세요.');
			$('#certPopupLayer').hide();
			$('input#idn1').val('');
			$('input#idn2').val('');
			return false;
		} */
		
		if( selectCert == 'j'){
			/* if( !checkIhIdNum(idn) ){
				alert('주민번호를 정확히 입력해주세요.');
				$('input#idn1').focus();
				return false;
			} */
			if( !/\d{13}/g.test( idn ) ){
				alert('주민번호를 정확히 입력해주세요.');
				$('input#idn1').focus();
				return false;
			}
		}else if( selectCert == 's'){
			idn = $('input#s_idn1').val()+$('input#s_idn2').val()+$('input#s_idn3').val();
			if( !/\d{10}/g.test( idn ) ){
				alert('사업자번호를 정확히 입력해주세요.');
				$('input#s_idn1').focus();
				return false;
			}
		}
		
		document.fCert.idn.value = idn;
		// document.fCert.agentCd.value = agentCd; -- 2016.12.07 [HYEON] 주석처리함
		//document.fCert.submit();
		SignData();
		
	});
	$('input#idn2').on('keydown',function(event){
		if( event.keyCode == 13) {
			$('a#certSubmit').click();
			return false;
		}
	});
	$('a#closePopup').on('click',function(){
		$('#certPopupLayer').hide();
	});
	
	
	<%-- 웹사이트 로그인 전환
	<%-- $('div.supportCont.clfix.cert div.flR a').on('click',function(e){
		e.preventDefault();
		$('div.supportCont.clfix.cert').hide();
		$('div.supportCont.clfix.idpw').show();
	}); --%>
	<%-- 인증서 로그인 전환
	<%-- $('div.supportCont.clfix.idpw div.flR a').on('click',function(e){
		e.preventDefault();
		$('div.supportCont.clfix.idpw').hide();
		$('div.supportCont.clfix.cert').show();
	}); --%>

	<%-- 임시 
	$('#fIdpw #agentCd').on('change',function(){
		var a = $('#fIdpw #agentCd:checked').val();
		
		switch (a) {
		case '1':
			$('#fIdpw input#id').val('yyctsco');
			$('#fIdpw input#password').val('yyctsco');
			break;
		case '2':
			$('#fIdpw input#id').val('miznea');
			$('#fIdpw input#password').val('ohse8038');
			break;
		case '3':
			$('#fIdpw input#id').val('handw0');
			$('#fIdpw input#password').val('8654001');
			break;
		}
	});--%>
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchForm();
			return false;
		}
	});
	<%-- 로그인 엔터키 설정--%>
	$('form#fIdpw input[name="password"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			$('#fIdpw div.logCont02 p.btn_login a').click();
			return false;
		}
	});
	
	$('div.supportCont.clfix.cert input[name="agentCd"]').on('change',function(){
		$('div.supportCont.clfix.idpw input[name="agentCd"][value="'+$(this).val()+'"]').click(); 
	});
	
	
	$('input[name="selectCert"]').on('change',function(){
		var selectCert = $('input[name="selectCert"]:checked').val();
		if( selectCert == 'j'){
			$('input#idn1').val('');
			$('input#idn2').val('');
			$('#cert_saup').hide();
			$('#cert_jumin').show();
		}else if( selectCert == 's'){
			$('input#s_idn1').val('');
			$('input#s_idn2').val('');
			$('input#s_idn3').val('');
			$('#cert_saup').show();
			$('#cert_jumin').hide();
		}
	});
	
	if(getCookie('loginIdSaveAt')=='true'){
		document.fIdpw.loginIdSaveAt.checked = 'true';
		document.fIdpw.id.value = getCookie('loginIdSaveId');
	}
});

function searchForm(){
	var keyword = document.searchForm.searchKeywordTotal.value;
	if(keyword.trim() == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.searchForm.searchKeywordT.value = keyword;
	document.searchForm.action = "<c:url value='/main/totalSearch.do'/>";
   	document.searchForm.submit();
	}
}

function SignData(){
    

	// 환경설정 함수 콜
	init();
	var ret;
	var signeddata, textin;
	var userdn, EncR;

	if( document.fCert.src.value == null || document.fCert.src.value == "" )
	{
		alert("서명할 데이타를 넣어주십시요");
		return;
	}



	// 인증서 선택창 초기화 및 선택된 인증서의 DN 추출
	// DN은 인증기관에서 유니크한 것임.
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		
		return;
	}
	else
	{

		// 전자서명 생성
		// BSTR *SignData(BSTR Source, BSTR HashAlgo, BSTR Password);
		// parameters : 
		//   Source : 전자서명할 메세지
		//   HashAlgo : 서명 알고리즘 ("SHA1", "MD5") ==> SHA1이 표준
		//   Password : 개인키 복호를 위한 패스워드
		// return value : 생성된 전자서명 값
		// 참 고 : 암호를 넣지 않았을 경우에는 암호 입력 다이얼로그 박스에 입력한다.
		signeddata = document.CC_Object_id.SignData( document.fCert.src.value, "SHA1", "");

		if( signeddata == null || signeddata == "" )
		{
			errmsg = document.CC_Object_id.GetErrorContent();
			errcode = document.CC_Object_id.GetErrorCode();
			alert( "SignData :"+errmsg );
			return;
		}
		else
		{

			getR = CC_Object_id.GetRFromKey(userdn, "");
			if (getR == "")
			{
				alert("주민번호/사업자번호를 확인할 수 없는 인증서입니다.");
				return;
			}


			ret = CC_Object_id.ValidCert_VID(userdn, getR, document.fCert.idn.value);
			if (ret == "0")
			{
				//alert("신원확인 성공");
				
			}
			else
			{
				alert("본인확인을 실패하였습니다.");	
				return false;
			}
			
			document.fCert.userR.value =  getR;

			if (document.fCert.idn.value == "")
			{
				//alert("주민 또는 사업자번호 입력 요망");
				alert("주민번호를 정확히 입력해주세요.");
				return;
			}

			document.fCert.signeddata.value = signeddata;
			//document.fCert.action = "login_check.jsp";
			//document.fCert.method = "post";
			document.fCert.submit();
			
		}
	}
}
function windowOpen(){
	window.open("/main/guidePopup.do",'','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=700,height=480 top=20 left=20');
}

// =============captcha 캡챠
function changeCaptcha() {
	  //IE에서 '새로고침'버튼을 클릭시 CaptChaImg.jsp가 호출되지 않는 문제를 해결하기 위해 "?rand='+ Math.random()" 추가 
	  $('#catpcha').html('<img src="<%=ctx%>/CaptChaImg.do?rand='+ Math.random() + '"/>');
}

function winPlayer(objUrl) {
	  $('#audiocatpch').html(' <bgsound src="' + objUrl + '">');
}

function audioCaptcha() {

	   var uAgent = navigator.userAgent;
	   var soundUrl = '/CaptChaAudio.do';
	   if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
	       //IE일 경우 호출
	       winPlayer(soundUrl+'?agent=msie&rand='+ Math.random());
	   } else if (!!document.createElement('audio').canPlayType) {
	       //Chrome일 경우 호출
	       try { new Audio(soundUrl).play(); } catch(e) { winPlayer(soundUrl); }
	   } else window.open(soundUrl, '', 'width=1,height=1');
	}
/* $(document).ready(function() {
	  
	  changeCaptcha(); //Captcha Image 요청
	  
	  $('#reLoad').click(function(){ changeCaptcha(); }); //'새로고침'버튼의 Click 이벤트 발생시 'changeCaptcha()'호출
	  $('#soundOn').click(function(){ audioCaptcha(); }); //'음성듣기'버튼의 Click 이벤트 발생시 'audioCaptcha()'호출
	  
	  //'확인' 버튼 클릭시
	  $('#frmSubmit').click(function(){
	      if ( !$('#answer').val() ) {
	           alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
	      } else {
	           $.ajax({
	               url: '/CaptchaSubmit.do',
	               type: 'POST',
	               dataType: 'text',
	               data: 'answer=' + $('#answer').val(),
	               async: false,  
	               success: function(resp) {
	                    alert(resp);
	                    $('#reLoad').click();
	                    $('#answer').val('');
	              }
	         });
	      }
	  });
	 }); */
//=============captcha 캡챠 끝	 
</script>
<c:if test="${param.code == 'noLegacy'}">
<script type="text/javascript">
$(window).load(function(){
	alert('가입된 조합원정보와 홈페이지정보가 \n일치하지 않습니다.\n\n[홈페이지 문의] \n02-3483-3800 \nweb_master@truck.or.kr');
});
</script>
</c:if>
<c:if test="${param.code == 'loginIPINFail' || param.code == 'loginHPFail' || param.code == 'loginNAMEFail' || param.code == 'loginCERTFail'}">
<script type="text/javascript">
$(window).load(function(){
	alert('화물공제조합에 등록되지 않은 사용자입니다.');
});
</script>
</c:if>
<c:if test="${param.code == 'lockingID'}"> <!-- 2016.12.09 [HYEON] 추가 -->
<script type="text/javascript">
$(window).load(function(){
	alert('잠겨있는 아이디 입니다.\n\n[홈페이지 문의] \n02-3483-3800 \nweb_master@truck.or.kr');
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
<c:if test="${param.code == 'alterSuccess'}">
<script type="text/javascript">
$(window).load(function(){
	alert('비밀번호가 변경되었습니다.');
});
</script>
</c:if>

<!-- 2016.12.09 [HYEON] 추가 -->
<c:if test="${param.idpwFailCount == '5'}">
<script type="text/javascript">
$(window).load(function(){
	alert('로그인이 5번 실패하셨습니다.\n\n[홈페이지 문의] \n02-3483-3800 \nweb_master@truck.or.kr');
	location.href="/main/index.do";
});
</script>
</c:if>

<style type="text/css">
	#certPopupLayer{
		background: url("/images/truck/com/overlay.png") repeat 0% 0%;
		position: fixed;
		left: 0px;
		top: 0px;
		text-align: center;
		z-index: 90000;
		width: 100%;
		height: 100%;
	}
</style>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s -->
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<!-- 20161130 삭제
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
						//20161130 삭제 -->
						<!-- <li><a href="#;"><img src="/images/truck/main/util01.gif" alt="직원마당" /></a></li> -->
						<c:choose>
							<c:when test="${not empty loginVO }">
								<li><a href="/netCounter/memberPage/myPage/myInfo.do"><img src="/images/truck/main/util04.gif" alt="마이페이지" /></a></li>
							<li><a href="/logout.do"><img src="/images/truck/main/logout.gif" alt="로그아웃" /></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/join/terms/view.do"><img src="/images/truck/main/util02.gif" alt="회원가입" /></a></li>
								<li><a href="/login.do"><img src="/images/truck/main/util03.gif" alt="로그인" /></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<div class="gnbSubGo">
						<a href="/main/guide.do"><img src="/images/truck/main/guide.gif" alt="이용안내가이드" /></a>
						<!-- 20161214 삭제 
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						//20161214 삭제 -->
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" method="post" action="">
						<fieldset>
						<legend>통합검색</legend>
							<input type="hidden" name="searchKeywordT"/>
							<span class="ut_search"><label for="">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
							<a class="btn_ut_search" href="#;" onclick="totalSearch();"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
						</fieldset>
						</form>
					</div>
				</div>
				<!-- gnb s --><!-- subDep01까지만 노출 depth03부터는 display:none과 display:block로 컨트롤  -->
				<div class="gnb" id="Gnb">
					<ul class="gnbList">
						<li class="gnb1Dep01 "><a class="menu1" href="/netCounter/memberPage/myPage/myInfo.do"><span class="hide">인터넷창구</span></a>
						</li><!--// gnb1Dep01 인터넷창구 e -->
						<li class="gnb1Dep02 "><a class="menu2" href="/infoLounge/infoLoungeIndex.do"><span class="hide">정보마당</span></a>
						</li><!--// gnb1Dep02 정보마당 e -->
						<li class="gnb1Dep03 "><a class="menu3" href="/deductProduct/deductProductIndex.do"><span class="hide">공제상품</span></a>
						</li><!--// gnb1Dep03 공제상품 e -->
						<li class="gnb1Dep04 "><a class="menu4" href="/customer/customerIndex.do"><span class="hide">고객광장</span></a>
						</li><!--// gnb1Dep04 고객광장 e -->
						<li class="gnb1Dep05"><a class="menu5" href="/assocIntroduce/assocIntroduceIndex.do"><span class="hide">조합소개</span></a>
						</li><!--// gnb1Dep05 조합소개 e -->
						<li class="gnb1Dep06 "><a class="menu6" href="/cyberPr/cyberPrIndex.do"><span class="hide">사이버홍보관</span></a>
						</li><!--// gnb1Dep06 사이버홍보관 e -->
					</ul>
					<!-- 컨트롤버튼 -->
					<!-- <a href="#;" title="메뉴열기버튼" class="btn_memuopen" ><span class="hide">메뉴열기</span></a>
					<a href="#;" title="메뉴를 고정시킵니다." class="btn_pause pause_on" ><span>고정</span></a> --><!-- 고정버튼 눌렀을 경우 class명 pause_on 추가 -->
					<a href="#;" title="메뉴를 닫습니다." class="btn_close" ><span>닫기</span></a>
				</div><!-- // gnb e -->
			</div>
		</div>
		<hr />
		<!--// header e -->
		
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/log_tit.gif" alt="로그인" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>로그인</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/log_con_tit.gif" alt="화물공제조합 방문을 환영합니다 로그인 하시면 공제계약관련 보상처리 내역 및 거래처의 거래내역 조회서비스를 보다 편리하게 이용하실 수 있습니다" /></p>
					<div class="conSection">
						<div class="clfix cert"><%-- cert class 추가 --%>	<!-- 20161201 수정 -->
							<p class="consecTit"><img src="/images/truck/net/log_sub_tit01.gif" alt="본인인증으로 안전하고 편리한 인터넷창구 서비스" /></p>
							<!-- 20161201 삭제 
							<div class="selectLog">
								<%-- param_r1 = agentCd --%>
								<input name="agentCd" class="" id="agentCd" type="radio"  value="1"/><label for="agentCd">조합원</label>
								<input name="agentCd" class="" id="agentCd" type="radio" value="2"/><label for="agentCd">차량관리자</label>
								<input name="agentCd" class="" id="agentCd" type="radio" value="3"/><label for="agentCd" class="mR0">거래처</label>
							</div>
							//20161201 삭제 -->
							<!-- 20161201 수정 -->
							<div class="roundBox">
								<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
								<div class="loginArea clfix">
									<!-- 인증서 로그인 -->
									<!-- <div class="logCont01">
										<h3>인증서 로그인</h3>
										<ul>
											<li><a id="alinkCert" href="#"><img src="/images/truck/com/log_type01_01.gif" alt="공인인증서 인증" /></a></li>
											<li><a id="alinkIpin" href="#"><img src="/images/truck/com/log_type02_01.gif" alt="아이핀 인증" /></a></li>
											<li><a id="alinkHp" href="#"><img src="/images/truck/com/log_type03_01.gif" alt="핸드폰 인증" /></a></li>
										</ul>
										20161214 삭제 
										<p class="txtPoint07">특히&#44; 공제계약 회원님께서는 인증서 로그인을 권장합니다&#46;</p>
										//20161214 삭제
									</div> -->
									<!-- 아이디 로그인 -->
									<form id="fIdpw" name="fIdpw" action="/actIdpwLogin.do" method="post">
									<input type="hidden" id="idpwFailCount" name="idpwFailCount" value="0" />
									<div class="logCont02">
										<h3>아이디 로그인</h3>
										<dl>
											<dt><label for="id">아이디</label></dt>
											<dd><input name="id" class="txt" id="id" type="text" value=""/></dd>
											<dt><label for="password">비밀번호</label></dt>
											<dd><input name="password" class="txt" id="password" type="password" value=""/></dd>
										</dl>
										<span class="idSave" style="display:inline;">
											<input name="loginIdSaveAt" id="loginIdSaveAt" type="checkbox" value="" />
											<label for="loginIdSaveAt">아이디 저장</label>
										</span>
										<p class="btn_login"><a href="#;"><img src="/images/truck/btn/btn_log02.gif" alt="로그인" /></a></p>	<!-- 20161206 수정 -->
										<!-- 버튼-->
										<div class="btnFind">
											<a href="/login/findInfoId.do">아이디 찾기</a>
											<a href="/login/findInfoPw.do">비밀번호 찾기</a>
										</div>
										</form>
										<!-- 버튼 -->
										 <!-- 로그인 3회 실패시 캡챠 노출 -->
										<div class="capchaBox" style="display: none;">
											<span class="txtPoint06">아래 이미지의 보안문자를 입력하세요.</span>
											<div class="img">
												<div id="catpcha">Wait...</div>
  												<div id="audiocatpch" style="display: none;"></div>
											</div>
											<div class="btn">
												<a href="# return false;" id='soundOn'><img src="/images/truck/net/btn_capcha_voice.gif" alt="" /></a>
												<a href="# return false;" id='reLoad'><img src="/images/truck/net/btn_capcha_refresh.gif" alt="" /></a>
											</div>
											<input type="text" name="" id="answer" placeholder="보안문자 입력" style="width:133px;" />
										</div>
										 <!-- //로그인 3회 실패시 캡챠 노출 -->
									<!-- <div id="catpcha">Wait...</div>
  									<div id="audiocatpch" style="display: none;"></div>

  									<input id="reLoad" type="button" value="새로고침" />
  									<input id="soundOn" type="button" value="음성듣기" />
  									<br />
  									<input type="text" id="answer" name="answer" value="" /> 
  									<input type="button" id="frmSubmit" value="Captcha확인" /> -->
									</div>
								</div>
								<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
							</div>
						</div>
							<%-- hp 인증 팝업에서 사용 --%>
							<form id="fHpResult" name="fHpResult" method="post" action="" >
								<input type="hidden" name="EncodeData">								<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
								<input type="hidden" name="param_r1" value="">
								<input type="hidden" name="param_r2" value="">
								<input type="hidden" name="param_r3" value="">
							</form>
							<form id="form_chk" name="form_chk" method="post" action="">
								<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
								<input type="hidden" name="EncodeData" value="<%= sEncDataHp %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
								<input type="hidden" name="param_r1" value="">
								<input type="hidden" name="param_r2" value="">
								<input type="hidden" name="param_r3" value="">
							</form>
							<%-- ipin 인증 팝업에서 사용 --%>
							<form name="form_ipin" method="post" action="">
								<input type="hidden" name="m" value="pubmain" />						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
								<input type="hidden" name="enc_data" value="<%= sEncDataIpin %>" />		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
								<input type="hidden" name="param_r1" value="" />
								<input type="hidden" name="param_r2" value="" />
								<input type="hidden" name="param_r3" value="" />
							</form>
							<form name="vnoform" method="post" action="">
								<input type="hidden" name="enc_data" />								<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
								<input type="hidden" name="param_r1" value="" />
								<input type="hidden" name="param_r2" value="" />
								<input type="hidden" name="param_r3" value="" />
							</form>
						<!--//20161201 수정 -->

					</div><!--// conSection e -->
					<div class="loginHelp clfix">
						<div class="helpInfo">
							<h3>분담금 카드결제 안내</h3>
							<p>분담금 카드 결제 및 확인 하고자 하는경우 <b>신용카드수납시스템</b>에서 로그인 없이 바로 이용 가능합니다&#46;</p>
							<div class="btnbox"><span class="btn_pack btn_type09 icon" style="margin-right:-70px"><span class="det"></span><a href="https://card.truck.or.kr" target="_blank">카드수납시스템 바로가기</a></span></div>
						</div>
						<!-- <div class="helpInfo">
							<h3>고객정보보호 방법 안내</h3>
							<p>금융사고 발생을 방지하고 보다 안전한 전자금융거래를 위해 금융감독원의 대응요령을 안내해 드립니다&#46;</p>
							<div class="btnbox"><span class="btn_pack btn_type09 icon"><span class="det"></span><a href="#;" onclick="windowOpen(); return false;" title="새창열림" >자세히보기</a></span></div>
						</div> -->
						<div class="helpQna">
							<h3>자주하는 질문</h3>
							<p class="more"><a href="/customer/faqNoticeIndex.do">더보기</a></p>
							<!-- 20161201 수정 -->
							<ul class="qnaBanner">
								<li><a href="#" id="memTarger"><img src="images/truck/net/img_ques_banner01.gif" alt="인터넷 회원의 대상이란" /></a></li>
								<li><a href="#" id="noJoin"><img src="images/truck/net/img_ques_banner02.gif" alt="회원가입이 이루어지지않아요." /></a></li>
								<li><a href="#" id="howContact"><img src="images/truck/net/img_ques_banner03.gif" alt="계약/보상조회는 어떻게 이루어지나요?" /></a></li>
							</ul>
							<form id="faqNoticeView" name="faqNoticeView" action="/customer/loginUnder/faqNoticeView.do" method="post">
								<input type="hidden" id="articleNo" name="articleNo" value="" />
								<input path="searchCategory" type="hidden" id="faqCategory" name="faqCategory" value="3"/>
							</form>
							<!-- //20161201 수정 -->
							<!--
							<div class="list">
								<c:forEach items="${resultList}" var="result" >
									<h4 class="cleanH4 "><span class="icoTit">${result.TITLE }</span></h4>
									<div class="cleanDiv">
										<p class="icoA">${result.CONTENT_TEXT }</p>
									</div>								
								</c:forEach>
								<!-- <h4 class="cleanH4 "><span class="icoTit">로그인이 되지 않을 경우 조치방법</span></h4>
								<div class="cleanDiv">
									<p class="icoA">로그인이 정상적으로 되지 않는 경우 아래 순서대로 진행하신 후 로그인 해 주시기 바랍니다</p>
								</div>
								<h4 class="cleanH4 "><span class="icoTit">로그인이 되지 않을 경우 조치방법</span></h4>
								<div class="cleanDiv">
									<p class="icoA">로그인이 정상적으로 되지 않는 경우 아래 순서대로 진행하신 후 로그인 해 주시기 바랍니다</p>
								</div>
							</div>
							 -->
						</div><!--// 자주하는 질문 -->
					</div><!--// loginHelp e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
		
		<!--  공인인증서 주민번호 입력 영역  -->

		<div id="certPopupLayer" style="display:none;">
			<div class="layerBox">
				<div class="layerContents">
					<p class="topClose"><a id="closePopup" href="#;"><img src="/images/truck/com/close.gif" alt="팝업창닫기"></a></p>
					<p class="layerTit">공인인증서 로그인</p>
					<p class="layerTxt">공인인증서를 인증하기 위해서<br />주민등록번호 또는 사업자번호를 입력하여 주시기 바랍니다&#46;</p>
					<div class="layerA">
						<p class="pB10">
							<input type="radio" id="selectCert" name="selectCert" value="j" checked="checked" /><label for="selectCert" class="pL5 pR40">주민등록번호</label>
							<input type="radio" id="selectCert" name="selectCert" value="s" /><label for="selectCert" class="pL5">사업자번호</label>
						</p>
						<p id="cert_jumin">
							<label class="hide" for="idn1">주민등록번호앞자리</label>
							<input name="idn1" class="txt alC" id="idn1" type="text" value="" maxlength="6" style="width:130px;" />
							<span>&#45;</span>
							<label class="hide" for="idn2">주민등록번호뒷자리</label>
							<input name="idn2" class="txt alC" id="idn2" type="text" value="" maxlength="7" style="width:130px;" />
						</p>
						<p id="cert_saup" style="display:none;">
							<label class="hide" for="idn1">사업자번호 첫번째</label>
							<input name="s_idn1" class="txt alC" id="s_idn1" type="text" value="" maxlength="3" style="width:65px;"/>
							<span>&#45;</span>
							<label class="hide" for="idn1">사업자번호 두번째</label>
							<input name="s_idn2" class="txt alC" id="s_idn2" type="text" value="" maxlength="2" style="width:65px;"/>
							<span>&#45;</span>
							<label class="hide" for="idn1">사업자번호 세번째</label>
							<input name="s_idn3" class="txt alC" id="s_idn3" type="text" value="" maxlength="5" style="width:100px;"/>
						</p>
					</div>
					<div class="btnboxC clfix">
						<span class="btn_pack btn_type16"><a id="certSubmit" href="#;">공인인증서 로그인</a></span>
						<form id="fCert" name="fCert" action="/cert_check.do" method="post" >
							<input id="userR" name="userR" type="hidden" value=""/>
							<input id="signeddata" name="signeddata" type="hidden" value=""/>
							<input id="src" name="src" type="hidden" value="<%=Origin_data%>"/>
							<input id="idn" name="idn" type="hidden" value=""/>
							<input id="agentCd" name="agentCd" type="hidden" value=""/>
							<input id="t" name="t" type="hidden" value=""/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //wrap e -->
	
	<object id="CC_Object_id"
      classid="CLSID:A099920B-630C-426B-91EC-737685CEEE17"
	  codebase="/cert/AxCrossCert.cab#Version=2,6,4,0"
      width= Document.body.clientWidth
      height= Document.body.clientHeight>
	</object>
</body>
</html>
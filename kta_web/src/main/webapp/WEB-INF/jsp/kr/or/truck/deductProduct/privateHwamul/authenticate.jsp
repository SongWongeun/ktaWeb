<%@page import="NiceID.Check.CPClient"%>
<%@page import="Kisinfo.Check.IPINClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	String customizeHp 	= "";			//없으면 기본 웹페이지 / Mobile : 모바일페이지
		
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.    
    String sReturnUrlHp = "https://"+request.getServerName()+"/checkplus_success.do";      // 성공시 이동될 URL
    //String sReturnUrlHp = "http://127.0.0.1:8080/checkplus_success.do";      // 성공시 이동될 URL
    String sErrorUrlHp = "http://"+request.getServerName()+"/checkplus_fail.do";          // 실패시 이동될 URL

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
	//String sReturnURLIpin				= "http://localhost:8080/ipin_process.do";
	
	
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

/************************************
안심체크  서비스 

*********************************** */

    NiceID.Check.CPClient niceCheckNice = new  NiceID.Check.CPClient();
    
    String sSiteCode		= "R304";				// NICE신용평가정보로부터 부여받은 사이트 코드
    String sSitePassword	= "77305237";				// NICE신용평가정보부터 부여받은 사이트 패스워드
    
    //아이핀연계정보는 별도 계약 입니다. 계약 확인후 진행해 주세요.
    String sIPINSiteCode	= "H708";				// NICE신용평가정보로부터 부여받은 아이핀사이트 코드(DI/CI 응답이 필요한 경우 사용)
	String sIPINPassword	= "35320687";				// NICE신용평가정보로부터 부여받은 아이핀사이트 패스워드
                                                    	
    String sReturnURL 		= "https://"+request.getServerName()+"/niceID_return.do";	//결과 수신 URL    
    //String sReturnURL 		= "http://localhost:8080/niceID_return.do";	//결과 수신 URL
    String sRequestNO		= "";												// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 필요시 사용
    String sBGType			= "";												//서비스 화면 색상 선택
    String sClientImg		= "";												//서비스 화면 로고 선택: default 는 null 입니다.(full 경로 입력해 주세요.)
    
    String sReserved1		= "authenticate";
	String sReserved2		= rURL;
	String sReserved3		= "NAME";
    
    sRequestNO = niceCheckNice.getRequestNO(sSiteCode);	//요청고유번호 / 비정상적인 접속 차단을 위해 필요
  	session.setAttribute("REQ_SEQ_NAME" , sRequestNO);	//해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
    //out.println ("sRequestNO : " + sRequestNO + "<br>");
    
    // 입력될 plain 데이타를 만든다.
    /* String sPlainData = "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
                        "7:REQ_SEQ" + sRequestNO.getBytes().length + ":" + sRequestNO +
                        "7:BG_TYPE" + sBGType.getBytes().length + ":" + sBGType +
                        "7:IMG_URL" + sClientImg.getBytes().length + ":" + sClientImg ; */ 

    
    /* String sPlainData1 = "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
                        "7:REQ_SEQ" + sRequestNO.getBytes().length + ":" + sRequestNO +
                        "7:BG_TYPE" + sBGType.getBytes().length + ":" + sBGType +
                        "7:IMG_URL" + sClientImg.getBytes().length + ":" + sClientImg +
                        "9:RESERVED1" + sReserved1.getBytes().length + ":" + sReserved1 +
                        "9:RESERVED2" + sReserved2.getBytes().length + ":" + sReserved2 +
                        "9:RESERVED3" + sReserved3.getBytes().length + ":" + sReserved3 ; */
                        
	String sPlainData2 = "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
                        "7:REQ_SEQ" + sRequestNO.getBytes().length + ":" + sRequestNO +
                        "7:BG_TYPE" + sBGType.getBytes().length + ":" + sBGType + 
                        "7:IMG_URL" + sClientImg.getBytes().length + ":" + sClientImg +
                        "9:RESERVED1" + sReserved1.getBytes().length + ":" + sReserved1 +
                        "9:RESERVED2" + sReserved2.getBytes().length + ":" + sReserved2 +
                        "9:RESERVED3" + sReserved3.getBytes().length + ":" + sReserved3 +
                        "13:IPIN_SITECODE" + sIPINSiteCode.getBytes().length + ":" + sIPINSiteCode +
                        "17:IPIN_SITEPASSWORD" + sIPINPassword.getBytes().length + ":" + sIPINPassword ;                        
    
    String sMessage = "";
    String sEncData = "";
    
    int iReturn = niceCheckNice.fnEncode(sSiteCode, sSitePassword, sPlainData2);
    if( iReturn == 0 )
    {
        sEncData = niceCheckNice.getCipherData();
        //out.println ("요청정보_암호화_성공[ : " + sEncData + "]");
    }
    else if( iReturn == -1)
    {
        sMessage = "암호화 시스템 에러입니다.";
    }    
    else if( iReturn == -2)
    {
        sMessage = "암호화 처리오류입니다.";
    }    
    else if( iReturn == -3)
    {
        sMessage = "암호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
window.name ="Parent_window";

$(document).ready(function(){
	<%-- IPIN 로그인 submit event --%>
	$('a#alinkIpin').on('click',function(e){
		e.preventDefault();

		window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_ipin.target = "popupIPIN2";
		document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
		document.form_ipin.param_r1.value = 'authenticate';
		document.form_ipin.param_r2.value = '<%=rURL%>';
		document.form_ipin.param_r3.value = 'IPIN';
		document.form_ipin.submit();
	});
	
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
	
	<%-- 안심체크 로그인 submit event --%>
	$('a#alinkName').on('click',function(e){
		e.preventDefault();
		window.open('', 'popupName', 'width=450, height=350,toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,top=0,left=0');
		document.form_name.action = "https://cert.namecheck.co.kr/NiceID/certnc_input.asp";
		document.form_name.target = "popupName";
		document.form_name.submit();
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
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/cust/authen_tit.gif" alt="회원인증" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/deductProduct/hwamulInfo.do">개인화물 가입안내</a>
						<span>회원인증</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/authen_con_tit.gif" alt="본 서비스는 인증이 필요합니다 다소 번거로우시더라도 양해 부탁 드립니다" /></p>
					<div class="conSection">
						<div class="supportCont">
							<p class="consecTit"><img src="/images/truck/cust/authen_sec_tit.gif" alt="고객의신뢰를이어가는화물공제 고객센터문의" /></p>
							<div class="roundBox">
								<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
								<!-- 내용 -->
								<div class="supportArea">
									<!-- <p class="supTxt"><img src="/images/truck/cust/authen_txt.gif" alt="1:1문의 및 답변글 확인" /></p> -->
									<p class="txt03 mB30 mT35">본 서비스는 본인 인증 후&#44; 이용 가능합니다&#46;</p>
									<ul class="logType">
										<li><a id="alinkHp" href="#;"><img src="/images/truck/info/reci_type01.gif" alt="휴대폰 인증" /></a></li>
										<!-- <li><a id="alinkIpin" href="#;"><img src="/images/truck/info/reci_type02.gif" alt="아이핀 인증" /></a></li> -->
										<!-- <li><a id="alinkName" href="#;"><img src="/images/truck/info/reci_type03.gif" alt="안심체크" /></a></li> -->
									</ul>
									<!-- <p class="txt04 pB20">휴대폰 인증과 아이핀 인증을 선택하여 진행<br /></p> -->
								</div>
								<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
							</div>
						</div>
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
	<%-- hp 인증 팝업에서 사용 --%>
	<form id="fHpResult" name="fHpResult" method="post" action="/actHpLogin.do">
		<fieldset>
		<legend>인증팝업</legend>
			<input type="hidden" name="EncodeData">								<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
		    <input type="hidden" name="param_r1" value="">
		    <input type="hidden" name="param_r2" value="">
		    <input type="hidden" name="param_r3" value="">
	    </fieldset>
	</form>
	<form id="form_chk" name="form_chk" method="post" action="">
		<fieldset>
		<legend>암호화 데이터</legend>
			<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
			<input type="hidden" name="EncodeData" value="<%= sEncDataHp %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
		    <input type="hidden" name="param_r1" value="">
		    <input type="hidden" name="param_r2" value="">
		    <input type="hidden" name="param_r3" value="">
	    </fieldset>
	</form>
	<%-- ipin 인증 팝업에서 사용 --%>
	<form name="form_ipin" method="post" action="">
		<fieldset>
		<legend>인증팝업</legend>
			<input type="hidden" name="m" value="pubmain">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		    <input type="hidden" name="enc_data" value="<%= sEncDataIpin %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
		    <input type="hidden" name="param_r1" value="">
		    <input type="hidden" name="param_r2" value="">
		    <input type="hidden" name="param_r3" value="">
	    </fieldset>
	</form>
	<form name="vnoform" method="post" action="">
		<fieldset>
		<legend>암호화 데이터</legend>
			<input type="hidden" name="enc_data">								<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
		    <input type="hidden" name="param_r1" value="">
		    <input type="hidden" name="param_r2" value="">
		    <input type="hidden" name="param_r3" value="">
	    </fieldset>
	</form>
	<%-- 안심체크 인증 팝업에서 사용 --%>
	<form name="form_name" method="post" action="">
		<fieldset>
		<legend>인증팝업</legend>
		    <input type="hidden" name="enc_data" value="<%=sEncData%>">	
    	</fieldset>	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	</form>
	<form name="niceID" method="post" action="">
		<fieldset>
		<legend>암호화 데이터</legend>
			<input type="hidden" name="enc_data">								<!-- 인증받은 사용자 정보 암호화 데이타입니다. -->
		    <input type="hidden" name="param_r1" value="">
		    <input type="hidden" name="param_r2" value="">
		    <input type="hidden" name="param_r3" value="">
	    </fieldset>
	</form>
</body>
</html>
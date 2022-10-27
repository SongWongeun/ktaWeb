<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
    
    String sSiteCode		= "R304";				// NICE신용평가정보로부터 부여받은 사이트 코드
    String sSitePassword	= "77305237";				// NICE신용평가정보부터 부여받은 사이트 패스워드
    
    //아이핀연계정보는 별도 계약 입니다. 계약 확인후 진행해 주세요.
    String sIPINSiteCode	= "";				// NICE신용평가정보로부터 부여받은 아이핀사이트 코드(DI/CI 응답이 필요한 경우 사용)
	String sIPINPassword	= "";				// NICE신용평가정보로부터 부여받은 아이핀사이트 패스워드
                                                    	
    String sReturnURL 		= "http://localhost:8080/test/NiceID/NiceID_return.jsp";	//결과 수신 URL    
    String sRequestNO		= "";												// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 필요시 사용
    String sBGType			= "";												//서비스 화면 색상 선택
    String sClientImg		= "";												//서비스 화면 로고 선택: default 는 null 입니다.(full 경로 입력해 주세요.)
    
    String sReserved1		= "authenticate";
	String sReserved2		= "";
	String sReserved3		= "NAME";
    
    sRequestNO = niceCheck.getRequestNO(sSiteCode);	//요청고유번호 / 비정상적인 접속 차단을 위해 필요
  	session.setAttribute("REQ_SEQ" , sRequestNO);	//해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
    out.println ("sRequestNO : " + sRequestNO + "<br>");
    
    // 입력될 plain 데이타를 만든다.
    String sPlainData = "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
                        "7:REQ_SEQ" + sRequestNO.getBytes().length + ":" + sRequestNO +
                        "7:BG_TYPE" + sBGType.getBytes().length + ":" + sBGType +
                        "7:IMG_URL" + sClientImg.getBytes().length + ":" + sClientImg ; 

    
    String sPlainData1 = "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
                        "7:REQ_SEQ" + sRequestNO.getBytes().length + ":" + sRequestNO +
                        "7:BG_TYPE" + sBGType.getBytes().length + ":" + sBGType +
                        "7:IMG_URL" + sClientImg.getBytes().length + ":" + sClientImg +
                        "9:RESERVED1" + sReserved1.getBytes().length + ":" + sReserved1 +
                        "9:RESERVED2" + sReserved2.getBytes().length + ":" + sReserved2 +
                        "9:RESERVED3" + sReserved3.getBytes().length + ":" + sReserved3 ;
                        
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
    
    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData2);
    if( iReturn == 0 )
    {
        sEncData = niceCheck.getCipherData();
        out.println ("요청정보_암호화_성공[ : " + sEncData + "]");
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

<html>
<head>
    <title>NICE신용평가정보 - NiceID 안심체크 테스트</title>
    
    <script language='javascript'>
    	 function fnPopup(){
    	
    	window.open('', 'popup', 'width=450, height=350,toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,top=0,left=0');
		document.frm_main.action = "https://cert.namecheck.co.kr/NiceID/certnc_input.asp";
		document.frm_main.target = "popup";
		document.frm_main.submit();
    	
    }
	</script>
	
</head>
    
<body>
	<form method="post" name="frm_main">
 		<input type="hidden" name="enc_data" value="<%=sEncData%>">
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
 	<center>
    <p><p><p><p>
    <a href="javascript:fnPopup();">NiceID 서비스 테스트 Click</a>
    <p><p>
	<%= sMessage %><br>
     <center>
    <p><p><p><p>
    
    </center>
	<p>
	[배경이미지색상 선택 : sBGType 설정] <br>
		* brown <br>
	    * gray : 선택없을시 디폴트 값<br>
	    * green <br>
	    * lightgreen <br>
	    * lightpurple <br>
	    * purple <br>
	    * red <br>
	    * skyblue <br>
	    * yellow <br>
</body>
</html>
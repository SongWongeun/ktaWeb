<%@page import="egovframework.rte.fdl.string.EgovStringUtil"%>
<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<html>
<head>
   <title>NICE신용평가정보 - NiceID 안심실명인증 테스트</title>
<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = request.getParameter("enc_data");
	String sReservedParam1  = request.getParameter("param_r1");
	String sReservedParam2  = request.getParameter("param_r2");//requestReplace(request.getParameter("param_r2"), "");
	String sReservedParam3  = request.getParameter("param_r3");
       
    String sSiteCode = "R304";					// NICE신용평가정보로부터 부여받은 사이트 코드
    String sSitePassword = "77305237";			// NICE신용평가정보부터 부여받은 사이트 패스워드
    
    String sCipherTime = "";						// 복호화한 시간
    String sRequestNO = "";						// 요청 번호
    String sPlainData = "";
    
    String sMessage = "";
    String sResult = "";
    
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);
	
    if( iReturn == 0 )
    {
    	sMessage = "본인인증 성공하였습니다.";
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        
        // 데이타를 추출합니다.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        sRequestNO	= (String)mapresult.get("REQ_SEQ");
        sResult		= (String)mapresult.get("NC_RESULT");
        
    	String t  = EgovStringUtil.null2void(request.getParameter("t"));
    	String strAction = "/actNameLogin.do?t="+t;
    	// 회원로그인일 경우 agentCd( 1:조합원, 2:차량관리자, 3:거래처) 이며
    	// 본인인증일 경우 'authenticate' 임
    	if( "authenticate".equals((String)mapresult.get("RESERVED1")) ){ 
    		strAction = "/actAuthenticate.do";
    	}
//         out.println("[실명확인결과 : " + (String)mapresult.get("NC_RESULT")+ "]<br>");
//         out.println("[이름 : " + (String)mapresult.get("NAME")+ "]<br>");
//         out.println("[안심KEY :" + (String)mapresult.get("SAFEID")+ "]<br>");
//         out.println("[요청고유번호 : " + sRequestNO + "]<br>");
        
//         out.println("[RESERVED1 : " + (String)mapresult.get("RESERVED1") + "]<br>");
//         out.println("[RESERVED2 : " + (String)mapresult.get("RESERVED2") + "]<br>");
//         out.println("[RESERVED3 : " + (String)mapresult.get("RESERVED3") + "]<br>");
        
//         out.println("[IPIN_DI : " + (String)mapresult.get("IPIN_DI")+ "]<br>");
//         out.println("[IPIN_CI : " + (String)mapresult.get("IPIN_CI")+ "]<br>");
                
        String session_sRequestNumber = (String)session.getAttribute("REQ_SEQ_NAME");
        if(!sRequestNO.equals(session_sRequestNumber))
        {
            sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
            sRequestNO = "";
%>
<script type="text/javascript">
alert('<%=sMessage%>');
self.close();
</script>	

<%            
        }else{
%>
<script>
parent.opener.parent.document.niceID.enc_data.value = "<%= sEncodeData %>";

parent.opener.parent.document.niceID.param_r1.value = "<%= strAction %>";
parent.opener.parent.document.niceID.param_r2.value = "<%= (String)mapresult.get("RESERVED2") %>";
parent.opener.parent.document.niceID.param_r3.value = "<%= (String)mapresult.get("RESERVED3")%>";

parent.opener.parent.document.niceID.target = "Parent_window";

// 인증 완료시에 인증결과를 수신하게 되는 귀사 클라이언트 결과 페이지 URL
parent.opener.parent.document.niceID.action = "<%=strAction%>";
parent.opener.parent.document.niceID.submit();

self.close();	
</script>

<%        	
        }
    }else{
    	if( iReturn == -1)
        {
            sMessage = "복호화 시스템 에러입니다.";
        }    
        else if( iReturn == -4)
        {
            sMessage = "복호화 처리오류입니다.";
        }    
        else if( iReturn == -5)
        {
            sMessage = "복호화 해쉬 오류입니다.";
        }    
        else if( iReturn == -6)
        {
            sMessage = "복호화 데이터 오류입니다.";
        }    
        else if( iReturn == -9)
        {
            sMessage = "입력 데이터 오류입니다.";
        }    
        else if( iReturn == -12)
        {
            sMessage = "사이트 패스워드 오류입니다.";
        }    
        else
        {
            sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
        }
%>
<script type="text/javascript">
alert('<%=sMessage%>');
self.close();
</script>	

<%
    }
%>

</head>
<body>
</body>
</html>
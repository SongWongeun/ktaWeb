<%@ page language="java" import="java.io.*,java.util.*,crosscert.*" %>
<%@ page contentType = "text/html; charset=EUC-KR" %>

<%  
	/*-------------------------시작----------------------------*/ 
	response.setDateHeader("Expires",0); 
	response.setHeader("Prama","no-cache"); 

	if(request.getProtocol().equals("HTTP/1.1")) 
	{ 
		response.setHeader("Cache-Control","no-cache"); 
	} 
	/*------------------------- 끝----------------------------*/ 


	
	
	
	String signeddata = request.getParameter("signed_data");		// 서명된 값

	
	int nRet;
	boolean boolCertChk = true;
	String ErrMsg = "";
	String ErrCode = "";
	
	Base64 CBase64 = new Base64();  
	nRet = CBase64.Decode(signeddata.getBytes(), signeddata.getBytes().length);

	if(nRet==0) 
	{
		
		//out.println("서명값 Base64 Decode 결과 : 성공<br>") ;
		
		Verifier CVerifier = new Verifier();
		nRet=CVerifier.VerSignedData(CBase64.contentbuf, CBase64.contentlen); 
		if(nRet==0) 
		{
			//String sOrgData = new String(CVerifier.contentbuf);
			//out.println("전자서명 검증 결과 : 성공<br>") ;
			//out.println("원문 : " + sOrgData + "<br>");
			
			//인증서 정보 추출 결과	
			Certificate CCertificate = new Certificate();
			nRet=CCertificate.ExtractCertInfo(CVerifier.certbuf, CVerifier.certlen);
			if(nRet==0) 
			{
				//out.println("인증서 정보 추출 결과 : " + Integer.toHexString(nRet));
				
				out.println("subject : " + CCertificate.subject +"<br>");
				
				out.println("from : " + CCertificate.from +"<br>");
				out.println("to : " + CCertificate.to +"<br>");
				out.println("signatureAlgId : " + CCertificate.signatureAlgId +"<br>");
				out.println("pubkey : " + CCertificate.pubkey +"<br>");
				out.println("signature : " + CCertificate.signature +"<br>");
				out.println("issuerAltName : " + CCertificate.issuerAltName +"<br>");
				out.println("subjectAltName : " + CCertificate.subjectAltName +"<br>");
				out.println("keyusage : " + CCertificate.keyusage +"<br>");
				out.println("policy : " + CCertificate.policy +"<br>");
				out.println("basicConstraint : " + CCertificate.basicConstraint +"<br>");
				out.println("policyConstraint : " + CCertificate.policyConstraint +"<br>");
				out.println("distributionPoint : " + CCertificate.distributionPoint +"<br>");
				out.println("authorityKeyId : " + CCertificate.authorityKeyId +"<br>");
				out.println("subjectKeyId : " + CCertificate.subjectKeyId +"<br>");
				

	

				String policies = "";
				 /* 법인상호연동용(범용) */                            //
				policies +="1.2.410.200004.5.2.1.1"    + "|";          // 한국정보인증               법인
				policies +="1.2.410.200004.5.1.1.7"    + "|";          // 한국증권전산               법인, 단체, 개인사업자
				policies +="1.2.410.200005.1.1.5"      + "|";          // 금융결제원                 법인, 임의단체, 개인사업자
				policies +="1.2.410.200004.5.3.1.1"    + "|";          // 한국전산원                 기관(국가기관 및 비영리기관)
				policies +="1.2.410.200004.5.3.1.2"    + "|";          // 한국전산원                 법인(국가기관 및 비영리기관을  제외한 공공기관, 법인)
				policies +="1.2.410.200004.5.4.1.2"    + "|";          // 한국전자인증               법인, 단체, 개인사업자
				policies +="1.2.410.200012.1.1.3"      + "|";          // 한국무역정보통신           법인    

				// 인증서 검증

				
				nRet=CCertificate.ValidateCert(CVerifier.certbuf, CVerifier.certlen, policies, 1);
				out.println("ValidateCert : " + nRet + " <br>") ;
				if(nRet == 0) 
				{
					//out.println("인증서 검증 결과 : 성공<br>") ;
				}
				else
				{
					boolCertChk = false;
					ErrMsg = "인증서 검증 실패 [ 에러내용 : " + CCertificate.errmessage + " ]";
					ErrCode = "에러코드 [ " + CCertificate.errcode + " ]";  
					//out.println("인증서 검증 결과 : 실패<br>") ;
					//out.println("에러내용 : " + CCertificate.errmessage + "<br>");
					//out.println("에러코드 : " + CCertificate.errcode + "<br>");
				}	
					
			}
			else
			{
				
				boolCertChk = false;
				ErrMsg = "인증서 추출 실패 [ 에러내용 : " + CCertificate.errmessage + " ]";
				ErrCode = "에러코드 [ " + CCertificate.errcode + " ]";  
				//out.println("인증서 추출 결과 : 실패<br>") ;
				//out.println("에러내용 : " + CCertificate.errmessage + "<br>");
				//out.println("에러코드 : " + CCertificate.errcode + "<br>");
			}
		}//
		else
		{
			
			boolCertChk = false;
			ErrMsg = "인증서 추출 실패 [ 에러내용 : " + CVerifier.errmessage + " ]";
			ErrCode = "에러코드 [ " + CVerifier.errcode + " ]";  
			//out.println("전자서명 검증 결과 : 실패<br>") ;
			//out.println("에러내용 : " + CVerifier.errmessage + "<br>");
			//out.println("에러코드 : " + CVerifier.errcode + "<br>");
			//return;
		}
	}//
	else
	{
		
		boolCertChk = false;
		ErrMsg = "인증서 추출 실패 [ 에러내용 : " + CBase64.errmessage + " ]";
		ErrCode = "에러코드 [ " + CBase64.errcode + " ]";  
		//out.println("서명값 Base64 Decode 결과 : 실패<br>") ;
		//out.println("에러내용 : " + CBase64.errmessage + "<br>");
		//out.println("에러코드 : " + CBase64.errcode + "<br>");
	}
		

	if (boolCertChk == false)
	{
%>
		<SCRIPT LANGUAGE="JavaScript">
		<!--
			alert("<%=ErrMsg%>\n\n<%=ErrCode%>");
			history.back();
		//-->
		</SCRIPT>
<%
	}
	else
	{
		out.print("성공");
	}

	
%>

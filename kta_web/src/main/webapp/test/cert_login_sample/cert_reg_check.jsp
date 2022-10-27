<%@ page language="java" import="java.io.*,java.util.*,crosscert.*" %>
<%@ page contentType = "text/html; charset=utf-8" %>

<%  
	/*-------------------------시작----------------------------*/ 
	response.setDateHeader("Expires",0); 
	response.setHeader("Prama","no-cache"); 

	if(request.getProtocol().equals("HTTP/1.1")) 
	{ 
		response.setHeader("Cache-Control","no-cache"); 
	} 
	/*------------------------- 끝----------------------------*/ 


	
	
	String idn = request.getParameter("idn");		            // 주민번호 DB에 저장될 값
	String signeddata = request.getParameter("signeddata");		// 서명된 값
	String sRandom = request.getParameter("userR");	

	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	String userDN = "";   // DB에 저장될 값 인증서에서 추출함.
	
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
				/*
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
				*/

				userDN = CCertificate.subject;

				/*
					ID와 PWD로 기존 회원인지 검색을 함.
					userDN 으로 DB 검색하여 주민/사업자번호와 ID를 가져와야 함. DN 값은 기등록되어 있는 상태
					ID는 성공후 세션값으로 설정하기 위함

					idn = "주민번호";
				*/
				
				
				nRet=CCertificate.VerifyVID(CVerifier.certbuf, CVerifier.certlen, sRandom.getBytes(), sRandom.length(), idn);
				if(nRet==0) 
				{
					
					//out.println("식별번호 검증 결과 : 성공<br>") ;

					String policies = "";

					/* 개인상호연동용(범용) */
					/*
					policies +="1.2.410.200004.5.2.1.1"    + "|";          // 한국정보인증               법인
					policies +="1.2.410.200004.5.1.1.7"    + "|";          // 한국증권전산               법인, 단체, 개인사업자
					policies +="1.2.410.200005.1.1.5"      + "|";          // 금융결제원                 법인, 임의단체, 개인사업자
					policies +="1.2.410.200004.5.3.1.1"    + "|";          // 한국전산원                 기관(국가기관 및 비영리기관)
					policies +="1.2.410.200004.5.3.1.2"    + "|";          // 한국전산원                 법인(국가기관 및 비영리기관을  제외한 공공기관, 법인)
					policies +="1.2.410.200004.5.4.1.2"    + "|";          // 한국전자인증               법인, 단체, 개인사업자
					policies +="1.2.410.200012.1.1.3"      + "|";          // 한국무역정보통신           법인
					*/
					/* 전자인증 철도시설공단 전용 인증서 */
					/*
					policies += "1.2.410.200004.5.4.1.30"      + "|";
					*/
					 /* 개인상호연동용(범용) */                            //
					
					policies +="1.2.410.200004.5.2.1.2"    + "|";          // 한국정보인증               개인                                             
					policies +="1.2.410.200004.5.1.1.5"    + "|";          // 한국증권전산               개인                                             
					policies +="1.2.410.200005.1.1.1"      + "|";          // 금융결제원                 개인                                             
					policies +="1.2.410.200004.5.3.1.4"    + "|";          // 한국전산원           개인(국가기관, 공공기관 및 법인의 소속직원 등)   
					policies +="1.2.410.200004.5.4.1.1"    + "|";          // 한국전자인증               개인                                             
					policies +="1.2.410.200012.1.1.1"      + "|";          // 한국무역정보통신           개인                                             
					policies +="1.2.410.200005.1.1.4"      + "|";          // 금융결제원                 인터넷뱅킹용                                             
					
					// 개인 용도제한용 인증서정책(OID)                 용도                    공인인증기관
					policies += "1.2.410.200004.5.4.1.101"    + "|";        // 은행거래용/보험용       한국전자인증
					//policies += "1.2.410.200004.5.4.1.102"    + "|";        // 증권거래용              한국전자인증
					//policies += "1.2.410.200004.5.4.1.103"    + "|";        // 신용카드용              한국전자인증
					//policies += "1.2.410.200004.5.4.1.104"    + "|";        // 전자민원용              한국전자인증
					policies += "1.2.410.200004.5.2.1.7.1"    + "|";        // 은행거래용/보험용       한국정보인증
					//policies += "1.2.410.200004.5.2.1.7.2"    + "|";        // 증권거래용/보험용       한국정보인증
					//policies += "1.2.410.200004.5.2.1.7.3"    + "|";        // 신용카드용              한국정보인증
					//policies += "1.2.410.200004.5.1.1.9"      + "|";          // 증권거래용/보험용       한국증전산
					//policies += "1.2.410.200004.5.1.1.9.2"    + "|";        // 신용카드용              한국증전산
					//policies += "1.2.410.200005.1.1.4"        + "|";            // 은행거래용/보험용       금융결제원
					//policies += "1.2.410.200005.1.1.6.2"      + "|";          // 신용카드용              금융결제원
					policies += "1.2.410.200012.1.1.101"      + "|";          // 은행거래용/보험용       한국무역정보통신
					//policies += "1.2.410.200012.1.1.103"      + "|";          // 증권거래용/보험용       한국무역정보통신
					//policies += "1.2.410.200012.1.1.105"      + "|";           // 신용카드용              한국무역정보통신

					//policies += "1.2.410.200004.5.2.1.5001"      + "|";           // 국세청              정보인증

					
					// 인증서 검증
					nRet=CCertificate.ValidateCert(CVerifier.certbuf, CVerifier.certlen, policies, 1);

					if(nRet==0) 
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
					ErrMsg = "식별번호 검증 실패 [ 에러내용 : 인증서의 주민번호를 확인바랍니다. ]"; 
					ErrCode = "에러코드 [ " + CCertificate.errcode + " ]";  
					//out.println("식별번호 검증 결과 : 실패<br>") ;
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
			///history.back();
		//-->
		</SCRIPT>
<%
	}
	else
	{
		out.print("성공<br>");
		out.print("DN값과 주민/사업자번호를 DB에 저장함.<br>");
		out.print("DN : " + userDN + "<br>");
		out.print("아이디 : " + userid + "<br>");
		out.print("주민번호 : " + idn + "<br>");
	}

	
%>

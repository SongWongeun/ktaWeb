<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="../init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function init()
{
	var Ret;

	var policies = "";


	 /* 개인상호연동용(범용) */
	
	policies +="1.2.410.200004.5.2.1.2"    + "|";          // 한국정보인증               개인                                             
	policies +="1.2.410.200004.5.1.1.5"    + "|";          // 한국증권전산               개인                                             
	policies +="1.2.410.200005.1.1.1"      + "|";          // 금융결제원                 개인                                               
	policies +="1.2.410.200004.5.4.1.1"    + "|";          // 한국전자인증               개인                                             
	policies +="1.2.410.200012.1.1.1"      + "|";          // 한국무역정보통신           개인                                             
	

	// 개인 용도제한용 인증서정책(OID)                 용도                    공인인증기관
	
	policies += "1.2.410.200004.5.4.1.101|";        // 은행거래용/보험용       한국전자인증
	policies += "1.2.410.200004.5.4.1.102|";        // 증권거래용              한국전자인증
	policies += "1.2.410.200004.5.4.1.103|";        // 신용카드용              한국전자인증
	policies += "1.2.410.200004.5.4.1.104|";        // 전자민원용              한국전자인증
	policies += "1.2.410.200004.5.2.1.7.1|";        // 은행거래용/보험용       한국정보인증
	policies += "1.2.410.200004.5.2.1.7.2|";        // 증권거래용/보험용       한국정보인증
	policies += "1.2.410.200004.5.2.1.7.3|";        // 신용카드용              한국정보인증
	policies += "1.2.410.200004.5.1.1.9|";          // 증권거래용/보험용       한국증전산
	policies += "1.2.410.200004.5.1.1.9.2|";        // 신용카드용              한국증전산
	policies += "1.2.410.200005.1.1.4|";            // 은행거래용/보험용       금융결제원
	policies += "1.2.410.200005.1.1.6.2|";          // 신용카드용              금융결제원
	policies += "1.2.410.200012.1.1.101|";          // 은행거래용/보험용       한국무역정보통신
	policies += "1.2.410.200012.1.1.103|";          // 증권거래용/보험용       한국무역정보통신
	policies += "1.2.410.200012.1.1.105";           // 신용카드용              한국무역정보통신
	
	//
	 /* 법인상호연동용(범용) */                            //
	
	policies +="1.2.410.200004.5.2.1.1"    + "|";          // 한국정보인증               법인
	policies +="1.2.410.200004.5.1.1.7"    + "|";          // 한국증권전산               법인, 단체, 개인사업자
	policies +="1.2.410.200005.1.1.5"      + "|";          // 금융결제원                 법인, 임의단체, 개인사업자
	policies +="1.2.410.200004.5.4.1.2"    + "|";          // 한국전자인증               법인, 단체, 개인사업자
	policies +="1.2.410.200012.1.1.3"      + "|";          // 한국무역정보통신           법인
	
	

	
	Ret =  document.CC_Object_id.SetCommonInfoFromVal("211.192.169.70",4502, 
														"211.192.169.180",389, 
														"211.192.169.180",389,
														"CN=ROOT-RSA-CRL,OU=ROOTCA,O=KISA,C=KR",
														"no",
														policies);
	if ( Ret != 0 )
	{ 
		alert( "인증 초기 설정에 실패하였습니다." );
		return false;
	}
	else
	{
		Ret =  document.CC_Object_id.SetPKCSInform(1, 0, 0, 0, 0, 0, 0, 1, "SEED");
		if ( Ret != 0 )
		{ 
			alert( "인증 초기 설정에 실패하였습니다." );
			return false;
		}
		else
		{
			return true;
		}
	}	
}

function SignData()
{
    

	// 환경설정 함수 콜
	//init();
	var ret;
	var signeddata, textin;
	var userdn;

	if( document.test.src.value == null || document.test.src.value == "" )
	{
		alert("서명할 데이타를 넣어주십시요");
		return;
	}



	// 인증서 선택창 초기화 및 선택된 인증서의 DN 추출
	// DN은 인증기관에서 유니크한 것임.
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		alert(" 사용자 DN 선택이 취소 되었습니다.");
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
		signeddata = document.CC_Object_id.SignData( document.test.src.value, "SHA1", "");

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

			ret = CC_Object_id.ValidCert_VID(userdn, getR, document.test.ssn.value)
			if (ret == "0")
			{
				alert("신원확인 성공");
				
			}
			else
			{
				alert("신원확인 실패");	
				
			}


			document.test.signed_data.value = signeddata;
			document.test.action = "verify.jsp";
			document.test.method = "post";
			//document.test.submit();
			
		}
	}
}
function sendit()
{
	
	document.test.action = "verify.jsp";
	document.test.method = "post";
	document.test.submit();
}
//-->
</SCRIPT>
</HEAD>

<BODY>
● 전자서명(PKCS#7)<br><br>
● 개요 : 인증서 선택창을 통해 선택된 서명용 인증서와 비밀키, 인증경로 정보를 이용해 평문에 대한 전자서명을 수행<br><br>
● 사용된 함수<br><br>
♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ GetUserDN() : 인증서 선택창 초기화 및 선택된 인증서의 DN 추출<br>
♣ SignData(원본, 알고리즘, 비밀번호) : 전자서명(PKCS#7) 수행<br>
♣ GetRFromKey(DN, 비밀번호) : 식별번호 추출
<form name="test">
<div align = center>


<table>
  <tr> 
	<td align="center"> 원문<br>
	  <textarea name="src" rows="20" cols="40">01:506-81-32479+02:(주)스마코+03:제조,도소매+04:경북 포항시 남구 연일읍 오천리 634-4번지+05:506-81-00017+06:포항종합제철(주)+07:제조,서비스,도소매,부동산+08:경북 포항시 남구 괴동동 1번지+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L외+14:+15:+16:2001-07-02+30:</textarea>
	</td>
	<td align="center"> 서명값<br>
	  <textarea name="signed_data" rows="20" cols="40"></textarea>
	</td>
  <tr>
	<td align="center">주민번호/사업자번호(숫자만입력)</td>
	<td align="center"><input type = text name = "ssn" value = "1234567890"></td>
  </tr>
  <tr> 
	<td align="center"><input type = button value = "전자서명(PKCS#7)" OnClick = "SignData()"></td>
	<td align="center"><input type = button value = "전송" OnClick = "sendit()"></td>
  </tr>
</table>
</div>
</form>

<!--<iframe src="../refer.html" frameborder="0" width="450" height="300" marginwidth="0" marginheight="0" scrolling="auto"></iframe>//-->                  


</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="../CC_Object.js"></script>

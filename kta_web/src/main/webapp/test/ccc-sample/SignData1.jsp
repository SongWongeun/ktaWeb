<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SignData()
{
    

	// 환경설정 함수 콜
	init();
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

		

		signeddata = document.CC_Object_id.genSignature(userdn, "", "SHA1RSA", document.test.src.value)

		if( signeddata == null || signeddata == "" )
		{
			errmsg = document.CC_Object_id.GetErrorContent();
			errcode = document.CC_Object_id.GetErrorCode();
			alert( "SignData :"+errmsg );
			return;
		}
		else
		{
			UserCert = document.CC_Object_id.CC_get_cert_local(userdn)
			if (UserCert =="")
			{
				alert("인증서 추출 실패");
				return;

			}
			else
			{
				UserCert = Repalce_cert(UserCert);
			}
			getR = CC_Object_id.GetRFromKey(userdn, "");
			if (getR == "")
			{
				alert("주민번호/사업자번호를 확인할 수 없는 인증서입니다.");
				return;
			}

			document.test.signed_data.value = signeddata;
			document.test.user_cert.value = UserCert;

		}
	}
}

function Repalce_cert(str_cert)
{
	var parse_cert = "";
	if (str_cert == "")
		return str;
	else
	{
		parse_cert = str_cert.replace(/\n/g, "");
		parse_cert = parse_cert.replace(/-----BEGIN CERTIFICATE-----/g, "");
		parse_cert = parse_cert.replace(/-----END CERTIFICATE-----/g, "");
	}
	return parse_cert;
}

function sendit()
{
	
	document.test.action = "verify1.asp";
	document.test.method = "post";
	document.test.submit();
}

//-->
</SCRIPT>
</HEAD>

<BODY>
● 전자서명<br><br>
● 개요 : 인증서 선택창을 통해 선택된 서명용 인증서와 비밀키, 인증경로 정보를 이용해 평문에 대한 전자서명을 수행<br><br>
● 사용된 함수<br><br>
♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ GetUserDN() : 인증서 선택창 초기화 및 선택된 인증서의 DN 추출<br>
♣ genSignature(DN, 알고리즘, 원본, 비밀번호) : 전자서명(PKCS#1) 수행<br>
♣ CC_get_cert_local(DN) : 선택한 인증서 추출<br>
<form name="test">
<div align = center>


<table>
  <tr> 
	<td align="center"> 원본<br>
	  <textarea name="src" rows="20" cols="40">01:506-81-32479+02:(주)스마코+03:제조,도소매+04:경북 포항시 남구 연일읍 오천리 634-4번지+05:506-81-00017+06:포항종합제철(주)+07:제조,서비스,도소매,부동산+08:경북 포항시 남구 괴동동 1번지+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L외+14:+15:+16:2001-07-02+30:</textarea>
	</td>
	<td align="center"> 서명값<br>
	  <textarea name="signed_data" rows="7" cols="40"></textarea><br>전자서명값(PKCS #1 : 인증서 및 원문 미포함)<br><br>
	  서명시 사용한 인증서<br>
	  <textarea name="user_cert" rows="9" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center" colspan = 2><input type = button value = "전자서명" OnClick = "SignData()"></td>
  </tr>

</table>
</div>
</form>

</BODY>
</HTML>
<!-- 전자인증 모듈 //-->
<script language="javascript" src="./CC_Object.js"></script>

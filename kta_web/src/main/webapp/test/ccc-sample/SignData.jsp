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

			document.test.signed_data.value = signeddata;
		}
	}
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
♣ SignData(원본, 알고리즘, 비밀번호) : 전자서명 수행<br>
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
	<td align="center"><input type = button value = "전자서명" OnClick = "SignData()"></td>
	<td align="center">전자서명값(PKCS #7 : 인증서 및 원문 포함)</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>


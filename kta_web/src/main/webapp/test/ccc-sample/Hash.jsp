<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function HashData()
{
    

	// 환경설정 함수 콜
	init();
	var ret;
	var signeddata, textin;
	var userdn;

	if( document.test.src.value == null || document.test.src.value == "" )
	{
		alert("원문 데이타를 넣어주십시요");
		return;
	}

	// 전자서명 생성
	// BSTR *GetHashData(BSTR Source, BSTR HashAlgo);
	// parameters : 
	//   Source : 해쉬할 메세지
	//   HashAlgo : 해쉬 알고리즘 ("SHA1", "MD5") ==> SHA1이 표준
	//   Password : 개인키 복호를 위한 패스워드
	// return value : 생성된 해쉬 값
	
	hashdata = document.CC_Object_id.GetHashData( document.test.src.value, "SHA1");

	if( hashdata == null || hashdata == "" )
	{
		errmsg = document.CC_Object_id.GetErrorContent();
		errcode = document.CC_Object_id.GetErrorCode();
		alert( "hashdata :"+errmsg );
		return;
	}
	else
	{

	

		document.test.hash_data.value = hashdata;
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
♣ GetHashData("원문", 알고리즘) : 입력된 원문으로부터 해쉬값 추출<br>
<form name="test">
<div align = center>


<table>
  <tr> 
	<td align="center"> 원문 <br>
	  <textarea name="src" rows="20" cols="40">01:506-81-32479+02:(주)스마코+03:제조,도소매+04:경북 포항시 남구 연일읍 오천리 634-4번지+05:506-81-00017+06:포항종합제철(주)+07:제조,서비스,도소매,부동산+08:경북 포항시 남구 괴동동 1번지+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L외+14:+15:+16:2001-07-02+30:</textarea>
	</td>
	<td align="center"> 해쉬값 <br>
	  <textarea name="hash_data" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center"><input type = button value = "해쉬값 추출" OnClick = "HashData()"></td>
	<td align="center">해쉬값</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>


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
    
	init();
	var ret;
    var signeddata, textin;
	var userdn;
   
   

   // 전자서명 생성
   // BSTR *SignData(BSTR Source, BSTR HashAlgo, BSTR Password);
   // parameters : 
   //   Source : 전자서명할 메세지
   //   HashAlgo : 서명 알고리즘 ("SHA1", "MD5")
   //   Password : 개인키 복호를 위한 패스워드
   // return value : 생성된 전자서명 값
   // 참 고 : 암호를 넣지 않았을 경우에는 암호 입력 다이얼로그 박스에 입력한다.

   // 추가된 부분
   userdn = document.CC_Object_id.GetUserDN();
   if( userdn == null || userdn == "" )
   { 
       alert(" 사용자 DN 선택이 취소 되었습니다.");
       return;
   }
   else
   {
	   for(i = 0;i <document.test.src.length;i++)
	   {
	   
		   signeddata = document.CC_Object_id.SignData( document.test.src[i].value, "SHA1", "");
	   
		   if( signeddata == null || signeddata == "" )
		   {
			   errmsg = document.CC_Object_id.GetErrorContent();
			   errcode = document.CC_Object_id.GetErrorCode();
			   alert( "SignData :"+errmsg );
			  return;
		   }
		   else
		   {
			  document.test.signed_data[i].value = signeddata;
		   }
	   }
	   
   }
}

function SignVerify()
{
   init();
   var signdata;

   
   // 전자서명 검증

	for(i = 0;i <document.test.signed_data.length;i++)
	{
	   
		src =  document.CC_Object_id.VerifySignData( document.test.signed_data[i].value, "SHA1" );

		if( src != null && src != "" )
		{
		  document.test.src1[i].value = src;
		}
		else
		{
		   errmsg = document.CC_Object_id.GetErrorContent();
		   errcode = document.CC_Object_id.GetErrorCode();
		   alert( "SignData :"+errmsg );
		  return;
		} 
	}

}
//-->
</SCRIPT>
</HEAD>

<BODY>

<form name="test">
<div align =center>
<br>멀티서명 샘플<br>
<table>
  <tr> 
	<td align="center"> 원문<br>
	  <input type = text  name="src" value ="01:506-81-32479+02:(주eeeeeeeeeee)스마코+03:제조,도소매+04:경북 포항시 남구 연일읍 오천리 634-4번지+05:506-81-00017+06:포항종합제철(주)+07:제조,서비스,도소매,부동산+08:경북 포항시 남구 괴동동 1번지+10:10,790,420+11:1,079,042+12:2001-07-02+13:CutAICOOL,200 L외+14:+15:+16:2001-07-02+30:" size = 50>
	</td>
	<td align="center"> 서명값<br>
	  <input type = text  name="signed_data">
	</td>
	<td align="center"> 원문<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"> 원문<br>
	  <input type = text  name="src" value ="01:506-81-32479+02:(주rrrrrrrrrr)스마코+03:제조,도소매+04:경북 포항시 남구 연일읍 오천리 634-4번지+05:506-81-00017+06:포항종합제철(주)+07:제조,서비스,도소매,부동산+08:경북 포항시sdddddddddddddddddddddddddddddddds 남구 괴동동 1번지+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L외+14:+15:+16:2001-07-02+30:" size = 50 >
	</td>
	<td align="center"> 서명값<br>
	  <input type = text  name="signed_data">
	</td>
	<td align="center"> 원문<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"> 원문<br>
	  <input type = text  name="src" value ="01:5dd06-81-32479+02:(주)스hhhhhhhhh마코+03:제조,도소매+04:경북 포항시 남구 연일읍 오천리 634-4번지+05:506-81-00017+06:포항종합제철(주)+07:제조,서비스,도소매,부동산+08:경북 포항시 남구 괴동동 1번지+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L외+14:+15:+16:2001-07-02+30:"  size = 50>
	</td>
	<td align="center"> 서명값<br>
	  <input type = text  name="signed_data">
	</td>
	<td align="center"> 원문<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"> 원문<br>
	  <input type = text  name="src" value ="01:506-81-32479+02:(주)스dfdsssfsdf마코+03:제조,도소매+04:경북 포항시 남구 연일읍 오천리 634-4번지+05:506-81-00017+06:포항종합제철(주)+07:제조,서비스,도소매,부동산+08:경북 포항시 남구 괴동동 1번지+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L외+14:+15:+16:2001-07-02+30:"  size = 50>
	</td>
	<td align="center"> 서명값<br>
	  <input type = text  name="signed_data">
	</td>
	<td align="center"> 원문<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"> 원문<br>
	  <input type = text  name="src" value ="01:506-81-32479+02:(주)스마mmmmmmmmm코+03:제조,도소매+04:경북 포항시 남구 연일읍 오천리 634-4번지+05:506-81-00017+06:포항종합제철(주)+07:제조,서비스,도소매,부동산+08:경북 포항시 남구 괴동동 1번지+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting 35333455353535353OOL,200 L외+14:+15:+16:2001-07-02+30:"  size = 50>
	</td>
	<td align="center"> 서명값<br>
	  <input type = text1  name="signed_data">
	</td>
	<td align="center"> 원문<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"><a href="javascript:SignData();" name="signok" alt=전자서명생성>전자서명</a></td>
	<td align="center"><a href="javascript:SignVerify();" name="verifyok" alt=전자서명검증>전자서명검증</a></td>
  </tr>
</table>
</div>
</form>
                  
</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>
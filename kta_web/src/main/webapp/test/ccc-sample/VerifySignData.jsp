<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SignVerify()
{
   init();
   var origin;

   if( document.test.signed_data.value == null || document.test.signed_data.value == "" )
   {
        alert("전자서명 값을 넣어주십시요");
        return;
   }
   
   // 전자서명 검증
   aaa = document.CC_Object_id.SetValidationFlag(0);
   origin =  document.CC_Object_id.VerifySignData( document.test.signed_data.value, "SHA1" );
   aaa = document.CC_Object_id.SetValidationFlag(1);
   
   if( origin != null && origin != "" )
   {
      alert("검증 성공");
	  document.test.src.value = origin
	  
   }
   else
   {
       errmsg = document.CC_Object_id.GetErrorContent();
       errcode = document.CC_Object_id.GetErrorCode();
       alert( "SignVerify :"+errmsg );
      return;
   }   

}
//-->
</SCRIPT>
</HEAD>

<BODY>
● 전자서명검증<br><br>
● 개요 : 인증서 선택창을 통해 선택된 서명용 인증서와 비밀키, 인증경로 정보를 이용해 평문에 대한 전자서명을 수행<br><br>
● 사용된 함수<br><br>
♣SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣VerifySignData(서명값, 알고리즘) : 전자서명검증

<form name="test">
<div align = center>
<table>
  <tr> 
	<td align="center"> 원본<br>
	  <textarea name="src" rows="20" cols="40"></textarea>
	</td>
	<td align="center"> 서명값<br>
	  <textarea name="signed_data" rows="20" cols="40">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</textarea>
	</td>
  <tr> 
	<td align="center">전자서명검증</td>
	<td align="center"><input type = button value = "전자서명검증" OnClick = "SignVerify()"></td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

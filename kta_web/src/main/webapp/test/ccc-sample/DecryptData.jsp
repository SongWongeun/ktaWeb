<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function DecryptData()
{
	init();
	var origin;
	var enc_data;
	var enc_cert;
	
	if( document.test.enc_data.value == null || document.test.enc_data.value == "" )
	{
		alert("복호화할 값을 넣어주십시요");
		return;
	}
   
	origin =  document.CC_Object_id.DecryptData(document.test.enc_data.value, "");
		
	
	if( origin != null && origin != "" )
	{
		alert("암호화 성공");
		document.test.src.value = origin;

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
● 복호화(비대칭형)<br><br>
● 개요 : 암호화된 데이타를 암호화된 인증서의 공개키로 풀어서 원문을 생성한다. 암호화에 사용된 인증서를 선택해야 한다. 또한 비밀번호가 없을 때에는 비밀번호 입력창이 나타난다.<br>
● 사용된 함수<br><br>
 ♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
 ♣ DecryptData(암호화값, 암호화에 사용한 인증서비밀번호) : 복호화

<form name="test">
<div align = center>
<table>
  <tr> 
	<td align="center"> 원본<br>
	  <textarea name="src" rows="20" cols="40"></textarea>
	</td>
	<td align="center"> 암호화값<br>
	  <textarea name="enc_data" rows="20" cols="40">MIIBewYJKoZIhvcNAQcDoIIBbDCCAWgCAQExggEEMIIBAAIBADBpMGIxCzAJBgNVBAYTAktSMRIwEAYDVQQKDAlDcm9zc0NlcnQxFTATBgNVBAsMDEFjY3JlZGl0ZWRDQTEoMCYGA1UEAwwfQ3Jvc3NDZXJ0IENlcnRpZmljYXRlIEF1dGhvcml0eQIDIBbhMA0GCSqGSIb3DQEBAQUABIGAAGUljvT3rKxCITslXZZ0xd0H+4zZj3WrpYPRL14dGCgM/9V0rId0ltK0EJKKSPhKcOlmsYnZkPXGKeoHDfH+FhF5nOjv0cOE4yFmFLPnOfzCx3i95SQk4KybMqqL07D4ex9MuDwAf6zLYIBH3sYLxoWl4LEbHzFqOX9+qPvI5mAwWwYJKoZIhvcNAQcBMBwGCCqDGoyaRAEEBBC3OBToMSefgzvfgXcOhGI+gDDMGNKzzBLdgHiyJxMALSvoIxlpnk06CUlfz45nXUjwo6j0oHIt35eqVe91GzP7DCw=</textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center"><input type = button value = "복호화(비대칭형)" OnClick = "DecryptData()"><br><br>
	
	</td>
  </tr>
</table>
</div>
</form>

</HTML>


<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

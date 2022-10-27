<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SymmDecryption(seq, alg, pwd)
{
	init();
	var origin;
	var enc_data;
	var enc_cert;
	
	if( document.test.enc_data[seq].value == null || document.test.enc_data[seq].value == "" )
	{
		alert("암호화할 원문 값을 넣어주십시요");
		return;
	}
   
	// 암호화
	origin =  document.CC_Object_id.SymmDecryption(alg, pwd, document.test.enc_data[seq].value);

  	if( origin != null && origin != "" )
	{
		alert("복호화 성공");
		document.test.src[seq].value = origin

	}
	else
	{
		errmsg = document.CC_Object_id.GetErrorContent();
		errcode = document.CC_Object_id.GetErrorCode();
		alert( "SymmEncryption :"+errmsg );
		return;
	}   

}
//-->
</SCRIPT>
</HEAD>

<BODY>
● 암호화(대칭형)<br><br>
● 개요 : 입력된 대칭키 암호 알고리즘과 키를 사용하여 테이터를 복호화 한다.<br><br>
● 사용된 함수<br><br>
♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ SymmDecryption(암호알고리즘, 비밀번호, 암호테이타) : 암호화. 암호알고리즘 : SEED, 3DES, RC2

<form name="test">
<div align = center>
<table>
  <tr> 
	<td align="center"> 원본<br>
	  <textarea name="src" rows="5" cols="40"></textarea>
	</td>
	<td align="center"> 암호화값(SEED)<br>
	  <textarea name="enc_data" rows="5" cols="40">hMH0ERzpwIIY6kEdZ+Hl+sRDpUYXN/eFF3aW1QFDxJ2i1jwpa9GmaYoSK173w286</textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center"><input type = button value = "복호화(대칭형 - SEED, 0123456789)" OnClick = "SymmDecryption('0', 'SEED', '0123456789')">
	<br><br>
	</td>
  </tr>
  <tr> 
	<td align="center"> 원본<br>
	  <textarea name="src" rows="5" cols="40"></textarea>
	</td>
	<td align="center"> 암호화값(3DES)<br>
	  <textarea name="enc_data" rows="5" cols="40">c6Vymzmc5R/kb8Ck5EUwG2bTbOgLUY1McUQdkWLJHrFUqIsaw7uRCa4Hj3+hk6DX</textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">
	<input type = button value = "복호화(대칭형 - 3DES, 0123456789)" OnClick = "SymmDecryption('1', '3DES','0123456789')">
	<br><br>
	</td>
  </tr>
  <tr> 
	<td align="center"> 원본<br>
	  <textarea name="src" rows="5" cols="40"></textarea>
	</td>
	<td align="center"> 암호화값(RC2)<br>
	  <textarea name="enc_data" rows="5" cols="40">P51M3Q5EaFIr1WCbGJ3b38V/CyYbJOwlcx6BhDZf2MOgsL8uuQRkXzxTTWc+vF+Q</textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">
	<input type = button value = "복호화(대칭형 - RC2, 0123456789)" OnClick = "SymmDecryption('2', 'RC2', '0123456789')">
	</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

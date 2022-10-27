<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SymmEncryption(alg, pwd)
{
	init();
	var origin;
	var enc_data;
	var enc_cert;
	
	if( document.test.src.value == null || document.test.src.value == "" )
	{
		alert("암호화할 원문 값을 넣어주십시요");
		return;
	}
   
	// 암호화
	enc_data =  document.CC_Object_id.SymmEncryption(alg, pwd, document.test.src.value);

  	if( enc_data != null && enc_data != "" )
	{
		alert("암호화 성공");
		document.test.enc_data.value = enc_data

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
● 개요 : 입력된 대칭키 암호 알고리즘과 키를 사용하여 테이터를 암호화 한다.<br><br>
● 사용된 함수<br><br>
♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ SymmEncryption(암호알고리즘, 비밀번호, 평문) : 암호화. 암호알고리즘 : SEED, 3DES, RC2

<form name="test">
<div align = center>
<table>
  <tr> 
	<td align="center"> 원본<br>
	  <textarea name="src" rows="20" cols="40">1234567890abcdefghijklmnopqrstuvwxyxz한글*##*</textarea>
	</td>
	<td align="center"> 암호화값<br>
	  <textarea name="enc_data" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center"><input type = button value = "암호화(대칭형 - SEED, 0123456789)" OnClick = "SymmEncryption('SEED', '0123456789')"><br><br>
	<input type = button value = "암호화(대칭형 - 3DES, 0123456789)" OnClick = "SymmEncryption('3DES','0123456789')"><br><br>
	<input type = button value = "암호화(대칭형 - RC2, 0123456789)" OnClick = "SymmEncryption('RC2', '0123456789')">
	</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

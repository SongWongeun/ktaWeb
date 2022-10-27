<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function GetUserDN()
{
    

	// 환경설정 함수 콜
	init();
	var ret;
	var signeddata, textin;
	var userdn;

	



	// 인증서 선택창 초기화 및 선택된 인증서의 DN 추출
	// DN은 인증기관에서 유니크한 것임.
	
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		alert(" 사용자 DN 선택이 취소 되었습니다.");
		return;
	}

	document.test.dn.value = userdn;
}

//-->
</SCRIPT>
</HEAD>

<BODY>
● 인증서 사용자 DN 검색<br><br>
● 개요 : 사용자의 로컬에 저장되어 있는(하드디스크, 플로피디스크, 스마트카드, USB) 인증서를 선택할 수 있도록 다이얼로그 박스를 띄우고 사용자가 선택한 인증서의 사용자 DN값을 제공한다.
GetUserDn() 함수를 이용하여 사용자가 마지막으로 선택한 사용자 DN 정보를 보관하므로 전자서명이나 식별번호 처리시에 선택된 인증서로 동시에 처리할 수 있다.
있다.<br><br>
● 사용된 함수<br><br>
♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ GetUserDN() : 인증서 선택창 초기화 및 선택된 인증서의 DN 추출<br>

<form name="test">
<div align = center>


<table>
  <tr>
	<td>
	 <input type = button value = "인증서 사용자 DN 검색" OnClick = "GetUserDN()">
	</td>
	<td>
	  <textarea name="dn" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">선택된 인증서의 DN</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

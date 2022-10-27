<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function GetOIDFromCert()
{
    

	// 환경설정 함수 콜
	init();
	var ret;
	var signeddata, textin;
	var userdn;
	var oid;

	



	// 인증서 선택창 초기화 및 선택된 인증서의 DN 추출
	// DN은 인증기관에서 유니크한 것임.
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		alert(" 사용자 DN 선택이 취소 되었습니다.");
		return;
	}

	oid = document.CC_Object_id.GetOIDFromCert(userdn);
	document.test.oid.value = oid;


}

//-->
</SCRIPT>
</HEAD>

<BODY>
● 인증서 정책(OID) 추출<br><br>
● 개요 : 입력된 사용자 DN으로 인증서의 OID값을 추출한다.<br><br>
● 사용된 함수<br><br>
♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ GetUserDN() : 인증서 선택창 초기화 및 선택된 인증서의 DN 추출<br>
♣ GetOIDFromCert(인증서DN) : 인증서 정책 추출

<form name="test">
<div align = center>


<table>
  <tr>
	<td>
	 <input type = button value = "인증서 정책 추출" OnClick = "GetOIDFromCert()">
	</td>
	<td>
	  <textarea name="oid" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">추출된 인증서정책(OID)</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

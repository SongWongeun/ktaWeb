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

	


/*	
	입력된 사용자 DN으로 개인키를 읽어서 R값을 추출한다. 
	DN값이 없으면 인증서 선택창이 나타난다. 
	또한 비빌번호가 없으면 비밀번호 창이 나타난다.
	
	
*/
	getR = CC_Object_id.GetRFromKey(userdn, "");
	if (getR == "")
	{
		alert("주민번호/사업자번호를 확인할 수 없는 인증서입니다.");
		return;
	}

	document.test.userR.value = getR;
}

//-->
</SCRIPT>
</HEAD>

<BODY>
● 신원확인 - 식별번호추출<br><br>
● 개요 : 입력된 사용자 DN으로 개인키를 읽어서 R값을 추출한다. DN값이 없으면 인증서 선택창이 나타난다. 또한 비빌번호가 없으면 비밀번호 창이 나타난다.<br><br>
● 사용된 함수<br><br>
♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ GetRFromKey(DN, 비밀번호) : 식별번호 추출

<form name="test">
<div align = center>


<table>
  <tr>
	<td>
	 <input type = button value = "식별번호추출(Random value)" OnClick = "GetUserDN()">
	</td>
	<td>
	  <textarea name="userR" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">식별번호(Random value)</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

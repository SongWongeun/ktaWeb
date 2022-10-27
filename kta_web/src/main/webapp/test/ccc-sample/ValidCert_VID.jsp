<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function ValidCert_VID()
{
    

	// 환경설정 함수 콜
	init();
	var ret;
	var signeddata, textin;
	var userdn;
	var getR;
	

/*	
	입력된 사용자 DN으로 개인키를 읽어서 R값을 추출한다. 
	DN값이 없으면 인증서 선택창이 나타난다. 
	또한 비빌번호가 없으면 비밀번호 창이 나타난다.
	
	
*/	
	userdn = CC_Object_id.GetUserDN();
	
	getR = CC_Object_id.GetRFromKey(userdn, "");
	
	if (getR == "")
	{
		alert("주민번호/사업자번호를 확인할 수 없는 인증서입니다.");
		return;
	}
	document.test.userR.value = getR;
	ret = CC_Object_id.ValidCert_VID(userdn, getR, document.test.ssn.value)
	alert(ret);		
	if (ret == "0")
	{
		alert("신원확인 성공");
		
	}
	else
	{
		alert("신원확인 실패");	
		
	}

}

//-->
</SCRIPT>
</HEAD>

<BODY>
● 신원확인 - 클라이언트<br><br>
● 개요 : 입력된 사용자 DN으로 인증서를 읽어서 VID를 추출한 다음 식별번호 R값과 주민등록번호(사업자번호)을 계산하여 동일여부를 판단한다. 클라이언트가 자기자신은 확인하는 것이다. <br><br>
● 사용된 함수<br><br>

♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ GetUserDN() <br>
♣ GetRFromKey(인증서DN, 비밀번호)<br>
♣ ValidCert_VID(인증서DN, 식별번호R값, 주민등록번호) : 신원확인 - 클라이언트

<form name="test">
<div align = center>


<table>
  <tr>
	<td>
	 <input type = button value = "본인확인 - 클라이언트" OnClick = "ValidCert_VID()">
	</td>
	<td>
	  <textarea name="userR" rows="20" cols="40"></textarea>
	</td>
  </tr>
  <tr>
	<td>
	 주민등록번호 또는 사업자번호
	</td>
	<td>
	  <input type = text name = ssn value = "1234567890">
	</td>
  </tr>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">신원확인</td>
  </tr>
</table>
</div>
</form>

<!--<center><iframe src="refer.html" frameborder="0" width="800" height="300" marginwidth="0" marginheight="0" scrolling="auto"></iframe></center>//-->


</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

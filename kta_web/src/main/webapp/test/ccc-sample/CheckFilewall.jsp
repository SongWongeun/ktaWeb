<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function CheckFilewall()
{
    

	// 환경설정 함수 콜
	init();
	var ret;
	
/*	
	전자인증의 CA 서버, 전자인증의 디렉토리서버, 
	RootCA(정보보호진흥원) 디렉토리 서버와의 통신여부 첵크
*/	

	ret = CC_Object_id.CheckFilewall();

}





//-->
</SCRIPT>
</HEAD>

<BODY>
● 방화벽 테스트<br><br>
● 개요 : 전자인증의 CA 서버, 전자인증의 디렉토리서버, RootCA(정보보호진흥원) 디렉토리 서버와의 통신여부 첵크<br><br>
● 사용된 함수<br><br>

♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ CheckFilewall()

<form name="test">
<div align = center>
<table>
 
  <tr>
	<td>
	  <input type = button value = "방화벽 테스트" OnClick = "CheckFilewall()">
	</td>
  </tr>
 
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

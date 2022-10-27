<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SetSystemTimeFromServer()
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

	ret = CC_Object_id.SetSystemTimeFromServer()
	
	if (ret == "0")
	{
		alert("사용자 PC 시간 설정 성공");
		
	}
	else
	{
		alert("사용자 PC 시간 설정 실패");	
		
	}

}



function showTime() 
{ 

	
	var d;
	var s;
	d = new Date();
	
	
	s = d.getYear() + "년";
	s += (d.getMonth() + 1) + "월";
	s += d.getDate() + "일";
	
	var today = new Date() ;
	var timestr =  today.getHours(); 
	timestr += "시" + today.getMinutes()+ "분" ;
	timestr += today.getSeconds()+ "초" ;
	
	document.test.nowtime.value =  s + " " + timestr; 
	
	time_id = setTimeout("showTime()", 1000) ;

} 



//-->
</SCRIPT>
</HEAD>

<BODY onload = "showTime() ">
● 사용자 PC 시간설정<br><br>
● 개요 : 사용자의 PC의 시간을 전자인증의 Time Server와 동기화 시킨다.<br><br>
● 사용된 함수<br><br>

♣ SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣ SetSystemTimeFromServer() : 사용자 PC 시간 설정 (IP : 211.192.169.210 PORT : 37) 

<form name="test">
<div align = center>
<table>
  <tr>
	<td>
	 사용자 PC 현재시간 <input type = text name = nowtime style = "width=300">
	</td>
  </tr>
  <tr>
	<td>
	  <input type = button value = "사용자 PC 시간설정" OnClick = "SetSystemTimeFromServer()">
	</td>
  </tr>
 
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

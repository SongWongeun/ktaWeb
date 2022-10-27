<%@ page language="java" import="java.io.*,java.util.*,java.text.SimpleDateFormat,crosscert.*" %>

<%@ page contentType = "text/html; charset=euc-kr" %>

<%

	Calendar cal = Calendar.getInstance();
	Date currentTime=cal.getTime();
	
	/* 서명시 서명원본을 구성하기 현재 시간을 구해옴.
	   구해진 현재시간에서 해쉬값을 추출함.
	*/
	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd-hh:mm:ss");
	String timestr=formatter.format(currentTime);
	//out.print("출력결과 : "+timestr);

	
	int nRet;
	String Origin_data = ""; 
	Hash hash = new Hash();
	nRet = hash.GetHash(timestr.getBytes(), timestr.getBytes().length);

	if(nRet==0) 
	{
		Origin_data = new String(hash.contentbuf);
	}
	else
	{
		Origin_data = "abcdefghijklmnopqrstuvwxyz1234567890";
	}
	
	


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> 인증서로그인 </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function SignData()
{
    

	// 환경설정 함수 콜
	init();
	var ret;
	var signeddata, textin;
	var userdn, EncR;

	if( document.frm.src.value == null || document.frm.src.value == "" )
	{
		alert("서명할 데이타를 넣어주십시요");
		return;
	}



	// 인증서 선택창 초기화 및 선택된 인증서의 DN 추출
	// DN은 인증기관에서 유니크한 것임.
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		
		return;
	}
	else
	{

		// 전자서명 생성
		// BSTR *SignData(BSTR Source, BSTR HashAlgo, BSTR Password);
		// parameters : 
		//   Source : 전자서명할 메세지
		//   HashAlgo : 서명 알고리즘 ("SHA1", "MD5") ==> SHA1이 표준
		//   Password : 개인키 복호를 위한 패스워드
		// return value : 생성된 전자서명 값
		// 참 고 : 암호를 넣지 않았을 경우에는 암호 입력 다이얼로그 박스에 입력한다.
		signeddata = document.CC_Object_id.SignData( document.frm.src.value, "SHA1", "");

		if( signeddata == null || signeddata == "" )
		{
			errmsg = document.CC_Object_id.GetErrorContent();
			errcode = document.CC_Object_id.GetErrorCode();
			alert( "SignData :"+errmsg );
			return;
		}
		else
		{

			getR = CC_Object_id.GetRFromKey(userdn, "");
			if (getR == "")
			{
				alert("주민번호/사업자번호를 확인할 수 없는 인증서입니다.");
				return;
			}


			document.frm.userR.value =  getR;

			if (document.frm.idn.value == "")
			{
				alert("주민 또는 사업자번호 입력 요망");
				return;
			}

			document.frm.signeddata.value = signeddata;
			document.frm.action = "login_check.jsp";
			document.frm.method = "post";
			document.frm.submit();
			
		}
	}
}

//-->
</SCRIPT>
</HEAD>

<BODY>

<input type = button value = "인증서로그인" OnClick = "SignData()">

<form name="frm">
<div align = center>


<table>
  <tr> 
	<td align="center"> 원문(서버에서 구한 현재시간에서 추출한 해쉬값)<br><font color = red><b>(컨트롤 type = hidden 임)</b></font><br>
	  <textarea name="src" rows="20" cols="40"><%=Origin_data%></textarea>
	</td>
	<td align="center"> 서명값<br><font color = red><b>(컨트롤 type = hidden 임)</b></font><br>
	  <textarea name="signeddata" rows="20" cols="40"></textarea>
	</td>
  </tr>
  <tr> 
	<td align="center"> 식별번호(랜덤값) 인증서 선택시 얻어옴<br><font color = red><b>(컨트롤 type = hidden 임)</b></font>
	</td>
	<td align="center"> 
	  <textarea name="userR" rows="3" cols="40"></textarea>
	</td>
  </tr>
  <tr> 
	<td align="center"> 주민 번호(입력값)- 테스트 상 필요 : DB에서 가져오는 값
	</td>
	<td align="center"> 
	  <input type = text name = idn>
	</td>
   </tr>
  
</table>
</div>
</form>



</BODY>
</HTML>

<script language="javascript" src="CC_Object.js"></script>

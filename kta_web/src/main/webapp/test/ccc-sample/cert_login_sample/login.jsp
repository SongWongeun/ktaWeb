<%@ page language="java" import="java.io.*,java.util.*,java.text.SimpleDateFormat,crosscert.*" %>

<%@ page contentType = "text/html; charset=euc-kr" %>

<%

	Calendar cal = Calendar.getInstance();
	Date currentTime=cal.getTime();
	
	/* ����� ��������� �����ϱ� ���� �ð��� ���ؿ�.
	   ������ ����ð����� �ؽ����� ������.
	*/
	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd-hh:mm:ss");
	String timestr=formatter.format(currentTime);
	//out.print("��°�� : "+timestr);

	
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
<TITLE> �������α��� </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function SignData()
{
    

	// ȯ�漳�� �Լ� ��
	init();
	var ret;
	var signeddata, textin;
	var userdn, EncR;

	if( document.frm.src.value == null || document.frm.src.value == "" )
	{
		alert("������ ����Ÿ�� �־��ֽʽÿ�");
		return;
	}



	// ������ ����â �ʱ�ȭ �� ���õ� �������� DN ����
	// DN�� ����������� ����ũ�� ����.
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		
		return;
	}
	else
	{

		// ���ڼ��� ����
		// BSTR *SignData(BSTR Source, BSTR HashAlgo, BSTR Password);
		// parameters : 
		//   Source : ���ڼ����� �޼���
		//   HashAlgo : ���� �˰��� ("SHA1", "MD5") ==> SHA1�� ǥ��
		//   Password : ����Ű ��ȣ�� ���� �н�����
		// return value : ������ ���ڼ��� ��
		// �� �� : ��ȣ�� ���� �ʾ��� ��쿡�� ��ȣ �Է� ���̾�α� �ڽ��� �Է��Ѵ�.
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
				alert("�ֹι�ȣ/����ڹ�ȣ�� Ȯ���� �� ���� �������Դϴ�.");
				return;
			}


			document.frm.userR.value =  getR;

			if (document.frm.idn.value == "")
			{
				alert("�ֹ� �Ǵ� ����ڹ�ȣ �Է� ���");
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

<input type = button value = "�������α���" OnClick = "SignData()">

<form name="frm">
<div align = center>


<table>
  <tr> 
	<td align="center"> ����(�������� ���� ����ð����� ������ �ؽ���)<br><font color = red><b>(��Ʈ�� type = hidden ��)</b></font><br>
	  <textarea name="src" rows="20" cols="40"><%=Origin_data%></textarea>
	</td>
	<td align="center"> ����<br><font color = red><b>(��Ʈ�� type = hidden ��)</b></font><br>
	  <textarea name="signeddata" rows="20" cols="40"></textarea>
	</td>
  </tr>
  <tr> 
	<td align="center"> �ĺ���ȣ(������) ������ ���ý� ����<br><font color = red><b>(��Ʈ�� type = hidden ��)</b></font>
	</td>
	<td align="center"> 
	  <textarea name="userR" rows="3" cols="40"></textarea>
	</td>
  </tr>
  <tr> 
	<td align="center"> �ֹ� ��ȣ(�Է°�)- �׽�Ʈ �� �ʿ� : DB���� �������� ��
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

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="../init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function SignData()
{
    

	// ȯ�漳�� �Լ� ��
	init();
	var ret;
	var signeddata, textin;
	var userdn;

	if( document.test.src.value == null || document.test.src.value == "" )
	{
		alert("������ ����Ÿ�� �־��ֽʽÿ�");
		return;
	}



	// ������ ����â �ʱ�ȭ �� ���õ� �������� DN ����
	// DN�� ����������� ����ũ�� ����.
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		alert(" ����� DN ������ ��� �Ǿ����ϴ�.");
		return;
	}
	else
	{

		
		signeddata = document.CC_Object_id.genSignature(userdn, "", "SHA1RSA", document.test.src.value)

		if( signeddata == null || signeddata == "" )
		{
			errmsg = document.CC_Object_id.GetErrorContent();
			errcode = document.CC_Object_id.GetErrorCode();
			alert( "SignData :"+errmsg );
			return;
		}
		else
		{
			UserCert = document.CC_Object_id.CC_get_cert_local(userdn)
			if (UserCert =="")
			{
				alert("������ ���� ����");
				return;

			}
			else
			{
				UserCert = Repalce_cert(UserCert);
			}
			getR = CC_Object_id.GetRFromKey(userdn, "");
			if (getR == "")
			{
				alert("�ֹι�ȣ/����ڹ�ȣ�� Ȯ���� �� ���� �������Դϴ�.");
				return;
			}

			document.test.signed_data.value = signeddata;
			document.test.user_cert.value = UserCert;
			/*
			document.test.action = "verify1.jsp";
			document.test.method = "post";
			document.test.submit();
			*/
		}
	}
}

function Repalce_cert(str_cert)
{
	var parse_cert = "";
	if (str_cert == "")
		return str;
	else
	{
		parse_cert = str_cert.replace(/\n/g, "");
		parse_cert = parse_cert.replace(/-----BEGIN CERTIFICATE-----/g, "");
		parse_cert = parse_cert.replace(/-----END CERTIFICATE-----/g, "");
	}
	return parse_cert;
}

function sendit()
{
	
	document.test.action = "verify1.jsp";
	document.test.method = "post";
	document.test.submit();
}

//-->
</SCRIPT>
</HEAD>

<BODY>
�� ���ڼ���(PKCS#1)<br><br>
�� ���� : ������ ����â�� ���� ���õ� ������ �������� ���Ű, ������� ������ �̿��� �򹮿� ���� ���ڼ����� ����<br><br>
�� ���� �Լ�<br><br>
�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� GetUserDN() : ������ ����â �ʱ�ȭ �� ���õ� �������� DN ����<br>
�� genSignature(DN, �˰�����, ����, ��й�ȣ) : ���ڼ���(PKCS#1) ����<br>
�� CC_get_cert_local(DN) : ������ ������ ����<br>
<form name="test" method="post">
<div align = center>


<table>
  <tr> 
	<td align="center"> ����<br>
	  <textarea name="src" rows="20" cols="40">01:506-81-32479+02:(��)������+03:����,���Ҹ�+04:��� ���׽� ���� ������ ��õ�� 634-4����+05:506-81-00017+06:����������ö(��)+07:����,����,���Ҹ�,�ε���+08:��� ���׽� ���� ������ 1����+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L��+14:+15:+16:2001-07-02+30:</textarea>
	</td>
	<td align="center"> ������<br>
	  <textarea name="signed_data" rows="7" cols="40"></textarea><br>���ڼ�����(PKCS #1 : ������ �� ���� ������)<br><br>
	  ������ ����� ������<br>
	  <textarea name="user_cert" rows="9" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center"><input type = button value = "���ڼ���" OnClick = "SignData()"></td>
	<td align="center"><input type = button value = "����" OnClick = "sendit()"></td>
  </tr>

</table>
</div>
</form>

<!--<iframe src="../refer.html" frameborder="0" width="450" height="300" marginwidth="0" marginheight="0" scrolling="auto"></iframe>//-->                  


</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="../CC_Object.js"></script>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
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

		// ���ڼ��� ����
		// BSTR *SignData(BSTR Source, BSTR HashAlgo, BSTR Password);
		// parameters : 
		//   Source : ���ڼ����� �޼���
		//   HashAlgo : ���� �˰����� ("SHA1", "MD5") ==> SHA1�� ǥ��
		//   Password : ����Ű ��ȣ�� ���� �н�����
		// return value : ������ ���ڼ��� ��
		// �� �� : ��ȣ�� ���� �ʾ��� ��쿡�� ��ȣ �Է� ���̾�α� �ڽ��� �Է��Ѵ�.
		signeddata = document.CC_Object_id.SignData( document.test.src.value, "SHA1", "");

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

			document.test.signed_data.value = signeddata;
		}
	}
	}

//-->
</SCRIPT>
</HEAD>

<BODY>
�� ���ڼ���<br><br>
�� ���� : ������ ����â�� ���� ���õ� ������ �������� ���Ű, ������� ������ �̿��� �򹮿� ���� ���ڼ����� ����<br><br>
�� ���� �Լ�<br><br>
�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� GetUserDN() : ������ ����â �ʱ�ȭ �� ���õ� �������� DN ����<br>
�� SignData(����, �˰�����, ��й�ȣ) : ���ڼ��� ����<br>
�� GetRFromKey(DN, ��й�ȣ) : �ĺ���ȣ ����
<form name="test">
<div align = center>


<table>
  <tr> 
	<td align="center"> ����<br>
	  <textarea name="src" rows="20" cols="40">01:506-81-32479+02:(��)������+03:����,���Ҹ�+04:��� ���׽� ���� ������ ��õ�� 634-4����+05:506-81-00017+06:����������ö(��)+07:����,����,���Ҹ�,�ε���+08:��� ���׽� ���� ������ 1����+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L��+14:+15:+16:2001-07-02+30:</textarea>
	</td>
	<td align="center"> ������<br>
	  <textarea name="signed_data" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center"><input type = button value = "���ڼ���" OnClick = "SignData()"></td>
	<td align="center">���ڼ�����(PKCS #7 : ������ �� ���� ����)</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

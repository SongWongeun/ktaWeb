<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="../init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function init()
{
	var Ret;

	var policies = "";


	 /* ���λ�ȣ������(����) */
	
	policies +="1.2.410.200004.5.2.1.2"    + "|";          // �ѱ���������               ����                                             
	policies +="1.2.410.200004.5.1.1.5"    + "|";          // �ѱ���������               ����                                             
	policies +="1.2.410.200005.1.1.1"      + "|";          // ����������                 ����                                               
	policies +="1.2.410.200004.5.4.1.1"    + "|";          // �ѱ���������               ����                                             
	policies +="1.2.410.200012.1.1.1"      + "|";          // �ѱ������������           ����                                             
	

	// ���� �뵵���ѿ� ��������å(OID)                 �뵵                    �����������
	
	policies += "1.2.410.200004.5.4.1.101|";        // ����ŷ���/�����       �ѱ���������
	policies += "1.2.410.200004.5.4.1.102|";        // ���ǰŷ���              �ѱ���������
	policies += "1.2.410.200004.5.4.1.103|";        // �ſ�ī���              �ѱ���������
	policies += "1.2.410.200004.5.4.1.104|";        // ���ڹο���              �ѱ���������
	policies += "1.2.410.200004.5.2.1.7.1|";        // ����ŷ���/�����       �ѱ���������
	policies += "1.2.410.200004.5.2.1.7.2|";        // ���ǰŷ���/�����       �ѱ���������
	policies += "1.2.410.200004.5.2.1.7.3|";        // �ſ�ī���              �ѱ���������
	policies += "1.2.410.200004.5.1.1.9|";          // ���ǰŷ���/�����       �ѱ�������
	policies += "1.2.410.200004.5.1.1.9.2|";        // �ſ�ī���              �ѱ�������
	policies += "1.2.410.200005.1.1.4|";            // ����ŷ���/�����       ����������
	policies += "1.2.410.200005.1.1.6.2|";          // �ſ�ī���              ����������
	policies += "1.2.410.200012.1.1.101|";          // ����ŷ���/�����       �ѱ������������
	policies += "1.2.410.200012.1.1.103|";          // ���ǰŷ���/�����       �ѱ������������
	policies += "1.2.410.200012.1.1.105";           // �ſ�ī���              �ѱ������������
	
	//
	 /* ���λ�ȣ������(����) */                            //
	
	policies +="1.2.410.200004.5.2.1.1"    + "|";          // �ѱ���������               ����
	policies +="1.2.410.200004.5.1.1.7"    + "|";          // �ѱ���������               ����, ��ü, ���λ����
	policies +="1.2.410.200005.1.1.5"      + "|";          // ����������                 ����, ���Ǵ�ü, ���λ����
	policies +="1.2.410.200004.5.4.1.2"    + "|";          // �ѱ���������               ����, ��ü, ���λ����
	policies +="1.2.410.200012.1.1.3"      + "|";          // �ѱ������������           ����
	
	

	
	Ret =  document.CC_Object_id.SetCommonInfoFromVal("211.192.169.70",4502, 
														"211.192.169.180",389, 
														"211.192.169.180",389,
														"CN=ROOT-RSA-CRL,OU=ROOTCA,O=KISA,C=KR",
														"no",
														policies);
	if ( Ret != 0 )
	{ 
		alert( "���� �ʱ� ������ �����Ͽ����ϴ�." );
		return false;
	}
	else
	{
		Ret =  document.CC_Object_id.SetPKCSInform(1, 0, 0, 0, 0, 0, 0, 1, "SEED");
		if ( Ret != 0 )
		{ 
			alert( "���� �ʱ� ������ �����Ͽ����ϴ�." );
			return false;
		}
		else
		{
			return true;
		}
	}	
}

function SignData()
{
    

	// ȯ�漳�� �Լ� ��
	//init();
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
		//   HashAlgo : ���� �˰��� ("SHA1", "MD5") ==> SHA1�� ǥ��
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

			ret = CC_Object_id.ValidCert_VID(userdn, getR, document.test.ssn.value)
			if (ret == "0")
			{
				alert("�ſ�Ȯ�� ����");
				
			}
			else
			{
				alert("�ſ�Ȯ�� ����");	
				
			}


			document.test.signed_data.value = signeddata;
			document.test.action = "verify.jsp";
			document.test.method = "post";
			//document.test.submit();
			
		}
	}
}
function sendit()
{
	
	document.test.action = "verify.jsp";
	document.test.method = "post";
	document.test.submit();
}
//-->
</SCRIPT>
</HEAD>

<BODY>
�� ���ڼ���(PKCS#7)<br><br>
�� ���� : ������ ����â�� ���� ���õ� ����� �������� ���Ű, ������� ������ �̿��� �򹮿� ���� ���ڼ����� ����<br><br>
�� ���� �Լ�<br><br>
�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� GetUserDN() : ������ ����â �ʱ�ȭ �� ���õ� �������� DN ����<br>
�� SignData(����, �˰���, ��й�ȣ) : ���ڼ���(PKCS#7) ����<br>
�� GetRFromKey(DN, ��й�ȣ) : �ĺ���ȣ ����
<form name="test">
<div align = center>


<table>
  <tr> 
	<td align="center"> ����<br>
	  <textarea name="src" rows="20" cols="40">01:506-81-32479+02:(��)������+03:����,���Ҹ�+04:��� ���׽� ���� ������ ��õ�� 634-4����+05:506-81-00017+06:����������ö(��)+07:����,����,���Ҹ�,�ε���+08:��� ���׽� ���� ������ 1����+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L��+14:+15:+16:2001-07-02+30:</textarea>
	</td>
	<td align="center"> ����<br>
	  <textarea name="signed_data" rows="20" cols="40"></textarea>
	</td>
  <tr>
	<td align="center">�ֹι�ȣ/����ڹ�ȣ(���ڸ��Է�)</td>
	<td align="center"><input type = text name = "ssn" value = "1234567890"></td>
  </tr>
  <tr> 
	<td align="center"><input type = button value = "���ڼ���(PKCS#7)" OnClick = "SignData()"></td>
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

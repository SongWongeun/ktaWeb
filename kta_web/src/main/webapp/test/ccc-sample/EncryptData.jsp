<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function EncryptData(flag)
{
	init();
	var origin;
	var enc_data;
	var enc_cert;
	
	if( document.test.src.value == null || document.test.src.value == "" )
	{
		alert("��ȣȭ�� ���� ���� �־��ֽʽÿ�");
		return;
	}
   
	// ��ȣȭ
	if (flag == "1")
	{
		document.CC_Object_id.SetValidationFlag(0);//������Ʈ�� ����
		enc_data =  document.CC_Object_id.EncryptData("cn=��������׽�Ʈ����,ou=�׽�Ʈ,ou=�ܺξ�ü��,ou=licensedCA,o=CrossCert,c=KR", document.test.src.value);
		document.CC_Object_id.SetValidationFlag(1);
	}
	else if (flag = "2")
	{
	// ������		
		enc_cert = "MIID1DCCAz2gAwIBAgIDAQq+MA0GCSqGSIb3DQEBBQUAMEwxCzAJBgNVBAYTAktSMRIwEAYDVQQKEwlDcm9zc0NlcnQxEzARBgNVBAsTCmxpY2Vuc2VkQ0ExFDASBgNVBAMTC0Nyb3NzQ2VydENBMB4XDTAzMDcxMjE1MDAwMFoXDTA0MDcxMzE0NTk1OVowfjELMAkGA1UEBhMCS1IxEjAQBgNVBAoTCUNyb3NzQ2VydDETMBEGA1UECxMKbGljZW5zZWRDQTEbMBkGA1UECwwS7ZWc6rWt7KCE7J6Q7J247KadMQ8wDQYDVQQLDAbrspXsnbgxGDAWBgNVBAMMD+2FjOyKpO2KuOuyleyduDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAuT1Gg8pBakwxUojrxYzOTnic4CUiTeUvR4ZENcu/ck1/WPehp+/PrAPD3weLy4zaPYq1l9ntza57h5rN0Cw0lYewaxMYBXOFWh2HJjM24K9gGNJ/XnfQEHV65caXkOxZ/2grnC/yODOQcgx57iuBMH9P26owuT2B5phEoez9K18CAwEAAaOCAZAwggGMMB8GA1UdIwQYMBaAFNPBk3vWH5ZPHCxocqzsTIVhTNLcMB0GA1UdDgQWBBR6sMALzEKpDVt99JwWUC+9SFM3UDAOBgNVHQ8BAf8EBAMCBSAwFwYDVR0gBBAwDjAMBgoqgxqMmkQFBAECMBkGA1UdEQQSMBCBDmRqZGpkakBkZGQuY29tMGIGA1UdHwRbMFkwV6BVoFOGUWxkYXA6Ly9kaXIuY3Jvc3NjZXJ0LmNvbTozODkvY249czFkcDNwMzQyLG91PWNybGRwLG91PWxpY2Vuc2VkQ0Esbz1Dcm9zc0NlcnQsYz1LUjCBoQYIKwYBBQUHAQEEgZQwgZEwVgYIKwYBBQUHMAKGSmxkYXA6Ly9kaXIuY3Jvc3NjZXJ0LmNvbTozODkvY249Q3Jvc3NDZXJ0Q0Esb3U9bGljZW5zZWRDQSxvPUNyb3NzQ2VydCxjPUtSMDcGCCsGAQUFBzABhitodHRwOi8vb2NzcDEuY3Jvc3NjZXJ0LmNvbToxNDIwMy9PQ1NQU2VydmVyMA0GCSqGSIb3DQEBBQUAA4GBAF2lRh76WEq3vzqPST7Ikfs2DCqM2hJ1RY1UT/5nviUvScA7Pc68KMeQUUubattoSOiUkV5DICyskrtVE1vLD6Pea5CwJTFcc7JghGBUYrxTl2hD2t4cxW4u8CpE9BTkQ2sPqWEGyZj4CLGFwjK7RBPBxGaVEUqVgDN1Njeza4ob";
		document.CC_Object_id.SetValidationFlag(0);//������Ʈ�� ����
		enc_data =  document.CC_Object_id.EncryptData(enc_cert, document.test.src.value);
		document.CC_Object_id.SetValidationFlag(1); //ldap
	}
   
   
	if( enc_data != null && enc_data != "" )
	{
		alert("��ȣȭ ����");
		document.test.enc_data.value = enc_data;

	}
	else
	{
		errmsg = document.CC_Object_id.GetErrorContent();
		errcode = document.CC_Object_id.GetErrorCode();
		alert( "SignVerify :"+errmsg );
		return;
	}   

}
//-->
</SCRIPT>
</HEAD>

<BODY>
�� ��ȣȭ(���Ī��)<br><br>
�� ���� : �������� ����Ű�� ����Ͽ� ��ȣȭ�� �����Ѵ�. ��ȣȭ�� �������� ���� ���丮�� ���� ��쿡�� ���ÿ��� ��������, ���� ��쿡�� LDAP���� �������� �� ����Ѵ�. ���� ��ȣȭ�� �������� BASE64 ���ڵ��Ͽ� ����� �� �ִ�. ���� SetValidationFlag(0)�� 0���� �����ϸ� ���ø� �˻��ϰ� 1�� �����ϸ� LDAP�� �˻��Ѵ�.<br><br>
�� ���� �Լ�<br><br>
��SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
��EncryptData(������DN �Ǵ� base64���ڵ��� ������, ��) : ��ȣȭ

<form name="test">
<div align = center>
<table>
  <tr> 
	<td align="center"> ����<br>
	  <textarea name="src" rows="20" cols="40">1234567890abcdefghijklmnopqrstuvwxyxz�ѱ�*##*</textarea>
	</td>
	<td align="center"> ��ȣȭ��<br>
	  <textarea name="enc_data" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center"><input type = button value = "��ȣȭ(���Ī��) DN" OnClick = "EncryptData('1')"><br><br>
	<input type = button value = "��ȣȭ(���Ī��) ���������" OnClick = "EncryptData('2')">
	</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function DecryptData()
{
	init();
	var origin;
	var enc_data;
	var enc_cert;
	
	if( document.test.enc_data.value == null || document.test.enc_data.value == "" )
	{
		alert("��ȣȭ�� ���� �־��ֽʽÿ�");
		return;
	}
   
	origin =  document.CC_Object_id.DecryptData(document.test.enc_data.value, "");
		
	
	if( origin != null && origin != "" )
	{
		alert("��ȣȭ ����");
		document.test.src.value = origin;

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
�� ���� : ��ȣȭ�� ����Ÿ�� ��ȣȭ�� �������� ����Ű�� Ǯ� ������ �����Ѵ�. ��ȣȭ�� ���� �������� �����ؾ� �Ѵ�. ���� ��й�ȣ�� ���� ������ ��й�ȣ �Է�â�� ��Ÿ����.<br>
�� ���� �Լ�<br><br>
 �� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
 �� DecryptData(��ȣȭ��, ��ȣȭ�� ����� ��������й�ȣ) : ��ȣȭ

<form name="test">
<div align = center>
<table>
  <tr> 
	<td align="center"> ����<br>
	  <textarea name="src" rows="20" cols="40"></textarea>
	</td>
	<td align="center"> ��ȣȭ��<br>
	  <textarea name="enc_data" rows="20" cols="40">MIIBewYJKoZIhvcNAQcDoIIBbDCCAWgCAQExggEEMIIBAAIBADBpMGIxCzAJBgNVBAYTAktSMRIwEAYDVQQKDAlDcm9zc0NlcnQxFTATBgNVBAsMDEFjY3JlZGl0ZWRDQTEoMCYGA1UEAwwfQ3Jvc3NDZXJ0IENlcnRpZmljYXRlIEF1dGhvcml0eQIDIBbhMA0GCSqGSIb3DQEBAQUABIGAAGUljvT3rKxCITslXZZ0xd0H+4zZj3WrpYPRL14dGCgM/9V0rId0ltK0EJKKSPhKcOlmsYnZkPXGKeoHDfH+FhF5nOjv0cOE4yFmFLPnOfzCx3i95SQk4KybMqqL07D4ex9MuDwAf6zLYIBH3sYLxoWl4LEbHzFqOX9+qPvI5mAwWwYJKoZIhvcNAQcBMBwGCCqDGoyaRAEEBBC3OBToMSefgzvfgXcOhGI+gDDMGNKzzBLdgHiyJxMALSvoIxlpnk06CUlfz45nXUjwo6j0oHIt35eqVe91GzP7DCw=</textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center"><input type = button value = "��ȣȭ(���Ī��)" OnClick = "DecryptData()"><br><br>
	
	</td>
  </tr>
</table>
</div>
</form>

</HTML>


<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

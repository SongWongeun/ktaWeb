<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SymmDecryption(seq, alg, pwd)
{
	init();
	var origin;
	var enc_data;
	var enc_cert;
	
	if( document.test.enc_data[seq].value == null || document.test.enc_data[seq].value == "" )
	{
		alert("��ȣȭ�� ���� ���� �־��ֽʽÿ�");
		return;
	}
   
	// ��ȣȭ
	origin =  document.CC_Object_id.SymmDecryption(alg, pwd, document.test.enc_data[seq].value);

  	if( origin != null && origin != "" )
	{
		alert("��ȣȭ ����");
		document.test.src[seq].value = origin

	}
	else
	{
		errmsg = document.CC_Object_id.GetErrorContent();
		errcode = document.CC_Object_id.GetErrorCode();
		alert( "SymmEncryption :"+errmsg );
		return;
	}   

}
//-->
</SCRIPT>
</HEAD>

<BODY>
�� ��ȣȭ(��Ī��)<br><br>
�� ���� : �Էµ� ��ĪŰ ��ȣ �˰���� Ű�� ����Ͽ� �����͸� ��ȣȭ �Ѵ�.<br><br>
�� ���� �Լ�<br><br>
�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� SymmDecryption(��ȣ�˰���, ��й�ȣ, ��ȣ����Ÿ) : ��ȣȭ. ��ȣ�˰��� : SEED, 3DES, RC2

<form name="test">
<div align = center>
<table>
  <tr> 
	<td align="center"> ����<br>
	  <textarea name="src" rows="5" cols="40"></textarea>
	</td>
	<td align="center"> ��ȣȭ��(SEED)<br>
	  <textarea name="enc_data" rows="5" cols="40">hMH0ERzpwIIY6kEdZ+Hl+sRDpUYXN/eFF3aW1QFDxJ2i1jwpa9GmaYoSK173w286</textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center"><input type = button value = "��ȣȭ(��Ī�� - SEED, 0123456789)" OnClick = "SymmDecryption('0', 'SEED', '0123456789')">
	<br><br>
	</td>
  </tr>
  <tr> 
	<td align="center"> ����<br>
	  <textarea name="src" rows="5" cols="40"></textarea>
	</td>
	<td align="center"> ��ȣȭ��(3DES)<br>
	  <textarea name="enc_data" rows="5" cols="40">c6Vymzmc5R/kb8Ck5EUwG2bTbOgLUY1McUQdkWLJHrFUqIsaw7uRCa4Hj3+hk6DX</textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">
	<input type = button value = "��ȣȭ(��Ī�� - 3DES, 0123456789)" OnClick = "SymmDecryption('1', '3DES','0123456789')">
	<br><br>
	</td>
  </tr>
  <tr> 
	<td align="center"> ����<br>
	  <textarea name="src" rows="5" cols="40"></textarea>
	</td>
	<td align="center"> ��ȣȭ��(RC2)<br>
	  <textarea name="enc_data" rows="5" cols="40">P51M3Q5EaFIr1WCbGJ3b38V/CyYbJOwlcx6BhDZf2MOgsL8uuQRkXzxTTWc+vF+Q</textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">
	<input type = button value = "��ȣȭ(��Ī�� - RC2, 0123456789)" OnClick = "SymmDecryption('2', 'RC2', '0123456789')">
	</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SymmEncryption(alg, pwd)
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
	enc_data =  document.CC_Object_id.SymmEncryption(alg, pwd, document.test.src.value);

  	if( enc_data != null && enc_data != "" )
	{
		alert("��ȣȭ ����");
		document.test.enc_data.value = enc_data

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
�� SymmEncryption(��ȣ�˰���, ��й�ȣ, ��) : ��ȣȭ. ��ȣ�˰��� : SEED, 3DES, RC2

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
	<td align="center"><input type = button value = "��ȣȭ(��Ī�� - SEED, 0123456789)" OnClick = "SymmEncryption('SEED', '0123456789')"><br><br>
	<input type = button value = "��ȣȭ(��Ī�� - 3DES, 0123456789)" OnClick = "SymmEncryption('3DES','0123456789')"><br><br>
	<input type = button value = "��ȣȭ(��Ī�� - RC2, 0123456789)" OnClick = "SymmEncryption('RC2', '0123456789')">
	</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

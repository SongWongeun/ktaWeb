<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function GetOIDFromCert()
{
    

	// ȯ�漳�� �Լ� ��
	init();
	var ret;
	var signeddata, textin;
	var userdn;
	var oid;

	



	// ������ ����â �ʱ�ȭ �� ���õ� �������� DN ����
	// DN�� ����������� ����ũ�� ����.
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		alert(" ����� DN ������ ��� �Ǿ����ϴ�.");
		return;
	}

	oid = document.CC_Object_id.GetOIDFromCert(userdn);
	document.test.oid.value = oid;


}

//-->
</SCRIPT>
</HEAD>

<BODY>
�� ������ ��å(OID) ����<br><br>
�� ���� : �Էµ� ����� DN���� �������� OID���� �����Ѵ�.<br><br>
�� ���� �Լ�<br><br>
�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� GetUserDN() : ������ ����â �ʱ�ȭ �� ���õ� �������� DN ����<br>
�� GetOIDFromCert(������DN) : ������ ��å ����

<form name="test">
<div align = center>


<table>
  <tr>
	<td>
	 <input type = button value = "������ ��å ����" OnClick = "GetOIDFromCert()">
	</td>
	<td>
	  <textarea name="oid" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">����� ��������å(OID)</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

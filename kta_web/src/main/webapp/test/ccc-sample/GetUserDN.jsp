<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function GetUserDN()
{
    

	// ȯ�漳�� �Լ� ��
	init();
	var ret;
	var signeddata, textin;
	var userdn;

	



	// ������ ����â �ʱ�ȭ �� ���õ� �������� DN ����
	// DN�� ����������� ����ũ�� ����.
	
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		alert(" ����� DN ������ ��� �Ǿ����ϴ�.");
		return;
	}

	document.test.dn.value = userdn;
}

//-->
</SCRIPT>
</HEAD>

<BODY>
�� ������ ����� DN �˻�<br><br>
�� ���� : ������� ���ÿ� ����Ǿ� �ִ�(�ϵ��ũ, �÷��ǵ�ũ, ����Ʈī��, USB) �������� ������ �� �ֵ��� ���̾�α� �ڽ��� ���� ����ڰ� ������ �������� ����� DN���� �����Ѵ�.
GetUserDn() �Լ��� �̿��Ͽ� ����ڰ� ���������� ������ ����� DN ������ �����ϹǷ� ���ڼ����̳� �ĺ���ȣ ó���ÿ� ���õ� �������� ���ÿ� ó���� �� �ִ�.
�ִ�.<br><br>
�� ���� �Լ�<br><br>
�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� GetUserDN() : ������ ����â �ʱ�ȭ �� ���õ� �������� DN ����<br>

<form name="test">
<div align = center>


<table>
  <tr>
	<td>
	 <input type = button value = "������ ����� DN �˻�" OnClick = "GetUserDN()">
	</td>
	<td>
	  <textarea name="dn" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">���õ� �������� DN</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

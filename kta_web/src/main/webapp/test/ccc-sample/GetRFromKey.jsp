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

	


/*	
	�Էµ� ����� DN���� ����Ű�� �о R���� �����Ѵ�. 
	DN���� ������ ������ ����â�� ��Ÿ����. 
	���� �����ȣ�� ������ ��й�ȣ â�� ��Ÿ����.
	
	
*/
	getR = CC_Object_id.GetRFromKey(userdn, "");
	if (getR == "")
	{
		alert("�ֹι�ȣ/����ڹ�ȣ�� Ȯ���� �� ���� �������Դϴ�.");
		return;
	}

	document.test.userR.value = getR;
}

//-->
</SCRIPT>
</HEAD>

<BODY>
�� �ſ�Ȯ�� - �ĺ���ȣ����<br><br>
�� ���� : �Էµ� ����� DN���� ����Ű�� �о R���� �����Ѵ�. DN���� ������ ������ ����â�� ��Ÿ����. ���� �����ȣ�� ������ ��й�ȣ â�� ��Ÿ����.<br><br>
�� ���� �Լ�<br><br>
�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� GetRFromKey(DN, ��й�ȣ) : �ĺ���ȣ ����

<form name="test">
<div align = center>


<table>
  <tr>
	<td>
	 <input type = button value = "�ĺ���ȣ����(Random value)" OnClick = "GetUserDN()">
	</td>
	<td>
	  <textarea name="userR" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">�ĺ���ȣ(Random value)</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

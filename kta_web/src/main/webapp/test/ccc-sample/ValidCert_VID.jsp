<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function ValidCert_VID()
{
    

	// ȯ�漳�� �Լ� ��
	init();
	var ret;
	var signeddata, textin;
	var userdn;
	var getR;
	

/*	
	�Էµ� ����� DN���� ����Ű�� �о R���� �����Ѵ�. 
	DN���� ������ ������ ����â�� ��Ÿ����. 
	���� �����ȣ�� ������ ��й�ȣ â�� ��Ÿ����.
	
	
*/	
	userdn = CC_Object_id.GetUserDN();
	
	getR = CC_Object_id.GetRFromKey(userdn, "");
	
	if (getR == "")
	{
		alert("�ֹι�ȣ/����ڹ�ȣ�� Ȯ���� �� ���� �������Դϴ�.");
		return;
	}
	document.test.userR.value = getR;
	ret = CC_Object_id.ValidCert_VID(userdn, getR, document.test.ssn.value)
	alert(ret);		
	if (ret == "0")
	{
		alert("�ſ�Ȯ�� ����");
		
	}
	else
	{
		alert("�ſ�Ȯ�� ����");	
		
	}

}

//-->
</SCRIPT>
</HEAD>

<BODY>
�� �ſ�Ȯ�� - Ŭ���̾�Ʈ<br><br>
�� ���� : �Էµ� ����� DN���� �������� �о VID�� ������ ���� �ĺ���ȣ R���� �ֹε�Ϲ�ȣ(����ڹ�ȣ)�� ����Ͽ� ���Ͽ��θ� �Ǵ��Ѵ�. Ŭ���̾�Ʈ�� �ڱ��ڽ��� Ȯ���ϴ� ���̴�. <br><br>
�� ���� �Լ�<br><br>

�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� GetUserDN() <br>
�� GetRFromKey(������DN, ��й�ȣ)<br>
�� ValidCert_VID(������DN, �ĺ���ȣR��, �ֹε�Ϲ�ȣ) : �ſ�Ȯ�� - Ŭ���̾�Ʈ

<form name="test">
<div align = center>


<table>
  <tr>
	<td>
	 <input type = button value = "����Ȯ�� - Ŭ���̾�Ʈ" OnClick = "ValidCert_VID()">
	</td>
	<td>
	  <textarea name="userR" rows="20" cols="40"></textarea>
	</td>
  </tr>
  <tr>
	<td>
	 �ֹε�Ϲ�ȣ �Ǵ� ����ڹ�ȣ
	</td>
	<td>
	  <input type = text name = ssn value = "1234567890">
	</td>
  </tr>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center">�ſ�Ȯ��</td>
  </tr>
</table>
</div>
</form>

<!--<center><iframe src="refer.html" frameborder="0" width="800" height="300" marginwidth="0" marginheight="0" scrolling="auto"></iframe></center>//-->


</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function HashData()
{
    

	// ȯ�漳�� �Լ� ��
	init();
	var ret;
	var signeddata, textin;
	var userdn;

	if( document.test.src.value == null || document.test.src.value == "" )
	{
		alert("���� ����Ÿ�� �־��ֽʽÿ�");
		return;
	}

	// ���ڼ��� ����
	// BSTR *GetHashData(BSTR Source, BSTR HashAlgo);
	// parameters : 
	//   Source : �ؽ��� �޼���
	//   HashAlgo : �ؽ� �˰��� ("SHA1", "MD5") ==> SHA1�� ǥ��
	//   Password : ����Ű ��ȣ�� ���� �н�����
	// return value : ������ �ؽ� ��
	
	hashdata = document.CC_Object_id.GetHashData( document.test.src.value, "SHA1");

	if( hashdata == null || hashdata == "" )
	{
		errmsg = document.CC_Object_id.GetErrorContent();
		errcode = document.CC_Object_id.GetErrorCode();
		alert( "hashdata :"+errmsg );
		return;
	}
	else
	{

	

		document.test.hash_data.value = hashdata;
	}
}


//-->
</SCRIPT>
</HEAD>

<BODY>
�� ���ڼ���<br><br>
�� ���� : ������ ����â�� ���� ���õ� ����� �������� ���Ű, ������� ������ �̿��� �򹮿� ���� ���ڼ����� ����<br><br>
�� ���� �Լ�<br><br>
�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� GetHashData("����", �˰���) : �Էµ� �������κ��� �ؽ��� ����<br>
<form name="test">
<div align = center>


<table>
  <tr> 
	<td align="center"> ���� <br>
	  <textarea name="src" rows="20" cols="40">01:506-81-32479+02:(��)������+03:����,���Ҹ�+04:��� ���׽� ���� ������ ��õ�� 634-4����+05:506-81-00017+06:����������ö(��)+07:����,����,���Ҹ�,�ε���+08:��� ���׽� ���� ������ 1����+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L��+14:+15:+16:2001-07-02+30:</textarea>
	</td>
	<td align="center"> �ؽ��� <br>
	  <textarea name="hash_data" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center"><input type = button value = "�ؽ��� ����" OnClick = "HashData()"></td>
	<td align="center">�ؽ���</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>


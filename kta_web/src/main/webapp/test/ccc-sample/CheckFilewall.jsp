<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function CheckFilewall()
{
    

	// ȯ�漳�� �Լ� ��
	init();
	var ret;
	
/*	
	���������� CA ����, ���������� ���丮����, 
	RootCA(������ȣ�����) ���丮 �������� ��ſ��� ýũ
*/	

	ret = CC_Object_id.CheckFilewall();

}





//-->
</SCRIPT>
</HEAD>

<BODY>
�� ��ȭ�� �׽�Ʈ<br><br>
�� ���� : ���������� CA ����, ���������� ���丮����, RootCA(������ȣ�����) ���丮 �������� ��ſ��� ýũ<br><br>
�� ���� �Լ�<br><br>

�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� CheckFilewall()

<form name="test">
<div align = center>
<table>
 
  <tr>
	<td>
	  <input type = button value = "��ȭ�� �׽�Ʈ" OnClick = "CheckFilewall()">
	</td>
  </tr>
 
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SetSystemTimeFromServer()
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

	ret = CC_Object_id.SetSystemTimeFromServer()
	
	if (ret == "0")
	{
		alert("����� PC �ð� ���� ����");
		
	}
	else
	{
		alert("����� PC �ð� ���� ����");	
		
	}

}



function showTime() 
{ 

	
	var d;
	var s;
	d = new Date();
	
	
	s = d.getYear() + "��";
	s += (d.getMonth() + 1) + "��";
	s += d.getDate() + "��";
	
	var today = new Date() ;
	var timestr =  today.getHours(); 
	timestr += "��" + today.getMinutes()+ "��" ;
	timestr += today.getSeconds()+ "��" ;
	
	document.test.nowtime.value =  s + " " + timestr; 
	
	time_id = setTimeout("showTime()", 1000) ;

} 



//-->
</SCRIPT>
</HEAD>

<BODY onload = "showTime() ">
�� ����� PC �ð�����<br><br>
�� ���� : ������� PC�� �ð��� ���������� Time Server�� ����ȭ ��Ų��.<br><br>
�� ���� �Լ�<br><br>

�� SetCommonInfoFromVal() : �������� �����(CC_Object_id) �ʱ� ȯ�漳��<br>
�� SetSystemTimeFromServer() : ����� PC �ð� ���� (IP : 211.192.169.210 PORT : 37) 

<form name="test">
<div align = center>
<table>
  <tr>
	<td>
	 ����� PC ����ð� <input type = text name = nowtime style = "width=300">
	</td>
  </tr>
  <tr>
	<td>
	  <input type = button value = "����� PC �ð�����" OnClick = "SetSystemTimeFromServer()">
	</td>
  </tr>
 
</table>
</div>
</form>

</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>

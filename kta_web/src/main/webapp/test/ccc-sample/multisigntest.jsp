<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SignData()
{
    
	init();
	var ret;
    var signeddata, textin;
	var userdn;
   
   

   // ���ڼ��� ����
   // BSTR *SignData(BSTR Source, BSTR HashAlgo, BSTR Password);
   // parameters : 
   //   Source : ���ڼ����� �޼���
   //   HashAlgo : ���� �˰����� ("SHA1", "MD5")
   //   Password : ����Ű ��ȣ�� ���� �н�����
   // return value : ������ ���ڼ��� ��
   // �� �� : ��ȣ�� ���� �ʾ��� ��쿡�� ��ȣ �Է� ���̾�α� �ڽ��� �Է��Ѵ�.

   // �߰��� �κ�
   userdn = document.CC_Object_id.GetUserDN();
   if( userdn == null || userdn == "" )
   { 
       alert(" ����� DN ������ ��� �Ǿ����ϴ�.");
       return;
   }
   else
   {
	   for(i = 0;i <document.test.src.length;i++)
	   {
	   
		   signeddata = document.CC_Object_id.SignData( document.test.src[i].value, "SHA1", "");
	   
		   if( signeddata == null || signeddata == "" )
		   {
			   errmsg = document.CC_Object_id.GetErrorContent();
			   errcode = document.CC_Object_id.GetErrorCode();
			   alert( "SignData :"+errmsg );
			  return;
		   }
		   else
		   {
			  document.test.signed_data[i].value = signeddata;
		   }
	   }
	   
   }
}

function SignVerify()
{
   init();
   var signdata;

   
   // ���ڼ��� ����

	for(i = 0;i <document.test.signed_data.length;i++)
	{
	   
		src =  document.CC_Object_id.VerifySignData( document.test.signed_data[i].value, "SHA1" );

		if( src != null && src != "" )
		{
		  document.test.src1[i].value = src;
		}
		else
		{
		   errmsg = document.CC_Object_id.GetErrorContent();
		   errcode = document.CC_Object_id.GetErrorCode();
		   alert( "SignData :"+errmsg );
		  return;
		} 
	}

}
//-->
</SCRIPT>
</HEAD>

<BODY>

<form name="test">
<div align =center>
<br>��Ƽ���� ����<br>
<table>
  <tr> 
	<td align="center"> ����<br>
	  <input type = text  name="src" value ="01:506-81-32479+02:(��eeeeeeeeeee)������+03:����,���Ҹ�+04:��� ���׽� ���� ������ ��õ�� 634-4����+05:506-81-00017+06:����������ö(��)+07:����,����,���Ҹ�,�ε���+08:��� ���׽� ���� ������ 1����+10:10,790,420+11:1,079,042+12:2001-07-02+13:CutAICOOL,200 L��+14:+15:+16:2001-07-02+30:" size = 50>
	</td>
	<td align="center"> ������<br>
	  <input type = text  name="signed_data">
	</td>
	<td align="center"> ����<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"> ����<br>
	  <input type = text  name="src" value ="01:506-81-32479+02:(��rrrrrrrrrr)������+03:����,���Ҹ�+04:��� ���׽� ���� ������ ��õ�� 634-4����+05:506-81-00017+06:����������ö(��)+07:����,����,���Ҹ�,�ε���+08:��� ���׽�sdddddddddddddddddddddddddddddddds ���� ������ 1����+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L��+14:+15:+16:2001-07-02+30:" size = 50 >
	</td>
	<td align="center"> ������<br>
	  <input type = text  name="signed_data">
	</td>
	<td align="center"> ����<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"> ����<br>
	  <input type = text  name="src" value ="01:5dd06-81-32479+02:(��)��hhhhhhhhh����+03:����,���Ҹ�+04:��� ���׽� ���� ������ ��õ�� 634-4����+05:506-81-00017+06:����������ö(��)+07:����,����,���Ҹ�,�ε���+08:��� ���׽� ���� ������ 1����+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L��+14:+15:+16:2001-07-02+30:"  size = 50>
	</td>
	<td align="center"> ������<br>
	  <input type = text  name="signed_data">
	</td>
	<td align="center"> ����<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"> ����<br>
	  <input type = text  name="src" value ="01:506-81-32479+02:(��)��dfdsssfsdf����+03:����,���Ҹ�+04:��� ���׽� ���� ������ ��õ�� 634-4����+05:506-81-00017+06:����������ö(��)+07:����,����,���Ҹ�,�ε���+08:��� ���׽� ���� ������ 1����+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting Fluid/Oil K MSDS DONG HO DAICOOL,200 L��+14:+15:+16:2001-07-02+30:"  size = 50>
	</td>
	<td align="center"> ������<br>
	  <input type = text  name="signed_data">
	</td>
	<td align="center"> ����<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"> ����<br>
	  <input type = text  name="src" value ="01:506-81-32479+02:(��)����mmmmmmmmm��+03:����,���Ҹ�+04:��� ���׽� ���� ������ ��õ�� 634-4����+05:506-81-00017+06:����������ö(��)+07:����,����,���Ҹ�,�ε���+08:��� ���׽� ���� ������ 1����+10:10,790,420+11:1,079,042+12:2001-07-02+13:Cutting 35333455353535353OOL,200 L��+14:+15:+16:2001-07-02+30:"  size = 50>
	</td>
	<td align="center"> ������<br>
	  <input type = text1  name="signed_data">
	</td>
	<td align="center"> ����<br>
	  <input type = text  name="src1" size = 50>
	</td>
  </tr>
  <tr> 
	<td align="center"><a href="javascript:SignData();" name="signok" alt=���ڼ�������>���ڼ���</a></td>
	<td align="center"><a href="javascript:SignVerify();" name="verifyok" alt=���ڼ�������>���ڼ�������</a></td>
  </tr>
</table>
</div>
</form>
                  
</BODY>
</HTML>

<!-- �������� ��� //-->
<script language="javascript" src="CC_Object.js"></script>
<%@ page language="java" import="java.io.*,java.util.*,crosscert.*" %>
<%@ page contentType = "text/html; charset=EUC-KR" %>

<%  
	/*-------------------------����----------------------------*/ 
	response.setDateHeader("Expires",0); 
	response.setHeader("Prama","no-cache"); 

	if(request.getProtocol().equals("HTTP/1.1")) 
	{ 
		response.setHeader("Cache-Control","no-cache"); 
	} 
	/*------------------------- ��----------------------------*/ 

		
	int nRet = 0;
	Encrypt encrypt = new Encrypt();
	
	String sInput = "0000000000";
	out.println("���� : " + sInput + "<br>");
	out.println("��ĪŰ : 88888888<br>");
	// ��ȣȭ (SEED)
	nRet = encrypt.EncryptData(sInput.getBytes("KSC5601"), sInput.getBytes("KSC5601").length, "8888888888888888");
	if (nRet != 0)
	{
		out.println("��ȣȭ2 �������� : " + encrypt.errmessage + "<br>");
		out.println("��ȣȭ2 �����ڵ� : " + encrypt.errcode + "<br>");
		return;
	}
	
	out.println("��ĪŰ ��ȣȭ(SEED) ����<br>");
	out.println("��ȣ��(SEED) ���� : " + encrypt.envelopedlen + "<br>");
	
	// Base64 Encoding
	Base64 base64 = new Base64();
	nRet = base64.Encode(encrypt.envelopedbuf, encrypt.envelopedlen);
	if (nRet != 0)
	{
		out.println("base���ڵ� �������� : " + base64.errmessage + "<br>");
		out.println("base���ڵ忡���ڵ� : " + base64.errcode);
		return;
	}
	String sEncData = new String(base64.contentbuf, "KSC5601");
	out.println("��ĪŰ ��ȣ��(SEED) ( Base64 Encoding) : " + sEncData + "<br>" + sEncData.length());

	%>


<pre>


<font color = red>

=====================================================================================
 ** �ҽ� **
=====================================================================================


< % @ page language="java" import="java.io.*,java.util.*,<b><font size = 4>crosscert.*</font></b>" % >
< % @ page contentType = "text/html; charset=EUC-KR" % >

< %  
	/*-------------------------����----------------------------*/ 
	response.setDateHeader("Expires",0); 
	response.setHeader("Prama","no-cache"); 

	if(request.getProtocol().equals("HTTP/1.1")) 
	{ 
		response.setHeader("Cache-Control","no-cache"); 
	} 
	/*------------------------- ��----------------------------*/ 

		
	int nRet = 0;
	Encrypt encrypt = new Encrypt();
	
	String sInput = "0000000000";
	out.println("���� : " + sInput + "< br>");
	out.println("��ĪŰ : 88888888< br>");
	// ��ȣȭ (SEED)
	nRet = encrypt.EncryptData(sInput.getBytes("KSC5601"), sInput.getBytes("KSC5601").length, "8888888888888888");
	if (nRet != 0)
	{
		out.println("��ȣȭ2 �������� : " + encrypt.errmessage + "< br>");
		out.println("��ȣȭ2 �����ڵ� : " + encrypt.errcode + "< br>");
		return;
	}
	
	out.println("��ĪŰ ��ȣȭ(SEED) ����< br>");
	out.println("��ȣ��(SEED) ���� : " + encrypt.envelopedlen + "< br>");
	
	// Base64 Encoding
	Base64 base64 = new Base64();
	nRet = base64.Encode(encrypt.envelopedbuf, encrypt.envelopedlen);
	if (nRet != 0)
	{
		out.println("base���ڵ� �������� : " + base64.errmessage + "< br>");
		out.println("base���ڵ忡���ڵ� : " + base64.errcode);
		return;
	}
	String sEncData = new String(base64.contentbuf, "KSC5601");
	out.println("��ĪŰ ��ȣ��(SEED) ( Base64 Encoding) : " + sEncData + "< br>" + sEncData.length());

	% >
</font>
</pre>
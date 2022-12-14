<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript" src="init.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function EncryptData(flag)
{
	init();
	var origin;
	var enc_data;
	var enc_cert;
	
	if( document.test.src.value == null || document.test.src.value == "" )
	{
		alert("암호화할 원문 값을 넣어주십시요");
		return;
	}
   
	// 암호화
	if (flag == "1")
	{
		document.CC_Object_id.SetValidationFlag(0);//레지스트리 로컬
		enc_data =  document.CC_Object_id.EncryptData("cn=기술지원테스트서버,ou=테스트,ou=외부업체용,ou=licensedCA,o=CrossCert,c=KR", document.test.src.value);
		document.CC_Object_id.SetValidationFlag(1);
	}
	else if (flag = "2")
	{
	// 인증서		
		enc_cert = "MIID1DCCAz2gAwIBAgIDAQq+MA0GCSqGSIb3DQEBBQUAMEwxCzAJBgNVBAYTAktSMRIwEAYDVQQKEwlDcm9zc0NlcnQxEzARBgNVBAsTCmxpY2Vuc2VkQ0ExFDASBgNVBAMTC0Nyb3NzQ2VydENBMB4XDTAzMDcxMjE1MDAwMFoXDTA0MDcxMzE0NTk1OVowfjELMAkGA1UEBhMCS1IxEjAQBgNVBAoTCUNyb3NzQ2VydDETMBEGA1UECxMKbGljZW5zZWRDQTEbMBkGA1UECwwS7ZWc6rWt7KCE7J6Q7J247KadMQ8wDQYDVQQLDAbrspXsnbgxGDAWBgNVBAMMD+2FjOyKpO2KuOuyleyduDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAuT1Gg8pBakwxUojrxYzOTnic4CUiTeUvR4ZENcu/ck1/WPehp+/PrAPD3weLy4zaPYq1l9ntza57h5rN0Cw0lYewaxMYBXOFWh2HJjM24K9gGNJ/XnfQEHV65caXkOxZ/2grnC/yODOQcgx57iuBMH9P26owuT2B5phEoez9K18CAwEAAaOCAZAwggGMMB8GA1UdIwQYMBaAFNPBk3vWH5ZPHCxocqzsTIVhTNLcMB0GA1UdDgQWBBR6sMALzEKpDVt99JwWUC+9SFM3UDAOBgNVHQ8BAf8EBAMCBSAwFwYDVR0gBBAwDjAMBgoqgxqMmkQFBAECMBkGA1UdEQQSMBCBDmRqZGpkakBkZGQuY29tMGIGA1UdHwRbMFkwV6BVoFOGUWxkYXA6Ly9kaXIuY3Jvc3NjZXJ0LmNvbTozODkvY249czFkcDNwMzQyLG91PWNybGRwLG91PWxpY2Vuc2VkQ0Esbz1Dcm9zc0NlcnQsYz1LUjCBoQYIKwYBBQUHAQEEgZQwgZEwVgYIKwYBBQUHMAKGSmxkYXA6Ly9kaXIuY3Jvc3NjZXJ0LmNvbTozODkvY249Q3Jvc3NDZXJ0Q0Esb3U9bGljZW5zZWRDQSxvPUNyb3NzQ2VydCxjPUtSMDcGCCsGAQUFBzABhitodHRwOi8vb2NzcDEuY3Jvc3NjZXJ0LmNvbToxNDIwMy9PQ1NQU2VydmVyMA0GCSqGSIb3DQEBBQUAA4GBAF2lRh76WEq3vzqPST7Ikfs2DCqM2hJ1RY1UT/5nviUvScA7Pc68KMeQUUubattoSOiUkV5DICyskrtVE1vLD6Pea5CwJTFcc7JghGBUYrxTl2hD2t4cxW4u8CpE9BTkQ2sPqWEGyZj4CLGFwjK7RBPBxGaVEUqVgDN1Njeza4ob";
		document.CC_Object_id.SetValidationFlag(0);//레지스트리 로컬
		enc_data =  document.CC_Object_id.EncryptData(enc_cert, document.test.src.value);
		document.CC_Object_id.SetValidationFlag(1); //ldap
	}
   
   
	if( enc_data != null && enc_data != "" )
	{
		alert("암호화 성공");
		document.test.enc_data.value = enc_data;

	}
	else
	{
		errmsg = document.CC_Object_id.GetErrorContent();
		errcode = document.CC_Object_id.GetErrorCode();
		alert( "SignVerify :"+errmsg );
		return;
	}   

}
//-->
</SCRIPT>
</HEAD>

<BODY>
● 암호화(비대칭형)<br><br>
● 개요 : 인증서의 공개키를 사용하여 암호화를 수행한다. 암호화용 인증서는 로컬 디렉토리에 있을 경우에는 로컬에서 가져오고, 없을 경우에는 LDAP에서 인증서를 얻어서 사용한다. 또한 암호화용 인증서를 BASE64 인코딩하여 사용할 수 있다. 또한 SetValidationFlag(0)를 0으로 설정하면 로컬만 검색하고 1로 설정하면 LDAP를 검색한다.<br><br>
● 사용된 함수<br><br>
♣SetCommonInfoFromVal() : 전자인증 웹모듈(CC_Object_id) 초기 환경설정<br>
♣EncryptData(인증서DN 또는 base64인코딩된 인증서, 평문) : 암호화

<form name="test">
<div align = center>
<table>
  <tr> 
	<td align="center"> 원본<br>
	  <textarea name="src" rows="20" cols="40">1234567890abcdefghijklmnopqrstuvwxyxz한글*##*</textarea>
	</td>
	<td align="center"> 암호화값<br>
	  <textarea name="enc_data" rows="20" cols="40"></textarea>
	</td>
  <tr> 
	<td align="center">&nbsp;</td>
	<td align="center"><input type = button value = "암호화(비대칭형) DN" OnClick = "EncryptData('1')"><br><br>
	<input type = button value = "암호화(비대칭형) 인증서사용" OnClick = "EncryptData('2')">
	</td>
  </tr>
</table>
</div>
</form>

</BODY>
</HTML>

<!-- 전자인증 모듈 //-->
<script language="javascript" src="CC_Object.js"></script>

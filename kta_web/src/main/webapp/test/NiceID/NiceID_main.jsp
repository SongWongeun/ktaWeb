<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
    
    String sSiteCode		= "R304";				// NICE�ſ��������κ��� �ο����� ����Ʈ �ڵ�
    String sSitePassword	= "77305237";				// NICE�ſ����������� �ο����� ����Ʈ �н�����
    
    //�����ɿ��������� ���� ��� �Դϴ�. ��� Ȯ���� ������ �ּ���.
    String sIPINSiteCode	= "";				// NICE�ſ��������κ��� �ο����� �����ɻ���Ʈ �ڵ�(DI/CI ������ �ʿ��� ��� ���)
	String sIPINPassword	= "";				// NICE�ſ��������κ��� �ο����� �����ɻ���Ʈ �н�����
                                                    	
    String sReturnURL 		= "http://localhost:8080/test/NiceID/NiceID_return.jsp";	//��� ���� URL    
    String sRequestNO		= "";												// ��û ��ȣ, �̴� ����/�����Ŀ� ���� ������ �ǵ����ְ� �ǹǷ� �ʿ�� ���
    String sBGType			= "";												//���� ȭ�� ���� ����
    String sClientImg		= "";												//���� ȭ�� �ΰ� ����: default �� null �Դϴ�.(full ��� �Է��� �ּ���.)
    
    String sReserved1		= "authenticate";
	String sReserved2		= "";
	String sReserved3		= "NAME";
    
    sRequestNO = niceCheck.getRequestNO(sSiteCode);	//��û������ȣ / ���������� ���� ������ ���� �ʿ�
  	session.setAttribute("REQ_SEQ" , sRequestNO);	//��ŷ���� ������ ���Ͽ� ������ ���ٸ�, ���ǿ� ��û��ȣ�� �ִ´�.
    out.println ("sRequestNO : " + sRequestNO + "<br>");
    
    // �Էµ� plain ����Ÿ�� �����.
    String sPlainData = "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
                        "7:REQ_SEQ" + sRequestNO.getBytes().length + ":" + sRequestNO +
                        "7:BG_TYPE" + sBGType.getBytes().length + ":" + sBGType +
                        "7:IMG_URL" + sClientImg.getBytes().length + ":" + sClientImg ; 

    
    String sPlainData1 = "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
                        "7:REQ_SEQ" + sRequestNO.getBytes().length + ":" + sRequestNO +
                        "7:BG_TYPE" + sBGType.getBytes().length + ":" + sBGType +
                        "7:IMG_URL" + sClientImg.getBytes().length + ":" + sClientImg +
                        "9:RESERVED1" + sReserved1.getBytes().length + ":" + sReserved1 +
                        "9:RESERVED2" + sReserved2.getBytes().length + ":" + sReserved2 +
                        "9:RESERVED3" + sReserved3.getBytes().length + ":" + sReserved3 ;
                        
	String sPlainData2 = "7:RTN_URL" + sReturnURL.getBytes().length + ":" + sReturnURL +
                        "7:REQ_SEQ" + sRequestNO.getBytes().length + ":" + sRequestNO +
                        "7:BG_TYPE" + sBGType.getBytes().length + ":" + sBGType + 
                        "7:IMG_URL" + sClientImg.getBytes().length + ":" + sClientImg +
                        "9:RESERVED1" + sReserved1.getBytes().length + ":" + sReserved1 +
                        "9:RESERVED2" + sReserved2.getBytes().length + ":" + sReserved2 +
                        "9:RESERVED3" + sReserved3.getBytes().length + ":" + sReserved3 +
                        "13:IPIN_SITECODE" + sIPINSiteCode.getBytes().length + ":" + sIPINSiteCode +
                        "17:IPIN_SITEPASSWORD" + sIPINPassword.getBytes().length + ":" + sIPINPassword ;                        
    
    String sMessage = "";
    String sEncData = "";
    
    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData2);
    if( iReturn == 0 )
    {
        sEncData = niceCheck.getCipherData();
        out.println ("��û����_��ȣȭ_����[ : " + sEncData + "]");
    }
    else if( iReturn == -1)
    {
        sMessage = "��ȣȭ �ý��� �����Դϴ�.";
    }    
    else if( iReturn == -2)
    {
        sMessage = "��ȣȭ ó�������Դϴ�.";
    }    
    else if( iReturn == -3)
    {
        sMessage = "��ȣȭ ������ �����Դϴ�.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "�Է� ������ �����Դϴ�.";
    }    
    else
    {
        sMessage = "�˼� ���� ���� �Դϴ�. iReturn : " + iReturn;
    }
%>

<html>
<head>
    <title>NICE�ſ������� - NiceID �Ƚ�üũ �׽�Ʈ</title>
    
    <script language='javascript'>
    	 function fnPopup(){
    	
    	window.open('', 'popup', 'width=450, height=350,toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,top=0,left=0');
		document.frm_main.action = "https://cert.namecheck.co.kr/NiceID/certnc_input.asp";
		document.frm_main.target = "popup";
		document.frm_main.submit();
    	
    }
	</script>
	
</head>
    
<body>
	<form method="post" name="frm_main">
 		<input type="hidden" name="enc_data" value="<%=sEncData%>">
 	</form>
 	<form name="niceID" method="post" action="">
		<fieldset>
		<legend>��ȣȭ ������</legend>
			<input type="hidden" name="enc_data">								<!-- �������� ����� ���� ��ȣȭ ����Ÿ�Դϴ�. -->
		    <input type="hidden" name="param_r1" value="">
		    <input type="hidden" name="param_r2" value="">
		    <input type="hidden" name="param_r3" value="">
	    </fieldset>
	</form>
 	<center>
    <p><p><p><p>
    <a href="javascript:fnPopup();">NiceID ���� �׽�Ʈ Click</a>
    <p><p>
	<%= sMessage %><br>
     <center>
    <p><p><p><p>
    
    </center>
	<p>
	[����̹������� ���� : sBGType ����] <br>
		* brown <br>
	    * gray : ���þ����� ����Ʈ ��<br>
	    * green <br>
	    * lightgreen <br>
	    * lightpurple <br>
	    * purple <br>
	    * red <br>
	    * skyblue <br>
	    * yellow <br>
</body>
</html>
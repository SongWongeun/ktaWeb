<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = request.getParameter("enc_data");
    
    String sSiteCode = "R304";					// NICE�ſ��������κ��� �ο����� ����Ʈ �ڵ�
    String sSitePassword = "77305237";			// NICE�ſ����������� �ο����� ����Ʈ �н�����
    
    String sCipherTime = "";						// ��ȣȭ�� �ð�
    String sRequestNO = "";						// ��û ��ȣ
    String sPlainData = "";
    
    String sMessage = "";
    String sResult = "";
    
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);
	
    if( iReturn == 0 )
    {
    	sMessage = "�������� �����Ͽ����ϴ�.";
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        
        // ����Ÿ�� �����մϴ�.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        sRequestNO	= (String)mapresult.get("REQ_SEQ");
        sResult		= (String)mapresult.get("NC_RESULT");
        
        out.println("[�Ǹ�Ȯ�ΰ�� : " + (String)mapresult.get("NC_RESULT")+ "]<br>");
        out.println("[�̸� : " + (String)mapresult.get("NAME")+ "]<br>");
        out.println("[�Ƚ�KEY :" + (String)mapresult.get("SAFEID")+ "]<br>");
        out.println("[��û������ȣ : " + sRequestNO + "]<br>");
        
        out.println("[RESERVED1 : " + (String)mapresult.get("RESERVED1") + "]<br>");
        out.println("[RESERVED2 : " + (String)mapresult.get("RESERVED2") + "]<br>");
        out.println("[RESERVED3 : " + (String)mapresult.get("RESERVED3") + "]<br>");
        
        out.println("[IPIN_DI : " + (String)mapresult.get("IPIN_DI")+ "]<br>");
        out.println("[IPIN_CI : " + (String)mapresult.get("IPIN_CI")+ "]<br>");
                
        String session_sRequestNumber = (String)session.getAttribute("REQ_SEQ");
        if(!sRequestNO.equals(session_sRequestNumber))
        {
            sMessage = "���ǰ��� �ٸ��ϴ�. �ùٸ� ��η� �����Ͻñ� �ٶ��ϴ�.";
            sRequestNO = "";
            
        }
    }
    else if( iReturn == -1)
    {
        sMessage = "��ȣȭ �ý��� �����Դϴ�.";
    }    
    else if( iReturn == -4)
    {
        sMessage = "��ȣȭ ó�������Դϴ�.";
    }    
    else if( iReturn == -5)
    {
        sMessage = "��ȣȭ �ؽ� �����Դϴ�.";
    }    
    else if( iReturn == -6)
    {
        sMessage = "��ȣȭ ������ �����Դϴ�.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "�Է� ������ �����Դϴ�.";
    }    
    else if( iReturn == -12)
    {
        sMessage = "����Ʈ �н����� �����Դϴ�.";
    }    
    else
    {
        sMessage = "�˼� ���� ���� �Դϴ�. iReturn : " + iReturn;
    }

%>

<html>
<head>
   <title>NICE�ſ������� - NiceID �ȽɽǸ����� �׽�Ʈ</title>
</head>
<body>
    <center>
    <p><p><p><p>
    <br><p><p>
        <table width=500 border=1>
        <tr>
            <td>�������</td>
            <td><%= sMessage %></td>
        </tr>
        <tr>
            <td>�����ڵ尪</td>
            <td><%= sResult %></td>
        </tr>
        <tr>
            <td>��ȣȭ�� �ð�</td>
            <td><%= sCipherTime %> (YYMMDDHHMMSSSSS)</td>
        </tr>
        <tr>
            <td>��û ��ȣ</td>
            <td><%= sRequestNO %></td>
        </tr>            
        
    </table>
    </center>
</body>
</html>
<%@page import="egovframework.rte.fdl.string.EgovStringUtil"%>
<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<html>
<head>
   <title>NICE�ſ������� - NiceID �ȽɽǸ����� �׽�Ʈ</title>
<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = request.getParameter("enc_data");
	String sReservedParam1  = request.getParameter("param_r1");
	String sReservedParam2  = request.getParameter("param_r2");//requestReplace(request.getParameter("param_r2"), "");
	String sReservedParam3  = request.getParameter("param_r3");
       
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
        
    	String t  = EgovStringUtil.null2void(request.getParameter("t"));
    	String strAction = "/actNameLogin.do?t="+t;
    	// ȸ���α����� ��� agentCd( 1:���տ�, 2:����������, 3:�ŷ�ó) �̸�
    	// ���������� ��� 'authenticate' ��
    	if( "authenticate".equals((String)mapresult.get("RESERVED1")) ){ 
    		strAction = "/actAuthenticate.do";
    	}
//         out.println("[�Ǹ�Ȯ�ΰ�� : " + (String)mapresult.get("NC_RESULT")+ "]<br>");
//         out.println("[�̸� : " + (String)mapresult.get("NAME")+ "]<br>");
//         out.println("[�Ƚ�KEY :" + (String)mapresult.get("SAFEID")+ "]<br>");
//         out.println("[��û������ȣ : " + sRequestNO + "]<br>");
        
//         out.println("[RESERVED1 : " + (String)mapresult.get("RESERVED1") + "]<br>");
//         out.println("[RESERVED2 : " + (String)mapresult.get("RESERVED2") + "]<br>");
//         out.println("[RESERVED3 : " + (String)mapresult.get("RESERVED3") + "]<br>");
        
//         out.println("[IPIN_DI : " + (String)mapresult.get("IPIN_DI")+ "]<br>");
//         out.println("[IPIN_CI : " + (String)mapresult.get("IPIN_CI")+ "]<br>");
                
        String session_sRequestNumber = (String)session.getAttribute("REQ_SEQ_NAME");
        if(!sRequestNO.equals(session_sRequestNumber))
        {
            sMessage = "���ǰ��� �ٸ��ϴ�. �ùٸ� ��η� �����Ͻñ� �ٶ��ϴ�.";
            sRequestNO = "";
%>
<script type="text/javascript">
alert('<%=sMessage%>');
self.close();
</script>	

<%            
        }else{
%>
<script>
parent.opener.parent.document.niceID.enc_data.value = "<%= sEncodeData %>";

parent.opener.parent.document.niceID.param_r1.value = "<%= strAction %>";
parent.opener.parent.document.niceID.param_r2.value = "<%= (String)mapresult.get("RESERVED2") %>";
parent.opener.parent.document.niceID.param_r3.value = "<%= (String)mapresult.get("RESERVED3")%>";

parent.opener.parent.document.niceID.target = "Parent_window";

// ���� �Ϸ�ÿ� ��������� �����ϰ� �Ǵ� �ͻ� Ŭ���̾�Ʈ ��� ������ URL
parent.opener.parent.document.niceID.action = "<%=strAction%>";
parent.opener.parent.document.niceID.submit();

self.close();	
</script>

<%        	
        }
    }else{
    	if( iReturn == -1)
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
<script type="text/javascript">
alert('<%=sMessage%>');
self.close();
</script>	

<%
    }
%>

</head>
<body>
</body>
</html>
<%@page import="egovframework.rte.fdl.string.EgovStringUtil"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%
    //�޴��� ����

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");
    String sReserved1  = requestReplace(request.getParameter("param_r1"), "");
    String sReserved2  = request.getParameter("param_r2");//requestReplace(request.getParameter("param_r2"), "");
    String sReserved3  = requestReplace(request.getParameter("param_r3"), "");

    String t  = EgovStringUtil.null2void(request.getParameter("t"));
	String strAction = "/actHpLogin.do?t="+t;
	// ȸ���α����� ��� agentCd( 1:���տ�, 2:����������, 3:�ŷ�ó) �̸�
	// ���������� ��� 'authenticate' ��
	if( "authenticate".equals(sReserved1) ){ 
		strAction = "/actAuthenticate.do";
	}
    
%>
<%!
public static String requestReplace (String paramValue, String gubun) {
        String result = "";
        
        if (paramValue != null) {
        	
        	paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

        	paramValue = paramValue.replaceAll("\\*", "");
        	paramValue = paramValue.replaceAll("\\?", "");
        	paramValue = paramValue.replaceAll("\\[", "");
        	paramValue = paramValue.replaceAll("\\{", "");
        	paramValue = paramValue.replaceAll("\\(", "");
        	paramValue = paramValue.replaceAll("\\)", "");
        	paramValue = paramValue.replaceAll("\\^", "");
        	paramValue = paramValue.replaceAll("\\$", "");
        	paramValue = paramValue.replaceAll("'", "");
        	paramValue = paramValue.replaceAll("@", "");
        	paramValue = paramValue.replaceAll("%", "");
        	paramValue = paramValue.replaceAll(";", "");
        	paramValue = paramValue.replaceAll(":", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll("#", "");
        	paramValue = paramValue.replaceAll("--", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll(",", "");
        	
        	if(gubun != "encodeData"){
        		paramValue = paramValue.replaceAll("\\+", "");
        		paramValue = paramValue.replaceAll("/", "");
            paramValue = paramValue.replaceAll("=", "");
        	}
        	
        	result = paramValue;
            
        }
        return result;
  }
%>

<html>
<head>
<title>NICE�ſ������� - CheckPlus �Ƚɺ������� </title>
<script type="text/javascript">

<%// ��ȣȭ�� ����� ������ �����ϴ� ���%>
<%if (!sEncodeData.equals("") && sEncodeData != null){%>
	<%-- opener.document.fHpResult.ipinDi.value = '<%=URLEncoder.encode(sDupInfo,"UTF-8")%>';
	opener.document.fHpResult.ipinCi.value = '<%=URLEncoder.encode(sConnInfo,"UTF-8")%>'; --%>
	opener.document.fHpResult.EncodeData.value = '<%=sEncodeData%>';
	opener.document.fHpResult.param_r1.value = '<%=sReserved1%>';<%-- agentCd --%>
	opener.document.fHpResult.param_r2.value = '<%=sReserved2%>';
	opener.document.fHpResult.param_r3.value = '<%=sReserved3%>';
	opener.document.fHpResult.action = "<%=strAction%>";
	opener.document.fHpResult.target = "Parent_window";
	opener.document.fHpResult.submit();
<%}else{%>
		
<%}%>
	window.close();
</script>
</head>
<body>
</body>
</html>
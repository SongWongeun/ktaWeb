<%@ page contentType="text/html; charset=euc-kr"%><%@ page import="java.util.*,java.io.*,java.text.*,java.lang.Integer, java.net.*" %><%@ page import="com.markany.fps.*"%><%@ page import="com.markany.futils.*"%><%
    

	String strServerIp     = "192.1.60.7";  // MarkAny ������� ��ġ IP
    int     iServerPort     = 18320;        // MarkAny ������� PORT
	// Config Data ����
	//String	strConfigData = new String("8^265^35^265^528^264^ȭ����������^�纻^0^280^80^0^0^3^");  264->1.1
	String	strConfigData = new String("8^265^35^265^589^496^ȭ����������^�纻^0^280^80^0^0^3^");
	//String	strConfigData = new String("OF4yNjVeMzVeMjY1XjU4OV40OTZeyK25sLD4wabBtsfVXrvnurteMF4yODBeODBeMF4wXjNessss");
	//���� 589, ���� 496
	String	strEncodeConfigData = MaBase64Utils.base64Encode( strConfigData.getBytes("euc-kr") );
	
	// rexpert.js ���Ͼȿ� printeroption �� ���� �����ּž� �մϴ�. ( �ڵ��� �� ���ڸ��� ���� �ɼ��� )
	// ��ϵ� ������ ���, ���������� ��� ����  0
	// ��ϵ� ������ ���, ���������� ���   1
	// ��� ������ ���, ���������� ��� ����  2
	// ��� ������ ���, ���������� ���   3
	//int		i2DCellCount = Integer.parseInt(request.getParameter("cellwidth"));// 18;
	//int		i2DCellRow = Integer.parseInt(request.getParameter("cellheight")); // 2;
	//int           i2DCellCount=16, i2DCellRow=2;
	int           i2DCellCount=16, i2DCellRow=2;
	
	// Unix
	String	strCertFilePath = "";
	String  strPriKeyPath     = "";
	String  strPriKeyPasswd   = "";
	
	String	strSignCompany = "INIT";
	String	strReportCompany = "RP##";

	
	// create instance
	MaFpsMake2DCode clMaFpsMake2DCode = new MaFpsMake2DCode();	
	
	String strXML =request.getParameter("rgx");


	int iRet = 0;
	String	strRet = new String();

	// Call Ma2DCode library
	try
	{
		strRet = clMaFpsMake2DCode.iGen2DCodeEx(
		                strServerIp,
		                iServerPort,
						strEncodeConfigData,
						i2DCellCount,
						i2DCellRow,
						strXML.getBytes(),
						strCertFilePath,
						strPriKeyPath,
						strPriKeyPasswd,
						strSignCompany,	
						strReportCompany );

//		out.print(strConfigData);
//		out.print(strEncodeConfigData);
						
			
		String strRetCode = new String( strRet.substring( 0, 4 ) );
		String str2DData = new String( strRet.substring( 4 ));
		
		if (strRetCode.equals( "0000" ))
		{
			out.print("OK$" + str2DData);
		}
		else
		{
			out.println(strRetCode);
		}						
				
						
	}
	catch( UnsatisfiedLinkError e )
	{
		out.println("error while binding method");
		out.println("\t:"+e.toString());
		
	}

%>

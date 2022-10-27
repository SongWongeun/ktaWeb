<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page import = "java.io.ByteArrayOutputStream" %>
<%@ page import = "java.io.BufferedReader" %>
<%@ page import = "java.io.InputStream" %>
<%@ page import = "java.io.InputStreamReader" %>
<%@ page import = "java.io.StringReader" %>
<%@ page import = "java.net.HttpURLConnection" %>
<%@ page import = "java.net.URL" %>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "java.net.URLEncoder" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "javax.xml.parsers.DocumentBuilder" %>
<%@ page import = "javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import = "org.w3c.dom.Document" %>
<%@ page import = "org.w3c.dom.Element" %>
<%@ page import = "org.w3c.dom.Node" %>
<%@ page import = "org.xml.sax.InputSource" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Board List</title>
<link type="text/css" rel="stylesheet" href="/css/css.css"/>
<script type="text/javaScript" language="javascript" defer="defer">
function search(){
   document.searchForm.action = "<c:url value='/addrIndex.do'/>";
   document.searchForm.submit();
}
function searchAddr(){
	var keyword = document.getElementById("keyword").value;
	var searchSe = document.getElementById("searchSe").value;
	document.location.href ="/jsb/api/addr/addrSearch.do?keyword="+keyword+"&searchSe="+searchSe+"&encoding=UTF-8";
	
}
</script>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
		final String apiurl = "http://openapi.epost.go.kr/postal/retrieveNewAdressService/retrieveNewAdressService/getNewAddressList";
		String key = "3aYDBzObnIDU7Mwflbe7N4eWb9k3fmlfbMAAo4Bp94lq8UOr6SmhJ9TaWRNu9K7t0vVP1gPnrkJBO7nH5qFJuQ==";
		String keyword = "";
		if(request.getParameter("keyword") != null){keyword = request.getParameter("keyword");}
		String searchSe = "";		

		key = URLEncoder.encode(key, "utf-8");
		String temp = URLEncoder.encode(keyword, "euc-kr");
		keyword = URLDecoder.decode(keyword, "ISO-8859-1");
		keyword = URLEncoder.encode(keyword, "utf-8");
		searchSe = request.getParameter("searchSe");
		URL url = new URL("http://openapi.epost.go.kr/postal/retrieveNewAdressService" + 
				"/retrieveNewAdressService/getNewAddressList" + 
				"?ServiceKey=" + key + 
				"&searchSe=" + searchSe +
				"&srchwrd=" + keyword +
				"&encoding=UTF-8");
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		System.out.println("encoding...."+conn);
		DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		byte[] bytes = new byte[4096];
		InputStream in = conn.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		while(true){
			int red = in.read(bytes);
			if(red < 0)
				break;
			baos.write(bytes, 0, red);
		}
		String xmlData = baos.toString("UTF-8");
		baos.close();
		in.close();
		conn.disconnect();
		Document doc = docBuilder.parse(new InputSource(new StringReader(xmlData)));
		Element el = (Element)doc.getElementsByTagName("NewAddressListResponse").item(0);
		System.out.println("xml"+xmlData);
		System.out.println("url"+url);
		%>
<div id="page">
	<form name="searchForm" method="post" action="Javascript:searchAddr()" >
	<label for="searchSe">검색구분: </label>
	<select id="searchSe" >
		<option value="dong">동명</option>
		<option value="road" selected="selected">도로명</option>
		<option value="post">우편번호</option>
	</select>
	<label for="srchwrd">검색어 :</label>
	<input type="text" cssClass="txt" id="keyword" size="50"/>
	<input type="button" value="검색" onclick="Javascript:searchAddr()" />
	</form>
	<div id="results">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-bottom:2px solid lightgray;">
		<tr bgcolor="lightgray">
				<th align="center">우편번호</th>
				<th align="center">도로명주소</th>
				<th align="center">지번주소</th>
			</tr>	
			<hr></hr>
		 	<%
		 	Node Result = el.getChildNodes().item(1).getFirstChild();
		 	System.out.println(Result);
		 	if(Result != null){
		 	for(int i=0; i<el.getChildNodes().getLength(); i++){
				Node node = el.getChildNodes().item(i);
				if(!node.getNodeName().equals("newAddressList")){
					continue;
				}
				else {
					String zipCode = node.getChildNodes().item(0).getTextContent();
					String newAddr = node.getChildNodes().item(1).getTextContent();
					String oldAddr = node.getChildNodes().item(2).getTextContent();
				%>
				<tr>
			    <td align="center" class="listtd"><%=zipCode%>
			    <hr></hr>
			    </td>
 				<td align="center" class="listtd"><%=newAddr%>
			    <hr></hr>
			    </td>
			     <td align="center" class="listtd"><%=oldAddr%>
			    <hr></hr>
			    </td>
			    </tr>
				<%	}}}else{%>
				<tr><td colspan="3" align="center">검색결과가 없습니다.</td>
				</tr>
				<%} %> 
	</table>
	</div>
</div>

</body>
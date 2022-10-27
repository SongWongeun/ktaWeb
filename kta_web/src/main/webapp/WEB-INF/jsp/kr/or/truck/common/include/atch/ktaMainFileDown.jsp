<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	System.out.println(request.getAttribute("articleNo"));
	String articleNo = (String)request.getAttribute("articleNo");
%>


<input type="hidden" name="${inputName}" id="${inputName}" value="${atchFileId}" />
<%-- <input type="hidden" name="fileListCnt" id="fileListCnt" value="${fileListCnt}"> --%>

	<ul>
		<c:forEach var="fileVO" items="${fileList}" varStatus="status">
		<a href="<c:url value='/cmm/fms/FileDown.do?atchFileId=${fileVO.atchFileId}&fileSn=${fileVO.fileSn}'/>">
		<img src="<c:url value='/images/truck/board/file.gif' />" width="19" height="19" alt="파일다운"></a>
		</c:forEach>
	</ul>
	
  



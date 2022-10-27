<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="page">
	<form:form commandName="searchVO" name="searchForm" method="post">
	<label for="searchSe">검색구분: </label>
	<form:select  path="searchSe" id="searchSe">
		<option value="dong"></option>
	</form:select>
	</form:form>
	<div id="results">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-bottom:2px solid lightgray;">
	</table>
	</div>
</div>
기준도시:&nbsp;<c:out value="${resultArea}"></c:out><br>
기상상태:&nbsp;<c:out value="${resultSky}"></c:out>&nbsp;&nbsp;[1:맑음 2:구름조금 3:구름많음 4:흐림]<br>
온도:&nbsp;<c:out value="${resultT1h}"></c:out>℃<br>
강수량:&nbsp;<c:out value="${resultRn1}"></c:out>mm
</body>
</html>

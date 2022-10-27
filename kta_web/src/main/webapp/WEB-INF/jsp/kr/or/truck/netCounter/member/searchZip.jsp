<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Board List</title>
<link type="text/css" rel="stylesheet" href="/css/css.css"/>
<script type="text/javaScript" language="javascript" defer="defer">

function searchAddr(){
	document.searchForm.action = "<c:url value='/netCounter/memberPage/myPage/searchZip.do'/>";
    document.searchForm.submit();
}

function inputZipCode(code,addr){
	var zipCode1 = code.substr(0,3);
	var zipCode2 = code.substr(4,6);
	window.opener.f.p_zip1.value = zipCode1;
	window.opener.f.p_zip2.value = zipCode2;
	window.opener.f.p_addr1.value = addr;
	window.close();
}
</script>
</head>
<body>
<form:form commandName="searchVO" name="searchForm" method="post" action="">
	<fieldset>
		<legend>업계소식 목록</legend>
	<input type="hidden" name="articleNo" />
	<div>
		<p class="infosearchWrap">
			<form:select path="searchCondition">
			<form:option value="dong">동명</form:option>
			<form:option value="road">도로명</form:option>
			</form:select>
			<label class="hide" for="search">검색어입력</label><form:input path="searchKeyword" id="search" class="txt" title="검색어를 입력해주세요" style="width:173px" />
			<a class="btn_search" href="#;" onclick="searchAddr();"><img class="vaM" src="/images/truck/btn/btn_search.gif" alt="검색" /></a>
		</p><p>검색도움말 </p>
						<p>동명검색: 예)목3동 643-7 같이 정확한 번지수를 같이 입력하여 주세요.</p>
						<p>도로명검색: 예)세종대로23 같이 정확한 도로명을 입력하여 주세요.</p>
		<!-- table list s -->
		<div>
			<table>
				<caption>우편번호 검색</caption>
				<colgroup>
					<col width="20%">
					<col width="40%">
					<col width="40%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="first">우편번호</th>
						<th scope="col">주소</th>
						<th scope="col">지번주소</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${resultList != null }">
					<c:forEach var="result" items="${resultList}" varStatus="status">
					 <tr onclick="inputZipCode('${result[0]}','${result[2]}')">
					 	<td><c:out value="${result[0]}"/></td>
					 	<td><c:out value="${result[1]}"/></td>
					 	<td><c:out value="${result[2]}"/></td>
					 </tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<!--// table list e -->
	</div>
	</fieldset>
	</form:form>
</body>
</html>
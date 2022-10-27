<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/common/include/global.do"></c:import>
<c:import url="/common/include/netCountSide.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
</script>
</head>
<body>


<div id="border">
	<form:form commandName="searchVO" name="boardForm" method="post" action="">
	<fieldset>
	<legend>다운로드</legend>
	<input type="hidden" name="articleNo" />
		<table width="100%" cellpadding="8" class="listTable" >
		 <thead>
		  <tr>
		    <th class="title" width="10%" nowrap><input type="checkbox" name="all_check" class="check2">전체선택</th>
		    <th scope="col" class="listTitle" width="90%" nowrap>구분</th>
		  </tr>
		 </thead>
		
		
		 <tbody>
			 <c:forEach var="result" items="${resultList}" varStatus="status">
			  <tr>
			    <td class="listCenter" nowrap><input type="checkbox" name="one_check"></td>
			    <td class="listCenter" nowrap><c:out value="${result.title}"/></td>
			  </tr>
			 </c:forEach>
		 </tbody>
		</table>
	
			<div class="paging">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="paging_accBoard" />
				<form:hidden path="pageIndex" />
			</div> 
			
			<div align="right">
				<a href="#;" onclick="downForm()">다운로드</a>
				<a href="#;" onclick="printForm()">인쇄하기</a>
			</div>
	</fieldset>
	</form:form>
</div>
</body>
</html>


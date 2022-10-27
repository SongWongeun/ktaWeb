<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/common/include/global.do"></c:import>
<c:import url="/common/include/cyberPrSide.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">


/* 글 보기 화면 function */
function viewEchoBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/cyberPr/echoView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addEchoBoard() {
   	document.boardForm.action = "<c:url value='/cyberPr/echoAddView.do'/>";
   	document.boardForm.submit();		
}


/* index function */
function listEchoBoard() {
	document.location.href = "/cyberPr/echoCustomIndex.do";
}

/* Mainindex function */
function goIndex() {
	document.location.href = "/main/index.do";
}

/* 글 검색 function */
function searchEchoBoard() {
	var year=document.getElementById("regYear").value;
	var month=document.getElementById("regMonth").value;
	var searchRecentDate = year+month;
	  
	document.boardForm.searchRecentDate.value=searchRecentDate;
	document.boardForm.action = "<c:url value='/cyberPr/echoCustomIndex.do'/>";
   	document.boardForm.submit();
}



</script>
</head>
<body>


<div id="border">
<a href="javascript:listEchoBoard()">트럭메아리 게시판</a>
<a href="#;" onclick="goIndex(); return false;">메인</a>
<form:form commandName="searchVO" name="boardForm" method="post" action="">
<fieldset>
<legend>트럭메아리 게시판</legend>
<input type="hidden" name="articleNo" />
	<table width="100%" cellpadding="8" class="listTable" >
	 <thead>
	  <tr>
	    <th scope="col" class="listTitle" width="40%" nowrap>제목</th>
	    <th scope="col" class="listTitle" width="10%" nowrap>월호</th>
	    <th scope="col" class="listTitle" width="40%" nowrap>메인이미지</th>
	    <th scope="col" class="listTitle" width="10%" nowrap>작성일</th>
	  </tr>
	 </thead>
	 <tbody>
		 <c:forEach var="result" items="${resultList}" varStatus="status">
		  <tr>
		    <td class="listCenter" nowrap><a href="javascript:viewEchoBoard('<c:out value="${result.articleNo}"/>')">${fn:replace(result.title, keyword , highlight )}</a></td>
	      	<td class="listCenter" nowrap><c:out value="${result.publicDate}"/></td>
	      	<td class="listCenter" nowrap><img src="/com/atch/getThumbPdfImage.do?atchFileId=${result.atchFileId}" width="315" height="445" border="0" alt="${result.title}"></td>
	    	<td class="listCenter" nowrap><c:out value="${result.createTime}"/></td>
		  </tr>
		 </c:forEach>
	 </tbody>
	</table>
		<div class="paging">
			<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="paging_echoBoard" />
			<form:hidden path="pageIndex" />
		</div>
		<div align="right">
			<a href="javascript:addEchoBoard()">글쓰기</a>
		</div>
			 <div id="search">
		<ul>
		<li>
			<form:select path="searchCondition" Class="use">
				<form:option value=""  label="======="/>
				<form:option value="0" label="월호" />
				<form:option value="1" label="제목" />
				<form:option value="2" label="내용" />
			</form:select>
		</li>
		<li><form:input path="searchKeyword" Class="txt"/></li>
		<li><a href="javascript:searchEchoBoard();">검색</a></li></ul>		
	</div> 
</fieldset>
</form:form>
</div> 
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<table class="table table-hover">
	<colgroup>
		<col style="width:20%;" />
		<col style="width:20%;" />
		<col style="width:20%;" />
		<col style="width:22%;" />
		<col style="width:18%;" />
	</colgroup>
	<thead>
	<tr>
	  <th><div>사번</div></th>
	  <th><div>이름</div></th>
	  <th><div>지부</div></th>
	  <th><div>직위</div></th>
	  <th><div>입사일</div></th>
	</tr>
	</thead>
	<tbody id="searchingList">
	<c:if test="${not empty resultList }">
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr onclick="changeUser('${result.SAWON_NO}','${result.HANGEUL_NM}')">
		<td class="center">${result.SAWON_NO}</td>
		<td class="center">${result.HANGEUL_NM}</td>
		<td class="center">${result.JIBU_NAME}</td>
		<td class="center">${result.JICWI_CD}</td>
		<td class="center">${result.IPSA_YMD}</td>
	</tr>					
	</c:forEach>	
	</c:if>	
	<c:if test="${empty resultList }">
	<tr>
		<td colspan="6">검색결과가 없습니다.</td>
	</tr>
	</c:if>						
	</tbody>
	</table>
	<tr>
		<td colspan="5">
		<!-- paging s -->
		<div class="text-center">
			<ul class="pagination pagination-sm">
				<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="searchAdminListPaging" />
			</ul>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex}" />
		</div><!--// paging e -->
		</td>
	</tr>
	
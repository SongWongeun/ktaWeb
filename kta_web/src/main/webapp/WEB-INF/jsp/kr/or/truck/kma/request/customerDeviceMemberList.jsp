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
	  <th><div>맥어드레스</div></th>
	  <th><div>기기명</div></th>
	  <th><div>요청상태</div></th>
	  <th><div>아이디</div></th>
	  <th><div>사용자명</div></th>
	</tr>
	</thead>
	<tbody id="searchingList">
	<c:if test="${not empty resultList2 }">
	<c:forEach var="result2" items="${resultList2}" varStatus="status">
	<tr onclick="changeDevice('${result2.EQUIP_PHY_ADDR}','${result2.USER_ID}','${result2.NAME}','${result2.SEQ_NO}')">
		<td class="center">${result2.EQUIP_PHY_ADDR}</td>
		<td class="center">${result2.EQUIP_NM}</td>
		<td class="center">${result2.PERMISSION_GBN_NM}</td>
		<td class="center">${result2.USER_ID}</td>
		<td class="center">${result2.NAME}</td>
	</tr>					
	</c:forEach>	
	</c:if>	
	<c:if test="${empty resultList2 }">
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
				<ui:pagination paginationInfo = "${paginationInfo2}" type="bootStrap" jsFunction="searchDeviceListPaging" />
			</ul>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex2}" />
		</div><!--// paging e -->
		</td>
	</tr>
	
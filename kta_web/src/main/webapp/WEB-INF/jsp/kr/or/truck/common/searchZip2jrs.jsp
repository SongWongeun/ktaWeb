<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<table class="tbZip" summary="우편번호검색">
	<caption>우편번호 검색</caption>
	<colgroup>
		<col width="30%"/>
		<col width="70%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" class="first">우편번호</th>
			<th scope="col">주소</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${resultList != null }">
			<c:forEach var="result" items="${resultList}" varStatus="status">
				 <tr onclick="inputZipCode('${result.ZIP}','${result.SN}','${result.SIDO_NM}','${result.SIGUNGU_NM}','${result.EUPMUNDONG_NM}','${result.LI_NM}','${result.BUILDING_NM}')">
				 	<td><c:out value="${fn:substring(result.ZIP,0,3)}"/>-<c:out value="${fn:substring(result.ZIP,3,6)}"/></td>
				 	<td><c:out value="${result.JUSO}"/></td>
				 </tr>
			</c:forEach>
		</c:if>
		<c:if test="${resultList == null }">
			<tr>
				<td colspan="2" style="text-align: center;">
					지역명을 올바르게 입력한 수 검색해 주세요!
				</td>
			</tr>
		</c:if>
	</tbody>
</table>
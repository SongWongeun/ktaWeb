<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">

/* loading 표시 */
window.onbeforeunload = function (e) {
		$('div#loading_page').show();
};

function selectDoro(lineName){
	//background-color: #FFF7E8;
	var str = $('#'+lineName).html();
	$('#selectDoroJuso').html(str);
}
</script>
<style type="text/css">
table.tbZip tbody tr:hover{background-color:#FFF7E8;cursor: pointer;}
</style>
</head>
<body>
	<div class="popUp">
		<div class="zipWrap">
			<div class="zipHelp">
				<p>자동변환된 도로명 주소를 확인해주세요.</p>
			</div>
			<table class="tbZip" summary="우편번호검색">
				<caption>지번주소</caption>
				<colgroup>
					<col width="20%"/>
					<col width="80%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="first">지번주소</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" style="text-align: left;">
							(<c:out value="${fn:substring(zipVO.j_zip,0,3)}"/>-<c:out value="${fn:substring(zipVO.j_zip,3,6)}"/>)</br>
							${zipVO.j_juso}</br>
							${zipVO.j_sangse}
						</td>
					</tr>
				</tbody>
			</table>
			
			
			<c:if test="${fn:length(result)>1}">
				<div class="zipHelp">
					<p>다수의 도로명 주소가 있습니다. 선택해주세요.</p>
				</div>
			</c:if>
			<table id="doroList" class="tbZip" summary="우편번호검색">
				<caption>도로명 주소</caption>
				<colgroup>
					<col width="20%"/>
					<col width="80%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="first">도로명 주소</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty result}">
							<tr>
								<td colspan="2" style="text-align: left;">
									없음
								</td>
							</tr>
						</c:when>
						<c:when test="${fn:length(result)==1}">
							<c:forEach var="resultList" items="${result}" varStatus="status">
								<tr>
									<td colspan="2" style="text-align: left;">
										(<c:out value="${fn:substring(resultList.ZIP,0,3)}"/>-<c:out value="${fn:substring(resultList.ZIP,3,6)}"/>)</br>
										${resultList.SIDO_NM}
										<c:if test="${!empty resultList.SIGUNGU_NM}">
											&nbsp;${resultList.SIGUNGU_NM}
										</c:if>
										<c:if test="${!empty resultList.EUPMUN_NM}">
											&nbsp;${resultList.EUPMUN_NM}
										</c:if>
										<c:if test="${!empty resultList.DOROMUNG_NM}">
											&nbsp;${resultList.DOROMUNG_NM}
										</c:if>
										<c:if test="${!empty resultList.BUILDING_M_NUM}">
											&nbsp;${resultList.BUILDING_M_NUM}
										</c:if>
										<c:if test="${!empty resultList.BUILDING_S_NUM&&resultList.BUILDING_S_NUM!=0}">
											-${resultList.BUILDING_S_NUM}
										</c:if>
										</br>
										<c:if test="${!empty resultList.D_SANGSE}">
											${resultList.D_SANGSE}&nbsp;
										</c:if>
										<c:if test="${!empty resultList.DONG_NM}">
										(${resultList.DONG_NM})
										</c:if>
										<c:if test="${!empty resultList.SIGUNGU_BUILDING_NM}">
										(${resultList.SIGUNGU_BUILDING_NM})
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${fn:length(result)>1}">
							<c:forEach var="resultList" items="${result}" varStatus="status">
								<tr id="doroList${status.count}" onclick="selectDoro('doroList${status.count}');">
									<td colspan="2" style="text-align: left;">
										(<c:out value="${fn:substring(resultList.ZIP,0,3)}"/>-<c:out value="${fn:substring(resultList.ZIP,3,6)}"/>)</br>
										${resultList.SIDO_NM}
										<c:if test="${!empty resultList.SIGUNGU_NM}">
											&nbsp;${resultList.SIGUNGU_NM}
										</c:if>
										<c:if test="${!empty resultList.EUPMUN_NM}">
											&nbsp;${resultList.EUPMUN_NM}
										</c:if>
										<c:if test="${!empty resultList.DOROMUNG_NM}">
											&nbsp;${resultList.DOROMUNG_NM}
										</c:if>
										<c:if test="${!empty resultList.BUILDING_M_NUM}">
											&nbsp;${resultList.BUILDING_M_NUM}
										</c:if>
										<c:if test="${!empty resultList.BUILDING_S_NUM&&resultList.BUILDING_S_NUM!=0}">
											-${resultList.BUILDING_S_NUM}
										</c:if>
										</br>
										<c:if test="${!empty resultList.D_SANGSE}">
											${resultList.D_SANGSE}&nbsp;
										</c:if>
										<c:if test="${!empty resultList.DONG_NM}">
										(${resultList.DONG_NM})
										</c:if>
										<c:if test="${!empty resultList.SIGUNGU_BUILDING_NM}">
										(${resultList.SIGUNGU_BUILDING_NM})
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<c:if test="${fn:length(result)>1}">
				<table id="doroList" class="tbZip" summary="우편번호검색">
					<caption>도로명 주소</caption>
					<colgroup>
						<col width="20%"/>
						<col width="80%"/>
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="first">도로명 주소</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<tr id="selectDoroJuso">
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>

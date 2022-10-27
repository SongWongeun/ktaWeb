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
						<th scope="col" class="first">도로명주소</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" style="text-align: left;">
							(<c:out value="${zipVO.d_zip}"/>)</br>
							${zipVO.d_juso}</br>
							${zipVO.d_sangse}
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="tbZip" summary="우편번호검색">
				<caption>도로명 주소</caption>
				<colgroup>
					<col width="20%"/>
					<col width="80%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="first">지번 주소</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" style="text-align: left;">
							(<c:out value="${fn:substring(result.ZIP,0,3)}"/>-<c:out value="${fn:substring(result.ZIP,3,6)}"/>)</br>
							${result.SIDO_NM}
							<c:if test="${!empty result.SIGUNGU_NM}">
								&nbsp;${result.SIGUNGU_NM}
							</c:if>
							<c:if test="${!empty result.EUPMUN_NM}">
								&nbsp;${result.EUPMUN_NM}
							</c:if>
							<c:if test="${!empty result.DONG_NM}">
								&nbsp;${result.DONG_NM}
							</c:if>
							</br>
							<c:if test="${!empty result.JIBUN_M_NUM}">${result.JIBUN_M_NUM}</c:if><c:if test="${!empty result.JIBUN_S_NUM&&result.JIBUN_S_NUM!='0'}">-<c:out value="${result.JIBUN_S_NUM}"/></c:if>번지
							<c:if test="${!empty result.SIGUNGU_BUILDING_NM}">
							${result.SIGUNGU_BUILDING_NM}
							</c:if>
							<c:if test="${!empty zipVO.d_sangse}">
							${zipVO.d_sangse}
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>

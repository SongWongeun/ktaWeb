<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javaScript" language="javascript" defer="defer">
function searchAddr(){
	document.searchForm.action = "/m/common/searchZip.do";
    document.searchForm.submit();
}
function inputZipCode(code,addr,new_addr){
	var zipCode1 = code.substr(0,3);
	var zipCode2 = code.substr(4,6);
	window.opener.${zipVO.form_name}.${zipVO.zip1_name}.value = zipCode1;
	window.opener.${zipVO.form_name}.${zipVO.zip2_name}.value = zipCode2;
	window.opener.${zipVO.form_name}.${zipVO.juso_name}.value = addr;
	window.opener.${zipVO.form_name}.${zipVO.new_juso_name}.value = new_addr;
	window.close();
}

$(document).ready(function(){
	$('form#searchForm input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			event.preventDefault();
			searchAddr();
		}
	});
});
<%-- 검색박스 엔터키 설정--%>

/* loading 표시 */
window.onbeforeunload = function (e) {
		$('div#loading_page').show();
};
</script>
</head>
<body>
	<div id="wrap">
		<h1 class="zipName">우편번호검색</h1>
		<form:form commandName="zipVO" id="searchForm" name="searchForm" method="post">
			<form:hidden path="form_name" />
			<form:hidden path="zip1_name" />
			<form:hidden path="zip2_name" />
			<form:hidden path="juso_name" />
			<form:hidden path="new_juso_name" />
		<div class="zipWrap">
			<div class="zipSearch">
				<div class="cellFirst">
					<div class="cellw1">  
						<form:select path="searchCondition"  style="width:100%" class="select">>
							<form:option value="dong">지번</form:option>
							<form:option value="road">도로명</form:option>
						</form:select>
					</div>
					<div class="cellw7">  
						<div class="searchForm mb0 pa0">
							<form:input path="searchKeyword" class="text" />
							<a class="btn" href="#;" onclick="searchAddr(); return false;"><i class="icon-search"></i></a>
						</div>
					</div>
				</div>
			</div>
			<!-- 검색도움말 -->
			<div class="zipHelp">
				<h3>검색도움말</h3>
				<p>지번검색 : 예) 방배동 753-5 같이 정확한 번지수를 같이 입력하여 주세요.</p>
				<p>도로명검색 : 예) '동작대로 230' 같이 정확한 도로명을 입력하여 주세요.</p>
			</div>
			<c:if test="${resultList != null }">
			<table class="tbZip" summary="우편번호검색">
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
					 <c:forEach var="result" items="${resultList}" varStatus="status">
						 <tr onclick="inputZipCode('${result[0]}','${result[2]}','${result[1]}')">
						 	<td><c:out value="${result[0]}"/></td>
						 	<td><c:out value="${result[1]}"/></td>
						 	<td><c:out value="${result[2]}"/></td>
						 </tr>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
		</form:form>
	</div>
		<div id="loading_page" style="width: 100%; position: fixed;top:0px; display: none;height: 100%;z-index: 1000;">
		<table style="width: 100%;height: 100%;z-index: 1001;position: fixed;"><tbody><tr><td>
			<img src="/images/ajax-loader.gif" id="loaderImg" style="left: 49%; position: absolute; "/>
		</td></tr></tbody></table>
		<div style="width: 100%;height: 100%;background-color: white;position: fixed; opacity: 0.5;filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=40);filter: alpha(opacity=50);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";" >
		</div>
	</div>
</body>
</html>
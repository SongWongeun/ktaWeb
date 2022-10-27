<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
<!-- Always force latest IE rendering engine or request Chrome Frame -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">
<!-- Use title if it's in the page YAML frontmatter -->
<title>KTA Admin page</title>

<link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" />
<link href="/css/truck/admin.css" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" /> -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
    <%-- datepicker 설정--%>
	$("#startDt").datepicker({
			showOn : 'both',
			changeYear : true,
			changeMonth : true,
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
			      '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
			showMonthAfterYear : true,
			dateFormat : 'yymmdd',
			buttonImageOnly : true,
			buttonImage : '/images/truck/board/calendar.gif',
			yearRange : '2012:'+sYear
	});
	$("#endDt").datepicker({
			showOn : 'both',
			defaultDate : "+1w",
			changeYear : true,
			changeMonth : true,
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
			      '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
			showMonthAfterYear : true,
			dateFormat : 'yymmdd',
			buttonImageOnly : true,
			buttonImage : '/images/truck/board/calendar.gif',
			yearRange : '2012:'+sYear
	});
});
function FnList(){
	var startDt = $('#startDt').val();
	var endDt = $('#endDt').val();
	if(startDt>endDt){
		alert("시작일과 종료일을 확인해주세요.");
		return false;
	}
	document.listForm.action = "<c:url value='/kma/mobileState/daysUseList.do'/>";
   	document.listForm.submit();
}
</script>
</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kma/common/left.do"></c:import>
<!--// left e -->

<div class="main-content">
	<form name="listForm" method="post">
	<input type="hidden" name="articleNo" id="articleNo" />
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						기간별메뉴사용현황
					</h3>
				</div>
			</div>
		</div>
	</div>
		<div class="container">
				<div class="row">
					<div class="col-md-12" >
						<div class="box">
							<div class="box-header">
								<span class="title">검색</span>
							</div>
							<div class="box-content padded">
								요청일시
								<input type="text" isInit="true" style="text-align:center; width:100px" readonly="readonly" id="startDt" name="startDt" value="${searchVO.startDt}" />
							 	- 
								<input type="text" isInit="true" style="text-align:center; width:100px" readonly="readonly" id="endDt" name="endDt" value="${searchVO.endDt}" />
								<a href="#;" onclick="FnList();return false;" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="search">조회</a>
							</div>		
						</div>
					</div>
				</div>
			</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
					<div class="box-content">
							<table class="table table-hover condensed">
							<colgroup>
								<col style="width:70%;" />
								<col style="width:30%;" />
							</colgroup>
							<thead>
							<tr>
							  <th><div>메뉴명</div></th>
							  <th><div>조회수</div></th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${not empty resultList}">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td>
									<c:out value="${result.REQUEST_MENU_NM}"/>
								</td>
								<td>
									${result.COUNT}
								</td>
							</tr>				
							</c:forEach>	
							</c:if>
							<c:if test="${empty resultList }">
							<tr>
								<td colspan="2">검색결과가 없습니다.</td>
							</tr>
							</c:if>						
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</fieldset>
	</form>
	</div>
</body>
</html>
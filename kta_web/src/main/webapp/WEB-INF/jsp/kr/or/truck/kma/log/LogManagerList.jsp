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
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<script src="/js/truck/kma_common.js" type="text/javascript"></script>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" />-->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
    <%-- datepicker 설정--%>
	$("#_ymdStart").datepicker({
			showOn : 'both',
			changeYear : true,
			changeMonth : true,
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
			      '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
			showMonthAfterYear : true,
			dateFormat : 'yy.mm.dd',
			buttonImageOnly : true,
			buttonImage : '/images/truck/board/calendar.gif',
			yearRange : (sYear-3)+':'+sYear
	});
	$("#_ymdEnd").datepicker({
			showOn : 'both',
			defaultDate : "+1w",
			changeYear : true,
			changeMonth : true,
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
			      '7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
			showMonthAfterYear : true,
			dateFormat : 'yy.mm.dd',
			buttonImageOnly : true,
			buttonImage : '/images/truck/board/calendar.gif',
			yearRange : (sYear-3)+':'+sYear
	});
});
function FnSetPage(_page){
}
function FnList(){
	var _userStr  = $("#_searField").val();
	var _ymdStart = deleteDateFormatStr($("#_ymdStart").val());
	var _ymdEnd   = deleteDateFormatStr($("#_ymdEnd").val());
	if(_userStr==""){
		alert("검색 값(아이디 혹은 명)을 입력하세요");
		$("#_searField").focus();
		return;
	}
	
	if(_ymdStart==""){
		alert("요청 시작일자를 입력하세요");
		$("#_ymdStart").focus();
		return;
	}
	
	if(_ymdEnd==""){
		alert("요청 종료일자를 입력하세요");
		$("#_ymdEnd").focus();
		return;
	}
	_ymdStart = Number(_ymdStart);
	_ymdEnd   = Number(_ymdEnd);
	if(_ymdStart > _ymdEnd){
		alert("요청시작일자가 요청종료일자 보다 큽니다.다시 입력하세요");
		$("#_ymdStart").focus();
		return;
	}

	$("form#kta_form").attr("action", "<c:url value='/kma/log/list.do'/>");
	$("form#kta_form").attr("method", "POST");
	$("form#kta_form").attr("target", "_self");
	$("form#kta_form").submit();
}
function FnNextPrev(section){
	var _page       = Number("${_param._page}");
	var _totalCount = Number("${_param._totalCount}");
	var _pageSize   = Number("${_param._pageSize}");
	var _ttPage     = parseInt( (_totalCount-1) / _pageSize+1 );

	if(section=="N"){
		if(_ttPage == _page){
			alert("마지막 페이지 입니다.");
			return;
		}
		_page = _page + 1;
	}else if(section=="P"){
		if(_page==0 || _page==1){
			alert("첫 페이지 입니다.");
			return;
		}
		_page = _page - 1;
	}
	
	$("#_page").val(_page);
	FnList();
}
function searchPaging(pageIndex){
	var _page       = Number(pageIndex);
	var _totalCount = Number("${_param._totalCount}");
	var _pageSize   = Number("${_param._pageSize}");
	var _ttPage     = parseInt( (_totalCount-1) / _pageSize+1 );

	$("#_page").val(_page);
	FnList();
}
//]]>
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
	<form id="kta_form" name="kta_form">
		<input type="hidden" id="_page"     name="_page"     value="${_param._page}" isInit="true"/>
		<input type="hidden" id="_pageSize" name="_pageSize" value="${_param._pageSize}" isInit="true"/>
	<fieldset>
		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
	        		<div class="pull-left header">
						<h3 class="title" >
							사용자 로그 관리
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
								사용자 아이디
								<input style="width: 20%" type="text" isInit="true" onkeypress="FnEnter(event, 'FnList');" name="_searField" id="_searField" value="${_param._searField}" />
								요청일시
								<input type="text" isInit="true" style="text-align:center; width:100px" readonly="readonly" id="_ymdStart" name="_ymdStart" value="${_param._ymdStart}" />
							 	- 
								<input type="text" isInit="true" style="text-align:center; width:100px" readonly="readonly" id="_ymdEnd" name="_ymdEnd" value="${_param._ymdEnd}" />
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
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="40%">
				</colgroup>
				<thead>
					<tr class="no-top">
						<th>아이디</th>
						<th>사용자명</th>
						<th>요청일시</th>
						<th>요청메뉴</th>
						<th>작업내용</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${!empty _param._list}">
							<c:forEach var="data" items="${_param._list}">
								<tr class="odd">
									<td class="first">${data.USER_ID}</td>
									<td class='text-left'>${data.NAME}</td>
									<td class='text-center'>${data.CONNECT_DT}</td>
									<td class='text-left'>
										${data.REQUEST_MENU_NM}
									</td>
									<td class='text-left'>
										${data.REQUEST_COMMENT}
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" align="center">
									데이터가 존재하지 않습니다.
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
					</div>
		</div>
		<div class="pag">
			<div class="ui-grid-a"  >
			<!-- 
				<div class="ui-block-a" style="text-align:right;">
					<div style="padding-top: 5px">&nbsp;&nbsp;&nbsp;총 ${_param._totalCount} 건 [${_param._page}/${_param._totalPage}]</div>
				</div>
			 -->
				<div class="ui-block-b" style="text-align:right;">
					<div data-role="controlgroup" data-type="horizontal" >
						<div class="text-center">
							<ul class="pagination pagination-sm">
								<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="searchPaging" />
							</ul>
							<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo}" />
						</div>
					</div>	
				</div>
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


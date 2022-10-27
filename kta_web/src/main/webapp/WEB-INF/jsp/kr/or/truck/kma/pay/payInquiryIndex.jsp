<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">

function searchPaging(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kma/pay/inquiry/list.do'/>";
   	document.boardForm.submit();
}

function searchList(){
	document.boardForm.pageIndex.value = "1";
	document.boardForm.action = "<c:url value='/kma/pay/inquiry/list.do'/>";
   	document.boardForm.submit();
}
$(document).ready(function(){
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;
	
	<%-- 검색박스 엔터키 설정--%>
	$('form#boardForm input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			search();
			return false;
		}
	});

	<%-- 조회기간년 셋팅--%>
	var yearCount = Number(sYear)-(2012);
	for(var z=0;z<=yearCount;z++){
		$('form#boardForm select[name="year"]')
			.append('<option value="'+(sYear-z)+'" label="'+(sYear-z)+'" />');		
	} 
	<%-- 조회기간월 셋팅--%>
	for(var z=1;z<=12;z++){
		if(z == sMonth){
				$('form#boardForm select[name="month"]')
					.append('<option value="'+z+'" label="'+z+'" />');
		}else{
				$('form#boardForm select[name="month"]')
					.append('<option value="'+z+'" label="'+z+'" />');
		}
	}

	<%-- 조회된 기간 셋팅--%>
	$('form#boardForm select[name="year"] option[value="${fn:substring(searchVO.searchDate,0,4) }"]').attr('selected','selected');
	$('form#boardForm select[name="month"] option:eq(${fn:substring(searchVO.searchDate,4,6) })').attr('selected','selected');
	
	<%-- 월별 조회 선택시 event --%>
	$('form#boardForm select[name="year"], form#boardForm select[name="month"], form#boardForm select[name="jibu_no"]').on('change',function(event){
		var y = $('form#boardForm select[name="year"] option:selected').val();
		var m = $('form#boardForm select[name="month"] option:selected').val();
		if( y != '0000' && m != '00' ){
			if(m.length == 2){
				$("#searchDate").val( y+m );
				searchList();
			}else{
				$("#searchDate").val( y+'0'+m);
				searchList();
			}
		}
	});
	
	$('form#boardForm select[name="searchCondition"]').on('change',function(event){
		var cond = $('form#boardForm select[name="searchCondition"] option:selected').val();
		if(cond == '3'){
			$("#searchKeyword").val('50260');
		}else{
			$("#searchKeyword").val('');
		}
	});
	
});
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
	<form:form commandName="searchVO" name="boardForm" id="boardForm" method="post"  enctype="multipart/form-data">
	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						모바일기기 요금조회
					</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="col-md-12" >
			<div class="panel panel-primary table-responsive">
 				<div class="panel-heading ">모바일기기 요금조회</div>
					<table class="table table-hover">
								<colgroup>
									<col style="width:5%;" />
									<col style="width:7%;" />
									<col style="width:7%;" />
									<col style="width:18%;" />
									<col style="width:12%;" />
									<col style="width:7%;" />
									<col style="width:10%;" />
									<col style="width:6%;" />
									<col style="width:6%;" />
									<col style="width:6%;" />
									<col style="width:6%;" />
									<col style="width:10%;" />
								</colgroup>
								<thead>
								<tr>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>순번</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>이름</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>사용자 ID</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>기기번호</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>MAC주소</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>지부</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>데이터</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>컨텐츠</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>문자</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>부가세</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>추가금</div></th>
									<th style="text-align:center; font-size:14px; font-weight:bold;"><div>총요금</div></th>
								</tr>
								</thead>
								<tbody>
								<c:if test="${not empty resultList}">
								<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr style="vertical-align:middle; text-align:center; font-size:13px; border-bottom: 1px solid lightgray;">
									<td><c:out value="${paginationInfo.firstRecordIndex + status.index + 1 }"/></td>
									<td>${result.USER_NM}</td>
									<td>${result.USER_ID}</td>
									<td>${result.TEL_NO}</td>
									<td>${result.EQUIP_PHY_ADDR}</td>
									<td>${result.JIBU}</td>
									<td><fmt:formatNumber value="${result.DATA_AMT}"  type="number" /></td> 
									<td><fmt:formatNumber value="${result.CONTENT_AMT}"  type="number" /></td>
									<td><fmt:formatNumber value="${result.SMS_AMT}"  type="number" /></td>
									<td><fmt:formatNumber value="${result.VAT_AMT}"  type="number" /></td>
									<td><fmt:formatNumber value="${result.EXTRA_AMT}"  type="number" /></td>
									<td>
										<c:if test="${result.TOT_AMT > 50260}"><span style="font-weight:bold; color:red; "><fmt:formatNumber value="${result.TOT_AMT}"  type="number" /></span></c:if>
										<c:if test="${result.TOT_AMT <= 50260}"><span style="font-weight:bold;"><fmt:formatNumber value="${result.TOT_AMT}"  type="number" /></span></c:if>
									</td>
								</tr>				
								</c:forEach>	
								</c:if>
								<c:if test="${empty resultList }">
								<tr>
									<td colspan="12">등록된 요금정보가 없습니다.</td>
								</tr>
								</c:if>						
								</tbody>
							</table>
					<div class="row box-section">
					<!-- paging s -->
						<form:input type="hidden" id="pageIndex" path="pageIndex" />
						<form:input type="hidden" id="searchDate" path="searchDate" />
						<div class="text-center">
							<ul class="pagination pagination-sm">
								<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="searchPaging" />
							</ul>
						</div>						
						<p align="center">
						<form:select path="year" id="year" title="조회기간 년도 선택" style="width:100px;" class="btn btn-default btn-sm">
							<form:option selected="selected" value="0000" label="선택"/>
						</form:select>
						년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<form:select path="month" id="month" title="조회기간 월 선택" style="width:80px;" class="btn btn-default btn-sm">
							<form:option selected="selected" value="00" label="선택"/>
						</form:select>
						월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<form:select path="jibu_no" id="jibu_no" title="지부선택" style="width:90px;" class="btn btn-default btn-sm">
							<form:option value="" label="전체"/>
							<form:option value="0101" label="본부"/>
							<form:option value="0131" label="본부직할(사)"/>
							<form:option value="0201" label="서울"/>
							<form:option value="0301" label="부산"/>
							<form:option value="0401" label="대구"/>
							<form:option value="0501" label="인천"/>
							<form:option value="0701" label="대전"/>
							<form:option value="0801" label="울산"/>
							<form:option value="0901" label="경기"/>
							<form:option value="1001" label="강원"/>
							<form:option value="1101" label="충북"/>
							<form:option value="1201" label="충남"/>
							<form:option value="1301" label="전북"/>
							<form:option value="1401" label="전남"/>
							<form:option value="1501" label="경북"/>
							<form:option value="1601" label="경남"/>
							<form:option value="1701" label="제주"/>
						</form:select>
						지부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="font-weight:bold;">검색조건</span>
						<form:select path="searchCondition" class="btn btn-default btn-sm">
							<li class=""><span class="title"><form:option value="0" label="전체"/></span></li>
							<li class=""><span class="title"><form:option value="1" label="이름"/></span></li>
							<li class=""><span class="title"><form:option value="2" label="전화번호"/></span></li>
							<li class=""><span class="title"><form:option value="3" label="요금초과"/></span></li>
						</form:select>&nbsp;&nbsp;&nbsp;
						<form:input type="text" path="searchKeyword" class="search-query animated" placeholder="Search"></form:input>
					  	<a id="back" class="btn btn-primary btn-sm" onclick="searchList()" href="#;">검색</a>
					  	<br/>
					  	요금초과 검색시 기준금액을 입력해주세요 ex) 50260 - 통상요금 초과자 검색 
						</p>
					</div>
				</div>
			</div>
		</div>
	</fieldset>
	</form:form>
</div>

</body>
</html>
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
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">

function searchList(){
	document.boardForm.action = "<c:url value='/kma/pay/mgr/list.do'/>";
   	document.boardForm.submit();
}
function insertInfo(){
	var year = document.boardForm.yearIn.value;
	var month = document.boardForm.monthIn.value;
	if(month.length == 1){
		month = "0"+month;
	}
	if(document.boardForm.file.value == ""){
		alert("파일을 업로드해주세요");
		return false;
	}
	var ext = document.boardForm.file.value;
		ext = ext.split('.')[1];
		ext = ext.toLowerCase();
	if(ext != 'xls'){
		alert("엑셀(*.xls) 파일만 업로드 가능합니다.");
		return false;
  	}
	  
	document.boardForm.searchDate.value = year+month;
	document.boardForm.action = "<c:url value='/kma/pay/mgr/excelUpload.do'/>";
   	document.boardForm.submit();
}

function deleteData(date){
	var year = date.substring(0,4);
	var month = date.substring(4,6);
	if(!confirm(year+"년 "+month+"월의 모바일 요금데이터가 모두 삭제됩니다. 계속하시겠습니까?")){
		return false;
	}
	document.boardForm.searchDate.value = date;
	document.boardForm.action = "<c:url value='/kma/pay/mgr/deleteData.do'/>";
   	document.boardForm.submit();	
}

$(document).ready(function(){
	
	<%-- 전역변수 --%>
	var a = new Date();
	var sYear = a.getFullYear();
	var sMonth = a.getMonth()+1;

	<%-- 조회기간년 셋팅--%>
	var yearCount = Number(sYear)-(2012);
	for(var z=0;z<=yearCount;z++){
		$('form#boardForm select[name="year"]')
			.append('<option value="'+(sYear-z)+'" label="'+(sYear-z)+'" />');		
	} 
	<%-- 입력기간년도 셋팅--%>
	for(var z=0;z<=yearCount;z++){
		$('form#boardForm select[name="yearIn"]')
			.append('<option value="'+(sYear-z)+'" label="'+(sYear-z)+'" />');		
	} 
	<%-- 입력기간월 셋팅--%>
	for(var z=1;z<=12;z++){
		if(z == sMonth){
				$('form#boardForm select[name="monthIn"]')
					.append('<option value="'+z+'" label="'+z+'" />');
		}else{
				$('form#boardForm select[name="monthIn"]')
					.append('<option value="'+z+'" label="'+z+'" />');
		}
	}
	
	
	<%-- 조회된 기간 셋팅--%>
	$('form#boardForm select[name="year"] option[value="${searchVO.searchDate}"]').attr('selected','selected');
	

	<%-- 조회된 기간 셋팅--%>
	$('form#boardForm select[name="yearIn"] option[value="'+sYear+'"]').attr('selected','selected');
	$('form#boardForm select[name="monthIn"] option:eq('+sMonth+')').attr('selected','selected');
	
	
	<%-- 월별 조회 선택시 event --%>
	$('form#boardForm select[name="year"]').on('change',function(event){
		var y = $('form#boardForm select[name="year"] option:selected').val();
		if( y != '0000'){
				$("#searchDate").val( y );
				searchList();
		}
	});
	
});

/* loading 표시 */
window.onbeforeunload = function (e) {
	var agt = navigator.userAgent.toLowerCase();
		/* IE 10이하 에서 팝업 열릴시에도 실행되어 처리함.
		 * - 조합원 - 보상정보조회 상세 ( /netCounter/inquiryService/accountInquiry/compenDetail.do )
		 * - 거래처 - 지급내역조회 ( /netCounter/inquiryService/accountInquiry/paymentListInquiry.do )
		 * */
		var agt = navigator.userAgent.toLowerCase();
		
		if(agt.indexOf("msie") != -1 && navigator.userAgent.match(/Trident\/(\d)/i)[1] < 7){
			return ;
		}
		
		$('div#loading_page').show();
}

</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'regist.overlap'){
		alert("중복된 요금정보가 있습니다. 업로드할 일자을 다시 확인해주세요");
	}else if(param == 'regist.fileFailed'){
		alert("파일형식이 다릅니다. Excel97-2003통합문서 형식으로 다른 이름 저장후 다시 시도해주세요.");
	}else if(param == 'regist.success'){
		alert("등록이 완료되었습니다.");
	}else if(param == 'delete.success'){
		alert("삭제가 완료되었습니다");
	}
});
</script>
</c:if>
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
						모바일기기 요금관리
					</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-7" >
				<div class="panel panel-primary table-responsive">
	 				<div class="panel-heading ">모바일기기 요금관리</div>
						<table class="table table-hover">
									<colgroup>
										<col style="width:90%;" />
										<col style="width:10%;" />
									</colgroup>
									<thead>
									<tr>
										<th style="text-align:center; font-size:14px; font-weight:bold;"><div>요금정보</div></th>
										<th style="text-align:center; font-size:14px; font-weight:bold;"><div>데이터 삭제</div></th>
									</tr>
									</thead>
									<tbody>
									<c:if test="${not empty resultList}">
									<c:forEach var="result" items="${resultList}" varStatus="status">
									<tr style="vertical-align:middle; text-align:center; font-size:12px; border-bottom: 1px solid lightgray;">
										<td>${fn:substring(result.GIJUN_YMD,0,4) }년&nbsp; ${fn:substring(result.GIJUN_YMD,4,6) }월&nbsp; 모바일기기 사용요금 정보</td>
										<td><a href="#;" class="btn btn-red" onclick="deleteData('${result.GIJUN_YMD}');">데이터 삭제</a></td>
									</tr>				
									</c:forEach>	
									</c:if>
									<c:if test="${empty resultList }">
									<tr>
										<td colspan="6">등록된 요금정보가 없습니다.</td>
									</tr>
									</c:if>						
									</tbody>
								</table>
						<div class="row box-section">
						<!-- paging s -->
							<p align="right">
							<form:input type="hidden" path="searchDate"/>
							<form:select path="year" id="year" title="조회기간 년도 선택" style="width:100px;" class="btn btn-default btn-sm">
								<form:option selected="selected" value="0000" label="선택"/>
							</form:select>
							년&nbsp;	
						  	<a id="back" class="btn btn-blue btn-sm" href="#addExcel" data-toggle="modal">EXCEL파일 업로드</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-5" >
				<div class="panel panel-primary">
  					<div class="panel-heading">요금관리 주의사항</div>
					<div class="panel-body">			
						<div>
						<p>1.업로드할 엑셀파일은 반드시 Excel 97-2003통합 문서(*.xls)형식으로 다른이름 저장하여 업로드해주세요</p>
						<p></p>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<div id="addExcel" class="modal fade" data-replace="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="panel panel-primary">
			    <div class="panel-heading">배너추가</div>
					<div class="row box-section">
						<div class="col-md-2" >EXCEL</div>
						<div class="col-md-10">
						<input name="file" id="file" type="file" title="IMAGE" placeholder="IMAGE" class="form-control"/>
						</div>
					</div>				
					<div class="row box-section">
						<div class="col-md-2" >기준일자</div>
						<div class="col-md-10">
						<select name="yearIn" id="yearIn" title="입력기간 년도 선택" style="width:100px;" class="btn btn-default btn-sm">
							<option selected="selected" value="0000" label="선택"/>
						</select>
						년&nbsp;
						<select name="monthIn" id="monthIn" title="입력기간 월 선택" style="width:80px;" class="btn btn-default btn-sm">
							<option selected="selected" value="00" label="선택"/>
						</select>
						월&nbsp;
						</div>
					</div>				
					<div class="row box-section">
						<div class="col-md-10" ></div>
						<div class="col-md-2">
				  			<a id="add" class="btn btn-blue" href="#;" onclick="insertInfo();">요금정보 추가</a>	  
				 	</div>
			    </div>
				</div><!-- /.modal-dialog -->
			</div>
		</div>
	</fieldset>
	</form:form>
</div>
<div id="loading_page" style="width: 100%; position: fixed;top:0px; display: none;height: 100%;z-index: 1000;">
	<table style="width: 100%;height: 100%;z-index: 1001;position: fixed;"><tbody><tr><td>
		<img src="/images/ajax-loader.gif" id="loaderImg" style="left: 49%; position: absolute;" ali="로딩이미지" />
	</td></tr></tbody></table>
	<div style="width: 100%;height: 100%;background-color: white;position: fixed; opacity: 0.5;filter: progid:DXImageTransform.Microsoft.Alpha(opacity=40);filter: alpha(opacity=50);-ms-filter:progid:DXImageTransform.Microsoft.Alpha(opacity=50);" >
	</div>
</div>	
</body>
</html>
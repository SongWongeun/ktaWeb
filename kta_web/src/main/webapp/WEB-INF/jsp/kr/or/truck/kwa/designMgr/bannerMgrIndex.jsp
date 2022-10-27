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
<title>KTA Admin page</title>

<link href="/bootStrap/stylesheets/application.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/bootStrap/javascripts/application.js" type="text/javascript"></script>
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<c:set var="registerFlag" value="${empty bidBoardVO.articleNo ? '등록' : '수정'}"/>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<!-- <link rel="stylesheet" href="/css/truck/jquery-ui.css" /> -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" type="text/css"/>
<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/namo/js/namo_scripteditor.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	$("select[name='asc']").on('change', function(event){
		var select = $(this).val();
		$('select[name="asc"] option[value="'+select+'"]:selected').parent().val("");
		$(this).val(select);		
	});

});

function deleteBanner(no){
	if(!confirm("선택된 배너가 바로 삭제됩니다. 삭제하시겠습니까?")){
		return false;	
	}	
	document.f.bannerNo.value = no;
	document.f.action='/kwa/design/bannerDelete.do';
	document.f.submit();
}

function insertBanner(){
	var url = document.f.banner_url.value;
	if(url == ""){
		if(!confirm("배너 링크가 없습니다. 계속진행하시겠습니까?")){
			return false;
		}
		
	}	
	if(document.f.file.value == ""){
		alert("배너 이미지 파일을 등록해 주십시오");
		return false;
	}
	if(document.f.newWindow.value==""){
		alert("배너형식을 선택해주십시오 \n (새창/현재창 여부)");
	}
	if(document.f.endDate.value==""){
		if(!confirm("배너 종료일이 선택되지 않았습니다. \n 이 배너는 삭제될때까지 계속해서 도출됩니다. \n 계속진행하시겠습니까?")){
			return false;
		}
	}
	document.f.action='/kwa/design/bannerInsert.do';
	document.f.submit();
}
function modifyBanner(no,url,title,fileId,winYn,date){

	document.f.bannerNo.value = no;
	document.f.banner_url_up.value = url;
	document.f.title_up.value= title;
	document.f.atchFileId.value=fileId;
	if(winYn == 'Y'){
		$("input[name='newWindow_up'][value='Y']").attr('checked','true')
	}else{
		$("input[name='newWindow_up'][value='N']").attr('checked','true')
	}
	document.f.newWindow_up.value=winYn;
	document.f.endDate_up.value=date;
}

function modifyBannerAction(){
	document.f.file.value = "";
	document.f.action = '/kwa/design/bannerModify.do';
	document.f.submit();
}
function bannerModify(){
	
	var bannerLength = document.f.banners_no.length;
	var bannerList = "";
	var tst = $("select[name='asc'] option[value='']:selected").length;
	if(tst > 0){
		alert("배너 순번을 선택해주세요");
		return false;
	}
	
	if(bannerLength >= 2){
		for(var i=0;i<bannerLength;i++){
			 var value = document.f.banners_no[i].value;
			 var value2 =document.f.asc[i].value;
			 bannerList += value+"_"+value2+",";
		}
		document.f.bannerList.value= bannerList;
	}else{
		document.f.bannerList.value= document.f.banners_no.value;
	}
	
	
	document.f.action = "/kwa/design/bannerUpdate.do";
	document.f.submit();
	
}

$(function() {
	 $("#end_datepicker").datepicker({
			  showOn : 'focus',
		      defaultDate : "+1w",
		      changeYear : true,
		      changeMonth : true,
		      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
		            '7월', '8월', '9월', '10월', '11월', '12월' ],
		      dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
		      showMonthAfterYear : true,
		      dateFormat : 'yy/mm/dd',
		      buttonImageOnly : true,
		      buttonImage : '/images/truck/board/calendar.gif'
			});
	});
$(function() {
	 $("#end_datepicker_up").datepicker({
			  showOn : 'focus',
		      defaultDate : "+1w",
		      changeYear : true,
		      changeMonth : true,
		      monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
		            '7월', '8월', '9월', '10월', '11월', '12월' ],
		      dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", ],
		      showMonthAfterYear : true,
		      dateFormat : 'yy/mm/dd',
		      buttonImageOnly : true,
		      buttonImage : '/images/truck/board/calendar.gif'
			});
	});
</script>
<c:if test="${not empty param.code}">
<script type="text/javascript">
$(document).ready(function(){
	var param ='${param.code}';
	if(param == 'insert.success'){
	 param = '등록이';
	}else if(param == 'update.success'){
		param='수정이';
	}else if(param == 'delete.success'){
		param ='삭제가';
	}
	alert('배너'+param+' 완료되었습니다.');
});
</script>
</c:if>

</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kwa/common/left.do"></c:import>
<!--// left e -->
<form:form name="f" id="f" commandName="designVO"  method="post"  enctype="multipart/form-data">
<div class="main-content">
	<form:hidden path="bannerNo"/>
	<form:hidden path="bannerList"/>
	<form:hidden path="atchFileId"/>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						배너 관리
					</h3>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="col-md-12" >
			<div class="panel panel-primary">
 				<div class="panel-heading">홈페이지 배너 관리</div>
				<div class="panel-body">			
					<div class="row">
					  	<c:forEach items="${bannerList}" var="banner">
 						<div class="col-sm-4 col-lg-3">
							<div class="thumbnail" style="min-height: 520px !important;">
						      <img src="/com/atch/getThumbImage.do?atchFileId=${banner.ATCH_FILE_ID}" style="width:300px;height:200px"alt="">
						      <div class="caption" id="banner">
						      <input type="hidden" name="banners_no" value="${banner.BANNER_NO}">
						      	<lead><b>링크</b></lead>
						        <pre style="min-height: 90px !important;"><p>${banner.BANNER_URL}<p></pre>
						        <lead><b>설명</b></lead>
						        <pre style="min-height: 110px !important;"><p> ${banner.TITLE}<p></pre>
						        <p><lead><b>
						       	종료일 : 
						       	<c:if test="${not empty banner.END_DATE}">
						       	${banner.END_DATE} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						       	</c:if>
						       	<c:if test="${empty banner.END_DATE}">
						       	지정되지 않음&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						       	</c:if>
						        </b></lead>
						        <lead><b>새창여부 : ${banner.NEW_WINDOW}</b></lead></p>
						         <p align="right"><select name="asc" id="asc" value="${banner.FILE_ASC }" class="btn btn-default btn-sm">
						        		<option value="">순번선택</option>
						        	<c:forEach items="${bannerList}" varStatus="asc" >
						        		<option value="${asc.index}" <c:if test="${asc.index == banner.FILE_ASC }">selected="selected"</c:if>>${asc.index+1}</option>
						        	</c:forEach>
						        </select>
						        <a href="#modifyBanner" data-toggle="modal" class="btn btn-default" onclick="modifyBanner('${banner.BANNER_NO}','${banner.BANNER_URL}','${banner.TITLE}','${banner.ATCH_FILE_ID}','${banner.NEW_WINDOW}','${banner.END_DATE}'); return false;">수정</a>
						        <a href="#;" class="btn btn-default" onclick="deleteBanner('${banner.BANNER_NO}');">삭제</a></p>
						      </div>
						    </div>
					    </div>
					    </c:forEach>
					</div>					
				</div>
			</div>
			<div class="col-md-2 col-lg-offset-10" >
				  <p align="right">
				  <a id="modify" class="btn btn-blue" href="#;" onclick="bannerModify();">적용하기</a>
				  <a id="add" class="btn btn-blue" href="#addBanner" data-toggle="modal" >배너 추가</a>
				  </p>
			</div>
		</div>
	</div>	
</div>

	<div id="addBanner" class="modal fade" data-replace="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="panel panel-primary">
		    <div class="panel-heading">배너추가</div>
				<div class="row box-section">
					<div class="col-md-2" >링크</div>
					<div class="col-md-10">
					<form:input path="banner_url" placeholder="링크 URL" maxlength="150" class="form-control" value="#;"/>
					</div>
				</div>		
				<div class="row box-section">
					<div class="col-md-2" >설명</div>
					<div class="col-md-10">
					<form:input path="title" placeholder="title" maxlength="150" class="form-control" />
					</div>
				</div>		
				<div class="row box-section">
					<div class="col-md-2" >이미지</div>
					<div class="col-md-10">
					<input name="file" id="file" type="file" title="IMAGE" placeholder="IMAGE" class="form-control"/>
					</div>
				</div>				
				<div class="row box-section">
					<div class="col-md-2" >새창여부</div>
					<div class="col-md-4" >
					<span style="vertical-align: middle;"><form:radiobutton path="newWindow" value="Y" type="radio"  />&nbsp;새창</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="vertical-align: middle;"><form:radiobutton path="newWindow" value="N" type="radio"/>&nbsp;현재창</span>
					</div>
					<div class="col-md-2" >배너 종료일</div>
					<div class="col-md-4">
					<form:input path="endDate" placeholder="배너종료일" id="end_datepicker" class="form-control" readonly="true"/>
					</div>
				</div>				
				<div class="row box-section">
					<div class="col-md-10" ></div>
					<div class="col-md-2">
			  			<a id="add" class="btn btn-blue" href="#;" onclick="insertBanner();">배너 추가</a>	  
			 	</div>
		    </div>
			</div><!-- /.modal-dialog -->
		</div>
	</div>
	
	<div id="modifyBanner" class="modal fade" data-replace="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="panel panel-primary">
		    <div class="panel-heading">배너 수정</div>
				<div class="row box-section">
					<div class="col-md-2" >링크</div>
					<div class="col-md-10">
					<input type="text" name="banner_url_up" placeholder="링크 URL" maxlength="150" class="form-control" />
					</div>
				</div>		
				<div class="row box-section">
					<div class="col-md-2" >설명</div>
					<div class="col-md-10">
					<input type="text" name="title_up" placeholder="title" maxlength="150" class="form-control" />
					</div>
				</div>		
				<div class="row box-section">
					<div class="col-md-2" >이미지</div>
					<div class="col-md-10">
					<input name="file_up" id="file_up" type="file" title="IMAGE" placeholder="IMAGE" class="form-control"/>
					</div>
				</div>				
				<div class="row box-section">
					<div class="col-md-2" >새창여부</div>
					<div class="col-md-4">
					<span style="vertical-align: middle;"><input name="newWindow_up" value="Y" type="radio" c/>&nbsp;새창</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="vertical-align: middle;"><input name="newWindow_up" value="N" type="radio"/>&nbsp;현재창</span>
					</div>
					<div class="col-md-2" >배너 종료일</div>
					<div class="col-md-4">
					<input name="endDate_up" placeholder="배너종료일" id="end_datepicker_up" class="form-control" readonly="true"/>
					</div>
				</div>				
				<div class="row box-section">
					<div class="col-md-10" ></div>
					<div class="col-md-2">
			  			<a id="add" class="btn btn-blue" href="#;" onclick="modifyBannerAction();">배너  수정</a>	  
			 	</div>
		    </div>
			</div><!-- /.modal-dialog -->
		</div>
	</div>
	
</form:form>
</body>
</html>
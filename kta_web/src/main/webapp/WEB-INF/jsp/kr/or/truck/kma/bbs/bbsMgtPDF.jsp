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
<%
pageContext.setAttribute("br", "\n");
%>
<script type="text/javascript">
//<![CDATA[
var _curOpenRn=0;
var ___mode="I";
var _fileInfos = "";

$(function() {
});

function FnSetPage(_page){
	$("#_page").val(_page);
	FnList();
}
function FnList(){
	$("form#kta_form").attr("action", "<c:url value='/kma/bbs/list.do'/>");
	$("form#kta_form").attr("method", "POST");
	$("form#kta_form").attr("target", "_self");
	$("form#kta_form").submit();
}
function FnSearList(){
	$("#_page").val("1");
	FnList();
}
function FnViews(isRn, bbsSeq){
	var tableId     = document.getElementById("listview");
	var tableId_cnt = (tableId.rows.length-1) / 2;

	if(isRn==_curOpenRn){
		$("#rows_by_"+isRn).hide();http://192.1.51.232:8080/bbs/list.do
		$("#icons_"+isRn).children().children().removeClass('ui-icon-minus').addClass('ui-icon-plus');
		$("#icons_"+isRn).trigger('create');	
		_curOpenRn = 0;
	}else{
		for(var i=1; i<=tableId_cnt; i++){
			if(Number(isRn)==i){
				FnHitCntAdd(bbsSeq, isRn);
				$("#rows_by_"+isRn).show();
				$("#icons_"+isRn).children().children().removeClass('ui-icon-plus').addClass('ui-icon-minus');
				$("#icons_"+isRn).trigger('create');
				_curOpenRn = isRn;
			}else{
				$("#rows_by_"+i).hide();
				$("#icons_"+i).children().children().removeClass('ui-icon-minus').addClass('ui-icon-plus');
				$("#icons_"+i).trigger('create');
			}
		}
	}
}
function FnViewsNotice(isRn, bbsSeq){
	var tableId     = document.getElementById("listview");
	var tableId_cnt = (tableId.rows.length-1) / 2;

	if(isRn==_curOpenRn){
		$("#rows_by_"+isRn).hide();http://192.1.51.232:8080/bbs/list.do
		$("#icons_"+isRn).children().children().removeClass('ui-icon-minus').addClass('ui-icon-plus');
		$("#icons_"+isRn).trigger('create');	
		_curOpenRn = 0;
	}else{
		for(var i=1; i<=tableId_cnt; i++){
			if(Number(isRn)==i){
				FnHitCntAdd(bbsSeq, isRn);
				$("#rows_by_"+isRn).show();
				$("#icons_"+isRn).children().children().removeClass('ui-icon-plus').addClass('ui-icon-minus');
				$("#icons_"+isRn).trigger('create');
				_curOpenRn = isRn;
			}else{
				$("#rows_by_"+i).hide();
				$("#icons_"+i).children().children().removeClass('ui-icon-minus').addClass('ui-icon-plus');
				$("#icons_"+i).trigger('create');
			}
		}
	}
	
}
function FnFileCall(bbsSeq, isRn){
	if("${_param._bbs.FILE_FN_USE_YN}"=="Y") {
		// ### 조회수 증가.
		$.ajax({
			async : true
	      , type: 'POST'
	      , url: "<c:url value='/kma/bbs/detail.do'/>"
	      , dataType : 'json'
	      , data : {
	    	         "_bbsManagerId"  : "${_param._bbs.BBS_MANAGER_ID}"
	               , "_bbsSeq" : bbsSeq
	          }
	      , success : function (data) {
				// ### 화면 조회수 증가 처리
				var hit = Number($("#rows_hit_cnt_"+isRn).html());
				$("#rows_hit_cnt_"+isRn).html( (hit+1));
				$("#file_area_"+isRn).html(data._fileHtml);
				$("#rows_"+isRn).show();
				
		  }, error: function(response, error) {
			  FnAjaxError(response);
		  }
		});
	}else{
		var hit = Number($("#rows_hit_cnt_"+isRn).html());
		$("#rows_hit_cnt_"+isRn).html( (hit+1));
		$("#rows_"+isRn).show();
	}
}
function FnHitCntAdd(bbsSeq, isRn){
	// ### 조회수 증가.
	$.ajax({
		async : true
      , type: 'POST'
      , url: "<c:url value='/kma/bbs/hitCnt.do'/>"
      , dataType : 'json'
      , data : {
    	         "_bbsManagerId"  : "${_param._bbs.BBS_MANAGER_ID}"
               , "_bbsSeq" : bbsSeq
          }
      , success : function (data) {
    	  
			if(data._reuslt=="S"){
				FnFileCall(bbsSeq, isRn);
			}
	  }, error: function(response, error) {
		  FnAjaxError(response);
	  }
	});
}
function FnSelectFrom(selection,bbsSeq){
	if(selection=="R"){
		$("#listview").show();
		$("#iuContainer").hide();
		$("#_bbsSeq").val("");
		$("#_mode").val("");
		$("#insertView").html("");
		
	}else{
		if(selection=="W"){
			$("#_bbsSeq").val("");
			$("#_bbsParentSeq").val("0");
			
		}else if(selection=="WR"){
			$("#_bbsSeq").val("");
			$("#_bbsParentSeq").val(bbsSeq);
			
		}else if(selection=="E"){
			$("#_bbsSeq").val(bbsSeq);
		}
		$("#_mode").val(selection);
		$("#listview").hide();
		$("#iuContainer").show();
		$.ajax({
			async : true
	      , type: 'POST'
	      , url: "<c:url value='/kma/bbs/select.do'/>"
	      , dataType : 'json'
	      , data : {
	    	         "_bbsManagerId" : "${_param._bbs.BBS_MANAGER_ID}"
	               , "_bbsSeq"       : bbsSeq
	               , "_mode"         : selection
	          }
	      , success : function (data) {
	    	  $("#insertView").html(data._form).trigger("create");
	    	  
		  }, error: function(response, error) {
			  FnAjaxError(response);
		  }
		});
	}

}

function FnAddFile(){
	// ### 파일 갯수를 설정한다. 화면 스크립트처리용.
	var curFileCnt = Number($("#_fileSu").val());

	var fileStr = new StringBuffer();
	fileStr.append("<tr id='TrFile"+curFileCnt+"' class='active'> \n");
	fileStr.append("	<td height='20'> \n");
	fileStr.append("		<input type='file' id='ObjFile"+curFileCnt+"' name='ObjFile"+curFileCnt+"' class='form-control'/>\n");
	fileStr.append("	</td> \n");
	fileStr.append("	<td> \n");
	fileStr.append("		<span id='SpanBtn"+curFileCnt+"'> \n");
	fileStr.append("		<a id='BtnFile"+curFileCnt+"' href=javascript:FnDeleteFile('TrFile"+curFileCnt+"','"+curFileCnt+"')  class='btn btn-primary btn-sm'>삭제</a>\n");
	fileStr.append("		</span> \n");
	fileStr.append("	</td> \n");
	fileStr.append("</tr> \n");

	// ### 파일 객체추가.
	$("#fileArea").append(fileStr.toString()).trigger("create");;

	// ### 현재 파일 갯수를 설정한다.
	$("#_fileSu").val(curFileCnt+1);
}

//### 파일객체 삭제
function FnDeleteFile(delId, curCnt){
	// ### 파일 갯수를 설정한다. 화면 스크립트처리용.
	var curFileCnt = Number($("#_fileSu").val());
	
	// ### 테이블 로우 갯수
	//var tableRowCnt = $("#fileArea").attr('rows').length;
	var tableId = document.getElementById("fileArea");		
	var tableRowCnt= tableId.rows.length;
	
	// ### 삭제될 인덱스
	var delCnt = Number(curCnt);

	// ### 파일 객체 삭제.
	$("#"+delId).remove();
	
	for(var i=(delCnt+1); i<= tableRowCnt; i++){
		$("#SpanBtn"+(i)).html("<a id='BtnFile"+(i-1)+"' href=javascript:FnDeleteFile('TrFile"+(i-1)+"','"+(i-1)+"')>[파일삭제]</a>");
		$("#SpanBtn"+(i)).attr("id"  , "SpanBtn"+(i-1) ); // 파일객체 아이디
		$("#ObjFile"+(i)).attr("name", "ObjFile"+(i-1) ); // 파일객체 명
		$("#ObjFile"+(i)).attr("id"  , "ObjFile"+(i-1) ); // 파일객체 아이디
		$("#TrFile"+(i)).attr("id"  , "TrFile"+(i-1) );   // 로우 아이디
	}

	// ### 다음 추가될 파일의 인덱스
	$("#_fileSu").val((curFileCnt-1));

}

function FnWriteValid(){
	if( Number("${___user_info.USER_AUTH_CD}") <= 1){
		// ### 글 등록 유효성 체크
		var ___writeTitle   = $("#_writeTitle").val();
		var ___writeContent = $("#_writeContent").val();
		
		if(___writeTitle.length<1){
			alert("글 제목을 입력 하세요");
			$("#_writeTitle").focus();
			return false;
		}
		
		if( fnByteLength(___writeTitle) >  256){
			alert("글 제목의 최대입력 크기를 초과 하였습니다.\n입력된 크기("+fnByteLength(___writeTitle) +") Byte");
			$("#_writeTitle").focus();
			return false;	
		}
		
		if(___writeContent.length<1){
			alert("글 내용을 입력 하세요");
			$("#_writeContent").focus();
			return false;
		}
		if( fnByteLength(___writeContent) > 4000){
			alert("글 내용의 최대입력 크기를 초과 하였습니다.\n입력된 크기("+fnByteLength(___writeContent) +") Byte");
			$("#_writeContent").focus();
			return false;
		}
	}
	
	return true;
}

function FnAjaxFileUpload(){
	if( Number("${___user_info.USER_AUTH_CD}") <= 1){
		if(!confirm("저장 하시겠습니까?")) return;
		
		// ### 유요성 체크
		if( FnWriteValid()== false ) return ;
		
		if( !$("#ObjFile1").val()==""){
			$("#loading").ajaxStart(function(){
				//$(this).show();
			}).ajaxComplete(function(){
				//$(this).hide();
			});
	
			$.ajaxFileUpload({
				url:"<c:url value='/kma/common/fileUploadBy.do'/>",
				secureuri:false,
				fileElementId:"ObjFile1",
				dataType: 'json',
				data:{},
				success: function (data, status) {
					if(data._result=="S"){
						FnSave( data._fileSeq );
					}
					
				}, error: function (data, status, e)
				{
					alert(e);
					return;
				}
			});
			//return false;
			return;
		}else{
			FnSave( "" );
		}
	}
}

// ### 게시판 글 저장
function FnBoardSave(){
	
	if( !confirm("저장하시겠습니까?") ){
		return;
	}
	
	var fileCnt = Number($("#_fileSu").val());

	for(var i=1; i<fileCnt; i++){
		if( $("#ObjFile"+i).val() == "" ){
			alert("("+i+") 번째 파일을 선택 하시기 바랍니다.");
			$("#ObjFile"+i).focus();
			return;
		}
	}

	// ### 수정모드 일 경우 기존 파일의 수정에 대한 유효성체크
	$("form#kta_form").attr("action", "<c:url value='/kma/bbs/save.do'/>");
	// ### 파일 기능을 사용할 경우.
	if(fileCnt>1){
		$("form#kta_form").attr("enctype" , "multipart/form-data");
		$("form#kta_form").attr("encoding", "multipart/form-data" );	
	}
	$("form#kta_form").attr("method"  , "POST");
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

function FnByDeleteBbsInfo(bbsSeq){
	if(!confirm("삭제 하시겠습니까?")) return;
	$.ajax({
		async : true
      , type: 'POST'
      , url: "<c:url value='/kma/bbs/delete.do'/>"
      , dataType : 'json'
      , data : {
    	         "_bbsManagerId" : "${_param._bbs.BBS_MANAGER_ID}"
               , "_bbsSeq"       : bbsSeq
          }
      , success : function (data) {
    	  FnSearList();
	  }, error: function(response, error) {
		  FnAjaxError(response);
	  }
	});
}
function FnFileDownLoad( _FileSeq ){
	$("#_fileSeq").val(_FileSeq);
	$("form#kta_form").attr("action", "<c:url value='/kma/down/index.do'/>");
	$("form#kta_form").attr("method", "POST");
	$("form#kta_form").attr("target", "_self");
	$("form#kta_form").submit();
}

jQuery.download = function(url, data, method){
    // url과 data를 입력받음
    if( url && data ){ 
        // data 는  string 또는 array/object 를 파라미터로 받는다.
        data = typeof data == 'string' ? data : jQuery.param(data);
        // 파라미터를 form의  input으로 만든다.
        var inputs = '';
        jQuery.each(data.split('&'), function(){ 
            var pair = this.split('=');
            inputs+='<input type="hidden" name="'+ pair[0] +'" value="'+ pair[1] +'" />'; 
        });
        // request를 보낸다.
        jQuery('<form action="'+ url +'" method="'+ (method||'post') +'">'+inputs+'</form>')
        .appendTo('body').submit().remove();
    };
};

/* 
// ### 파일객체 추가
function FnAddFile(){
	// ### 파일 갯수를 설정한다. 화면 스크립트처리용.
	var curFileCnt = Number($("#_fileSu").val());
	var fileStr = new StringBuffer();
	fileStr.append("<tr id='TrFile"+curFileCnt+"'> \n");
	fileStr.append("	<td height='20'> \n");
	fileStr.append("		<input type='file' id='ObjFile"+curFileCnt+"' name='ObjFile"+curFileCnt+"' /> \n");
	fileStr.append("		<span id='SpanBtn"+curFileCnt+"'> \n");
	//fileStr.append("		<a href='#' id='BtnFile"+curFileCnt+"' onclick=FnDeleteFile('TrFile"+curFileCnt+"','"+curFileCnt+"')><img src=<c:url value='/resource/images/inventory'/>/b_4.gif align='middle'></a>\n");
	fileStr.append("			<a id='BtnFile"+curFileCnt+"' href=javascript:FnDeleteFile('TrFile"+curFileCnt+"','"+curFileCnt+"') data-role='button' data-inline='true' data-theme='b' >삭제</a>\n");
	fileStr.append("		</span> \n");
	fileStr.append("	</td> \n");
	fileStr.append("</tr> \n");

	// ### 파일 객체추가.
	$("#fileArea").append(fileStr.toString()).trigger("create");
	
	// ### 현재 파일 갯수를 설정한다.
	$("#_fileSu").val(curFileCnt+1);
}
 */
// ### 파일객체 삭제
function FnDeleteFile(delId, curCnt){
	// ### 파일 갯수를 설정한다. 화면 스크립트처리용.
	var curFileCnt = Number($("#_fileSu").val());

	// ### 테이블 로우 갯수
	var tableRowCnt = $("#fileArea tr").length;
	
	// ### 삭제될 인덱스
	var delCnt = Number(curCnt);

	// ### 파일 객체 삭제.
	$("#"+delId).remove();
	
	for(var i=(delCnt+1); i<= tableRowCnt; i++){
		$("#SpanBtn"+(i)).html("<a id='BtnFile"+(i-1)+"' href=javascript:FnDeleteFile('TrFile"+(i-1)+"','"+(i-1)+"') data-role='button' data-inline='true' data-theme='b' >삭제</a>\n").trigger("create");
		$("#SpanBtn"+(i)).attr("id"  , "SpanBtn"+(i-1) ); // 파일객체 아이디
		$("#ObjFile"+(i)).attr("name", "ObjFile"+(i-1) ); // 파일객체 명
		$("#ObjFile"+(i)).attr("id"  , "ObjFile"+(i-1) ); // 파일객체 아이디
		$("#TrFile"+(i)).attr("id"  , "TrFile"+(i-1) );   // 로우 아이디
	}

	// ### 다음 추가될 파일의 인덱스
	$("#_fileSu").val((curFileCnt-1));
}

function FnFileEdit(fileRn,isgbn){

	if(isgbn=="N" || isgbn=="D"){
		$("#fileEdit"+fileRn).html("");
	}else{
		var str = new StringBuffer();
		str.append("<input type='file' data-mini='true' data-inline='true' id='ObjFile"+fileRn+"' name='ObjFile"+fileRn+"' />");
		$("#fileEdit"+fileRn).html(str.toString()).trigger("create");
	}
	
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
<input type="hidden" id="_bbsManagerId" name="_bbsManagerId" value="${_param._bbs.BBS_MANAGER_ID}" isInit="true" />
<input type='hidden' id='_bbsSeq'       name='_bbsSeq'       value='' isInit='true'/>
<input type='hidden' id='_mode'         name='_mode'         value='' isInit='true'/>
<input type='hidden' id='_bbsParentSeq' name='_bbsParentSeq' value='' isInit='true'/>
<input type='hidden' id='_fileSeq'     name='_fileSeq'       value='' isInit='true'/>

	<fieldset>
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						${_param._bbs.BBS_NM} 게시판
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
						<select name="_searTerms" id="_searTerms" class="btn btn-default btn-sm" isInit="true" style="margin-left: 2%; margin-right: 2%" data-mini="true" data-inline="true">
							<option value="">선택</option>
							<option value="TT" <c:if test="${_param._searTerms eq 'TT' }">selected</c:if>>제목</option>
							<option value="CT" <c:if test="${_param._searTerms eq 'CT' }">selected</c:if>>내용</option>
							<option value="NA" <c:if test="${_param._searTerms eq 'NA' }">selected</c:if>>이름</option>
						</select>
						<input type="text" style="font-size:12px; width:40%; margin-right: 2%" onkeypress="FnEnter(event, 'FnSearList')" name="_searField1" id="_searField1" value="${_param._searField}" isInit="true" />
						<a href="javascript:FnSearList()" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="search">조회</a>
						<a href="javascript:FnSelectFrom('W', '');" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="plus">추가</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="display: none;" id="iuContainer">
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
					<script src="<c:url value='/js/truck/jquery-AjaxFileupload.js'/>"></script>
						<div class="tbl" id="insertView" style="text-align: left;"></div>
					<img id="loading" src="<c:url value='/resource/images'/>/loading.gif" style="display:none;">
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
					<table class="table table-normal" id="listview">
						<colgroup>
							<col width="4%">
							<col width="90%">
							<col width="6%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center">순번</th>
								<th class="text-center">제목</th>
								<th class="text-center">다운로드</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${!empty _param._noticeList}">
							<c:set var="notice_i" value="10" />
							<c:forEach var="notice_data" items="${_param._noticeList}">
								<tr class="warning" onclick="FnViews('${notice_i}','${notice_data.BBS_SEQ}')" rel="external" style="cursor: pointer;">
									<%-- <td class="first text-center">
										<!--a href="#;" id="icons_${notice_i}" data-role="button" data-icon="minus" data-iconpos="notext">&nbsp;</a-->
										<a href="#;" id="icons_${notice_i}" data-role="button" data-icon="plus" data-iconpos="notext">&nbsp;</a>
									</td> --%>
									<td class="text-center">
										공지
									</td>
									<td class="title">
										<c:if test="${ _param._bbs.REPLY_FORM_YN eq 'Y' }">
											<c:if test="${notice_data.LVL > 1}">
												<c:forEach begin="${1}" end="${notice_data.LVL*2}">&nbsp;</c:forEach>[RE] 
											</c:if>
										</c:if>
										<c:choose>
											<c:when test="${fn:length(notice_data.WRITE_TITLE) > 50}">
												<c:out value="${fn:substring(notice_data.WRITE_TITLE,0,50)}" />..
											</c:when>
											<c:otherwise>
												${notice_data.WRITE_TITLE}
											</c:otherwise>
										</c:choose>
										<!-- 뉴 버튼 -->
										<c:if test="${notice_data.REG_DT eq _param._system_todate}">
											&nbsp;<font color="red"><strong>(N)</strong></font>
										</c:if>
										<c:if test="${_param._bbs.FILE_FN_USE_YN eq 'Y'}">
											<c:if test="${notice_data.FILE_CNT > 0}">
												<img src="/images/truck/etc/btn_icon_file.gif" alt="File" />
											</c:if>
										</c:if>
									</td>
									<%-- <td>${notice_data.REG_DT}</td> --%>
									<%-- <td class="text-center">${notice_data.WRITER_NM}</td> --%>
									<!-- <td class="text-center">
										<a href="#;" onclick="">
											링크
										</a>
									</td> -->
									<td class="text-center"><span id="rows_hit_cnt_${notice_i}">${notice_data.HIT_CNT}</span></td>
								</tr>
							<c:set var="styles1" value="" />
							<c:choose>
								<c:when test="${notice_i >= 10}"><c:set var="styles1" value="style='display:none'" /></c:when>
							</c:choose>
								<tr id="rows_by_${notice_i}" ${styles1} class="odd">
									<th class="text-center" style="vertical-align: middle;background-color: white;">내용</th>
									<td colspan="4" class="text-left" style="vertical-align: top;">
	
					    				<!-- 내용 -->
				    					<div class='box_area' style='text-align:left;margin-top:10px;margin-bottom:10px;width:98%'>
											<c:if test="${ !empty notice_data.WRITE_CONTENT}">
												<div style="margin-left:10px;margin-top:10px">${fn:replace( notice_data.WRITE_CONTENT,br, "<br/>")}</div>
											</c:if>
											<br/>
				    					</div>
				    					
				    					<!-- 파일 정보 -->
					    				<c:if test="${_param._bbs.FILE_FN_USE_YN eq 'Y'}">
					    					<c:choose>
					    						<c:when test="${notice_data.FILE_CNT > 0}">
							    					<div class='box_area' style='text-align:left;margin-left:3px;margin-top:10px;width:98%;font-weight: bold;'>
														<img src="/images/truck/etc/btn_icon_file.gif" alt="File" /><span class="c" id="file_area_${notice_i}"></span>
							    					</div>
							    					<br/>
					    						</c:when>
					    					</c:choose>
					    				</c:if>
				    					<!-- 버튼 정보 영역 -->
					    				<c:choose>
					    					<c:when test="${ _param._bbs.REPLY_FORM_YN eq 'Y' }">
					    						<div class='box_area' style='text-align:left;margin-left:3px;margin-top:10px;width:98%'>
					    							<a href="javascript:FnSelectFrom('WR','${notice_data.BBS_SEQ}');" data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='plus'>답변</a>
													<c:if test="${notice_data.WRITER_ID eq adminLoginVO.user_id }">
							    						<a href="javascript:FnSelectFrom('E','${notice_data.BBS_SEQ}')"  data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='save' class='btn btn-primary' >수정</a>
							    						<a href="javascript:FnByDeleteBbsInfo('${notice_data.BBS_SEQ}')" data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='save' class='btn btn-primary' >삭제</a>
									    			</c:if>
								    			</div>
					    					</c:when>
					    					<c:otherwise>
					    						<div class='box_area' style='text-align:left;margin-left:3px;margin-top:10px;width:98%'>
													<c:if test="${notice_data.WRITER_ID eq adminLoginVO.user_id }">
							    						<a href="javascript:FnSelectFrom('E','${notice_data.BBS_SEQ}')"  data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='save' class='btn btn-primary '>수정</a>
							    						<a href="javascript:FnByDeleteBbsInfo('${notice_data.BBS_SEQ}')" data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='save' class='btn btn-primary' >삭제</a>
									    			</c:if>
								    			</div>
					    					</c:otherwise>
					    				</c:choose>
									</td>
								</tr>
								<c:set var="notice_i" value="${notice_i+1}" />
							</c:forEach>
						</c:if>
						<c:choose>
							<c:when test="${!empty _param._list}">
							<c:set var="i" value="1" />
							<c:set var="row_number" value="${_param._totalCount-((_param._page-1)*_param._pageSize)}" />
							<c:forEach var="data" items="${_param._list}">
								<tr class="odd" onclick="FnViews('${i}','${data.BBS_SEQ}')" rel="external" style="cursor: pointer;">
									<%-- <td class="first text-center">
										<!--a href="#;" id="icons_${i}" data-role="button" data-icon="minus" data-iconpos="notext">&nbsp;</a-->
										<a href="#;" id="icons_${i}" data-role="button" data-icon="plus" data-iconpos="notext">&nbsp;</a>
									</td> --%>
									<td class="text-center">
										${row_number}
									</td>
									<td class="title">
										<c:if test="${ _param._bbs.REPLY_FORM_YN eq 'Y' }">
											<c:if test="${data.LVL > 1}">
												<c:forEach begin="${1}" end="${data.LVL*2}">&nbsp;</c:forEach>[RE] 
											</c:if>
										</c:if>
										<c:choose>
											<c:when test="${fn:length(data.WRITE_TITLE) > 50}">
												<c:out value="${fn:substring(data.WRITE_TITLE,0,50)}" />..
											</c:when>
											<c:otherwise>
												${data.WRITE_TITLE}
											</c:otherwise>
										</c:choose>
										<!-- 뉴 버튼 -->
										<c:if test="${data.REG_DT eq _param._system_todate}">
											&nbsp;<font color="red"><strong>(N)</strong></font>
										</c:if>
										<c:if test="${_param._bbs.FILE_FN_USE_YN eq 'Y'}">
											<c:if test="${data.FILE_CNT > 0}">
												<img src="/images/truck/etc/btn_icon_file.gif" alt="File" />
											</c:if>
										</c:if>
									</td>
									<%-- <td>${data.REG_DT}</td> --%>
									<%-- <td class="text-center">${data.WRITER_NM}</td> --%>
									<!-- <td class="text-center">
										<a href="#;" onclick="">
											링크
										</a>
									</td> -->
									<td class="text-center"><span id="rows_hit_cnt_${i}">${data.HIT_CNT}</span></td>
								</tr>
							<c:set var="styles1" value="" />
							<c:choose>
								<c:when test="${i >= 1}"><c:set var="styles1" value="style='display:none'" /></c:when>
							</c:choose>
								<tr id="rows_by_${i}" ${styles1} class="odd">
									<th class="text-center" style="vertical-align: middle;background-color: white;">내용</th>
									<td colspan="4" class="text-left" style="vertical-align: top;">
	
					    				<!-- 내용 -->
				    					<div class='box_area' style='text-align:left;margin-top:10px;margin-bottom:10px;width:98%'>
											<c:if test="${ !empty data.WRITE_CONTENT}">
												<div style="margin-left:10px;margin-top:10px">${fn:replace( data.WRITE_CONTENT,br, "<br/>")}</div>
											</c:if>
											<br/>
				    					</div>
				    					
				    					<!-- 파일 정보 -->
					    				<c:if test="${_param._bbs.FILE_FN_USE_YN eq 'Y'}">
					    					<c:choose>
					    						<c:when test="${data.FILE_CNT > 0}">
							    					<div class='box_area' style='text-align:left;margin-left:3px;margin-top:10px;width:98%;font-weight: bold;'>
														<img src="/images/truck/etc/btn_icon_file.gif" alt="File" /><span class="c" id="file_area_${i}"></span>
							    					</div>
							    					<br/>
					    						</c:when>
					    					</c:choose>
					    				</c:if>
				    					<!-- 버튼 정보 영역 -->
					    				<c:choose>
					    					<c:when test="${ _param._bbs.REPLY_FORM_YN eq 'Y' }">
					    						<div class='box_area' style='text-align:left;margin-left:3px;margin-top:10px;width:98%'>
					    							<a href="javascript:FnSelectFrom('WR','${data.BBS_SEQ}');" data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='plus'>답변</a>
													<c:if test="${data.WRITER_ID eq adminLoginVO.user_id }">
							    						<a href="javascript:FnSelectFrom('E','${data.BBS_SEQ}')"  data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='save' class='btn btn-primary' >수정</a>
							    						<a href="javascript:FnByDeleteBbsInfo('${data.BBS_SEQ}')" data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='save' class='btn btn-primary' >삭제</a>
									    			</c:if>
								    			</div>
					    					</c:when>
					    					<c:otherwise>
					    						<div class='box_area' style='text-align:left;margin-left:3px;margin-top:10px;width:98%'>
													<c:if test="${data.WRITER_ID eq adminLoginVO.user_id }">
							    						<a href="javascript:FnSelectFrom('E','${data.BBS_SEQ}')"  data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='save' class='btn btn-primary '>수정</a>
							    						<a href="javascript:FnByDeleteBbsInfo('${data.BBS_SEQ}')" data-mini='true' data-inline='true'  data-role='button' data-theme='b' data-icon='save' class='btn btn-primary' >삭제</a>
									    			</c:if>
								    			</div>
					    					</c:otherwise>
					    				</c:choose>
									</td>
								</tr>
								<c:set var="row_number" value="${_param._totalCount-(i+( (_param._page-1)*_param._pageSize ))}" />
								<c:set var="i" value="${i+1}" />
							</c:forEach>
						</c:when>
						<c:otherwise>
								<tr>
									<td align="center" colspan="6">
										데이터가 존재하지 않습니다.
									</td>
								</tr>	
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
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
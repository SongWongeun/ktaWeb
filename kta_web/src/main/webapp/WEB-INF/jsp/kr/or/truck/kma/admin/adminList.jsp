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
function FnSetPage(_page){
	$("#_page").val(_page);
	FnList();
}
function FnList(){
	$("form#kta_form").attr("action", "<c:url value='/kma/admin/list.do'/>");
	$("form#kta_form").attr("method", "POST");
	$("form#kta_form").attr("target", "_self");
	$("form#kta_form").submit();
}
function FnSearList(){
	$("#_page").val("1");
	FnList();
}
function FnIPActivity(seq, userId, action){
	var msg = "";
	if(action=="I"){
		msg = "등록 하시겠습니까?";
	}else if(action=="U"){
		msg = "변경 하시겠습니까?";
	}else if(action=="D"){
		msg = "삭제 하시겠습니까?";
	}

	if( !confirm(msg) ){
		return;
	}
	
	var obj = document.getElementsByName("_user_ip");
	for(var i=0; i<obj.length; i++){
		if(i==(seq-1)){
			
			if(obj[i].value==""){
				alert("아이피 정보를 입력 하세요.");
				obj[i].focus();
				return;
			}

			if( !isIp4(obj[i].value) ){
				alert("아이피 형식이 올바르지 않습니다.");
				obj[i].focus();
				return;
			}

			$.ajax({
				async : true
	          , type: 'POST'
	          , url: "<c:url value='/kma/admin/multiAction.do'/>"
	          , dataType : 'json'
	          , data : {
	        	         "_ipInfo" : obj[i].value
                       , "_userId" : userId
                       , "_action" : action
				}
	          , success : function (data) {
				if(data._result == "S"){
					alert("완료되었습니다.");					
					FnBtnCtl(seq, userId, action);
				}else{
					alert(data._message);
				}
			  }, error: function(response, error) {
				  FnAjaxError(response);
			  }
			});
		}
	}
}

function FnBtnCtl(seq, userId, action){
	var obj = document.getElementsByName("_user_ip");
	var msg = "";
	for(var i=0; i<obj.length; i++){
		if(i==(seq-1)){
			
			if(action=="I"){
				msg = "관리자";
			}else if(action=="U"){
				msg = "관리자";
			}else if(action=="D"){
				obj[i].value = "";
				msg = "";
			}
			$("#adm_yn_area_"+seq).html(msg);
			break;
		}
	}
	
	var str = new StringBuffer();
	if(action == "I"){
		//str.append("<div class='ui-btn ui-btn-corner-all ui-shadow ui-btn-up-c' data-theme='c' aria-disabled='false'> ");
		//str.append("	<span class='ui-btn-inner ui-btn-corner-all'> ");
		//str.append("		<span class='ui-btn-text'>변경</span> ");
		//str.append("	</span> ");
		//str.append("	<input class='ui-btn-hidden' type='button' onclick=FnIPActivity('"+seq+"','"+userId+"','U'); value='변경' aria-disabled='false'> ");
		str.append("	<input type='button' onclick=FnIPActivity('"+seq+"','"+userId+"','U'); value='변경' /> ");
		//str.append("</div> ");
		
		//str.append("<div class='ui-btn ui-btn-corner-all ui-shadow ui-btn-up-c' data-theme='c' aria-disabled='false'> ");
		//str.append("	<span class='ui-btn-inner ui-btn-corner-all'> ");
		//str.append("		<span class='ui-btn-text'>삭제</span> ");
		//str.append("	</span> ");
		//str.append("	<input class='ui-btn-hidden' type='button' onclick=FnIPActivity('"+seq+"','"+userId+"','D'); value='삭제' aria-disabled='false'> ");
		str.append("	<input type='button' onclick=FnIPActivity('"+seq+"','"+userId+"','D'); value='삭제' /> ");
		//str.append("</div> ");
	}else if(action == "D"){
		//str.append("<div class='ui-btn ui-btn-corner-all ui-shadow ui-btn-up-c' data-theme='c' aria-disabled='false'> ");
		//str.append("	<span class='ui-btn-inner ui-btn-corner-all'> ");
		//str.append("		<span class='ui-btn-text'>등록</span> ");
		//str.append("	</span> ");
		//str.append("	<input class='ui-btn-hidden' type='button' onclick=FnIPActivity('"+seq+"','"+userId+"','I'); value='등록' aria-disabled='false'> ");
		str.append("	<input type='button' onclick=FnIPActivity('"+seq+"','"+userId+"','I'); value='등록' /> ");
		//str.append("</div> ");
	}else if(action == "U"){
		str.append($("#btn_area_"+seq).html());
	}
	$("#btn_area_"+seq).html(str.toString());
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
						계정관리
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
							사용자 명(아이디)
							<label for="" class="hide">사용자 명</label><input style="font-size: 12px; width: 40%" type="text" onkeypress="FnEnter(event, 'FnSearList');" name="_searField" id="_searField" value="${_param._searField}" />
							<a href="javascript:FnSearList()" class="btn btn-primary btn-sm" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="search">조회</a>
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
							<table class="table table-normal">
							<colgroup>
								<col width="20%">
								<col width="">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr class="no-top">
									<th>아이디</th>
									<th>사용자명</th>
									<th>관리자여부</th>
									<th>아이피</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${!empty _param._list}">
										<c:forEach var="data" items="${_param._list}">
											<tr class="odd">
												<td class="first">${data.USER_ID}</td>
												<td class='text-left'>${data.NAME}</td>
												<td class='text-center'><span id="adm_yn_area_${data.ROW_SEQ}">${data.ADM_YN}</span></td>
												<td>
													<input type="text" name="_user_ip" id="_user_ip" maxlength="15" value="${data.PERMISSION_IP}" style="font-size:12px; width:80%;text-align:center"/>
												</td>
												<td class='text-left'>
													<span id="btn_area_${data.ROW_SEQ}">
														<c:choose>
															<c:when test="${empty data.ADM_YN }">
																<a href="#;" onclick="FnIPActivity('${data.ROW_SEQ}','${data.USER_ID }','I'); return false;" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="save" class="btn btn-primary btn-sm">등록</a>	
															</c:when>
															<c:otherwise>
																<a href="#;" onclick="FnIPActivity('${data.ROW_SEQ}','${data.USER_ID }','U'); return false;" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="check" class="btn btn-primary btn-sm">변경</a>
																<a href="#;" onclick="FnIPActivity('${data.ROW_SEQ}','${data.USER_ID }','D'); return false;" data-role="button" data-inline="true" data-theme="b" data-mini="true" data-icon="delete" class="btn btn-primary btn-sm">삭제</a>
															</c:otherwise>
														</c:choose>
													</span>
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
							<!-- paging s -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
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
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">

<%-- 검색박스 엔터키 설정--%>
$('input[name="searchKeyword"]').on('keydown',function(event){
	if( event.keyCode == 13) {
		
		searchAdminList();
		return false;
	}
});

/*
*카테고리 추가 펑션
*/
function addCtg(){
	var tbody = $("#ctgBody");
    var ctgNm = $("#addCtg").val();
	var cnt = Number($("#cnt").val())+1;
	var cnt2 = Number($("#cnt2").val())+1;
    if( ctgNm == ""){
    	alert("카테고리 명을 입력해주세요.");
    	return false;
    }
    if( cnt2 > 10){
    	alert("카테고리는 최대 10개까지 추가할 수 있습니다.");
        $("#addCtg").val("");
    	return false;
    }
    if( cnt2 == 1){
    	tbody.empty();
    }
	var contents = "<tr id='ctg_"+cnt+"' ><td name='ctg' value='"+ctgNm+"'>"+ctgNm+"</td><td align='right'><i class=\"icon-remove\" onclick=\"removeCtg('ctg_"+cnt+"');\"></td></tr>";
    tbody.append(contents);    
    $("#addCtg").val("");
    $("#cnt").val(cnt);
    $("#cnt2").val(cnt2);
}
/*
*카테고리 제거 펑션
*/
function removeCtg(ctg){
	var obj = document.getElementById(ctg);
	obj.remove();
	var cnt2 = Number($("#cnt2").val())-1;
    $("#cnt2").val(cnt2);
}

/*
*관리자 제거 펑션
*/
function removeAdm(adm){
	var obj = document.getElementById(adm);
	obj.remove();
	var cnt2 = Number($("#Acnt2").val())-1;
    $("#Acnt2").val(cnt2);
}

/*
*관리자 검색
*/
function searchAdminList(){
	var keyword = $("#searchKeyword").val();
	var condition = $("#searchCondition").val();
	var params ={'keyword':keyword,'condition':condition};
	$.ajax({
		url:'/kwa/menuMgr/searchStaffList.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchingList").html(html).css('dispaly','block').trigger('create');
		}
	});
}

/*
*관리자 페이징
*/
function searchAdminListPaging(pageNo){
	var keyword = $("#searchKeyword").val();
	var condition = $("#searchCondition").val();
	var paging = pageNo;
	var params ={'keyword':keyword,'condition':condition,'paging':paging};
	$.ajax({
		url:'/kwa/menuMgr/searchStaffList.do', type:'POST',
		data : params, dataType:'html', timeout: 2000, async:false,
		error: function(html){
			alert("error!"+html);
		},
		success: function(html){
			$("#searchingList").html(html).css('dispaly','block').trigger('create');
		}
	});
}

/*
*관리자 추가 펑션
*/
function inputAdmin(sawonNo,name){
	var tbody = $("#admBody");
	var admNm = name;
	var admNo = sawonNo;
	var cnt = Number($("#Acnt").val())+1;
	var cnt2 = Number($("#Acnt2").val())+1;
    if( cnt2 > 10){
    	alert("관리자는 최대 10명까지 추가할 수 있습니다.");
    	return false;
    }
    if( cnt2 == 1){
    	tbody.empty();
    }
	var contents = "<tr id='adm_"+cnt+"' ><td align='right'>이름:</td><td name='admNm'>"+admNm+"</td><td align='right'>사원번호:</td><td name='admNo' align='left'>"+admNo+"</td><td align='right'><i class=\"icon-remove\" onclick=\"removeAdm('adm_"+cnt+"');\"></td></tr>";
    tbody.append(contents);    
    $("#Acnt").val(cnt);
    $("#Acnt2").val(cnt2);
    $("#searchingList").empty();
    $("#searchKeyword").val("");
	$('#adminSearch').modal('hide');
}

/*
*메뉴 수정 실행
*/
function modifyBasicBoard(){
	var ctglength = document.getElementsByName('ctg').length;
	var category = "";
	for(var i=0;i<ctglength;i++){
		 var value = document.getElementsByName('ctg')[i].innerHTML;
		 category += value+",";
	}
	var admlength = document.getElementsByName('admNo').length;
	var adminList = "";
	for(var i=0;i<admlength;i++){
		 var value = document.getElementsByName('admNo')[i].innerHTML;
		 var value2 = document.getElementsByName('admNm')[i].innerHTML;
		 adminList += value+"_"+value2+",";
	}
	
	document.boardForm.adminList.value = adminList;
	document.boardForm.category.value = category;
	document.boardForm.action="<c:out value='/kwa/menuMgr/actMenuBasicModify.do'/>";
	document.boardForm.submit();	
	alert("게시판이 수정되었습니다.");
}


function backtoIndex(){
	document.boardForm.action = "<c:url value='/kwa/menuMgr/menulist.do'/>";
   	document.boardForm.submit();
}

</script>

</head>
<body>
<!-- header s -->
	<c:import url="/kwa/common/header.do"></c:import>
<!--// header e -->
<!-- left s -->
	<c:import url="/kwa/common/left.do"></c:import>
<!--// left e -->

<div class="main-content">
		<form:form commandName="menuVO" name="boardForm" >
		<form:input type="hidden" id="menu_no"  path="menu_no" value="${resultMap.HP_MENU_NO}"/>
		<form:input type="hidden" id="menu_desc"  path="menu_desc" value="${resultMap.MENU_DESC}"/>
		<input type="hidden" id="cnt" value="${ctgSize}"/>
		<input type="hidden" id="cnt2" value="${ctgSize}"/>
		<input type="hidden" id="Acnt" value="${authSize}"/>
		<input type="hidden" id="Acnt2" value="${authSize}"/>

		<div class="container">
			<div class="row">
				<div class="area-top clearfix">
					<div class="pull-left header">
						<h3 class="title">${resultMap.MENU_NM} 카테고리/담당자 관리페이지리</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="box-content">
			<form class="fill-up">
				<div class="row box-section">	
					<div class="col-lg-6">
						<div class="panel panel-info">
						  <div class="panel-heading">카테고리</div>
						  <div class="panel-body">
						    <table class="table" id="ctgTbl" class="table table-hover">
								<tbody id="ctgBody">
								<c:if test="${not empty ctgList }">
									<c:forEach items="${ctgList}" var="ctg"varStatus="status" >
									<tr id="ctg_${status.index +1}">
									<td name="ctg">${ctg.CATEGORY_NM}</td>
									<td align='right'><i class="icon-remove" onclick="removeCtg('ctg_${status.index +1}')"></td>
									</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty ctgList }">
									<tr>
									<td>등록된 카테고리가 없습니다.</td>
									</tr>
								</c:if>
								</tbody>
							</table>
						  </div>
						</div>
						<form:input type="hidden" id="category" path ="category" value=""/>
						<input type="text" id="addCtg" name="addCtg"  placeholder="카테고리명">
						<a id="addCategory" class="btn btn-blue" href="#;" onclick="addCtg();" >카테고리 추가</a>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-info">
						  <div class="panel-heading">담당자</div>
						  <div class="panel-body">
						    <table class="table" id="admTbl" class="table table-hover">
								<tbody id="admBody">
									<c:if test="${not empty authList }">
									<c:forEach items="${authList}" var="adm"  varStatus="status" >
										<tr id="adm_${status.index  +1}">
										<td align="left">이름:</td>
										<td name="admNm" align="left">${adm.AUTH_NAME}</td>
										<td align="right">사원번호:</td>
										<td name="admNo">${adm.AUTH_ID}</td>
										<td align='right'><i class="icon-remove" onclick="removeAdm('adm_${status.index  +1}')"></td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${empty authList }">
										<tr>
										<td>등록된 담당자가 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						  	</div>
						</div>
						<form:input type="hidden" id="adminList" path ="adminList" value=""/>
						<a id="searchAdmin" class="btn btn-blue" data-toggle="modal" href="#adminSearch">직원 검색</a>
					</div>
				</div>	
				<div class="row box-section">	
					<div class="col-lg-12">
						<div class="col-md-12" >
							<p align="right" style="margin-left:20px;">
								<a id="addMenu" class="btn btn-blue" href="#;" onclick="modifyBasicBoard();">메뉴 수정</a>
								<a id="addMenu" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
							</p>
						</div>
					</div>
				</div>	
				</form>
			</div>
			</form:form>
		</div>
	<div id="adminSearch" class="modal fade" data-replace="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    <div class="modal-content">
			<div class="modal-header">
			  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			  <h4 class="modal-title">직원 검색</h4>
			</div>
			<div class="modal-body">
			<div class="box-content">
				<input type="text" name="searchKeyword"  id="searchKeyword" class="search" placeholder="Search"/>
				<select name="searchCondition"  id="searchCondition" class="btn btn-default btn-sm">
				<li class=""><span class="title"><option value="1" label="사원번호"/></span></li>
				<li class=""><span class="title"><option value="2" label="이름" selected="selected"/></span></li>
				</select>
				<a id="searchBtn" class="btn btn-blue"  href="#;" onclick="searchAdminList();"> 검색</a>
			</div>
			<div id="searchingList">
			</div>
			</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	     	</div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div>
</body>
</html>
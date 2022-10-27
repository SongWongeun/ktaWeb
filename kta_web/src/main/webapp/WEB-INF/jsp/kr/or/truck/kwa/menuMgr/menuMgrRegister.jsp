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
*메뉴 추가 실행
*/
function addBoard(){
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
	
	if($('input[name="fileYn"]:checked').val() == '0'){
		var fileSize = $('input[name="file_size"]').val();
		if(fileSize == ""){
			alert("파일첨부 제한용량을 설정하여 주십시오.");
			return false;
		}else if(isNaN(fileSize)){
			alert("첨부제한용량은 숫자로만 입력해주세요");
			return false;
		}		
	}
	
	if($('input[name="boardForm"]:checked').val() == undefined){
		alert("게시판 형태를 선택해주십시오");
		return false;
	}
	
	document.boardForm.adminList.value = adminList;
	document.boardForm.category.value = category;
	document.boardForm.action="<c:out value='/kwa/menuMgr/actMenuAdd.do'/>";
	document.boardForm.submit();	
	alert("게시판이 추가되었습니다.");
}


//파일 첨부 활성화
function checkFileYn(){
	if(document.boardForm.fileYn.checked==true){
		document.boardForm.file_size.disabled=false;
	}else{
		document.boardForm.file_size.value="";
		document.boardForm.file_size.disabled=true;
	}
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
		<form:input type="hidden" id="menu_no"  path="menu_no" value="${resultMap.NEWMENUNO}"/>
		<form:input type="hidden" id="menu_desc"  path="menu_desc" value="${resultMap.MENU_DESC}"/>
		<input type="hidden" id="cnt" value="0"/>
		<input type="hidden" id="cnt2" value="0"/>
		<input type="hidden" id="Acnt" value="0"/>
		<input type="hidden" id="Acnt2" value="0"/>
		<div class="row">
			<div class="col-md-12" >
				<div class="box">
					<div class="box-header">
						<span class="title">메뉴 추가페이지</span>
							<ul class="box-toolbar">
							<li>
							
							</li>
						</ul>
					</div>
					<div class="box-content">
						<div class="row">
							<div class="col-lg-6">
								<ul class="padded separate-sections">
									<div class="input-group addon-left">
									<span class="input-group-addon" href="#;">
									  <i class="icon-tag"></i>
									</span>
									  <form:input type="text" id="board_nm" path ="board_nm" placeholder="메뉴명" />
									</div>
								</ul>	
								<ul class="padded separate-sections">
									<div class="input-group addon-left">
									<span class="input-group-addon" href="#;">
									  <i class="icon-tag"></i>
									</span>
									  <input type="text" id="desc" name ="desc" placeholder="메뉴위치" value="${resultMap.MENU_DESC}" disabled="true"/>
									</div>
								</ul>	
								<ul class="padded separate-sections">
									<div class="input-group addon-left">
									<span class="input-group-addon" href="#;">
									  <i class="icon-tag"></i>
									</span>
										<form:input id="file_size" path ="file_size" placeholder="파일첨부제한 용량(KB)" disabled="true" />
									</div>
									<span>
						        	<input type="checkbox" class=""  id="fileYn" name="fileYn" value="0" onclick="checkFileYn()"/>
									<label for="icheck1">첨부파일 사용여부</label>
									</span>
								</ul>	
								<%-- <ul class="padded separate-sections">
								<span class="input-group addon-left" href="#;">
									  <i class="icon-tag"><label>관리자 전용여부</label></i>
								</span>
								<span>
						        	 <form:checkbox class="icheck" id="adminOnly" path="adminOnly" value="Y" />
                  				     <label for="icheck1">관리자 전용시 체크</label>&nbsp;&nbsp;&nbsp;
								</span> --%>
						        	 <form:hidden id="adminOnly" path="adminOnly" value="Y" />
								</ul>	
								<ul class="padded separate-sections">
								<span class="input-group addon-left" href="#;">
									  <i class="icon-tag"><label>화면 형태</label></i>
								</span>
								<span>
						        	 <form:radiobutton class="icheck"  path="boardForm" id="board" value="board"/>
                  				     <label for="board">게시판</label>&nbsp;&nbsp;&nbsp;
						        	 <form:radiobutton class="icheck"  path="boardForm" id="gallery" value="gallery"/>
                  				     <label for="gallery">갤러리</label>&nbsp;&nbsp;&nbsp;
						        	 <form:radiobutton class="icheck"  path="boardForm" id="gallery_board" value="gallery_board"/>
                  				     <label for="boardGallery">게시판+갤러리</label>
								</span>
								</ul>		
							</div>
							<div class="col-lg-3">
								<ul class="padded separate-sections">
									<div class="box">
									<div class="box-header"><span class="title">카테고리</span></div>
									<div class="box-content">			
										<table cellpadding="0" cellspacing="0" border="0" class="table" id="ctgTbl">
										<tbody id="ctgBody">
											<tr>
											<td>등록된 카테고리가 없습니다.</td>
											</tr>
											</tbody>
										</table>
									</div>
									<div class="table-footer">
										<div class="dataTables_info"></div>
									</div>
									</div>
									</span>
									  <form:input type="hidden" id="category" path ="category" value=""/>
									  <input type="text" id="addCtg" name="addCtg"  placeholder="카테고리명">
									  <a id="addCategory" class="btn btn-blue" href="#;" onclick="addCtg();" >카테고리 추가</a>
									</span>
								</ul>	
							</div>
							
							<div class="col-lg-3">
								<ul class="padded separate-sections">
									<div class="box">
									<div class="box-header"><span class="title">담당자</span></div>
									<div class="box-content">			
										<table cellpadding="0" cellspacing="0" border="0" class="table" id="admTbl">
											<tbody id="admBody">
											<tr>
											<td>지정된 관리자가 없습니다.</td>
											</tr>
											</tbody>
										</table>
									</div>
									<div class="table-footer">
										<div class="dataTables_info"></div>
									</div>
									</div>
									</span>
										<form:input type="hidden" id="adminList" path ="adminList" value=""/>
										<a id="searchAdmin" class="btn btn-blue" data-toggle="modal" href="#adminSearch">직원 검색</a>
									</span>
								</ul>	
							</div>
						</div>
					</div>
				</div>
				<ul class="padded separate-sections">
					<li align="right">
					  <a id="back" class="btn btn-blue" href="#;" onclick="backtoIndex();">목록</a>
					  <a id="addMenu" class="btn btn-blue" href="#;" onclick="addBoard()">메뉴 추가</a>
					</li>
				</ul>
			</div>
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
				<li class=""><span class="title"><option value="1" label="사원번호" /></span></li>
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
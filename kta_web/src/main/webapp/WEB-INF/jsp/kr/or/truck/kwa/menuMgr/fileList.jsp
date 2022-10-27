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
<style type="text/css">
html, body{font-family: 'NanumGothic','나눔고딕', 돋움, Dotum, Arial, tahoma, sans-serif;}
</style>
<script type="text/javascript">

function changeBoardList(boardNo){
	document.boardForm.pageIndex.value ="1";
	document.boardForm.bmstNo.value=boardNo;
	document.boardForm.action = "<c:url value='/kwa/menuMgr/fileList.do'/>";
   	document.boardForm.submit();
}
function searchPaging(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/kwa/menuMgr/fileList.do'/>";
   	document.boardForm.submit();
}

function searchList(){
	document.boardForm.pageIndex.value = "1";
	document.boardForm.action = "<c:url value='/kwa/menuMgr/fileList.do'/>";
   	document.boardForm.submit();
}

function addFile(){
	document.boardForm.file_up.value='';
	document.boardForm.action= "<c:url value='/kwa/menuMgr/fileAdd.do'/>";
   	document.boardForm.submit();
}
function deleteFile(fileId,fileNo){
	
	if(!confirm("정말 파일을 삭제하시겠습니까? 지금즉시 삭제됩니다.")){
		return false;
	}
	document.boardForm.atchFileId = fileId;
	document.boardForm.file_sn = fileNo;
	document.boardForm.action="<c:url value='/kwa/menuMgr/deleteFileInfs.do?fileId="+fileId+"&fileSn="+fileNo+"'/>";
	document.boardForm.submit();
}

/* function fileView(id, sn){
	document.boardForm.action='/kwa/menuMgr/fileView.do?atchFileId='+fileId+'&fileSn='+fileNo;
	document.boardForm.submit();
}
 */
function modifyFiles(id,sn,title,desc){
	document.boardForm.atchFileId.value=id;
	document.boardForm.file_sn.value=sn;
	document.boardForm.file_title_up.value=title;
	document.boardForm.file_desc_up.value=desc;
	
}
function modifyFileAction(){
	document.boardForm.file.value='';
	document.boardForm.action='/kwa/menuMgr/updateFileInfs.do';
	document.boardForm.submit();	
}

function fileModify(boardNo, fileId){
	
	document.boardForm.action = "<c:url value='/kwa/contentMgr/contentsModifyFile.do?boardNo="+boardNo+"&fileId="+fileId+"'/>";
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
	<form:form commandName="searchVO" name="boardForm" method="post"  enctype="multipart/form-data">
	<input type="hidden" name="bmstNo" id="bmstNo" value="${boardNo}"/>
	<input type="hidden" name="articleNo" id="articleNo" />
	<div class="container">
		<div class="row">
			<div class="area-top clearfix">
        		<div class="pull-left header">
					<h3 class="title" >
						파일관리
					</h3>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="col-md-12" >
			<div class="panel panel-primary">
 				<div class="panel-heading">홈페이지 파일 관리</div>
				<%-- <div class="row box-section">
					<div class="col-md-2" >게시판 선택</div>
					<div class="col-md-10">
					<select class="chzn-select" name="boardList" onchange="changeBoardList(boardList.options[this.selectedIndex].value)">
						<option value="0">선택하세요</option>
						<c:forEach items="${boardList}" var="board">
							<option value="${board.HP_BOARD_MASTER_NO}" <c:if test="${board.HP_BOARD_MASTER_NO eq boardNo}">selected="selected"</c:if>>${board.BOARD_NM }</option>
						</c:forEach>
					</select>
					</div>
				</div>	 --%>
					<table class="table table-condensed" >
							<colgroup>
								<col style="width:8%;" />
								<col style="width:8%;" />
								<%-- <col style="width:3%;" />
								<col style="width:5%;" /> --%>
								<col style="width:14%;" />
								<col style="width:10%;" />
								<col style="width:40%;" />
								<col style="width:15%;" />
								<col style="width:3%;" />
								<col style="width:3%;" />
								<col style="width:3%;" />
							</colgroup>
							<thead>
							<tr>
								<th><div>글번호</div></th>
								<th><div>파일ID</div></th>
								<!-- <th><div>순번</div></th>
								<th><div>생성일</div></th> -->
								<th><div>제목</div></th>
								<th><div>파일명</div></th>
								<th><div>링크</div></th>
								<th><div>사용메뉴</div></th>
								<th colspan="3"><div>파일관리</div></th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${not empty resultList}">
							<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr style="cursor:default !important;">
								<td><c:out value="${paginationInfo.totalRecordCount - paginationInfo.firstRecordIndex - status.index }"/></td>
								<td>${result.ATCH_FILE_ID}</td>
								<%-- <td>${result.FILE_SN}</td>
								<td>${result.CREAT_DT}</td> --%>
								<td>${result.FILE_TITLE}</td>
								<td>${result.ORIGNL_FILE_NM}</td> 
								<td>${result.LINK}</td>
								<td>${result.MENU_NM}</td>
								<td><a href="${result.LINK}"  class="btn btn-blue">다운</a></td>
								<c:if test="${not empty result.HP_BOARD_MASTER_NO}">
									<td></td>
									<td><a href="#;" onclick="fileModify('${result.HP_BOARD_MASTER_NO}','${result.ATCH_FILE_ID}');"  class="btn btn-blue btn-sm"  data-toggle="modal">상세/수정</a></td>
								</c:if>
								<c:if test="${empty result.HP_BOARD_MASTER_NO }">
									<td><a href="#;" onclick="deleteFile('${result.ATCH_FILE_ID}','${result.FILE_SN}')"  class="btn btn-danger btn-sm">삭제</a></td>
									<td><a href="#modifyFiles" onclick="modifyFiles('${result.ATCH_FILE_ID}','${result.FILE_SN}','${result.FILE_TITLE}','${result.FILE_DESC}');"  class="btn btn-blue btn-sm"  data-toggle="modal">파일 변경</a></td>
								</c:if>
							</tr>				
							</c:forEach>	
							</c:if>
							<c:if test="${empty resultList }">
							<tr>
								<td colspan="6">검색결과가 없습니다.</td>
							</tr>
							</c:if>						
							</tbody>
						</table>
					<!-- paging s -->
					<p align="right" style="margin-right:6px"><a id="add" class="btn btn-blue btn-sm" href="#addFiles" data-toggle="modal">파일 추가</a></p> 
						<div class="text-center">
						<ul class="pagination pagination-sm">
							<ui:pagination paginationInfo = "${paginationInfo}" type="bootStrap" jsFunction="searchPaging" />
						</ul>
					</div>						
					<p align="center">
					<form:input type="hidden" id="pageIndex" path="pageIndex" />
						<form:select path="searchCondition" class="btn btn-default btn-sm">검색 유형
							<li class=""><span class="title"><form:option value="0" label="메뉴"/></span></li>
							<li class=""><span class="title"><form:option value="1" label="파일명"/></span></li>
						</form:select>
						<form:input type="text" path="searchWord" class="search-query animated" placeholder="Search"></form:input>
					  	<a id="back" class="btn btn-primary btn-sm" onclick="searchList()" href="#;">검색</a>
					</p>
				</div>
			</div>
		</div>
		<div id="addFiles" class="modal fade" data-replace="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="panel panel-primary">
			    <div class="panel-heading">파일추가</div>
					<div class="row box-section">
						<div class="col-md-2" >파일제목</div>
						<div class="col-md-10">
						<form:input path="file_title" id="file_title" class="form-control"/>
						</div>
						<div class="col-md-2" >파일내용</div>
						<div class="col-md-10">
						<form:input path="file_desc" id="file_desc" class="form-control"/>
						</div>
						<div class="col-md-2" >파입업로드</div>
						<div class="col-md-10">
						<input name="file" id="file" type="file" title="IMAGE" placeholder="IMAGE" class="form-control"/>
						</div>
					</div>				
					<div class="row box-section">
						<div class="col-md-10" ></div>
						<div class="col-md-2">
				  			<a id="add" class="btn btn-blue" href="#;" onclick="addFile();">파일 추가</a>	  
				 	</div>
			    </div>
				</div><!-- /.modal-dialog -->
			</div>
		</div>
		<div id="modifyFiles" class="modal fade" data-replace="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="panel panel-primary">
			    <div class="panel-heading">파일추가</div>
					<div class="row box-section">
						<div class="col-md-2" >파일제목</div>
						<div class="col-md-10">
						<input name="file_title_up" id="file_title_up" class="form-control"/>
						</div>
						<div class="col-md-2" >파일내용</div>
						<div class="col-md-10">
						<input name="file_desc_up" id="file_desc_up"class="form-control"/>
						</div>
						<div class="col-md-2" >파입업로드</div>
						<div class="col-md-10">
						<input name="file_up" id="file_up" type="file" title="IMAGE" placeholder="IMAGE" class="form-control"/>
						<input type="hidden" id="atchFileId" name="atchFileId"/>
						<input type="hidden" id="file_sn" name="file_sn"/>
						</div>
					</div>				
					<div class="row box-section">
						<div class="col-md-10" ></div>
						<div class="col-md-2">
				  			<a id="add" class="btn btn-blue" href="#;" onclick="modifyFileAction();">파일 수정</a>	  
				 	</div>
			    </div>
				</div><!-- /.modal-dialog -->
			</div>
		</div> 
	</form:form>
</div>
</body>
</html>
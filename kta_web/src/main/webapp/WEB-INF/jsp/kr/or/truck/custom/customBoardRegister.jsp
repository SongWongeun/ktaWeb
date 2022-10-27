<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:set var="registerFlag" value="${empty BoardVO.articleNo ? '등록' : '수정'}"/>
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){

});



function listCustomBoard(){
   	document.boardForm.action = "<c:url value='/customboard/list.do'/>";
   	document.boardForm.submit();		
}

function saveCustomBoard(){
	if(document.boardForm.title.value == ""){
		alert("제목을 입력해주십시오");
		return false;
	}
	if(document.boardForm.contentHtml.value == ""){
		alert("내용을 입력해주십시오");
		return false;
	}
   	document.boardForm.action = "<c:url value='/customboard/registBoard.do'/>";
   	document.boardForm.submit();		
}

function modifyCustomBoard(){
	if(document.boardForm.title.value.trim() == ""){
		alert("제목을 입력해주십시오");
		return false;
	}
	if(document.boardForm.contentHtml.value.trim() == ""){
		alert("내용을 입력해주십시오");
		return false;
	}
   	document.boardForm.action = "<c:url value='/customBoard/modifyBoard.do'/>";
   	document.boardForm.submit();			
}
function checkFileSize(path){
	var maxSize ='${fileSize}';
	var filesize;
	if(path.files.length == 0){
		return;
	}else{
		filesize = path.files[0].size;	
	}
	filesize = filesize/1024;
   	if(filesize > maxSize){
		alert("첨부파일은 ["+maxSize+"KB]이하만 업로드 가능합니다.");
		$(path).val("");
		return;
   	}
}
</script>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2>customBoard</h2> 
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="#;" >#</a>
						<span>#</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
				<form:form commandName="boardVO" name="boardForm" id="boardForm" enctype="multipart/form-data" action="">
				<fieldset>
				<legend>사용자정의 게시판 게시글 등록</legend>
				<form:hidden path="boardNo"/>
				<form:hidden path="articleNo"/>
					<div class="conSection">
						<!-- table writing s -->
						<div class="bbsView1">
							<!-- 테이블 타이틀 s -->
							<div class="tbtitBox">
								<dl>
									<dt><span class="mustHave">제목</span></dt>
									<dd><form:input type="text" value="" path="title" title="클린센터제목" style="width:773px;" class="inputSt01" maxlength="100"/><label for=title class="hide">제목</label></dd>
								</dl>
							<c:if test="${not empty ctgList }">
								<dl>
									<dt><span>구분</span></dt>
									<dd>										
				 					   	<form:select path="category" class="btn btn-default btn-sm">
											<c:forEach items="${ctgList}" var="ctg">
											<form:option value="${ctg.CATEGORY_ID}">${ctg.CATEGORY_NM}</form:option>
				 					   		</c:forEach>
										</form:select>
									</dd>
								</dl>
							</c:if>
							</div><!--// 테이블 타이틀 e -->
							<!-- 테이블 s -->
							<table class="tbView_st02" summary="칭찬하기등록게시판 연락처,내용">
								<caption>칭찬하기 등록 게시판</caption>
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>									
									
									<tr>
										<th scope="row"><span class="mustHave">내용</span></th>
										<td>
										<form:textarea path="contentHtml" style="height:250px"></form:textarea>
										</td>
									</tr>
									<c:if test="${fileNo > 0 }">
									<tr>
										<th scope="row"><span>첨부파일</span></th>
										<td>
										<c:if test="${not empty boardVO.atchFileId}">
											<c:import url="/com/atch/selectFileInfsForUpdate.do" charEncoding="utf-8">
											<c:param name="param_atchFileId" value="${boardVO.atchFileId}" />
											</c:import>
							 			</c:if> 
							 			<c:if test="${empty boardVO.atchFileId}">
							 				<c:forEach var="cnt" begin="1" end="${fileNo}" >
												<input name="file_${cnt}" id="file_${cnt}" type="file" title="첨부파일입력" onchange="checkFileSize(file_${cnt});"/><label for="file" class="hide">첨부파일입력</label>
							 				</c:forEach>
							 			</c:if> 
										</td>
									</tr>
									</c:if>
								</tbody>
							</table><!--// 테이블 e -->							
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<c:if test="${empty boardVO.articleNo}">
									<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="saveCustomBoard(); return false;">등록완료</a></span>
									<span class="btn_pack btn_type10 icon"><span class="cancel"></span><a href="#;" onclick="listCustomBoard();">등록취소</a></span>
								</c:if>
								<c:if test="${not empty boardVO.articleNo }">
									<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="modifyCustomBoard(); return false;">수정완료</a></span>
									<span class="btn_pack btn_type10 icon"><span class="cancel"></span><a href="#;" onclick="listCustomBoard();">수정취소</a></span>
								</c:if>								
								<!-- <span class="btn_pack btn_type02"><a href="javascript:clearFile(obj);">다시쓰기</a></span> -->
							</div>
						</div>
						<!--// table writing e -->
					</div>
					</fieldset>
					</form:form>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
 </body>
</html>
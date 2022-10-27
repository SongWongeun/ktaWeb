<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 삭제 function */
function deleteBoard(no){
	if(confirm("삭제하겠습니까?")){
	document.boardForm.articleNo.value = no;
	document.boardForm.action = "<c:url value='/customer/inquiry/deleteArticle.do'/>";
	document.boardForm.submit();
	}else return;
}
/* 글 수정 화면 function */
function updateBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/customer/inquiry/viewUpdateBoard.do'/>";
   	document.boardForm.submit();		
}
/* 글 목록 화면 function */
function listOaoBoard() {
   	document.boardForm.action = "<c:url value='/customer/inquiry/oaoInquiryList.do'/>";
   	document.boardForm.submit();
}
</script>
<script type="text/javascript" src="/namo/js/namo_scripteditor.js"></script>
</head>
<%-- 
	http://192.1.51.242:8080/customer/inquiry/oaoResultIndex.do?articleNo=INQUIRY_0000000071  
--%>
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
 						<h2><img src="/images/truck/cust/result_tit.gif" alt="문의결과확인" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/customer/qnaInfo.do" >고객문의</a>
						<span>문의결과확인</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>1:1문의</legend>
					<input name="articleNo" type="hidden" />
					<form:input path="searchKeyword" type="hidden"/>
					<form:input path="searchCondition" type="hidden"/>
					<p class="confirTit"><img src="/images/truck/cust/result_con_tit.gif" alt="고객님의 문의내용에 대한 문의 결과 입니다 추가 문의가 필요하신 분께서는 1:1문의로 재 문의해 주세요" /></p>
					<div class="conSection">
						<!-- table view s -->
						<div class="bbsView1">
							<!-- 테이블 타이틀 s -->
							<div class="tbtitBox">
								<dl>
									<dt><span>상담제목</span></dt>
									<dd><c:out value="${resultBoard.title}"/></dd>
								</dl>
							</div><!--// 테이블 타이틀 e -->
							<!-- 테이블 s -->
							<table class="tbView_st02" summary="문의내용,답변내용 확인 게시판입니다.">
								<caption>문의결과확인상세보기 게시판입니다.</caption>
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_q.gif" alt="문의내용아이콘" /></p><p class="type02">문의내용</p></th>
										<td>${resultBoard.contentHtml}</td>
									</tr>
									<c:if test="${resultBoard.replyAt eq 'Y'}">
									<tr>
										<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_a.gif" alt="답변내용아이콘" /></p><p class="type02">답변내용</p></th>
										<td>${resultBoard.replyContentHtml}</td>
									</tr>
									</c:if>
									<c:if test="${resultBoard.replyAt eq 'N'}">
									<tr>
										<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_a.gif" alt="답변내용아이콘" /></p><p class="type02">답변내용</p></th>
										<td>아직 답변이 등록되지 않았습니다.</td>
									</tr>
									</c:if>
								</tbody>
							</table><!--// 테이블 e -->
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="listOaoBoard(); return false;">목록</a></span>
							</div>
						</div>
						<!--// table view e -->
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

<%-- <form:form commandName="inquiryBoardVO" name="detailForm" method="post">
<input type="hidden" name="articleNo"/>
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li>글내용 조회</li>
		</ul>
	</div>	
	<div>	
	번호 : ${resultBoardArticle.articleNo}<br>
	작성자 이름 : ${resultBoardArticle.writerName}<br>			
	제목 : ${resultBoardArticle.title}<br>
	내용 : ${resultBoardArticle.contentHtml}<br>
	내용(text) : ${resultBoardArticle.contentText}<br>
	조회수 : ${resultBoardArticle.rdCount}<br>
	작성시간 :${resultBoardArticle.createTime}<br>
	작성자아이디:${resultBoardArticle.writerId}<br>
	작성자이름:${resultBoardArticle.writerName}<br>
	수정자아이디:${resultBoardArticle.modifyId}<br>
	수정자이름:${resultBoardArticle.modifyName}<br>
	수정시간:${resultBoardArticle.modifyTime}<br>
	
	문의분야 : ${resultBoardArticle.category}<br>
	연락처 : ${resultBoardArticle.phone}<br>
	이메일 : ${resultBoardArticle.email}<br>
	
	첨부파일 :
	<c:if test="${!empty resultBoardArticle.atchFileId}">
	<tr>
		<c:if test="${not empty resultBoardArticle.atchFileId}">
			<c:import url="/com/atch/selectFileInfs.do" charEncoding="utf-8">
				<c:param name="param_atchFileId" value="${resultBoardArticle.atchFileId}" />
			</c:import>
 		</c:if> 	
	</tr>
</c:if>
<br>
파일아이디:${resultBoardArticle.atchFileId}<br>
파일이름:${resultBoardArticle.atchFileName}<br>
페이지 인덱스:${searchVO.pageIndex}<br>
사용여부 : ${resultBoardArticle.useAt}<br><br>
  </div>
  <div>
	<a href="/customer/inquiry/oaoInquiryIndex.do">고객문의 메인</a><br>
	<a href="/customer/inquiry/oaoInquiryList.do">목록보기</a><br>
	<a href="javascript:updateBoard('<c:out value="${resultBoardArticle.articleNo}"/>')">수정하기</a><br>
	<a href="javascript:deleteBoard('<c:out value='${resultBoardArticle.articleNo}'/>')">글 삭제</a>
</div>
</div>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form> --%>


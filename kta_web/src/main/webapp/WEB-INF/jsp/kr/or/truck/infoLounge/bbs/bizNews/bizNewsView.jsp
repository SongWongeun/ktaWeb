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
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
/* 글 수정 화면 function */
function updateBizBoard(no) {
	document.boardForm.articleNo.value=no;
   	document.boardForm.action = "<c:url value='/kwa/infoLounge/bizNewsUpdate.do'/>";
   	document.boardForm.submit();		
}
/* 글 목록 화면 function */
function listBizBoard() {
	document.boardForm.action = "<c:url value='/infoLounge/bizNewsIndex.do'/>";
   	document.boardForm.submit();
}
/* 글 삭제 화면 function */
function deleteBizBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/infoLounge/bizNewsDelete.do'/>";
   	document.boardForm.submit();		
}
/* 이전/다음글 보기 화면 function */
function viewPreNexArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/infoLounge/bizNewsView.do'/>";
   	document.boardForm.submit();		
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
						<h2><img src="/images/truck/info/biznews_tit.gif" alt="업계소식" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<a href="/infoLounge/bizNewsIndex.do" >업계소식</a>
						<span>업계소식</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea bizBg">
					<div class="infoContit01"><p class="hide">동종업계소식입니다. 보다 신속하고, 정확한 정보로 보답해 드리겠습니다.</p></div>
					<!-- font s -->
					<div class="font">
               			<h3 class="hide">글자크기 조절</h2>
                		<span><img src="/images/truck/btn/btn_font_tit.gif" alt="글자크기" /></span>
                		<button type="button" class="btn_zoom1" title="글자 키우기" onclick="Field.zoomIn();return false;" onkeypress="Field.zoomIn();return false;">글자 키우기</button>
                		<button type="button" class="btn_zoom2" title="기본 사이즈" onkeypress="Field.zoom100(100);" onclick="Field.zoom100(100);return false;">기본 사이즈</button>
                		<button type="button" class="btn_zoom3" title="글자 줄이기" onclick="Field.zoomOut();return false;" onkeypress="Field.zoomOut();">글자 줄이기</button>
                	</div><!--// font e -->
					<div class="conSection">
						<form:form commandName="searchVO" name="boardForm" method="post" action="">						
						<fieldset>
						<legend>업계소식 view</legend> 
						<input type="hidden" name="articleNo" />
						<form:input path="searchCondition" type="hidden"/>
						<form:input path="searchKeyword" type="hidden"/>
						<!-- table view s -->
						<div class="bbsView1">
							<table class="tbView_st01" summary="제목,작성일,본문내용을 순서로 나타낸 게시물 입니다.">
								<caption>업계소식 읽기게시판</caption>
								<colgroup>
									<col style="width:11%;" />
									<col style="width:70%;" />
									<col style="width:8%;" />
									<col style="width:11%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">제목</th>
										<td><c:out value="${resultBoard.title}"/></th>
										<th scope="col">작성일</th>
										<td><c:out value="${fn:substring(resultBoard.createTime, 0, 11)}"/></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4" class="subject">
											${resultBoard.contentHtml}
										</td>
									</tr>
								</tbody>
							</table>
							<!-- 이전글, 다음글 s -->						
							<div class="nextprevBox">
								<dl>
								<c:choose>
									<c:when test="${empty preArticle.articleNo}">
										<dt class="btn_prev lineFrist">이전글</dt>
										<dd class="lineFrist"><c:out value="${preArticle.title }"/></dd>
										<dt class="btn_next lineLast">다음글</dt>
										<dd class="lineLast"><a href="#;" onclick="viewPreNexArticle('<c:out value="${nextArticle.articleNo}"/>')"><c:out value="${nextArticle.title}"/></a></dd>
									</c:when>
									<c:when test="${empty nextArticle.articleNo}">
										<dt class="btn_prev lineFrist">이전글</dt>
										<dd class="lineFrist"><a href="#;" onclick="viewPreNexArticle('<c:out value="${preArticle.articleNo}"/>')"><c:out value="${preArticle.title }"/></a></dd>
										<dt class="btn_next lineLast">다음글</dt>
										<dd class="lineLast"><c:out value="${nextArticle.title}"/></dd>
									</c:when>
									<c:otherwise>
										<dt class="btn_prev lineFrist">이전글</dt>
										<dd class="lineFrist"><a href="#;" onclick="viewPreNexArticle('<c:out value="${preArticle.articleNo}"/>')"><c:out value="${preArticle.title }"/></a></dd>
										<dt class="btn_next lineLast">다음글</dt>
										<dd class="lineLast"><a href="#;" onclick="viewPreNexArticle('<c:out value="${nextArticle.articleNo}"/>')"><c:out value="${nextArticle.title}"/></a></dd>
									</c:otherwise>
								</c:choose>
								</dl>
							</div><!--// 이전글, 다음글 e -->
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="listBizBoard()">목록</a></span>
							</div>
						</div>
						</fieldset>
						</form:form>
						<!--// table view e -->
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->


<%-- 
<form:form commandName="bizBoardVO" name="boardForm" method="post">
게시판아이디:${resultBoard.bbsId}<br>
게시물번호:${resultBoard.articleNo}<br>
제목:${resultBoard.title}<br>
내용:${resultBoard.contentHtml}<br>
검색용내용${resultBoard.contentText}<br>
생성시간:${resultBoard.createTime}<br>
조회수:${resultBoard.rdcount}<br>
생성자아이디:${resultBoard.writerId}<br>
생성자이름:${resultBoard.writerName}<br>
수정자아이디:${resultBoard.modifyId}<br>
수정자이름:${resultBoard.modifyName}<br>
수정시간:${resultBoard.modifyTime}<br>
첨부파일 :
<c:if test="${!empty resultBoard.atchFileId}">
	<tr>
		<c:if test="${not empty resultBoard.atchFileId}">
				<c:import url="/com/atch/selectFileInfs.do" charEncoding="utf-8">
				<c:param name="param_atchFileId" value="${resultBoard.atchFileId}" />
				</c:import>
 		</c:if>
 	
	</tr>
</c:if>
<br>
파일아이디:${resultBoard.atchFileId}<br>
파일이름:${resultBoard.atchFileName}<br>
페이지 인덱스:${searchVO.pageIndex}<br>

이전글 :${preArticle.articleNo }<br>
다음글 :${nextArticle.articleNo }<br>
<c:choose>


<c:when test="${empty nextArticle.articleNo && empty preArticle.articleNo}">
이전글:<c:out value="${preArticle.title }"/><br>
다음글:<c:out value="${nextArticle.title}"/><br>
</c:when>

<c:when test="${empty preArticle.articleNo}">
이전글:<c:out value="${preArticle.title }"/><br>
다음글:<a href="#;" onclick="viewPreNexArticle('<c:out value="${nextArticle.articleNo}"/>')"><c:out value="${nextArticle.title}"/></a><br>
</c:when>

<c:when test="${empty nextArticle.articleNo}">
이전글:<a href="#;" onclick="viewPreNexArticle('<c:out value="${preArticle.articleNo}"/>')"><c:out value="${preArticle.title }"/></a><br>
다음글:<c:out value="${nextArticle.title}"/><br>
</c:when>

<c:otherwise>
이전글:<a href="#;" onclick="viewPreNexArticle('<c:out value="${preArticle.articleNo}"/>')"><c:out value="${preArticle.title }"/></a><br>
다음글:<a href="#;" onclick="viewPreNexArticle('<c:out value="${nextArticle.articleNo}"/>')"><c:out value="${nextArticle.title}"/></a><br>
</c:otherwise>

</c:choose>
<br>
<br>
<br>
<a href="#;" onclick="listBizBoard()">목록으로</a><br>
<a href="#;" onclick="updateBizBoard('<c:out value="${resultBoard.articleNo}"/>')">수정하기</a><br>
<a href="#;" onclick="deleteBizBoard('<c:out value="${resultBoard.articleNo}"/>')">삭제하기</a><br>

<input type="hidden" name="articleNo" value="${resultBoard.articleNo}" />
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>

</form:form>
 --%>
 </body>
</html>
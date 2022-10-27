<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>

<script type="text/javaScript" language="javascript" defer="defer">
/* 글 목록 화면 function */
function listQnaBoard() {
   	document.boardForm.action = "<c:url value='/netCounter/memberPage/myPage/qnaList.do'/>";
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
 						<h2><img src="/images/truck/net/myqna_tit.gif" alt="나의 문의 내역" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/netCounter/memberPage/myPage/myInfo.do" >인터넷창구</a>
						<a href="#;" >마이페이지</a><!-- 회원유형별 마이페이지 링크 걸러주세요 -->
						<span>나의 문의 내역</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
					<legend>자주하는질문</legend>
					<input name="articleNo" type="hidden" />
					<form:input path="searchKeyword" type="hidden"/>
					<p class="confirTit"><img src="/images/truck/net/myqna_con_tit.gif" alt="회원님께서 문의하신 전체 내역 조회가 가능합니다 추가 문의 사항이 있으신 분께서는 1:1 문의 서비스를 이용해 주시기 바랍니다" /></p>
					<!-- font s -->
					<div class="font">
						<h3 class="hide">글자크기 조절</h2>
						<span><img src="/images/truck/btn/btn_font_tit.gif" alt="글자크기" /></span>
						<button type="button" class="btn_zoom1" title="글자 키우기" onclick="Field.zoomIn();return false;" onkeypress="Field.zoomIn();return false;">글자 키우기</button>
						<button type="button" class="btn_zoom2" title="기본 사이즈" onkeypress="Field.zoom100(100);" onclick="Field.zoom100(100);return false;">기본 사이즈</button>
						<button type="button" class="btn_zoom3" title="글자 줄이기" onclick="Field.zoomOut();return false;" onkeypress="Field.zoomOut();">글자 줄이기</button>
					</div><!--// font e -->
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
									<tr>
										<c:if test="${resultBoard.replyAt eq 'Y' }">
										<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_a.gif" alt="답변내용아이콘" /></p><p class="type02">답변내용</p></th>
										<td><c:out value="${resultBoard.replyContentHtml}"/></td>
										</c:if>
										<c:if test="${resultBoard.replyAt eq 'N' }">
										<th scope="row"><p class="type01"><img src="/images/truck/board/bbs_a.gif" alt="답변내용아이콘" /></p><p class="type02">답변내용</p></th>
										<td>아직 답변이 등록되지 않았습니다.</td>
										</c:if>
									</tr>
								</tbody>
							</table><!--// 테이블 e -->
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="listQnaBoard();">목록</a></span>
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
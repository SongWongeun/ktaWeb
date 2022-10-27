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
/* 글 보기 화면 function */
function viewAccBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/cyberPr/thirtyHistoryView.do'/>";
   	document.boardForm.submit();		
}
/* 글 등록 화면 function */
function addAccBoard() {
   	document.boardForm.action = "<c:url value='/cyberPr/accAddView.do'/>";
   	document.boardForm.submit();		
}
/* 글 검색 function */
function searchAccBoard() {
	document.boardForm.action = "<c:url value='/cyberPr/accIndex.do'/>";
   	document.boardForm.submit();
}
/* pagination 페이지 링크 function */
function paging_accBoard(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/cyberPr/accIndex.do'/>";
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
						<h2><img src="/images/truck/cyber/thirtyhistory_tit.gif" alt="화물공제 30년사" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/cyberPr/cyberPrIndex.do" >사이버홍보관</a>
						<span>화물공제 30년사</span>
					</div>
				</div><!-- conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cyber/acc_con_tit.gif" alt="전국화물공제조합은 여러분과 함께 밝은 미래를 열어가겠습니다." /></p>
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
							<table class="tbView_st01" summary="제목,작성일,본문내용을 순서로 나타낸 게시물 입니다.">
								<caption>화물공제 30년사 게시판 상세보기</caption>
								<colgroup>
									<col style="width:11%;" />
									<col style="width:70%;" />
									<col style="width:8%;" />
									<col style="width:11%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">제목</th>
										<td>화물공제 30년사</td>
										<th scope="col">작성일</th>
										<td>0000-00-00</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4" class="subject">
											화물공제 30년사 내용
										</td>
									</tr>
								</tbody>
							</table>
							<!-- 이전글, 다음글 s -->
							<div class="nextprevBox">
								<dl>
									<dt class="btn_prev lineFrist">이전글</dt>
									<dd class="lineFrist"><a href="#;">TEST</a></dd>
									<dt class="btn_next lineLast">다음글</dt>
									<dd class="lineLast"><a href="#;">TEST</a></dd>
								</dl>
							</div><!--// 이전글, 다음글 e -->
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="listDriverBoard()">목록</a></span>
							</div>
						</div>
						</fieldset>
						<!-- table view e -->
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
</body>
</html>



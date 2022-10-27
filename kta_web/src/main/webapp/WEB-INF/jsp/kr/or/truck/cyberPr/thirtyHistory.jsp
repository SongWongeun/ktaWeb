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
					<p class="confirTit"><img src="/images/truck/cyber/30_con_tit.gif" alt="전국화물공제조합은 여러분과 함께 밝은 미래를 열어가겠습니다" /></p>
					<div class="cyberPr">
						<p class="cyberAb"><span class="desC">책제목을 클릭하시면 PDF파일을 보실 수 있습니다&#46;</span></p>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003498&fileSn=0'/>" target="new" class="prSt01"><img src="/images/truck/cyber/con_1.png" alt="회물공제발자취30년 1 &#126; 30" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003498&fileSn=1'/>" target="new" class="prSt02"><img src="/images/truck/cyber/con_36.png" alt="사진으로보는발자취 36 &#126; 131" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003498&fileSn=2'/>" target="new" class="prSt03"><img src="/images/truck/cyber/con_132.png" alt="회물공제30년목차 132 &#126; 139" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003498&fileSn=4'/>" target="new" class="prSt04"><img src="/images/truck/cyber/con_140.png" alt="태동기1981 1985 140 &#126; 179" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003498&fileSn=5'/>" target="new" class="prSt05"><img src="/images/truck/cyber/con_180.png" alt="결손기1986 1991 180 &#126; 235" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003498&fileSn=6'/>" target="new" class="prSt06"><img src="/images/truck/cyber/con_236.png" alt="도약기1992 1998 236 &#126; 265" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003498&fileSn=7'/>" target="new" class="prSt07"><img src="/images/truck/cyber/con_266.png" alt="시련기1999 2002 266 &#126; 261" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003498&fileSn=8'/>" target="new" class="prSt08"><img src="/images/truck/cyber/con_292.png" alt="안정기 2003 292 &#126; 321" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003498&fileSn=9'/>" target="new" class="prSt09"><img src="/images/truck/cyber/con_322.png" alt="화물자동차운송사업의 History 322 &#126; 355" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003499&fileSn=0'/>" target="new" class="prSt10"><img src="/images/truck/cyber/con_356.png" alt="공제기반사업  356 &#126; 407" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003499&fileSn=1'/>" target="new" class="prSt11"><img src="/images/truck/cyber/con_408.png" alt="기타부대사업 408 &#126; 429" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003499&fileSn=2'/>" target="new" class="prSt12"><img src="/images/truck/cyber/con_430.png" alt="조직과 경영의 합리화 430 &#126; 473" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003499&fileSn=3'/>" target="new" class="prSt13"><img src="/images/truck/cyber/con_474.png" alt="조합의 미래 발전방향 474 &#126; 501" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003499&fileSn=5'/>" target="new" class="prSt14"><img src="/images/truck/cyber/con_630.png" alt="부록 630 &#126; 714" /></a>
						<a href="<c:url value='/com/atch/selectPdfFileInf.do?atchFileId=FILE_000000000003499&fileSn=4'/>" target="new" class="prSt15"><img src="/images/truck/cyber/con_502.png" alt="본부지부편 502 &#126; 629" /></a>					
					</div>
				</div>
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
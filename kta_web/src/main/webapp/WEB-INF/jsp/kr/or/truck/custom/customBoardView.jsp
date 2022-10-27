<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String u1 = "http://" +request.getServerName();
	String u2 = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String thisUrl = u1+u2+"?customNo="+request.getParameter("customNo")+"&boardNo="+request.getParameter("boardNo");
	String shareImage = u1+"/images/truck/jpg/thumb_fb_logo.jpg";
	//String shareImage = "http://www.truck.or.kr/img2009/kta_banner.gif";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<meta property="og:title" content="화물공제조합 - 공제소식"/>
<meta property="og:url" content="<%=thisUrl%>"/>
<meta property="og:image" content="<%=shareImage%>"/>
<meta property="og:site_name" content="화물공제조합"/>
<meta property="og:description"
      content="${resultBoard.TITLE}"/>      
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){

	var returnUrl = '<%=thisUrl%>';
	
	$("#url").html(returnUrl);
	
	$('a.urlCopy').on('click',function(){
		var temp;
		var IE=(document.all)?true:false;
		if (IE) {
		if(confirm("이 글의 트랙백 주소를 클립보드에 복사하시겠습니까?"))
		window.clipboardData.setData("Text", returnUrl);
		} else {
		temp = prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", returnUrl);
		}
	});
	
	$('a.twitterTb').on('click',function(){		
		var msg = "<c:out value='${resultBoard.TITLE}'/>";
		window.open("https://twitter.com/intent/tweet?text=" + encodeURIComponent(msg)+"  "+encodeURIComponent( returnUrl ));//트위터추가
	});
	
	$('a.facebookTb').on('click',function(){		
		var url = 'https://www.facebook.com/sharer/sharer.php?u='+ encodeURIComponent( returnUrl );
	 	window.open( url );
	});
});


function viewPreNexArticle(no){
	document.boardForm.customNo.value = no;
   	document.boardForm.action = "<c:url value='/customboard/view.do'/>";
   	document.boardForm.submit();			
}

function listCustomBoard(){
   	document.boardForm.action = "<c:url value='/customboard/list.do'/>";
   	document.boardForm.submit();		
}
function modifyCustomBoard(){
   	document.boardForm.action = "<c:url value='/customboard/modifyView.do'/>";
   	document.boardForm.submit();		
}
function deleteCustomBoard(){
   	document.boardForm.action = "<c:url value='/customboard/delete.do'/>";
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
						<h2 style="font-size: 38px;font-weight: bolder;color: #143B8F;"> ${BOARD_NM}</h2>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<span>${BOARD_NM}</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<!-- table view font&sns -->
					<div class="tbviewArea clfix">
						<!-- font -->
						<div class="font">
							<h3 class="hide">글자크기 조절</h2>
							<span><img src="/images/truck/btn/btn_font_tit.gif" alt="글자크기" /></span>
							<button type="button" class="btn_zoom1" title="글자 키우기" onclick="Field.zoomIn();return false;" onkeypress="Field.zoomIn();return false;">글자 키우기</button>
							<button type="button" class="btn_zoom2" title="기본 사이즈" onkeypress="Field.zoom100(100);" onclick="Field.zoom100(100);return false;">기본 사이즈</button>
							<button type="button" class="btn_zoom3" title="글자 줄이기" onclick="Field.zoomOut();return false;" onkeypress="Field.zoomOut();">글자 줄이기</button>
						</div>
						<!-- url sns -->
						<div class="viewRight">
							<span id="url" name="url" class="url"></span>
							<a title="url복사" class="urlCopy" href="#;"><span class="hide">url복사</span></a>
							<a title="트위터 공유하기" class="twitterTb" href="#;"><span class="hide">트위터</span></a>
							<a title="페이스북 공유하기" class="facebookTb" href="#;"><span class="hide">페이스북</span></a>
						</div>
					</div><!--// table view font&sns -->
					<div class="conSection">
						<form:form commandName="searchVO" name="boardForm" method="post" action="">
						<fieldset>
						<legend>게시글내용</legend>
						<form:hidden path="upperNo"/>
						<form:hidden path="boardNo"/>
						<form:hidden path="customNo"/>
						<form:input path="searchCondition" type="hidden"/>
						<form:input path="searchKeyword" type="hidden"/>
						<!-- table view s -->
						<div class="bbsView1">
							<table class="tbView_st01" summary="제목,작성일,본문내용을 순서로 나타낸 게시물 입니다.">
								<caption>공제소식 읽기게시판</caption>
								<colgroup>
									<col style="width:11%;" />
									<col style="width:70%;" />
									<col style="width:8%;" />
									<col style="width:11%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">제목</th>
										<td><c:out value="${resultBoard.TITLE}"/></th>
										<th scope="col">작성일</th>
										<td><c:out value="${fn:substring(resultBoard.REGIST_DATE, 0, 11)}"/></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4" class="subject">
											${resultBoard.CONTENT_HTML}
										</td>
									</tr>
								</tbody>
							</table>
							<!-- 이전글, 다음글 s -->						
							<div class="nextprevBox">
								<dl>
								<c:choose>
									<c:when test="${empty preBoard.HP_CUSTOM_BOARD_NO}">
										<dt class="btn_prev lineFrist">이전글</dt>
										<dd class="lineFrist"><c:out value="${preBoard.TITLE }"/></dd>
										<dt class="btn_next lineLast">다음글</dt>
										<dd class="lineLast"><a href="#;" onclick="viewPreNexArticle('<c:out value="${nextBoard.HP_CUSTOM_BOARD_NO}"/>')"><c:out value="${nextBoard.TITLE}"/></a></dd>
									</c:when>
									<c:when test="${empty nextBoard.HP_CUSTOM_BOARD_NO}">
										<dt class="btn_prev lineFrist">이전글</dt>
										<dd class="lineFrist"><a href="#;" onclick="viewPreNexArticle('<c:out value="${preBoard.HP_CUSTOM_BOARD_NO}"/>')"><c:out value="${preBoard.TITLE }"/></a></dd>
										<dt class="btn_next lineLast">다음글</dt>
										<dd class="lineLast"><c:out value="${nextBoard.TITLE}"/></dd>
									</c:when>
									<c:otherwise>
										<dt class="btn_prev lineFrist">이전글</dt>
										<dd class="lineFrist"><a href="#;" onclick="viewPreNexArticle('<c:out value="${preBoard.HP_CUSTOM_BOARD_NO}"/>')"><c:out value="${preBoard.TITLE }"/></a></dd>
										<dt class="btn_next lineLast">다음글</dt>
										<dd class="lineLast"><a href="#;" onclick="viewPreNexArticle('<c:out value="${nextBoard.HP_CUSTOM_BOARD_NO}"/>')"><c:out value="${nextBoard.TITLE}"/></a></dd>
									</c:otherwise>
								</c:choose>
								</dl>
							</div><!--// 이전글, 다음글 e -->
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="javascript:modifyCustomBoard()">수정</a></span>
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="javascript:deleteCustomBoard()">삭제</a></span>
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="javascript:listCustomBoard()">목록</a></span>
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
 </body>
</html>
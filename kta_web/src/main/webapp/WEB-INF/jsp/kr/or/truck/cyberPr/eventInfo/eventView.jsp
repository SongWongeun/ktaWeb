<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String u1 = "http://" +request.getServerName();
	String u2 = request.getAttribute("javax.servlet.forward.request_uri").toString();
	String thisUrl = u1+u2+"?articleNo="+request.getParameter("articleNo");
	String shareImage = u1+"/images/truck/jpg/thumb_fb_logo.jpg";
	//String shareImage = "http://www.truck.or.kr/img2009/kta_banner.gif";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>

<meta property="og:title" content="화물공제조합 - 행사안내"/>
<meta property="og:url" content="<%=thisUrl%>"/>
<meta property="og:image" content="<%=shareImage%>"/>
<meta property="og:site_name" content="화물공제조합"/>
<meta property="og:description"
      content="${resultBoard.title}"/>
      
      
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
		var msg = "<c:out value='${resultBoard.title}'/>";
		window.open("https://twitter.com/intent/tweet?text=" + encodeURIComponent(msg)+"  "+encodeURIComponent( returnUrl ));//트위터추가
	});
	
	$('a.facebookTb').on('click',function(){		
		var url = 'https://www.facebook.com/sharer/sharer.php?u='+ encodeURIComponent( returnUrl );
	 	window.open( url );
	});
});
/* 글 수정 화면 function */
function updateEventBoard(no) {
   	document.boardForm.action = "<c:url value='/kwa/cyberPr/eventUpdate.do'/>";
   	document.boardForm.submit();		
}
/* 글 목록 화면 function */
function listEventBoard() {
	document.boardForm.action = "<c:url value='/cyberPr/eventIndex.do'/>";
   	document.boardForm.submit();
}
/* 글 삭제 화면 function */
function deleteEventBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/cyberPr/eventDelete.do'/>";
   	document.boardForm.submit();		
}
/* 이전/다음글 보기 화면 function */
function viewPreNexArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/cyberPr/eventView.do'/>";
   	document.boardForm.submit();		
}

$(document).ready(function(){
	$('#imageArea img').load(function(e){
		var p = $('#imageArea').width();
		var i = $(this).width();
		
		if( p < i){
			$(this).css('width','100%');
		}
	});
});
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
						<h2><img src="/images/truck/cyber/event_tit.gif" alt="행사안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="/main/index.do">HOME</a>
						<a href="/cyberPr/cyberPrIndex.do" >사이버홍보관</a>
						<span>행사안내</span>
					</div>
				</div><!-- conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cyber/event_con_tit.gif" alt="화물공제조합의 다양한 행사 갤러리 입니다." /></p>		
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
					<%--<!-- font s -->
					<div class="font">
						<h3 class="hide">글자크기 조절</h3>
						<span><img src="/images/truck/btn/btn_font_tit.gif" alt="글자크기" /></span>
						<button type="button" class="btn_zoom1" title="글자 키우기" onclick="Field.zoomIn();return false;" onkeypress="Field.zoomIn();return false;">글자 키우기</button>
						<button type="button" class="btn_zoom2" title="기본 사이즈" onkeypress="Field.zoom100(100);" onclick="Field.zoom100(100);return false;">기본 사이즈</button>
						<button type="button" class="btn_zoom3" title="글자 줄이기" onclick="Field.zoomOut();return false;" onkeypress="Field.zoomOut();">글자 줄이기</button>
					</div><!--// font e -->--%>
					<div class="conSection">
						<form:form commandName="searchVO" name="boardForm" method="post" action="">
						<fieldset>
						<legend>행사안내</legend>
						<input type="hidden" name="articleNo" />
						<form:input path="tabCon" type="hidden"/>
						<form:input path="searchCondition" type="hidden"/>
						<form:input path="searchKeyword" type="hidden"/>
						<form:input path="pageIndex" type="hidden"/>
						<!-- event view s -->
						<div class="eventView">
							<div class="eventViewcont">
								<table class="tbView_event" summary="제목,작성일,본문내용을 순서로 나타낸 게시물 입니다.">
									<caption>행사안내 게시판 상세보기</caption>
									<colgroup>
										<col style="width:10%;" />
										<col style="width:65%;" />
										<col style="width:10%;" />
										<col style="width:15%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">제목</th>
											<td><c:out value="${resultBoard.title}"/></td>
											<th scope="col">작성일</th>
											<td><c:out value="${fn:substring(resultBoard.createTime, 0, 11)}"/></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4" class="subject">
												${resultBoard.contentHtml}
											</td>
										</tr>
										<%-- <tr>
											<td colspan="4" class="subject">
											<c:if test="${not empty resultBoard.atchFileId }">
												<div id="imageArea" style="width:100%;text-align: center;display: block;margin: 20px 0;">
													<img src="/cmm/fms/getImage.do?atchFileId=${resultBoard.atchFileId}&fileSn=0" alt="<c:out value="${resultBoard.atchFileId}" /> 이미지" />
												</div>
											</c:if>
											</td>
										</tr> --%>
									</tbody>
								</table>
							</div>
							<div class="eventViewpn">
								<!-- 이전글, 다음글 s -->						
								<div class="nextprevBox_event">
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
								</div><!-- 이전글, 다음글 e -->
								<!-- 버튼 -->
								<div class="eventbtnboxR clfix">
									<a href="#;" onclick="listEventBoard()" class="eventBtn_list"><span>목록</span></a>
								</div>
							</div>
						</div>
						</fieldset>
						</form:form>
						<!-- event view e -->
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

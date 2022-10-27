<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<meta property="og:title" content="화물공제조합 - 입찰공고"/>
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
function updateBidBoard(no) {
   	document.boardForm.action = "<c:url value='/kwa/infoLounge/bidNoticeUpdate.do'/>";
   	document.boardForm.submit();		
}

/* 글 목록 화면 function */
function listBidBoard() {
	document.boardForm.action = "<c:url value='/infoLounge/bidNoticeIndex.do'/>";
   	document.boardForm.submit();
}

/* 글 삭제 화면 function */
function deleteBidBoard(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/infoLounge/bidNoticeDelete.do'/>";
   	document.boardForm.submit();		
}

/* 이전/다음글 보기 화면 function */
function viewPreNexArticle(no) {
	document.boardForm.articleNo.value = no;
   	document.boardForm.action = "<c:url value='/infoLounge/bidNoticeView.do'/>";
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
						<h2><img src="/images/truck/info/bid_tit.gif" alt="입찰공고" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<span>입찰공고</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/info/bid_con_tit.gif" alt="입찰사업명을 입력하거나 공고기간을 지정하면 해당기간의 입찰공고현황을 검색할 수 있습니다." /></p>
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
               			<h3 class="hide">글자크기 조절</h2>
                		<span><img src="/images/truck/btn/btn_font_tit.gif" alt="글자크기" /></span>
                		<button type="button" class="btn_zoom1" title="글자 키우기" onclick="Field.zoomIn();return false;" onkeypress="Field.zoomIn();return false;">글자 키우기</button>
                		<button type="button" class="btn_zoom2" title="기본 사이즈" onkeypress="Field.zoom100(100);" onclick="Field.zoom100(100);return false;">기본 사이즈</button>
                		<button type="button" class="btn_zoom3" title="글자 줄이기" onclick="Field.zoomOut();return false;" onkeypress="Field.zoomOut();">글자 줄이기</button>
                	</div><!--// font e -->--%>
					<div class="conSection">
						<form:form commandName="searchVO" name="boardForm" method="post" action="">
						<fieldset>
						<legend>입찰공고 view</legend>
						<input name="articleNo" type="hidden" />
						<form:input path="searchKeyword" type="hidden"/>
						<form:input path="searchCondition" type="hidden"/>
						<form:input path="searchRecentDate" type="hidden"/>
						<form:input path="searchStartDetailDate" type="hidden"/>
						<form:input path="searchEndDetailDate" type="hidden"/>
						<form:input path="pageIndex" type="hidden"/>
						<!-- table view s -->
						<div class="bbsView1">
							<table class="tbView_st01" summary="제목,작성일,본문내용을 순서로 나타낸 게시물 입니다.">
								<caption>입찰공고 읽기게시판</caption>
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
											<!-- 테이블 in 테이블 s -->
											<table class="tbIn_st01" summary="공고일반,공고상세,첨부파일을 순서로 나타낸 게시물 입니다.">
												<caption>입찰공문내용</caption>
												<colgroup>
													<col style="width:11%;" />
													<col style="width:15%;" />
													<col style="width:29%;" />
													<col style="width:15%;" />
													<col style="width:30%;" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="row" rowspan="6" class="underLine">공고일반</th>
														<td class="title">공고번호</td>
														<td><c:out value="${resultBoard.bidNo}"/></td>
														<td class="title">공고기간</td>
														<td><c:out value="${fn:substring(resultBoard.bidStartDate, 0, 11)}"/>~ <c:out value="${fn:substring(resultBoard.bidEndDate, 0, 11)}"/></td>
													</tr>
													<tr>
														<td class="title">공고명</td>
														<td><c:out value="${resultBoard.bidName}"/></td>
														<td class="title">공고기관</td>
														<td><c:out value="화물공제조합"/></td>
													</tr>
													<tr>
														<td class="title">입찰방식</td>
														<td><c:out value="${resultBoard.bidRule}"/></td>
														<td class="title">계약방식</td>
														<td><c:out value="${resultBoard.contractRule}"/></td>
													</tr>
													<tr>
														<td class="title">기초금액</td>
														<td><c:out value="${resultBoard.baseAmount}"/></td>
														<td class="title">업무구분</td>
														<td>
														<c:forEach items="${ctgList}" var="ctgIndex">
															<c:if test="${ctgIndex.CATEGORY_ID == resultBoard.bbsCtg}">${ctgIndex.CATEGORY_NM}</c:if>
														</c:forEach>
														</td>
													</tr>
													<tr>
														<td class="title">낙찰자 선정방법</td>
														<td colspan="3"><c:out value="${resultBoard.bidWinRule}"/></td>
													</tr>
													<tr>
														<td class="title underLine">참가자격</td>
														<td colspan="3" class="underLine">${resultBoard.pq}</td>
													</tr>
													<tr>
														<th scope="row" rowspan="4" class="underLine">공고상세</th>
														<td class="title">담당자</td>
														<td><c:out value="${resultBoard.bidManger}"/></td>
														<td class="title">연락처</td>
														<td><c:out value="${resultBoard.managerCall}"/></td>
													</tr>
													<tr>
														<td class="title">입찰참가등록일시</td>
														<td><c:out value="${fn:substring(resultBoard.joinDate,0, 11)}"/> ${resultBoard.joinTime}</td>
														<td class="title">입찰참가등록장소</td>
														<td><c:out value="${resultBoard.joinPlace}"/></td>
													</tr>
													<tr>
														<td class="title">개찰(입찰)방식</td>
														<td><c:out value="${resultBoard.detailBidRule}"/></td>
														<td class="title">개찰장소</td>
														<td><c:out value="${resultBoard.bidPlace}"/></td>
													</tr><%-- 
													<tr>
														<td class="title underLine">사업(현장)설명일시</td>
														<td class="underLine"><c:out value="${fn:substring(resultBoard.explanDate,0, 11)}"/> ${resultBoard.explanTime}</td>
														<td class="title underLine">사업(현장)설명장소</td>
														<td class="underLine"><c:out value="${resultBoard.explanPlace}"/></td>
													</tr> --%>
													<tr>
														<td class="title underLine">기타</td>
														<td colspan="3" class="underLine">${resultBoard.explanPlace}</td>
													</tr>
													<tr>
														<th scope="row" >첨부파일</th>
														<td colspan="4">
															<c:if test="${!empty resultBoard.atchFileId}">
																<c:if test="${not empty resultBoard.atchFileId}">
																	<c:import url="/com/atch/selectFileInfs.do" charEncoding="utf-8">
																	<c:param name="param_atchFileId" value="${resultBoard.atchFileId}" />
																	</c:import>
													 			</c:if> 	
															</c:if>
														</td>
													</tr>
												</tbody>
											</table><!--// 테이블 in 테이블 e -->
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
										<dd class="lineFrist"><a href="#;" onclick="viewPreNexArticle('<c:out value="${nextArticle.articleNo}"/>')"><c:out value="${nextArticle.title}"/></a></dd>
										<dt class="btn_next lineLast">다음글</dt>
										<dd class="lineLast"><c:out value="${preArticle.title }"/></dd>
									</c:when>
									<c:when test="${empty nextArticle.articleNo}">
										<dt class="btn_prev lineFrist">이전글</dt>
										<dd class="lineFrist"><c:out value="${nextArticle.title}"/></dd>
										<dt class="btn_next lineLast">다음글</dt>
										<dd class="lineLast"><a href="#;" onclick="viewPreNexArticle('<c:out value="${preArticle.articleNo}"/>')"><c:out value="${preArticle.title }"/></a></dd>
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
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="listBidBoard()">목록</a></span>
								<%-- <span class="btn_pack btn_type02"><a href="#;" onclick="updateBidBoard('<c:out value="${resultBoard.articleNo}"/>')">수정</a></span>
								<span class="btn_pack btn_type02"><a href="#;" onclick="deleteBidBoard('<c:out value="${resultBoard.articleNo}"/>')">삭제</a></span> --%>
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
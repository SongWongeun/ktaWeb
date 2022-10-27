<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	
	
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTop"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			totalSearch();
			return false;
		}
	});
	
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeyword"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchForm();
			return false;
		}
	});
	
});

function goPage(articleNo){
	var temp = articleNo.substr(0,5);
	if(temp == 'DEDUC'){
		window.location.href='/infoLounge/deductNewsView.do?articleNo='+articleNo;
	}else if(temp == 'INSUR'){
		window.location.href='/infoLounge/insuranceNewsView.do?articleNo='+articleNo;
	}else if(temp == 'BIZNS'){
		window.location.href='/infoLounge/bizNewsView.do?articleNo='+articleNo;
	}else if(temp == 'BIDBO'){
		window.location.href='/infoLounge/bidNoticeView.do?articleNo='+articleNo;
	}else if(temp == 'ENCOR'){
		window.location.href='/infoLounge/encourNoticeView.do?articleNo='+articleNo;
	}else if(temp == 'RECOM'){
		window.location.href='/infoLounge/dataCenter/recommandSite.do';
	}else if(temp == 'FAQST'){
		window.location.href='/customer/faqNoticeView.do?articleNo='+articleNo;
	}else if(temp == 'FORMD'){
		window.location.href='/customer/formDataIndex.do';
	}else if(temp == 'PRAIS'){
		window.location.href='/customer/praise/praiseView.do?articleNo='+articleNo;
	}else if(temp == 'DRIVR'){
		window.location.href='/cyberPr/driversDayView.do?articleNo='+articleNo;
	}else if(temp == 'ACCPR'){
		window.location.href='/cyberPr/accView.do?articleNo='+articleNo;
	}else if(temp == 'EVENT'){
		window.location.href='/cyberPr/eventView.do?articleNo='+articleNo;
	}else if(temp == 'VIDEO'){
		window.location.href='/cyberPr/prMovieIndex.do';
	}else{
		window.location.href=articleNo;
	}
}

function totalSearch(){

	var searchKeyword = $("#searchKeywordTop").val();
	if(searchKeyword == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}
	document.boardForm.searchKeyword.value = $("#searchKeywordTop").val();
	searchForm();
}

function searchForm(){
	document.boardForm.pageIndex.value = 1;
	document.boardForm.pageIndex2.value = 1;
	var keyword = document.boardForm.searchKeyword.value;
	if(keyword == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.boardForm.action = "<c:url value='/main/totalSearch.do'/>";
   	document.boardForm.submit();
	}
}

/* pagination 페이지 링크 function */
function paging_bbs(pageNo){
	document.boardForm.pageIndex.value = pageNo;
	document.boardForm.action = "<c:url value='/main/totalSearch.do'/>";
   	document.boardForm.submit();
}
function paging_web(pageNo){
	document.boardForm.pageIndex2.value = pageNo;
	document.boardForm.action = "<c:url value='/main/totalSearch.do'/>";
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
		<!-- header s -->
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA | 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
						<!-- <li><a href="#;"><img src="/images/truck/main/util01.gif" alt="직원마당" /></a></li> -->
						<c:choose>
							<c:when test="${not empty loginVO }">
								<li><a href="/netCounter/memberPage/myPage/myInfo.do"><img src="/images/truck/main/util04.gif" alt="마이페이지" /></a></li>
							<li><a href="/logout.do"><img src="/images/truck/main/logout.gif" alt="로그아웃" /></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/join/terms/view.do"><img src="/images/truck/main/util02.gif" alt="회원가입" /></a></li>
								<li><a href="/login.do"><img src="/images/truck/main/util03.gif" alt="로그인" /></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<div class="gnbSubGo">
						<a href="/main/guide.do"><img src="/images/truck/main/guide.gif" alt="이용안내가이드" /></a>
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<span class="ut_search"><label for="searchKeywordTotal">검색어</label><input type="text" name="searchKeywordTop" id="searchKeywordTop" title="검색어 입력" /></span>
						<a class="btn_ut_search" href="#;" onclick="totalSearch();"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
					</div>
				</div>
				<!-- gnb s --><!-- subDep01까지만 노출 depth03부터는 display:none과 display:block로 컨트롤  -->
				<div class="gnb" id="Gnb">
					<ul class="gnbList">
						<li class="gnb1Dep01 "><a class="menu1" href="/netCounter/memberPage/myPage/myInfo.do"><span class="hide">인터넷창구</span></a>
						</li><!--// gnb1Dep01 인터넷창구 e -->
						<li class="gnb1Dep02 "><a class="menu2" href="/infoLounge/infoLoungeIndex.do"><span class="hide">정보마당</span></a>
						</li><!--// gnb1Dep02 정보마당 e -->
						<li class="gnb1Dep03 "><a class="menu3" href="/deductProduct/deductProductIndex.do"><span class="hide">공제상품</span></a>
						</li><!--// gnb1Dep03 공제상품 e -->
						<li class="gnb1Dep04 "><a class="menu4" href="/customer/customerIndex.do"><span class="hide">고객광장</span></a>
						</li><!--// gnb1Dep04 고객광장 e -->
						<li class="gnb1Dep05"><a class="menu5" href="/assocIntroduce/assocIntroduceIndex.do"><span class="hide">조합소개</span></a>
						</li><!--// gnb1Dep05 조합소개 e -->
						<li class="gnb1Dep06 "><a class="menu6" href="/cyberPr/cyberPrIndex.do"><span class="hide">사이버홍보관</span></a>
						</li><!--// gnb1Dep06 사이버홍보관 e -->
					</ul>
					<!-- 컨트롤버튼 -->
					<!-- <a href="#;" title="메뉴열기버튼" class="btn_memuopen" ><span class="hide">메뉴열기</span></a>
					<a href="#;" title="메뉴를 고정시킵니다." class="btn_pause pause_on" ><span>고정</span></a> --><!-- 고정버튼 눌렀을 경우 class명 pause_on 추가 -->
					<a href="#;" title="메뉴를 닫습니다." class="btn_close" ><span>닫기</span></a>
				</div><!-- // gnb e -->
			</div>
		</div>
		<hr />
		<!--// header e -->
		
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
						<h2><img src="/images/truck/etc/tsearch_tit.gif" alt="검색결과" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>	
						<span>검색결과</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/etc/tsearch_con_tit.gif" alt="화물공제조합 홈페이지 검색결과입니다." /></p>				
					<div class="conSection">
					<form:form commandName="searchVO" name="boardForm" method="post" action="">
					<fieldset>
						<legend>통합검색</legend>
						<div class="roundBox">
							<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="findArea pD">
								<p class="findName"><img src="/images/truck/etc/tseach_tit.gif" alt="검색어 입력" /></p>
								<div class="findForm pT20">
									<form:select id="searchCondition" path="searchCondition" title="카테고리검색옵션">
										<form:option selected="selected" value="0">전체</form:option>
										<form:option value="1">제목</form:option>
										<form:option value="2">본문</form:option>
									</form:select>
									<label class="hide" for="search">검색어입력</label><form:input id="search" path="searchKeyword" title="검색어를 입력해주세요" style="width:270px" class="txt" type="text" value=""/>
									<a class="btn_search" href="#;" onclick="searchForm();"><img class="vaM" src="/images/truck/btn/btn_ksearch.gif" alt="검색" /></a>
								</div>
							</div>
							<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div><!--// roundBox e -->
						<div class="totalSearch">
							<div class="totalTitle clfix">
								<h3>자료 검색 결과</h3>
								<p class="totalResult">총 검색결과 <span>${paginationInfoBbs.totalRecordCount}</span>건</p>
							</div>
							<ul class="searchList">
								<c:if test="${not empty bbsList }">
								<c:forEach items="${bbsList}" var="bbs">
									<li>
									<p class="sTit clfix"><a href="#;" onclick="goPage('${bbs.ARTICLE_NO}')">${fn:replace(bbs.TITLE, keyword, highlight )}</a><span class="sdate"><c:out value="${fn:substring(bbs.createTime, 0, 11)}"/></span></p>
									<p class="sCont">${fn:replace(fn:substring(bbs.CONTENT_TEXT,0,200), keyword, highlight)}...</p>
									<p class="sUrl"><a href="#;" onclick="goPage('${bbs.ARTICLE_NO}')">바로가기</a></p>
									</li>
								</c:forEach>
								</c:if>
								<c:if test="${empty bbsList }">
									<li>
									<p><span>검색결과가 없습니다.</span></p>
									</li>	
								</c:if>																
							</ul>
							<!-- paging s -->
							<c:if test="${not empty bbsList }">
							<div class="paging">
								<ui:pagination paginationInfo = "${paginationInfoBbs}" type="image" jsFunction="paging_bbs" />
								<form:hidden path="pageIndex" />
							</div>
							</c:if>
							<c:if test="${empty bbsList }">
								<form:hidden path="pageIndex" />
							</c:if>
							<!--// paging e -->
						</div>	
						<div class="totalSearch pT50">
							<div class="totalTitle clfix">
								<h3>웹 페이지 검색 결과</h3>
								<p class="totalResult">총 검색결과 <span>${paginationInfoWeb.totalRecordCount}</span>건</p>
							</div>
							<ul class="searchList">
								<c:if test="${not empty webList}">
								<c:forEach items="${webList}" var="web">
									<li>
									<p class="sTit clfix"><a href="#;" onclick="goPage('${web.WEB_URL}')">${fn:replace(web.WEB_TITLE, keyword, highlight )}</a><span class="sdate"><c:out value="${fn:substring(web.CREATE_TIME, 0, 11)}"/></span></p>
									<p class="sCont">${fn:replace(fn:substring(web.WEB_CONTENT,0,200), keyword, highlight)}...</p>
									<p class="sUrl"><a href="#;" onclick="goPage('${web.WEB_URL}')">바로가기</a></p>
									</li>
								</c:forEach>
								</c:if>
								<c:if test="${empty webList }">
									<li>
									<p><span>검색결과가 없습니다.</span></p>
									</li>
								</c:if>
							</ul>
							<!-- paging s -->
							<c:if test="${not empty webList}">
							<div class="paging">
								<ui:pagination paginationInfo = "${paginationInfoWeb}" type="image" jsFunction="paging_web" />
								<form:hidden path="pageIndex2" />
							</div>
							</c:if>
							<c:if test="${empty webList }">
								<form:hidden path="pageIndex2" />		
							</c:if>
							<!--// paging e -->
						</div>					
						</fieldset>
						</form:form>
					</div><!--// conSection e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<!--// container e -->
		<hr />
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->

</body>
</html>
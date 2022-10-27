<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	//New이미지를 보여주기 위해 현재날짜 가져오기
 	GregorianCalendar calender = new GregorianCalendar();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
 	Date nowDate = calender.getTime();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/mainGlobal.do"></c:import>
<!-- // meta, title, css, javascript -->

<!-- autoLogout -->
<c:import url="/common/include/hyeon.do"></c:import>
		
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchForm();
			return false;
		}
	});
});
function goRecentBoard(articleNo){
	var temp = articleNo.substr(0,5);
	if(temp == 'DEDUC'){
		window.location.href='/infoLounge/deductNewsView.do?articleNo='+articleNo;
	}else{
		window.location.href='/infoLounge/insuranceNewsView.do?articleNo='+articleNo;
	}
}
function searchForm(){
	var keyword = document.searchForm.searchKeywordTotal.value;
	if(keyword == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.searchForm.searchKeywordT.value = keyword;
	document.searchForm.action = "<c:url value='/main/totalSearch.do'/>";
   	document.searchForm.submit();
	}
}
</script>
<!-- script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script> 
<style>
html, body {margin:0px;padding:0px;}
#bg1 {width:100%; height:85px; background-color:#ffffff;}
</style>-->
</head>
<body>
	
	<div id="bg1" align="center"><a href="/deductProduct/compenInfo/amountCharge.do"><img src="/images/truck/main/layerpop_tit.gif" alt="보상서비스 바로가기" /></a><a href="#" onclick="$('#bg1').slideUp(400);"><img src="/images/truck/main/layer_close.gif" alt="닫기" /></a></div>
	
	<div id="wrapMain">
		<div class="skipMenu"  title="스킵메뉴" >
			<a href="#containerMain">본문 내용 바로가기</a>
		</div>
		<hr />
		<!-- headerMain s -->
		<div id="headerMain">
			<h1><a href="/main/index.do"><img src="/images/truck/main/main_logo.gif" alt="KTA | 전국화물자동차운송사업자공제조합" /></a></h1>
			<div class="util">
				<c:if test="${loginVO != null}">
				<!-- 20161208 추가 -->
				<div class="loginInfo">
					<c:if test="${loginVO.agentCd == '1'}">
						${loginVO.agentNm}
					</c:if>
					<c:if test="${loginVO.agentCd == '2'}">
						${loginVO.carmgrNm}
					</c:if>
					<c:if test="${loginVO.agentCd == '3'}">
						${loginVO.custNm}
					</c:if>
					&nbsp;&nbsp;
					<span class="time" id="timeLimitLogout"><strong>10 : 00</strong>&nbsp;&nbsp;</span>
					<a href="#" id="logoutTimeReset"><img src="/images/truck/com/btn_login_delay.gif" alt="연장" /></a>
				</div>
				<!-- //20161208 추가 -->
				</c:if>
				<ul>
					<!-- 20161130 삭제
					<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
					<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
					//20161130 삭제 -->
					<!-- <li><a href="#;"><img src="/images/truck/main/util01.gif" alt="직원마당" /></a></li> -->
					<c:choose>
						<c:when test="${not empty loginVO }">
							<!-- 20161208 삭제 
							<li><a href="/netCounter/memberPage/myPage/myInfo.do"><img src="/images/truck/main/util04.gif" alt="마이페이지" /></a></li>
							//20161208 삭제 -->
							<li><a href="/logout.do"><img src="/images/truck/main/logout.gif" alt="로그아웃" /></a></li>
							<!-- 20161208 추가 -->
							<li><a href="/netCounter/memberPage/myPage/alterInfo.do"><img src="/images/truck/main/util06.gif" alt="회원정보관리" /></a></li>
							<!-- //20161208 추가 -->
							
								<!-- 2016.11.11 HYEON :: 20161208 삭제
							<li><span id="timeLimitLogout"><strong>10 : 00</strong>&nbsp;&nbsp;<a href="#" id="logoutTimeReset">연장</a></span></li>
								<!-- //2016.11.11 HYEON :: 20161208 삭제 -->
								
						</c:when>
						<c:otherwise>
							<li><a href="/join/terms/view.do"><img src="/images/truck/main/util02.gif" alt="회원가입" /></a></li>
							<li><a href="/login.do"><img src="/images/truck/main/util03.gif" alt="로그인" /></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<div class="utilGo">
					<a href="/main/guide.do"><img src="/images/truck/main/guide.gif" alt="이용안내가이드" /></a>
					<!-- 20161214 삭제 
					<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
					//20161214 삭제 -->
					<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
				</div>
				<div class="utilSearch">
				<form name="searchForm" method="post" action="">
				<fieldset>
				<legend>통합검색</legend>
					<input type="hidden" name="searchKeywordT"/>
					<span class="ut_search"><label for="searchKeywordTotal">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
					<a class="btn_ut_search" href="#;" onclick="totalSearch();"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
				</fieldset>
				</form>
				</div>
			</div>
		</div><!--// headerMain e -->
		<hr />
		<!-- containerMain s -->
		<div id="containerMain">
			<div id="mainLeft">
				<div class="mainGnb">
					<ul class="mgnbUi">
						<li class="over01"><a href="/netCounter/memberPage/myPage/myInfo.do"><span class="hide">인터넷창구</span></a></li>
						<li class="over02"><a href="/infoLounge/infoLoungeIndex.do"><span class="hide">정보마당</span></a></li>
						<li class="over03"><a href="/deductProduct/deductProductIndex.do"><span class="hide">공제상품</span></a></li>
						<li class="over04"><a href="/customer/customerIndex.do"><span class="hide">고객광장</span></a></li>
						<li class="over05"><a href="/assocIntroduce/assocIntroduceIndex.do"><span class="hide">조합소개</span></a></li>
					</ul>
					<ul class="mlnbUi">
						<li class="over01"><a href="/customer/inquiry/viewRegistBoard.do"><span class="hide">1:1문의</span></a></li>
						<li class="over02"><a href="http://card.truck.or.kr" target="_blank"><span class="hide">카드수납시스템</span></a></li>
					</ul>
				</div>
				<div class="mainInfo">
				<a href="/assocIntroduce/office/officeInfo.do"><img src="/images/truck/main/main_customer3.gif"  alt="전국지부안내" /></a>
				<img src="/images/truck/main/main_customer.gif"  alt="사고 접수 현장 출동 서비스 1577-8278 24시간 전일" /></br></br>
				<img src="/images/truck/main/main_customer2.gif"  alt="사고 접수 현장 출동 서비스 1577-8278 24시간 전일" /></div>
			</div><!--// mainLeft e -->
			<div id="mainCenter">
				<div id="mainSlides" class="visualWrap">
					<div class="main_slide_visual">
						<c:forEach items="${bannerList}" var="banner">
						<c:if test="${banner.NEW_WINDOW eq 'Y'}">
						<a href="${banner.BANNER_URL}" target="_blank"><img src="/com/atch/getThumbImage.do?atchFileId=${banner.ATCH_FILE_ID}" style="width:457px; height:375px" alt="${banner.TITLE}" /></a>
						</c:if>
						<c:if test="${banner.NEW_WINDOW eq 'N'}">
						<a href="${banner.BANNER_URL}"><img src="/com/atch/getThumbImage.do?atchFileId=${banner.ATCH_FILE_ID}" style="width:457px; height:375px" alt="${banner.TITLE}" /></a>
						</c:if>
						</c:forEach>
					</div>
					<div class="controlWrap">
						<ul class="main_slide_pagination"></ul>
					</div>
					<div class="controlWrap2">
						<ul class="slideControl"></ul>
					</div>
				</div>
				<div class="quickService">
					<h2 class="hide">빠른서비스</h2>
					<ul>
						<li class="style01"><a href="/deductProduct/joinInfo/joinInfo.do"><span class="hide">가입안내</span></a></li>
						<li class="style02">
							<c:choose>
								<c:when test="${not empty loginVO && ( loginVO.agentCd != '1' && loginVO.agentCd != '2')}">
									<a href="#;" onclick="alert('조합원,차량관리자 회원만 사용가능 합니다.'); return false;" ><span class="hide">지급내역조회</span></a>
								</c:when>
								<c:otherwise>
									<a href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><span class="hide">계약정보조회</span></a>
								</c:otherwise>
							</c:choose>
						</li>
						<li class="style03">
							<c:choose>
								<c:when test="${not empty loginVO && ( loginVO.agentCd != '1' && loginVO.agentCd != '2')}">
									<a href="#;" onclick="alert('조합원,차량관리자 회원만 사용가능 합니다.'); return false;" ><span class="hide">지급내역조회</span></a>
								</c:when>
								<c:otherwise>
									<a href="/netCounter/inquiryService/accountInquiry/compenInfo.do"><span class="hide">보상정보조회</span></a>
								</c:otherwise>
							</c:choose>
						</li>
						<li class="style04">
							<c:choose>
								<c:when test="${not empty loginVO && loginVO.agentCd != '3'}">
									<a href="#;" onclick="alert('거래처 회원만 사용가능 합니다.'); return false;" ><span class="hide">지급내역조회</span></a>
								</c:when>
								<c:otherwise>
									<a href="/netCounter/inquiryService/accountInquiry/paymentListInquiry.do"><span class="hide">지급내역조회</span></a>
								</c:otherwise>
							</c:choose>
						</li>
						<li class="style05"><a href="/customer/inquiry/oaoInquiryIndex.do"><span class="hide">전자민원</span></a></li>
						<li class="style06"><a href="/infoLounge/deductNewsView.do?articleNo=DEDUC_00000000681790"><span class="hide">개인신용정보 조회사실 공시</span></a></li>
					</ul>
				</div>
			</div><!--// mainCenter e -->
			<div id="mainRight">
				<div class="productInfo">
					<h2><img src="/images/truck/main/h2tit02.gif" alt="공제상품안내" /></h2>
					<ul>
						<li class="over01"><a href="/deductProduct/productInfo/manInfo.do"><span class="hide">대인배상</span></a></li>
						<li class="over02"><a href="/deductProduct/productInfo/objectInfo.do"><span class="hide">대물배상</span></a></li>
						<li class="over03"><a href="/deductProduct/productInfo/carryInfo.do"><span class="hide">적재물</span></a></li>
						<li class="over04"><a href="/deductProduct/productInfo/practicianInfo.do"><span class="hide">종사자재해</span></a></li>
					</ul>
				</div>
				<div class="newNotice">
					<h2><img src="/images/truck/main/h2tit03.gif" alt="최근소식" /></h2>
					<div class="newSect">
						<dl>
							<dt class="thumb">
							<img src="/com/atch/getThumbImage.do?atchFileId=${recentImg.ATCH_FILE_ID}" width="125px"  height="90px" alt="최근소식썸네일" ></img></dt>
							<c:set var="recentRegDate">
							${fn:replace(recentImg.CREATE_TIME, '.', '')}
							</c:set>
							<dd class="txt_title"><a href="#;" onclick="goRecentBoard('${recentImg.ARTICLE_NO}');">
							<c:if test="${fn:length(recentImg.TITLE) > 30 }">${fn:substring(recentImg.TITLE,0,30) }...</c:if>
							<c:if test="${fn:length(recentImg.TITLE) <= 30 }">${recentImg.TITLE }</c:if>&nbsp;
							<%
								String chkDate2 = (String)pageContext.getAttribute("recentRegDate",PageContext.PAGE_SCOPE);
								Date regDate2 = dateFormat.parse(chkDate2); 
								long diff2 = nowDate.getTime() - regDate2.getTime(); //현재날짜 - 공지사항등록날짜
								long diffDays2 = diff2 / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
							%>
							<%if(diffDays2<5){ %>								
								<img  src="/images/truck/main/icon_new_org.png" alt="새글"/>
							<%}%>
							</a>
							</dd>
							<dd class="txt_date">${fn:substring(recentImg.CREATE_TIME, 0, 11)}</dd>
						</dl>
					</div> 
					<ul class="newsList">
						<c:forEach items="${recentList}" var="recent">
						<c:set var="regDate">
						${fn:replace(recent.CREATE_TIME, '-', '')}
						</c:set>			
						<li>
							<a href="#;" onclick="goRecentBoard('${recent.ARTICLE_NO}');">
							<c:if test="${fn:length(recent.TITLE) > 25 }">${fn:substring(recent.TITLE,0,25) }...</c:if>
							<c:if test="${fn:length(recent.TITLE) <= 25 }">${recent.TITLE }</c:if>
								<%
									String chkDate = (String)pageContext.getAttribute("regDate",PageContext.PAGE_SCOPE);
									Date regDate = dateFormat.parse(chkDate); 
									long diff = nowDate.getTime() - regDate.getTime(); //현재날짜 - 공지사항등록날짜
									long diffDays = diff / (24*60*60*1000); // 남은 값 / 1일로(24h x 60m x 60s x 1000) 나눔.  
								%>
								<%if(diffDays<5){ %>								
									<img  src="/images/truck/main/icon_new_org.png" alt="새글"/>
								<%}%>
							</a>
						</li>
						</c:forEach>
					</ul>
					<!-- <a href="#;" class="btn_more"><img src="/images/truck/main/btn_plusmore.png" alt="더보기" /></a> -->
				</div>
				<div class="banner">
					<ul>
						<!-- 개인화물 가입안내 및 상담신청 페이지 추가 -->
						<li class="over04"><a href="/deductProduct/cardInfo.do"><span class="hide">카드수납 안내</span></a></li>
						<li class="over05"><a href="/deductProduct/hwamulInfo.do"><span class="hide">개인화물 가입안내</span></a></li>
						<!-- <li class="over04"><a href="/infoLounge/dataCenter/recommandCompanyDirect.do"><span class="hide">우수협력 정비업체</span></a></li> -->
						<!-- <li class="over01"><a href="/cyberPr/cyberPrIndex.do"><span class="hide">사이버홍보관 화물공제조합의 다양한 행사와 소식</span></a></li> -->
						<li class="over03"><a href="/deductProduct/compenInfo/claimInfo.do"><span class="hide">고객님을 위한 편리한 서비스 정보</span></a></li>
						<!-- <li class="over04"><a href="/infoLounge/encourInfo.do"><span class="hide">장학사업안내 화물공제조합의 장학사업</span></a></li> -->
						<li class="over02"><a href="/deductProduct/guaranteeProduct.do"><span class="hide">조합원 사업용 화물자동차 신차 구입자금 대출</span></a></li>
					</ul>
				</div>
			</div><!--// mainRight e -->
		</div><!--// containerMain e -->
		<hr />
		<!-- footer s -->
		<c:import url="/common/include/footer.do"></c:import>
		<!--// footer e -->
	</div><!--// wrapMain div -->
</body>
</html>
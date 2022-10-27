<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">

$(document).ready(function(){
	
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchForm();
			return false;
		}
	});
});
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
								<li><a href="#;"><img src="/images/truck/main/logout.gif" alt="로그아웃" /></a></li>
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
						<h2><img src="/images/truck/etc/sitemap_tit.gif" alt="전체보기" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>	
						<span>전체보기</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/etc/sitemap_con_tit.gif" alt="화물공제조합 홈페이지 전체보기 입니다." /></p>				
					<div class="conSection">
						<div class="siteBox clfix">
							<div class="siteMap eC">
								<p><a href="netCounter/memberPage/myPage/myInfo.do">인터넷창구</a></p>
								<ul>
									<li><a href="netCounter/memberPage/myPage/myInfo.do">마이페이지</a></li>
									<li>계약조회
										<ul>
											<li><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do">자동차공제조회</a></li>
											<li><a href="/netCounter/inquiryService/contractInquiry/accInquiry.do">재해공제조회</a></li>
											<li><a href="/netCounter/inquiryService/contractInquiry/carryInquiry.do">적재물공제조회</a></li>
										</ul>
									</li>
									<li><a href="/netCounter/inquiryService/accountInquiry/compenInfo.do">보상정보조회</a></li>
									<li><a href="/netCounter/inquiryService/accountInquiry/paymentListInquiry.do">지급내역조회</a></li>
									<li><a href="/netCounter/certSerivce/certServiceIndex.do">증명서발급</a></li>
									<li><a href="/netCounter/memberPage/myPage/alterInfo.do">회원정보관리</a></li>
								</ul>
							</div>
							<div class="siteMap iL">
								<p><a href="/infoLounge/infoLoungeIndex.do">정보마당</a></p>
								<ul>
									<li><a href="/infoLounge/deductNewsIndex.do">공제소식</a></li>
									<li><a href="/infoLounge/insuranceNewsIndex.do">보험소식</a></li>
									<!-- <li>업계소식
										<ul>
											<li><a href="/infoLounge/bizNewsIndex.do">업계소식</a></li>
											<li><a href="/infoLounge/insuranceNewsIndex.do">보험소식</a></li>
										</ul>
									</li> -->
									<li><a href="/infoLounge/bidNoticeIndex.do">입찰공고</a></li>
									<li>장학사업
										<ul>
											<li><a href="/infoLounge/encourInfo.do">장학사업안내</a></li>
											<li><a href="/infoLounge/encourNoticeIndex.do">장학사업공지</a></li>
											<li><a href="/infoLounge/recipientResult.do">장학금지원내역</a></li>
										</ul>
									</li>
									<li><a href="/infoLounge/dataCenter/recommandSite.do">관련사이트</a></li>
									<li><a href="/infoLounge/dataCenter/recommandCompanyDirect.do">우수협력정비업체</a></li>
								</ul>
							</div>
							<div class="siteMap dP">
								<p><a href="/deductProduct/deductProductIndex.do">공제상품</a></p>
								<ul>
									<li>가입안내
										<ul>
											<li><a href="/deductProduct/joinInfo/joinInfo.do">가입안내</a></li>
											<li><a href="/deductProduct/divideCalcu.do">분담금계산</a></li>
										</ul>
									</li>
									<li>상품안내
										<ul>
											<li><a href="/deductProduct/productInfo/manInfo.do">대인배상</a></li>
											<li><a href="/deductProduct/productInfo/objectInfo.do">대물배상</a></li>
											<li><a href="/deductProduct/productInfo/bodyAccInfo.do">자기신체사고</a></li>
											<li><a href="/deductProduct/productInfo/practicianInfo.do">종사자재해</a></li>
											<li><a href="/deductProduct/productInfo/myCarDamege.do">자기차량손해</a></li>
											<li><a href="/deductProduct/productInfo/carryInfo.do">적재물 배상</a></li>
											<li><a href="/deductProduct/productInfo/lawSupportInfo.do">법률비용 지원특약</a></li>
										</ul>
									</li>
									<li><a href="/deductProduct/guaranteeProduct.do">보증상품</a></li>
									<li>보상안내
										<ul>
											<li><a href="/deductProduct/compenInfo/amountCharge.do">공제금청구안내</a></li>
											<li><a href="/deductProduct/compenInfo/accProcc.do">사고처리절차</a></li>
										</ul>
									</li>
									<li>보상관련정보
										<ul>
											<li><a href="/deductProduct/dataCenter/insuranceKnowlege/injurGradeInfo.do">상해급수안내</a></li>
											<li><a href="/deductProduct/dataCenter/insuranceKnowlege/faultRate.do">유형별과실비율</a></li>
											<li><a href="/deductProduct/dataCenter/insuranceKnowlege/greatNegligence.do">11대중과실</a></li>
										</ul>
									</li>
									<li>공제약관
										<ul>
											<li><a href="/deductProduct/carDeductInfo.do">자동차공제약관</a></li>
											<li><a href="/deductProduct/carryDeductInfo.do">적재물공제약관</a></li>
										</ul>
									</li>
									<li><a href="/deductProduct/callInfo.do">콜센터안내</a></li>
								</ul>
							</div>	
							<div class="siteMap cL">
								<p><a href="/customer/customerIndex.do">고객광장</a></p>
								<ul>
									<li><a href="/customer/qnaInfo.do">문의안내</a></li>
									<li><a href="/customer/faqNoticeIndex.do">자주하는 질문</a></li>
									<li>고객문의
										<ul>
											<li><a href="/customer/inquiry/viewRegistBoard.do">1:1문의</a></li>
											<li><a href="/customer/inquiry/oaoInquiryList.do">문의결과확인</a></li>
										</ul>
									</li>
									<li><a href="/customer/praise/praiseListIndex.do">칭찬합시다.</a></li>
									<li><a href="/customer/formDataIndex.do">자료실</a></li>
								</ul>
							</div>
							<div class="siteMap aI">
								<p><a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a></p>
								<ul>
									<li><a href="/assocIntroduce/presidentGreeting.do">인사말</a></li>
									<li>공제조합소개
										<ul>
											<li><a href="/assocIntroduce/introduce/vision.do">설립목적</a></li>
											<li><a href="/assocIntroduce/introduce/history.do">주요연혁</a></li>
											<li><a href="/assocIntroduce/introduce/organChart.do">조직도</a></li>
											<li><a href="/assocIntroduce/steeringCommittee.do">운영위원회</a></li>
											<li><a href="/assocIntroduce/introduce/ci.do">CI소개</a></li>
											<li><a href="/assocIntroduce/introduce/manageInfoList.do">경영정보</a></li>
											<li><a href="/assocIntroduce/introduce/ordinance.do">관련법령</a></li>
										</ul>
									</li>
									<li><a href="/customer/cleanCenter/charter.do">윤리경영</a>
										<!-- <ul>
											<li><a href="/assocIntroduce/ethical/charter.do">윤리헌장</a></li>
											<li><a href="/assocIntroduce/ethical/conduct.do">윤리강령</a></li>
											<li><a href="/assocIntroduce/ethical/guide.do">윤리지침</a></li>
											<li><a href="/customer/cleanCenter/authenticate.do">클린신고</a></li>
										</ul> -->
									</li>
									<li><a href="/assocIntroduce/recruit/recruitInfo.do">채용안내</a></li>
									<li><a href="/assocIntroduce/office/officeInfo.do">지부안내</a></li>
									<li><a href="/assocIntroduce/allRoughMap.do">본부안내</a></li>
								</ul>
							</div>	
							<div class="siteMap cP">
								<p><a href="/cyberPr/cyberPrIndex.do">사이버홍보관</a></p>
								<ul>
									<li><a href="/cyberPr/thirtyHistory.do">화물공제 30년사</a></li>
									<li><a href="/cyberPr/driversDayIndex.do">운전자의 날</a></li>
									<li><a href="/cyberPr/accIndex.do">사고예방활동</a></li>
									<li><a href="/cyberPr/echoIndex.do">트럭메아리</a></li>
									<li><a href="/cyberPr/eventIndex.do">행사안내</a></li>
									<li><a href="/cyberPr/prMovieIndex.do">홍보영상</a></li>
								</ul>
							</div>
						</div>							
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
	$('div#headerWrap ul.gnbList li[class*="gnb1Dep"] a[href*="list.do"]').parent().find("img").hide();
	$('div#headerWrap ul.gnbList li[class*="gnb1Dep"] a[href*="list.do"]').parent().find("a[class*='Img']").hide();
	
});
function searchForm(){
	var keyword = document.searchForm.searchKeywordTotal.value;
	if(keyword.trim() == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.searchForm.searchKeywordT.value = keyword;
	document.searchForm.action = "<c:url value='/main/totalSearch.do'/>";
   	document.searchForm.submit();
	}
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
</script>

		<div id="headerWrap" style="height: 340px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA | 전국화물자동차공제조합" /></a></h1>
				<div class="gnbSub">
				<c:if test="${loginVO != null}">
					<!-- 20161201 추가 -->
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
						<span class="time" id="timeLimitLogout"><strong>30 : 00</strong>&nbsp;&nbsp;</span>
						<a href="#" id="logoutTimeReset"><img src="/images/truck/com/btn_login_delay.gif" alt="연장" /></a>
					</div> 
					<!-- //20161201 추가 -->
				</c:if>
					<ul>
						<!-- 20161201 삭제
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
						 //20161201 삭제 -->
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
							</c:when>
							<c:otherwise>
								<li><a href="/join/terms/view.do"><img src="/images/truck/main/util02.gif" alt="회원가입" /></a></li>
								<li><a href="/login.do"><img src="/images/truck/main/util03.gif" alt="로그인" /></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<div class="gnbSubGo">
						<a href="/main/guide.do"><img src="/images/truck/main/guide.gif" alt="이용안내가이드" /></a>
						<!-- 20161214 삭제 
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						//20161214 삭제 -->
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" action="" method="post" >
						<fieldset>
						<legend>통합검색</legend>
							<input type="hidden" name="searchKeywordT"/>
							<span class="ut_search"><label for="searchKeywordTotal">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
							<a class="btn_ut_search" href="#;" onclick="totalSearch(); return false;"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
						</fieldset>
						</form>
					</div>
				</div>
				<!-- gnb s --><!-- subDep01까지만 노출 depth03부터는 display:none과 display:block로 컨트롤  -->
				<div class="gnb" id="Gnb">
					<ul class="gnbList">
						<li class="gnb1Dep01 "><a class="menu1" href="/netCounter/memberPage/myPage/myInfo.do"><span class="hide">인터넷창구</span></a>
							<ul class="subList" >
								<li class="subDep01 "><a href="/netCounter/memberPage/myPage/myInfo.do"><span class="hide">마이페이지</span></a>
									<div class="depth03" >
										<c:forEach items="${interList}" var="mypage">
											<c:if test="${fn:substring(mypage.UPPER_HP_MENU_NO,4,5) eq  '1'}">
												<a class="" href="/customboard/list.do?boardNo=${mypage.HP_BOARD_MASTER_NO}&upperNo=${mypage.UPPER_HP_MENU_NO}">${mypage.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Txt" href="/netCounter/memberPage/myPage/myInfo.do"><img src="/images/truck/net/gnb01_txt.gif" alt="공제계약내용을한눈에 확인해보실 수 있습니다" /></a>
									</div>
								</li>
								<c:choose>
									<c:when test="${loginVO.agentCd == '1' }">
										<li class="subDep03 " ><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><span class="hide">계약조회</span></a>
											<div class="depth03" >
												<c:forEach items="${interList}" var="contract">
													<c:if test="${fn:substring(contract.UPPER_HP_MENU_NO,4,5) eq  '3'}">
														<a class="" href="/customboard/list.do?boardNo=${contract.HP_BOARD_MASTER_NO}&upperNo=${contract.UPPER_HP_MENU_NO}">${contract.MENU_NM}</a>
													</c:if>
												</c:forEach>
												<a class="depth03Img12"  href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><img src="/images/truck/net/gnb01_img2.gif" alt="계약조회" /></a>	<!-- 20161215 수정 -->
											</div>
										</li>
										<li class="subDep04 " ><a href="/netCounter/inquiryService/accountInquiry/compenInfo.do"><span class="hide">보상정보조회</span></a>
											<div class="depth03" >
												<c:forEach items="${interList}" var="compen">
													<c:if test="${fn:substring(compen.UPPER_HP_MENU_NO,4,5) eq  '4'}">
														<a class="" href="/customboard/list.do?boardNo=${compen.HP_BOARD_MASTER_NO}&upperNo=${compen.UPPER_HP_MENU_NO}">${compen.MENU_NM}</a>
													</c:if>
												</c:forEach>
												<a class="depth03Img5"  href="/netCounter/inquiryService/accountInquiry/compenInfo.do"><img src="/images/truck/net/gnb01_img3.gif" alt="보상정보조회" /></a>
											</div>
										</li>
										 <li class="subDep06 " ><a href="/netCounter/certSerivce/certServiceIndex.do"><span class="hide">증명서발급</span></a>
											<div class="depth03" >
												<c:forEach items="${interList}" var="cert">
													<c:if test="${fn:substring(cert.UPPER_HP_MENU_NO,4,5) eq  '5'}">
														<a class="" href="#;">${cert.MENU_NM}</a>
													</c:if>
												</c:forEach>
												<a class="depth03Img6" href="/netCounter/certSerivce/certServiceIndex.do"><img src="/images/truck/net/gnb01_img5.gif" alt="증명서발급" /></a>
											</div>
										</li>  
										<!--<li class="subDep07 " ><a href=""><span class="hide">분담금가설계</span></a></li> -->
									</c:when>
									<c:when test="${loginVO.agentCd == '2' }">
										<li class="subDep03 " ><a href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><span class="hide">계약관리</span></a>
											<div class="depth03" >
												<c:forEach items="${interList}" var="contract">
													<c:if test="${fn:substring(contract.UPPER_HP_MENU_NO,4,5) eq  '3'}">
														<a class="" href="/customboard/list.do?boardNo=${contract.HP_BOARD_MASTER_NO}&upperNo=${contract.UPPER_HP_MENU_NO}">${contract.MENU_NM}</a>
													</c:if>
												</c:forEach>
												<a class="depth03Img12"  href="/netCounter/inquiryService/contractInquiry/carInquiry.do"><img src="/images/truck/net/gnb01_img2.gif" alt="계약관리" /></a><!-- 20161201 수정 -->
											</div>
										</li>
										<li class="subDep04 " ><a href="/netCounter/inquiryService/accountInquiry/compenInfo.do"><span class="hide">보상정보조회</span></a>
											<div class="depth03" >
												<c:forEach items="${interList}" var="compen">
													<c:if test="${fn:substring(compen.UPPER_HP_MENU_NO,4,5) eq  '4'}">
														<a class="" href="/customboard/list.do?boardNo=${compen.HP_BOARD_MASTER_NO}&upperNo=${compen.UPPER_HP_MENU_NO}">${compen.MENU_NM}</a>
													</c:if>
												</c:forEach>
												<a class="depth03Img5"  href="/netCounter/inquiryService/accountInquiry/compenInfo.do"><img src="/images/truck/net/gnb01_img3.gif" alt="보상정보조회" /></a>
											</div>
										</li>
									</c:when>
									<c:when test="${loginVO.agentCd == '3' }">
										<li class="subDep05 " ><a href="/netCounter/inquiryService/accountInquiry/paymentListInquiry.do"><span class="hide">지급내역조회</span></a>
											<div class="depth03" >
												<c:forEach items="${interList}" var="pay">
													<c:if test="${fn:substring(pay.UPPER_HP_MENU_NO,4,5) eq  '6'}">
														<a class="" href="/customboard/list.do?boardNo=${pay.HP_BOARD_MASTER_NO}&upperNo=${pay.UPPER_HP_MENU_NO}">${pay.MENU_NM}</a>
													</c:if>
												</c:forEach>
												<a class="depth03Img1" href="/netCounter/inquiryService/accountInquiry/paymentListInquiry.do"><img src="/images/truck/net/gnb01_img4.gif" alt="지급내역조회" /></a>
											</div>
										</li>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
								<li class="subDep02 " ><a href="/netCounter/memberPage/myPage/alterInfo.do"><span class="hide">회원정보관리</span></a>
									<div class="depth03" >
										<c:forEach items="${interList}" var="alter">
											<c:if test="${fn:substring(alter.UPPER_HP_MENU_NO,4,5) eq  '2'}">
												<a class="" href="/customboard/list.do?boardNo=${alter.HP_BOARD_MASTER_NO}&upperNo=${alter.UPPER_HP_MENU_NO}">${alter.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Img3" href="/netCounter/memberPage/myPage/alterInfo.do"><img src="/images/truck/net/gnb01_img1.gif" alt="회원정보관리" /></a>
									</div><!-- /netCounter/memberPage/myPage/confirmPassword.do -->
								</li>

								<!-- 20161201 추가 -->
								<c:if test="${loginVO.agentCd == '1' }">
									<li class="subDep08"><a href="/netCounter/memberManagerment/memberManagerment.do"><span class="hide">조합원관리</span></a>
										<div class="depth03">
											<a href="/netCounter/memberManagerment/memberManagerment.do" class="depth03Img10"><img src="/images/truck/net/gnb01_img8.gif" alt="조합원관리" /></a>
										</div>
									</li>
									<li class="subDep09"><a href="/mail/check.do"><span class="hide">만기안내  비밀번호 변경</span></a>
										<div class="depth03">
											<a href="/mail/check.do" class="depth03Img11"><img src="/images/truck/net/gnb01_img9.gif" alt="만기안내  비밀번호 변경" /></a>
										</div>
									</li>
								</c:if>
								<!-- //20161201 추가 -->

							</ul>
						</li><!--// gnb1Dep01 인터넷창구 e -->
						<li class="gnb1Dep02 "><a class="menu2" href="/infoLounge/infoLoungeIndex.do"><span class="hide">정보마당</span></a>
							<ul class="subList" >
								<li class="subDep01 "><a href="/infoLounge/deductNewsIndex.do"><span class="hide">공제소식</span></a>
									<div class="depth03" >
										<c:forEach items="${infoList}" var="deductN">
											<c:if test="${fn:substring(deductN.UPPER_HP_MENU_NO,4,5) eq  '1'}">
												<a class="" href="/customboard/list.do?boardNo=${deductN.HP_BOARD_MASTER_NO}&upperNo=${deductN.UPPER_HP_MENU_NO}">${deductN.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Txt" href="/infoLounge/deductNewsIndex.do"><img src="/images/truck/info/gnb02_txt1.gif" alt="화물공제조합의 다양한 최근 소식을 알려드립니다." /></a>
									</div>
								</li>
								<li class="subDep02 " ><a href="/infoLounge/insuranceNewsIndex.do"><span class="hide">보험소식</span></a>
									<div class="depth03" >
										<c:forEach items="${infoList}" var="insuN">
											<c:if test="${fn:substring(insuN.UPPER_HP_MENU_NO,4,5) eq  '2'}">
												<a class="" href="/customboard/list.do?boardNo=${insuN.HP_BOARD_MASTER_NO}&upperNo=${insuN.UPPER_HP_MENU_NO}">${insuN.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Img2"  href="/infoLounge/insuranceNewsIndex.do"><img src="/images/truck/info/gnb02_img.gif" alt="보험소식" /></a>
									</div>
								</li>
								<!-- <li class="subDep02 " ><a href="/infoLounge/bizNewsIndex.do"><span class="hide">업계소식</span></a>
									<div class="depth03" >
										<a href="/infoLounge/bizNewsIndex.do" class="">업계소식</a>
										<a href="/infoLounge/insuranceNewsIndex.do" class="">보험소식</a>
									</div>
								</li> -->
								<li class="subDep03 " ><a href="/infoLounge/bidNoticeIndex.do"><span class="hide">입찰공고</span></a>
									<div class="depth03" >
										<c:forEach items="${infoList}" var="bid">
											<c:if test="${fn:substring(bid.UPPER_HP_MENU_NO,4,5) eq  '3'}">
												<a class="" href="/customboard/list.do?boardNo=${bid.HP_BOARD_MASTER_NO}&upperNo=${bid.UPPER_HP_MENU_NO}">${bid.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Img7"  href="/infoLounge/bidNoticeIndex.do"><img src="/images/truck/info/gnb02_img1.gif" alt="입찰공고" /></a>
									</div>
								</li>
							<%-- 	<li class="subDep04 " ><a href="/infoLounge/encourIndex.do"><span class="hide">장학사업</span></a>
									<div class="depth03" >
										<a href="/infoLounge/encourIndex.do" class="">장학사업안내</a>
										<a href="/infoLounge/encourNoticeIndex.do" class="">장학사업공지</a>
										<a href="/infoLounge/encour/encourDecidedCheck.do" class="">장학금지원내역</a>
										<c:forEach items="${infoList}" var="encour">
											<c:if test="${fn:substring(encour.UPPER_HP_MENU_NO,4,5) eq  '4'}">
												<a class="" href="/customboard/list.do?boardNo=${encour.HP_BOARD_MASTER_NO}&upperNo=${encour.UPPER_HP_MENU_NO}">${encour.MENU_NM}</a>
											</c:if>
										</c:forEach>
									</div>
								</li> --%>
								<li class="subDep05 " ><a href="/infoLounge/dataCenter/recommandSite.do"><span class="hide">관련사이트</span></a>
									<div class="depth03" >
										<c:forEach items="${infoList}" var="recomanS">
											<c:if test="${fn:substring(recomanS.UPPER_HP_MENU_NO,4,5) eq  '5'}">
												<a class="" href="/customboard/list.do?boardNo=${recomanS.HP_BOARD_MASTER_NO}&upperNo=${recomanS.UPPER_HP_MENU_NO}">${recomanS.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Img2"  href="/infoLounge/dataCenter/recommandSite.do"><img src="/images/truck/info/gnb02_img2.gif" alt="관련사이트" /></a>
									</div>
								</li>
								<li class="subDep06 " ><a href="/infoLounge/dataCenter/recommandCompanyDirect.do"><span class="hide">우수협력정비업체</span></a>
									<div class="depth03" >
										<c:forEach items="${infoList}" var="recomanC">
											<c:if test="${fn:substring(recomanC.UPPER_HP_MENU_NO,4,5) eq  '6'}">
												<a class="" href="/customboard/list.do?boardNo=${recomanC.HP_BOARD_MASTER_NO}&upperNo=${recomanC.UPPER_HP_MENU_NO}">${recomanC.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Txt" href="/infoLounge/dataCenter/recommandCompanyDirect.do"><img src="/images/truck/info/gnb02_txt2.gif" alt="고객님을 위한 편리한 서비스, 병원과 정비사업소 정보입니다." /></a>
									</div>
								</li>
							</ul>
						</li><!--// gnb1Dep02 정보마당 e -->
						<li class="gnb1Dep03 "><a class="menu3" href="/deductProduct/deductProductIndex.do"><span class="hide">공제상품</span></a>
							<ul class="subList" >
								<li class="subDep01 "><a href="/deductProduct/joinInfo/joinInfo.do"><span class="hide">가입안내</span></a>
									<div class="depth03" >
										<a href="/deductProduct/joinInfo/joinInfo.do" class="">일반화물 가입안내</a>
										<a href="/deductProduct/hwamulInfo.do" class="">개인화물 가입안내</a>
										<a href="/deductProduct/divideCalcu.do" class="">분담금계산</a>
										<!-- <a href="/deductProduct/cardInfo.do" class="">카드수납안내</a> -->
										<a href="/deductProduct/contractGuide.do" class="">계약 시 유의사항</a>
										<c:forEach items="${deductList}" var="join">
											<c:if test="${fn:substring(join.UPPER_HP_MENU_NO,4,5) eq  '1'}">
												<a class="" href="/customboard/list.do?boardNo=${join.HP_BOARD_MASTER_NO}&upperNo=${join.UPPER_HP_MENU_NO}">${join.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<!-- 
											<a class="depth03Txt"  href="/deductProduct/joinInfo/joinInfo.do"><img src="/images/truck/dedu/gnb03_txt.gif" alt="공제계약절차를 친절하게 안내해드립니다." /></a>
										 -->
									</div>
								</li>
								<li class="subDep02 "><a href="/deductProduct/productInfo/manInfo.do"><span class="hide">상품안내</span></a>
									<div class="depth03" >
										<a href="/deductProduct/productInfo/manInfo.do" class="">대인배상</a>
										<a href="/deductProduct/productInfo/objectInfo.do" class="">대물배상</a>
										<a href="/deductProduct/productInfo/bodyAccInfo.do" class="">자기신체사고</a>
										<a href="/deductProduct/productInfo/practicianInfo.do" class="">종사자재해</a>
										<a href="/deductProduct/productInfo/myCarDamege.do" class="">자기차량손해</a>
										<a href="/deductProduct/productInfo/carryInfo.do" class="">적재물 배상</a>
										<a href="/deductProduct/productInfo/lawSupportInfo.do" class="">법률비용 지원특약</a>
										<a href="/deductProduct/productInfo/carSupportInfo.do" class="">긴급출동서비스 특약</a>										
										<a href="/deductProduct/productInfo/carAccInfo.do" class="" style="letter-spacing: -2px;">차대차사고 한정담보 특약</a>
										<c:forEach items="${deductList}" var="guide">
											<c:if test="${fn:substring(guide.UPPER_HP_MENU_NO,4,5) eq  '2'}">
												<a class="" href="/customboard/list.do?boardNo=${guide.HP_BOARD_MASTER_NO}&upperNo=${guide.UPPER_HP_MENU_NO}">${guide.MENU_NM}</a>
											</c:if>
										</c:forEach>
									</div>
								</li>
								<li class="subDep03 " ><a href="/deductProduct/guaranteeProduct.do"><span class="hide">보증상품</span></a>
									<div class="depth03" >
										<c:forEach items="${deductList}" var="cal">
											<c:if test="${fn:substring(cal.UPPER_HP_MENU_NO,4,5) eq  '3'}">
												<a class="" href="/customboard/list.do?boardNo=${cal.HP_BOARD_MASTER_NO}&upperNo=${cal.UPPER_HP_MENU_NO}">${cal.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Img1" href="/deductProduct/guaranteeProduct.do"><img src="/images/truck/dedu/gnb03_img1.gif" alt="분담금계산" /></a>
									</div>
								</li>
								<li class="subDep04 " ><a href="/deductProduct/compenInfo/amountCharge.do"><span class="hide">보상안내</span></a>
									<div class="depth03" >
										<a href="/deductProduct/compenInfo/amountCharge.do" class="">공제금청구안내</a>
										<a href="/deductProduct/compenInfo/amountPay.do" class="">공제금지급절차안내</a>
										<a href="/deductProduct/compenInfo/accProcc.do" class="">사고처리절차</a>
										<a href="/deductProduct/compenInfo/acciInfo.do" class="">교통사고처리요령</a>
										<a href="/deductProduct/compenInfo/indirectInfo.do" class="">간접손해금안내</a>
										<a href="/deductProduct/compenInfo/claimInfo.do" class="">직접청구권안내</a>
										<a href="/deductProduct/compenInfo/tempInfo.do" class="">가불금청구권안내</a>
										<a href="/deductProduct/compenInfo/medicalInfo.do" class="">진료비지급보증안내</a>
										<a href="/deductProduct/compenInfo/delayInfo.do" class="">공제금지급지연안내</a>
										<c:forEach items="${deductList}" var="comguide">
											<c:if test="${fn:substring(comguide.UPPER_HP_MENU_NO,4,5) eq  '4'}">
												<a class="" href="/customboard/list.do?boardNo=${comguide.HP_BOARD_MASTER_NO}&upperNo=${comguide.UPPER_HP_MENU_NO}">${comguide.MENU_NM}</a>
											</c:if>
										</c:forEach>
									</div>
								</li>
								<li class="subDep05 " ><a href="/deductProduct/dataCenter/insuranceKnowlege/injurGradeInfo.do"><span class="hide">보상관련정보</span></a>
									<div class="depth03" >
										<a href="/deductProduct/dataCenter/insuranceKnowlege/injurGradeInfo.do" class="">상해급수안내</a>
										<a href="/deductProduct/dataCenter/insuranceKnowlege/faultRate.do" class="">유형별과실비율</a>
										<a href="/deductProduct/dataCenter/insuranceKnowlege/greatNegligence.do" class="">12대중과실</a>
										<c:forEach items="${deductList}" var="comInfo">
											<c:if test="${fn:substring(comInfo.UPPER_HP_MENU_NO,4,5) eq  '5'}">
												<a class="" href="/customboard/list.do?boardNo=${comInfo.HP_BOARD_MASTER_NO}&upperNo=${comInfo.UPPER_HP_MENU_NO}">${comInfo.MENU_NM}</a>
											</c:if>
										</c:forEach>
									</div>
								</li>
								<li class="subDep06 " ><a href="/deductProduct/carDeductInfo.do"><span class="hide">공제약관</span></a>
									<div class="depth03" >
										<a href="/deductProduct/carDeductInfo.do" class="">자동차공제약관</a>
										<a href="/deductProduct/carryDeductInfo.do" class="">적재물공제약관</a>
										<c:forEach items="${deductList}" var="proInfo">
											<c:if test="${fn:substring(proInfo.UPPER_HP_MENU_NO,4,5) eq  '6'}">
												<a class="" href="/customboard/list.do?boardNo=${proInfo.HP_BOARD_MASTER_NO}&upperNo=${proInfo.UPPER_HP_MENU_NO}">${proInfo.MENU_NM}</a>
											</c:if>
										</c:forEach>
									</div>
								</li>
								<li class="subDep07 " ><a href="/deductProduct/callInfo.do"><span class="hide">콜센터안내</span></a>
									<div class="depth03" >
										<c:forEach items="${deductList}" var="call">
											<c:if test="${fn:substring(call.UPPER_HP_MENU_NO,4,5) eq  '7'}">
												<a class="" href="/customboard/list.do?boardNo=${call.HP_BOARD_MASTER_NO}&upperNo=${call.UPPER_HP_MENU_NO}">${call.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Img1"  href="/deductProduct/callInfo.do"><img src="/images/truck/dedu/gnb03_img2.gif" alt="콜센터안내" /></a>
									</div>
								</li>
							</ul>
						</li><!--// gnb1Dep03 공제상품 e -->
						<li class="gnb1Dep04 "><a class="menu4" href="/customer/customerIndex.do"><span class="hide">고객광장</span></a>
							<ul class="subList">
								<li class="subDep01 "><a href="/customer/qnaInfo.do"><span class="hide">문의안내</span></a>
									<div class="depth03" >
										<c:forEach items="${customList}" var="qnaGuide">
											<c:if test="${fn:substring(qnaGuide.UPPER_HP_MENU_NO,4,5) eq  '1'}">
												<a class="" href="/customboard/list.do?boardNo=${qnaGuide.HP_BOARD_MASTER_NO}&upperNo=${qnaGuide.UPPER_HP_MENU_NO}">${qnaGuide.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Txt" href="/customer/qnaInfo.do"><img src="/images/truck/cust/gnb04_txt1.gif" alt="고객님 편에서 보다 편리한 서비스와 만족을 드리겠습니다" /></a>
									</div>
								</li>
								<li class="subDep02 " ><a href="/customer/faqNoticeIndex.do"><span class="hide">자주하는질문</span></a>
									<div class="depth03">
										<c:forEach items="${customList}" var="faqInfo">
											<c:if test="${fn:substring(faqInfo.UPPER_HP_MENU_NO,4,5) eq  '2'}">
												<a class="" href="/customboard/list.do?boardNo=${faqInfo.HP_BOARD_MASTER_NO}&upperNo=${faqInfo.UPPER_HP_MENU_NO}">${faqInfo.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Img1" href="/customer/faqNoticeIndex.do"><img src="/images/truck/cust/gnb04_img1.gif" alt="자주하는질문" /></a>
									</div>
								</li>
								<li class="subDep03 " ><a href="/customer/inquiry/oaoInquiryIndex.do"><span class="hide">전자민원</span></a>
									<div class="depth03">
										<a href="/customer/inquiry/viewRegistBoard.do" class="">1:1문의</a>
										<a href="/customer/inquiry/oaoInquiryList.do" class="">문의결과확인</a>
										<!-- <a href="/customer/inquiry/oaoInquiryList2.do" class="">민원리스트</a> -->
										<c:forEach items="${customList}" var="oaoInfo">
											<c:if test="${fn:substring(oaoInfo.UPPER_HP_MENU_NO,4,5) eq  '3'}">
												<a class="" href="/customboard/list.do?boardNo=${oaoInfo.HP_BOARD_MASTER_NO}&upperNo=${oaoInfo.UPPER_HP_MENU_NO}">${oaoInfo.MENU_NM}</a>
											</c:if>
										</c:forEach>
									</div>
								</li>
								<li class="subDep04 " ><a href="/customer/praise/praiseListIndex.do"><span class="hide">칭찬합시다</span></a>
									<div class="depth03">
										<c:forEach items="${customList}" var="praise">
											<c:if test="${fn:substring(praise.UPPER_HP_MENU_NO,4,5) eq  '4'}">
												<a class="" href="/customboard/list.do?boardNo=${praise.HP_BOARD_MASTER_NO}&upperNo=${praise.UPPER_HP_MENU_NO}">${praise.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Img4" href="/customer/praise/praiseListIndex.do"><img src="/images/truck/cust/gnb04_img2.gif" alt="칭찬합시다" /></a>
									</div>
								</li>
								<li class="subDep05 " ><a href="/customer/formDataIndex.do"><span class="hide">자료실</span></a>
									<div class="depth03">
										<c:forEach items="${customList}" var="data">
											<c:if test="${fn:substring(data.UPPER_HP_MENU_NO,4,5) eq  '5'}">
												<a class="" href="/customboard/list.do?boardNo=${data.HP_BOARD_MASTER_NO}&upperNo=${data.UPPER_HP_MENU_NO}">${data.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Txt" href="/customer/formDataIndex.do"><img src="/images/truck/cust/gnb04_txt2.gif" alt="양식,관련문서등 필요한 자료를 검색해 보세요" /></a>
									</div>
								</li>
								<li class="subDep06 " ><a href="/customer/fraud/oaoFraudIndex.do""><span class="hide">보험사기</span></a>
									<div class="depth03">
										<a href="/customer/fraud/oaoFraudOper.do" class="">운영방안</a>
										<a href="/customer/fraud/viewRegistBoard.do" class="">제보하기</a>
										<a href="/customer/fraud/oaoFraudList.do" class="">제보결과확인</a>
										<a href="/customer/fraud/oaoFraudBounty.do" class="">신고포상금 지급기준</a>
										<c:forEach items="${customList}" var="data">
											<c:if test="${fn:substring(data.UPPER_HP_MENU_NO,4,5) eq  '6'}">
												<a class="" href="/customboard/list.do?boardNo=${data.HP_BOARD_MASTER_NO}&upperNo=${data.UPPER_HP_MENU_NO}">${data.MENU_NM}</a>
											</c:if>
										</c:forEach>
									</div>
								</li>
							</ul>
						</li><!--// gnb1Dep04 고객광장 e -->
						<li class="gnb1Dep05"><a class="menu5" href="/assocIntroduce/assocIntroduceIndex.do"><span class="hide">조합소개</span></a>
							<ul class="subList" >
								<li class="subDep01"><a href="/assocIntroduce/presidentGreeting.do"><span class="hide">인사말</span></a>
									<div class="depth03" >
										<c:forEach items="${assoList}" var="hello">
											<c:if test="${fn:substring(hello.UPPER_HP_MENU_NO,4,5) eq  '1'}">
												<a class="" href="/customboard/list.do?boardNo=${hello.HP_BOARD_MASTER_NO}&upperNo=${hello.UPPER_HP_MENU_NO}">${hello.MENU_NM}</a>
											</c:if>
										</c:forEach>
										<a class="depth03Txt" href="/assocIntroduce/presidentGreeting.do"><img src="/images/truck/asso/gnb05_txt.gif" alt="차와 고객을 위한 화물공제조합 소개입니다." /></a>
									</div>
								</li>
								<li class="subDep02 " ><a href="/assocIntroduce/introduce/vision.do"><span class="hide">공제조합 소개</span></a>
									<div class="depth03">
										<a href="/assocIntroduce/introduce/vision.do" class="">설립목적 및 비전</a>
										<a href="/assocIntroduce/introduce/history.do" class="">주요연혁</a>
										<a href="/assocIntroduce/introduce/organChart.do" class="">조직도</a>
										<a href="/assocIntroduce/steeringCommittee.do" class="">운영위원회</a>
										<a href="/assocIntroduce/introduce/ci.do" class="">CI소개</a>
										<a href="/assocIntroduce/introduce/manageInfoList.do" class="">재무상태표</a>
										<a href="/assocIntroduce/introduce/ordinance.do" class="">관련법령</a>	
										<c:forEach items="${assoList}" var="vision">
											<c:if test="${fn:substring(vision.UPPER_HP_MENU_NO,4,5) eq  '2'}">
												<a class="" href="/customboard/list.do?boardNo=${vision.HP_BOARD_MASTER_NO}&upperNo=${vision.UPPER_HP_MENU_NO}">${vision.MENU_NM}</a>
											</c:if>
										</c:forEach>									
									</div>
								</li>
								<li class="subDep03 " ><a href="/customer/cleanCenter/charter.do"><span class="hide">윤리경영</span></a>
									<div class="depth03" >
										<c:forEach items="${assoList}" var="charter">
											<c:if test="${fn:substring(charter.UPPER_HP_MENU_NO,4,5) eq  '3'}">
												<a class="" href="/customboard/list.do?boardNo=${charter.HP_BOARD_MASTER_NO}&upperNo=${charter.UPPER_HP_MENU_NO}">${charter.MENU_NM}</a>
											</c:if>
										</c:forEach>									
										<a class="depth03Img9" href="/customer/cleanCenter/charter.do"><img src="/images/truck/asso/gnb05_img3.gif" alt="윤리경영" /></a>
									</div>
								</li>
								<li class="subDep05 " ><a href="/assocIntroduce/recruit/recruitInfo.do"><span class="hide">채용안내</span></a>
									<div class="depth03" >
										<c:forEach items="${assoList}" var="recruit">
											<c:if test="${fn:substring(recruit.UPPER_HP_MENU_NO,4,5) eq  '4'}">
												<a class="" href="/customboard/list.do?boardNo=${recruit.HP_BOARD_MASTER_NO}&upperNo=${recruit.UPPER_HP_MENU_NO}">${recruit.MENU_NM}</a>
											</c:if>
										</c:forEach>									
										<a class="depth03Img1" href="/assocIntroduce/recruit/recruitInfo.do"><img src="/images/truck/asso/gnb05_img1.gif" alt="채용안내" /></a>
									</div>
								</li>
								<li class="subDep04 " ><a href="/assocIntroduce/office/officeInfo.do"><span class="hide">지부안내</span></a>
									<div class="depth03" >
										<c:forEach items="${assoList}" var="office">
											<c:if test="${fn:substring(office.UPPER_HP_MENU_NO,4,5) eq  '5'}">
												<a class="" href="/customboard/list.do?boardNo=${office.HP_BOARD_MASTER_NO}&upperNo=${office.UPPER_HP_MENU_NO}">${office.MENU_NM}</a>
											</c:if>
										</c:forEach>									
										<a class="depth03Txt" href="/assocIntroduce/office/officeInfo.do"><img src="/images/truck/asso/gnb05_txt2.gif" alt="화물공제조합의 지부위치와 주소를 자세하게 안내합니다" /></a>
									</div>
								</li>
								<li class="subDep06 " ><a href="/assocIntroduce/allRoughMap.do"><span class="hide">본부안내</span></a>
									<div class="depth03" >
										<c:forEach items="${assoList}" var="bonebu">
											<c:if test="${fn:substring(bonebu.UPPER_HP_MENU_NO,4,5) eq  '6'}">
												<a class="" href="/customboard/list.do?boardNo=${bonebu.HP_BOARD_MASTER_NO}&upperNo=${bonebu.UPPER_HP_MENU_NO}">${bonebu.MENU_NM}</a>
											</c:if>
										</c:forEach>						
										<a class="depth03Img8" href="/assocIntroduce/allRoughMap.do"><img src="/images/truck/asso/gnb05_img2.gif" alt="본부안내" /></a>
									</div>
								</li>
							</ul>
						</li><!--// gnb1Dep05 조합소개 e -->
						<li class="gnb1Dep06 "><a class="menu6" href="/cyberPr/cyberPrIndex.do"><span class="hide">사이버홍보관</span></a>
							<ul class="subList" >
								<li class="subDep01 "><a href="/cyberPr/thirtyHistory.do"><span class="hide">화물공제 30년사</span></a>
									<div class="depth03">
										<c:forEach items="${cyberList}" var="thirty">
											<c:if test="${fn:substring(thirty.UPPER_HP_MENU_NO,4,5) eq  '1'}">
												<a class="" href="/customboard/list.do?boardNo=${thirty.HP_BOARD_MASTER_NO}&upperNo=${thirty.UPPER_HP_MENU_NO}">${thirty.MENU_NM}</a>
											</c:if>
										</c:forEach>						
										<a class="depth03Txt" href="/cyberPr/thirtyHistory.do"><img src="/images/truck/cyber/gnb06_txt1.gif" alt="신뢰로 이어온 꿈과 미래 화물공제조합30년사" /></a>
									</div>
								</li>
								<li class="subDep02 "><a href="/cyberPr/driversDayIndex.do"><span class="hide">운전자의날</span></a>
									<div class="depth03">
										<c:forEach items="${cyberList}" var="driver">
											<c:if test="${fn:substring(driver.UPPER_HP_MENU_NO,4,5) eq  '2'}">
												<a class="" href="/customboard/list.do?boardNo=${driver.HP_BOARD_MASTER_NO}&upperNo=${driver.UPPER_HP_MENU_NO}">${driver.MENU_NM}</a>
											</c:if>
										</c:forEach>				
										<a class="depth03Txt" href="/cyberPr/driversDayIndex.do"><img src="/images/truck/cyber/gnb06_txt2.gif" alt="매년 10월 8일은 운전자의 날입니다.각종 행사를 담았습니다" /></a>
									</div>
								</li>
								<li class="subDep03 " ><a href="/cyberPr/accIndex.do"><span class="hide">사고예방활동</span></a>
									<div class="depth03">
										<c:forEach items="${cyberList}" var="acc">
											<c:if test="${fn:substring(acc.UPPER_HP_MENU_NO,4,5) eq  '3'}">
												<a class="" href="/customboard/list.do?boardNo=${acc.HP_BOARD_MASTER_NO}&upperNo=${acc.UPPER_HP_MENU_NO}">${acc.MENU_NM}</a>
											</c:if>
										</c:forEach>			
										<a class="depth03Txt" href="/cyberPr/accIndex.do"><img src="/images/truck/cyber/gnb06_txt3.gif" alt="우리조합에서는사업용 화물자동차의 교통사고 감소를 위한캠페인을 시행하고있습니다" /></a>
									</div>
								</li>
								<li class="subDep04 " ><a href="/cyberPr/echoIndex.do"><span class="hide">트럭메아리</span></a>
									<div class="depth03">
										<c:forEach items="${cyberList}" var="echo">
											<c:if test="${fn:substring(echo.UPPER_HP_MENU_NO,4,5) eq  '4'}">
												<a class="" href="/customboard/list.do?boardNo=${echo.HP_BOARD_MASTER_NO}&upperNo=${echo.UPPER_HP_MENU_NO}">${echo.MENU_NM}</a>
											</c:if>
										</c:forEach>			
										<a class="depth03Img1" href="/cyberPr/echoIndex.do"><img src="/images/truck/cyber/gnb06_img1.gif" alt="트럭메아리" /></a>
									</div>
								</li>
								<li class="subDep05 " ><a href="/cyberPr/eventIndex.do"><span class="hide">행사안내</span></a>
									<div class="depth03">
										<c:forEach items="${cyberList}" var="event">
											<c:if test="${fn:substring(event.UPPER_HP_MENU_NO,4,5) eq  '5'}">
												<a class="" href="/customboard/list.do?boardNo=${event.HP_BOARD_MASTER_NO}&upperNo=${event.UPPER_HP_MENU_NO}">${event.MENU_NM}</a>
											</c:if>
										</c:forEach>			
										<a class="depth03Txt" href="/cyberPr/eventIndex.do"><img src="/images/truck/cyber/gnb06_txt4.gif" alt="화물공제조합의 다양한 행사 갤러리" /></a>
									</div>
								</li>
								<li class="subDep06 " ><a href="/cyberPr/prMovieIndex.do"><span class="hide">홍보영상</span></a>
									<div class="depth03">
										<c:forEach items="${cyberList}" var="movie">
											<c:if test="${fn:substring(movie.UPPER_HP_MENU_NO,4,5) eq  '6'}">
												<a class="" href="/customboard/list.do?boardNo=${movie.HP_BOARD_MASTER_NO}&upperNo=${movie.UPPER_HP_MENU_NO}">${movie.MENU_NM}</a>
											</c:if>
										</c:forEach>			
										<a class="depth03Img1" href="/cyberPr/prMovieIndex.do"><img src="/images/truck/cyber/gnb06_img2.gif" alt="홍보영상" /></a>
									</div>
								</li>
							</ul>
						</li><!--// gnb1Dep06 사이버홍보관 e -->
					</ul>
					<!-- 컨트롤버튼 -->
					<a href="#;" title="메뉴열기버튼" class="btn_memuopen" ><span class="hide">메뉴열기</span></a>
					<!-- <a href="#;" title="메뉴를 고정시킵니다." class="btn_pause pause_on" ><span>고정</span></a> --><!-- 고정버튼 눌렀을 경우 class명 pause_on 추가 -->
					<a href="#;" title="메뉴를 닫습니다." class="btn_close" ><span>닫기</span></a>
				</div><!-- // gnb e -->
			</div>
		</div>
		<hr />

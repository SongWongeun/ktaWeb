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
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
$(document).ready(function(){
	var hash = location.hash;
	

	if(hash == '#tab1'){
		$("a[name='tab1']").trigger('click');	
	}else if(hash == '#tab2'){
		$("a[name='tab2']").trigger('click');		
	}	
});
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
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<!-- 20161130 삭제
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
						//20161130 삭제 -->
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
						<!-- 20161214 삭제 
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						//20161214 삭제 -->
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" method="post" action="">
						<fieldset>
						<legend>통합검색</legend>
							<input type="hidden" name="searchKeywordT"/>
							<span class="ut_search"><label for="">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
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
		<div id="container" >  
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
						<h2><img src="/images/truck/etc/privacy_tit.gif" alt="개인정보보호정책" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>개인정보보호정책</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/etc/privacy_con_tit.gif" alt="화물공제조합 웹사이트 개인정보보호정책입니다" /></p>
					<div>${result.ph_contents}</div><!--  2016.12.20 [HYEON] 추가 -->
					<!-- 개인정보처리방침 변경내용 테이블 2016.12.22 [HYEON] 추가-->
					<table class="tbDetail_st04" summary="개인정보처리방침 변경내용 테이블 입니다.">
						<caption>개인정보처리방침 변경내용</caption>
						<colgroup>
							<col style="width:30%;" />
							<col style="width:70%;" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">변경일자</th>
								<th scope="col">변경내용</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${changeInfo !=null}">
								<c:forEach var="change" items="${changeInfo}">
									<c:if test="${change.ph_chg_info != null}">
										<tr>
											<td class="alC">${change.ph_regDate}</td>
											<td class="alC">
												<a href="#" class="txtLine">${change.ph_chg_info}</a><br />
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<!-- //개인정보처리방침 변경내용 테이블 -->
					<%-- 2016.12.20 [HYEON] 주석처리함
					<div class="conSection">
						<!-- tabs s -->
						<div class="jointabs">
							<ul class="tabMenu">
								<li><a href="#tab1" name="tab1">개인정보 처리방침</a></li>
								<li><a href="#tab2" name="tab2">영상정보 처리기기 운영 · 관리 방침</a></li>
							</ul><!--// tabMenu e -->
							<div class="tabContainer">
								<!-- 공제계약 체결절차 -->
								<div id="tab1" class="tabCont">
									<div class="roundBox mB30">
										<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
										<div class="privacyDesc">
											<p>전국화물자동차운송사업연합회공제조합(이하 '공제조합'이라 함)이 취급하는 모든 개인정보는 개인정보보호법 등 관련 법령상의 개인정보보호 규정을 준수하여 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있으며, 이를 변경하는 경우에도 다음과 같이 공개하고 있습니다&#46;</p>
										</div>
										<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
									</div>
									<div class="userAgree">
										<div class="txtContent">
											<h3 class="etch3Tit">제1조 개인정보의 처리 목적</h3>
											<p class="txtPoint">공제조합은 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.</p>
											<p class="txtPoint">가. 공제계약의 체결 및 이행 등</p>
											<ul class="txtListst04">												
												<li>공제계약상담, 공제계약 체결 및 인수여부 결정 판단</li>
												<li>공제계약의 체결 · 유지 · 관리 · 상담 · 이행, 계약적부, 가불금의 지급 및 관리·상담· 이행, 공제금지급 · 심사, 공제 사고조사</li>
												<li>조사연구, 서비스 제공, 순공제요율의 산출, 검증</li>
												<li>공공기관 등의 정책 자료로 제공단</li>
												<li>공제계약 및 공제금 청구에 이해관계가 있는 자에 대한 법규 및 계약상 의무 이행</li>
												<li>공제계약 관련 분쟁 대응, 고객, 가불금수령자, 채권결손처분 해당자의 이력 관리</li>
												<li>제환급금 지급신청 처리업무를 포함한 공제계약 변경신청 처리</li>
												<li>계약정보, 공제금지급정보, 채권결손처분 관리정보의 조회</li>
											</ul>
											<p class="txtPoint">나. 직원 채용 및 인사관리</p>
											<ul class="txtListst04">												
												<li>입사지원 행정 처리 및 입사자 채용업무</li>
												<li>입사지원자 중 최종 입사자의 경우 근로계약의 체결 및 유지와 증명서 발급 및 입사 후 인력관리, 업무 분배, 기본급 · 상여금 · 수당 · 4대보험 · 휴가와 같은 복지 관련 사항의 처리 등 직원관리의 효율성 유지 · 제고</li>
												<li>인력관리(채용, 승진, 평가, 노무, 상벌), 업무분배(부서이동, 배치, 전보), 기본급 · 상여금 · 수당 · 사회보험 · 상해보험 · 신용보증보험 · 퇴직보험 · 휴가 등과 같은 복지 관련 사항의 처리 등 직원 관리의 효율성 유지 · 제고 및 근로계약상 의무의 준수, 증명서의 발급</li>
												<li>소득세 등 세금의 납부, 보건 · 안전의무, 불법적인 차별 없는 근무환경의 제공, 4대 보험 등 법정보험의 가입과 근로기준법 기타 고용관계 관련 법령의 준수, 균등한 처우 및 기회 제공, 보훈대상자 확인 및 처우제공, 외국인근로자 관련 법령 준수 등 조합에 부과되는 법적·행정적 의무의 준수</li>
												<li>보안 유지, 향상 및 점검</li>
												<li>퇴직자에 대한 증명서 발급</li>
												<li>개인 식별정보, 신용거래정보, 신용능력정보, 공공정보, 신용등급 등 조회</li>
											</ul>
											<p class="txtPoint">다. 복지사업 및 교통사고예방활동, 홍보 등에의 활용</p>
											<ul class="txtListst04">												
												<li>복지사업 시행(장학사업, 후방카메라 장착지원 사업) 및 교통사고예방활동(홍보단원 선정, 정부표창 대상자선정)</li>
												<li>회사의 상품·서비스 소개 및 교통안전 관련 안내(SMS, 우편 포함)</li>
											</ul>
										</div>
										<!-- 2 -->
										<div class="txtContent">
											<h3 class="etch4Tit">제2조 개인정보의 처리 및 보유 기간</h3>
											<p class="txtPoint">가. 공제조합은 법령에 따른 개인정보 보유 · 이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받는 개인정보 보유 · 이용기간, 공제조합 문서관리규정에 따른 보존기간 내에서 개인정보를 처리 · 보유합니다.</p>
											<p class="txtPoint">나. 공제조합에서 보유하고 있는 개인정보파일의 보유기간은 다음 각 호와 같습니다.</p>
											<ul class="txtListst04">												
												<li>운전자정보 : 거래종료일로부터 5년</li>
												<li>피해자정보 : 거래종료일로부터 5년</li>
												<li>피해물정보 : 거래종료일로부터 5년</li>
												<li>지급처정보 : 거래종료일로부터 5년</li>
												<li>피구상처정보 : 10년(민법 제162조)</li>
												<li>보상협력업체정보 : 거래종료일로부터 5년</li>
											</ul>
											<p class="txtPoint">다. (나)의 각 호에서 정하고 있는 '거래종료일'이란 공제계약 만기, 해지, 취소, 철회일 또는 소멸일, 공제금 청구권 소멸시효 완성일, 채권·채무관계 소멸일을 의미합니다. 다만, 만기 등 사유발생일 이후라도 만기환급금 또는 해지환급금 등을 수령하지 않았거나 상환할 금액이 남아있는 경우 및 공제금 지급이 진행 중이거나 수사·소송이 진행 중인 경우 거래종료로 보지 않습니다.</p>
										</div>
										<!-- 3 -->
										<div class="txtContent">
											<h3 class="etch4Tit">제3조 개인정보의 제3자 제공에 관한 사항</h3>
											<p class="txtPoint08">공제조합은 원칙적으로 이용자의 개인정보를 제1조 (개인정보의 처리 목적)에서 명시한 범위 내에서 처리하며, 이용자의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다. 단, 다음의 경우에는 개인정보를 처리할 수 있습니다. </p>
											<p class="txtPoint">가. 이용자가 사전에 제3자 제공 및 공개에 동의한 경우</p>
											<p class="txtPoint">나. 법령 등에 의해 제공이 요구되는 경우</p>
											<p class="txtPoint">다. 서비스의 제공에 관한 계약의 이행을 위하여 필요한 개인정보로서 경제적/기술적인 사유로 통상의 동의를 받는 것이 현저히 곤란한 경우</p>
											<p class="txtPoint">라. 개인을 식별하기에 특정할 수 없는 상태로 가공하여 이용하는 경우</p>
											<p class="txtPoint">마. 공제조합은 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</p>
											<p class="txtPoint">바. 제공대상 및 목적 이용기간</p>
											<ul class="txtListst04">
												<li>법률상 업무수행을 위한 개인(신용)정보 제공</li>
											</ul>
											<table class="tbDetail_st04" summary="법률상 업무수행을 위한 개인(신용)정보 제공 테이블 입니다.">
												<caption>법률상 업무수행을 위한 개인(신용)정보 제공</caption>
												<colgroup>
													<col style="width:20%;" />
													<col style="width:80%;" />
												</colgroup>
												<tbody>
													<tr>
														<td>제공받는 자</td>
														<td>법원, 검찰, 경찰, 국토교통부, 금융감독원</td>
													</tr>
													<tr>
														<td>제공 목적</td>
														<td>법률상 업무수행 및 공공기관의 정책자료로 제공</td>
													</tr>
													<tr>
														<td>제공 항목</td>
														<td>- 개인식별정보 (조합원의 성명, 주민등록번호, 주소, 전화번호)<br/>
															- 공제계약정보 (차량번호, 형식, 년식, 계약일시, 공제종목, 담보종목, 공제계약금액, 자기부담금 및 제할인·할증 적용과 특약계약사항)<br/>
															- 공제금지급정보 (사고일자, 사고내용, 공제금 청구일자, 지급일자, 지급액, 지급사유)</td>
													</tr>
													<tr class="bB2">
														<td>보유 · 이용기간</td>
														<td>제공 동의일로부터 개인(신용)정보의 제공 목적을 달성할 때 까지</td>
													</tr>
												</tbody>
											</table><!--// 법률상 업무수행을 위한 개인(신용)정보 제공에 관한 표 e -->
											<table class="tbDetail_st04" summary="법률상 업무수행을 위한 개인(신용)정보 제공 테이블 입니다.">
												<caption>법률상 업무수행을 위한 개인(신용)정보 제공</caption>
												<colgroup>
													<col style="width:20%;" />
													<col style="width:80%;" />
												</colgroup>
												<tbody>
													<tr>
														<td>제공받는 자</td>
														<td>의료기관 및 수리업체</td>
													</tr>
													<tr>
														<td>제공 목적</td>
														<td>피해자(물) 지불 보증</td>
													</tr>
													<tr>
														<td>제공 항목</td>
														<td>- 성명, 주민번호, 주소, 전화번호, 휴대전화번호, 차량번호</td>
													</tr>
													<tr class="bB2">
														<td>보유 · 이용기간</td>
														<td>정보제공 목적을 달성 할 때 까지</td>
													</tr>
												</tbody>
											</table><!--// 법률상 업무수행을 위한 개인(신용)정보 제공에 관한 표 e -->
											<table class="tbDetail_st04" summary="법률상 업무수행을 위한 개인(신용)정보 제공 테이블 입니다.">
												<caption>법률상 업무수행을 위한 개인(신용)정보 제공</caption>
												<colgroup>
													<col style="width:20%;" />
													<col style="width:80%;" />
												</colgroup>
												<tbody>
													<tr>
														<td>제공받는 자</td>
														<td>근로복지공단</td>
													</tr>
													<tr>
														<td>제공 목적</td>
														<td>산재보험 처리건 구상청구 공문에 대한 답변</td>
													</tr>
													<tr>
														<td>제공 항목</td>
														<td>- 성명, 주민번호, 공제금지급내역, 약관</td>
													</tr>
													<tr class="bB2">
														<td>보유 · 이용기간</td>
														<td>제공 기관의 목적이 달성 될 때 까지</td>
													</tr>
												</tbody>
											</table><!--// 법률상 업무수행을 위한 개인(신용)정보 제공에 관한 표 e -->
											<table class="tbDetail_st04" summary="법률상 업무수행을 위한 개인(신용)정보 제공 테이블 입니다.">
												<caption>법률상 업무수행을 위한 개인(신용)정보 제공</caption>
												<colgroup>
													<col style="width:20%;" />
													<col style="width:80%;" />
												</colgroup>
												<tbody>
													<tr>
														<td>제공받는 자</td>
														<td>자동차보험진료수가분쟁심의회</td>
													</tr>
													<tr>
														<td>제공 목적</td>
														<td>공제조합과 의료기관간의 진료비분쟁 조정</td>
													</tr>
													<tr>
														<td>제공 항목</td>
														<td>- 성명, 주민번호, 치료비내역서, 진단서</td>
													</tr>
													<tr class="bB2">
														<td>보유 · 이용기간</td>
														<td>분쟁 조정이 끝나고 심의회 결정을 수용할 때까지</td>
													</tr>
												</tbody>
											</table><!--// 법률상 업무수행을 위한 개인(신용)정보 제공에 관한 표 e -->
											
											<ul class="txtListst04">
												<li>계약목적 달성을 위한 개인(신용)정보 제공</li>
											</ul>
											<table class="tbDetail_st04" summary="계약목적 달성을 위한 개인(신용)정보 제공 테이블 입니다.">
												<caption>계약목적 달성을 위한 개인(신용)정보 제공</caption>
												<colgroup>
													<col style="width:20%;" />
													<col style="width:80%;" />
												</colgroup>
												<tbody>
													<tr>
														<td>제공받는 자</td>
														<td>손해보험사, 생명보험사, 공제사업자, 손해보험협회, 신용평가기관, 재보험사</td>
													</tr>
													<tr>
														<td>제공 목적</td>
														<td>공동인수, 재보험 업무 및 비례 보상 등 관련규정에 의한 계약 이행, 신용을 판단하기 위한 자료로 활용 </td>
													</tr>
													<tr>
														<td>제공 항목</td>
														<td>- 개인식별정보 (성명, 주민등록번호, 법인대표자명, 대표자 주민등록번호, 대표자 및 담당자 연락처, 대표자 및 담당자 이-메일)<br/>
															- 공제계약정보 (계약번호, 공제기간, 담보종목, 공제계약일자, 공제가입금액, 조합원사 정보)<br/>
															- 공제금지급정보 (사고일자, 사고내용, 공제금 청구일자, 지급일자, 지급액, 지급사유)</td>
													</tr>
													<tr class="bB2">
														<td>보유 · 이용기간</td>
														<td>제공 기관의 목적이 달성될 때까지</td>
													</tr>
												</tbody>
											</table><!--// 계약목적 달성을 위한 개인(신용)정보 제공에 관한 표 e -->
											<table class="tbDetail_st04" summary="계약목적 달성을 위한 개인(신용)정보 제공 테이블 입니다.">
												<caption>계약목적 달성을 위한 개인(신용)정보 제공</caption>
												<colgroup>
													<col style="width:20%;" />
													<col style="width:80%;" />
												</colgroup>
												<tbody>
													<tr>
														<td>제공받는 자</td>
														<td>보험개발원 등 보험업법상 보험요율산출 기관 </td>
													</tr>
													<tr>
														<td>제공 목적</td>
														<td>순분담금요율 산출 및 통계작성에 필요한 자료제공 등 보험업법이 정한 목적</td>
													</tr>
													<tr>
														<td>제공 항목</td>
														<td>- 개인식별정보 (성명, 주민번호, 공제금지급내역, 약관)<br/>
															- 공제계약정보 (계약번호, 공제기간, 담보종목, 공제계약일자, 공제가입금액, 피공제차량 정보, 조합원사 정보, 분담금, 자기부담금 및 제할인·할증과 특약가입사항)</td>
													</tr>
													<tr class="bB2">
														<td>보유 · 이용기간</td>
														<td>제공 기관의 목적이 달성될 때까지</td>
													</tr>
												</tbody>
											</table><!--// 계약목적 달성을 위한 개인(신용)정보 제공에 관한 표 e -->
											
											<ul class="txtListst04">
												<li>직원채용 및 인사관리를 위한 개인(신용)정보제공</li>
											</ul>
											<table class="tbDetail_st04" summary="직원채용 및 인사관리를 위한 개인(신용)정보제공 테이블 입니다.">
												<caption>직원채용 및 인사관리를 위한 개인(신용)정보제공</caption>
												<colgroup>
													<col style="width:20%;" />
													<col style="width:80%;" />
												</colgroup>
												<tbody>
													<tr>
														<td>제공받는 자</td>
														<td>고용노동부, 보훈청, 장애인공단, 국민연금공단, 국민건강보험공단, 근로복지공단, 급여정보에 관련된 금융기관, 국세청 등</td>
													</tr>
													<tr>
														<td>제공 목적</td>
														<td>기관별 법령에 따른 의무 이행</td>
													</tr>
													<tr>
														<td>제공 항목</td>
														<td>- 개인식별정보 (성명, 주민등록번호(외국인등록번호), 성별, 주소, 전화번호, 휴대전화번호, 전자우편주소)<br/>
															- 장애사항 (장애인여부, 장애유형, 장애등록번호, 장애인정일자, 장애등급)<br/>
															- 보훈사항 (보훈구분, 보훈번호, 관계, 보훈관청, 관할기관)<br/>
															- 학력사항 (최종학력, 전공)<br/>
															- 급여사항 (급/상여액, 계좌번호, 입사일, 퇴직금 기산일, 퇴직금 추계액)<br/>
															- 인사정보 (사번, 소속, 직위, 입사일, 퇴직일, 자격 사항, 징계내역, 포상내역, 발령내역 등)</td>
													</tr>
													<tr class="bB2">
														<td>보유 · 이용기간</td>
														<td>업무목적 달성 될 때 까지</td>
													</tr>
												</tbody>
											</table><!--// 직원채용 및 인사관리를 위한 개인(신용)정보제공에 관한 표 e -->
											
											<ul class="txtListst04">
												<li>복지사업 및 교통사고예방활동, 홍보를 위한 개인 정보제공</li>
											</ul>
											<table class="tbDetail_st04" summary="복지사업 및 교통사고예방활동, 홍보를 위한 개인 정보제공 테이블 입니다.">
												<caption>복지사업 및 교통사고예방활동, 홍보를 위한 개인 정보제공</caption>
												<colgroup>
													<col style="width:20%;" />
													<col style="width:80%;" />
												</colgroup>
												<tbody>
													<tr>
														<td>제공받는 자</td>
														<td>화물복지재단, 행정자치부, 국토교통부, 후방카메라 장착지원 업체</td>
													</tr>
													<tr>
														<td>제공 목적</td>
														<td>장학사업, 후방카메라 장착지원사업, 정부표창 시행</td>
													</tr>
													<tr>
														<td>제공 항목</td>
														<td>- 개인식별정보(성명, 주민등록번호, 주소, 전화번호, 휴대전화번호, 전자우편주소, 직업, 소속, 직위(직급) 등)<br/>
															- 공제계약정보(차량번호, 차량정보, 계약기간, 조합원사 정보)<br/>
															- 금융거래정보(거래은행, 계좌번호)<br/>
															- 장학사업, 후방카메라 장착지원사업, 정부표창 시행과 관련하여 확인이 필요한 정보(가구소득, 재산현황, 연소득, 운전경력, 수상경력 등)</td>
													</tr>
													<tr class="bB2">
														<td>보유 · 이용기간</td>
														<td>업무목적 달성 될 때 까지</td>
													</tr>
												</tbody>
											</table><!--// 복지사업 및 교통사고예방활동, 홍보를 위한 개인 정보제공에 관한 표 e -->
										</div>
										<!-- 4 -->
										<div class="txtContent">
											<h3 class="etch4Tit">제4조 개인정보처리의 위탁</h3>											
											<p class="txtPoint">가. 공제조합은 원칙적으로 이용자의 동의 없이 해당 개인정보의 처리를 타인에게 위탁하지 않습니다. 다만, 이용자의 동의를 받아 공제조합이 현재 개인정보 처리를 위탁하는 수탁자와 업무는 다음과 같습니다.</p>
											
											<table class="tbDetail_st04" summary="개인정보처리의 위탁 테이블 입니다.">
												<caption>개인정보처리의 위탁</caption>
												<colgroup>
													<col style="width:14%;" />
													<col style="width:12%;" />
													<col style="width:31%;" />
													<col style="width:34%;" />
													<col style="width:9%;" />
												</colgroup>
												<thead>
												<tr>
													<th scope="col">수탁 업체명</th>
													<th scope="col">연락처</th>
													<th scope="col">위탁업무(제공목적)</th>
													<th scope="col">제공항목</th>
													<th scope="col">보유기간</th>
												</tr>
											</thead>
												<tbody>
													<tr>
														<td>변호사</td>
														<td>별첨 1 참조</td>
														<td>법률자문, 소송수행</td>
														<td>성명,연락처,주민번호</td>
														<td></td>
													</tr>
													<tr>
														<td>손해사정업체 등</td>
														<td>별첨 2 참조</td>
														<td>손해사정 (차량외 피해물)</td>
														<td>성명,연락처,주민번호</td>
														<td></td>
													</tr>
													<tr>
														<td>교육업체</td>
														<td>별첨 2 참조</td>
														<td>컨설팅 및 교육</td>
														<td>성명,연락처,주민번호</td>
														<td></td>
													</tr>
													<tr>
														<td>마스터자동차</td>
														<td>02-590-7000</td>
														<td>차량고장 시 긴급출동 서비스 </td>
														<td>고객명,연락처,차량번호 </td>
														<td>업무완료시</td>
													</tr>
													<tr>
														<td>리카온</td>
														<td>1577-9551</td>
														<td>잔존물 매각</td>
														<td>수탁사 자체수집 </td>
														<td>업무완료시</td>
													</tr>
													<tr>
														<td>앤드와이즈</td>
														<td>070-7095-9794</td>
														<td>전자메일 안내 발송 유지보수</td>
														<td>-</td>
														<td>업무완료시</td>
													</tr>
													<tr>
														<td>건강보험심사평가원</td>
														<td>1644-2000</td>
														<td>자동차보험진료수가 심사업무</td>
														<td>성명,주민번호,성별 등 교통사고 피해자(환자) 관련정보</td>
														<td>업무완료시</td>
													</tr>
													<tr>
														<td>신한은행</td>
														<td>1577-4664</td>
														<td>화물자동차대출보증사업</td>
														<td>공제계약유무 및 조합원사 상호, 연락처, 차량번호</td>
														<td>업무완료시</td>
													</tr>
													<tr>
														<td>신한카드</td>
														<td>1688-7474</td>
														<td>화물자동차대출보증사업</td>
														<td>공제계약유무 및 조합원사 상호, 연락처, 차량번호</td>
														<td>업무완료시</td>
													</tr>
													<tr>
														<td>프린테크21</td>
														<td>02-468-3718</td>
														<td>표창장 제작 위탁</td>
														<td>성명, 회사명, 직위(직급)</td>
														<td>업무완료시</td>
													</tr>
													<tr>
														<td>CJ대한통운 택배</td>
														<td>1588-1255</td>
														<td>교통안전물품 및 표창장 발송 위탁</td>
														<td>성명, 주소, 연락처</td>
														<td>업무완료시</td>
													</tr>
													<tr>
														<td>행사대행 기획사</td>
														<td></td>
														<td>화물 운전자의 날 행사 진행 업무(표창대상자 관련)</td>
														<td>성명, 회사명, 직업, 직위(직급), 수상내역</td>
														<td>업무완료시</td>
													</tr>
													<tr>
														<td>굿어스</td>
														<td>02-508-8868</td>
														<td>DBMS유지보수 (Oracle)</td>
														<td>-</td>
														<td>-</td>
													</tr>
													<tr>
														<td>코니스밸리</td>
														<td>02-874-5513</td>
														<td>건강보험심사평가원 진료비위탁 연계시스템 관리</td>
														<td>-</td>
														<td>-</td>
													</tr>
													<tr>
														<td>에스넷 시스템즈</td>
														<td>02-3469-2994 </td>
														<td>네트워크시스템 장비 유지보수</td>
														<td>-</td>
														<td>-</td>
													</tr>
													<tr>
														<td>나온 소프트</td>
														<td>02-7500-7000</td>
														<td>그룹웨어 시스템 유지보수</td>
														<td>-</td>
														<td>-</td>
													</tr>
													<tr>
														<td>DMI시스템즈</td>
														<td>02-6900-8400</td>
														<td>서버 장비 유지보수</td>
														<td>-</td>
														<td>-</td>
													</tr>
													<tr>
														<td>JK솔루션</td>
														<td>02-2634-1116</td>
														<td>백업 시스템 유지보수</td>
														<td>-</td>
														<td>-</td>
													</tr>
													<tr>
														<td>데이터뱅크</td>
														<td>02-6404-8977</td>
														<td>DB 동기화 유지보수</td>
														<td>-</td>
														<td>-</td>
													</tr>
													<tr>
														<td>효성ITX</td>
														<td>02-2102-8470</td>
														<td>저장장치 유지보수</td>
														<td>-</td>
														<td>-</td>
													</tr>
													<tr>
														<td>웨어비즈</td>
														<td>02-2652-7986</td>
														<td>암호화, 접근제어 유지보수</td>
														<td>-</td>
														<td>-</td>
													</tr>
													<tr class="bB2">
														<td>슈어엠</td>
														<td>02-457-5396</td>
														<td>문자 안내 서비스 위탁</td>
														<td>-</td>
														<td>-</td>
													</tr>
												</tbody>
											</table><!--// 개인정보처리의 위탁에 관한 표 e -->
											
											<p class="txtPoint">나. 공제조합은 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적 · 관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리 · 감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</p>
											<p class="txtPoint">다. 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체 없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p>
										</div>
										<!-- 5 -->
										<div class="txtContent">
											<h3 class="etch4Tit">제5조 정보주체의 권리 · 의무 및 그 행사방법 </h3>
											<p class="txtPoint">가. 정보주체는 공제조합에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.</p>
											<ul class="txtListst04">
												<li>개인정보 열람요구</li>
												<li>오류 등이 있을 경우 정정 요구</li>
												<li>삭제요구</li>
												<li>처리정지 요구</li>
											</ul>
											<p class="txtPoint">나. 제1항에 따른 권리 행사는 공제조합에 대해 개인정보 보호법에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 공제조합은 이에 대해 지체 없이 조치하겠습니다.</p>
											<p class="txtPoint">다. 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 공제조합은 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</p>
											<p class="txtPoint">라. 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법에 따른 위임장을 제출하셔야 합니다.</p>
										</div>
										<!-- 6 -->
										<div class="txtContent">
											<h3 class="etch4Tit">제6조 처리하는 개인정보의 항목 작성 </h3>
											<p class="txtPoint">공제조합은 다음의 개인정보 항목을 처리하고 있습니다.</p>
											<p class="txtPoint">가. 수집항목</p>
											<p class="txtPoint11">1. 공제계약 체결 전 사전조회(신설)</p>											
											<ul class="txtListst04">
												<li>개인식별정보 (성명, 주민등록번호, 주소, 성별, 직업, 피공제차량 정보, 전화번호, 휴대전화번호, 전자우편주소, 법인대표자명, 대표자 주민등록번호, 대표자 및 담당자 연락처, 대표자 및 담당자 이-메일)</li>
											</ul>
											<p class="txtPoint11">2. 공제계약 체결 시</p>											
											<ul class="txtListst04">
												<li>개인식별정보 (성명, 주민등록번호, 주소, 성별, 직업, 전화번호, 휴대전화번호, 전자우편주소, 법인대표자명, 대표자 주민등록번호, 대표자 및 담당자 연락처, 대표자 및 담당자 이-메일)</li>
												<li>공제계약정보 (계약번호, 공제기간, 피공제 차량정보, 조합원사 정보, 공제종목, 담보종목, 공제계약일자, 공제가입금액, 분담금, 자기부담금 및 제할인,할증과 특약가입사항, 적용계약 유지여부, 계약해지시 그 내용 및 사유)</li>
												<li>공제금지급정보 (사고일자, 사고내용, 공제금 청구일자, 지급일자, 지급액, 지급사유)</li>
											</ul>
											<p class="txtPoint11">3. 공제금 지급 시 </p>											
											<ul class="txtListst04">
												<li>개인 식별정보(피해자 및 공제금 청구자 · 수령자의 성명, 주민등록번호, 주소, 성별, 직업, 전화번호, 휴대전화번호, 계좌번호)</li>
												<li>공제금지급 및 관리 정보(지급공제조합, 담당자 정보, 사고번호, 피해차량 정보, 피해차량 공제가입정보 · 담보 · 공제계약일자 · 공제가입금액 · 지급된 공제금 정보, 제출된 진단서와 관련한 정보, 제출된 경찰 조사결과와 관련한 정보(사고일자, 사고내용, 경찰서 접수번호 등), 공제금 청구일자, 지급일자, 지급액, 지급 사유)</li>
											</ul>
											<p class="txtPoint11">4. 가불금 지급 시 </p>											
											<ul class="txtListst04">
												<li>개인식별정보(피해자 및 가불금 청구자 · 수령자의 성명, 주민등록번호, 주소, 성별, 직업, 전화번호, 휴대전화번호, 계좌번호)</li>
												<li>가불금지급 및 관리 정보(지급공제조합, 담당자 정보, 사고번호, 피해차량 정보, 피해차량 공제가입종목 · 담보 · 공제계약일자 · 공제가입금액, 제출된 진단서와 관련한 정보, 제출된 경찰 조사결과와 관련한 정보(사고일자, 사고내용, 경찰서 접수번호 등), 가불금 청구일자, 지급일자, 지급액, 지급사유)</li>
											</ul>
											<p class="txtPoint11">5. 직원 채용 및 인사관리</p>											
											<ul class="txtListst04">
												<li>개인식별정보 (사진, 성명, 주민등록번호, 현주소, 전화번호, 휴대전화번호, 이메일 주소, 생년월일, 종교, 결혼일자, 취미 · 특기)</li>
												<li>민감정보 (개인병력(병가, 휴직) 관련 사항)</li>
												<li>병역사항 (구분, 군별, 병과, 계급, 복무기간, 군번, 입영일자, 전역일자, 미필사유)</li>
												<li>보훈대상사항 (여부)</li>
												<li>학력사항 (입학시기, 졸업시기, 학교명, 소재지, 졸업구분, 전공)</li>
												<li>가족사항 (가족관계, 성명, 생년월일, 학력, 동거여부, 근무처)</li>
												<li>자격사항 (자격내용, 취득일, 자격번호, 발령청)</li>
												<li>경력사항 (근무기간, 근무처, 근무부서, 직위, 소득사항, 담당업무)</li>
												<li>급여 등 지급을 위한 사항 (은행 및 계좌번호)</li>
											</ul>
											<p class="txtPoint">나. 수집방법</p>
											<p class="txtPoint11">1. 서면양식, 팩스, 전화, 이-메일</p>
										</div>
										<!-- 7 -->
										<div class="txtContent">
											<h3 class="etch4Tit">제7조 개인정보의 파기</h3>
											<p class="txtPoint">공제조합은 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체 없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.</p>
											<p class="txtPoint">가. 파기절차</p>
											<ul class="txtListst04">
												<li>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</li>
											</ul>
											<p class="txtPoint">나. 파기기한</p>
											<ul class="txtListst04">
												<li>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</li>
											</ul>
											<p class="txtPoint">다. 파기방법</p>
											<ul class="txtListst04">
												<li>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
											</ul>
										</div>
										<!-- 8 -->
										<div class="txtContent">
											<h3 class="etch4Tit">제8조 개인정보의 안전성 확보 조치 </h3>
											<p class="txtPoint08">공제조합은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다&#46;</p>
											<p class="txtPoint">가. 정기적인 자체 감사 실시</p>
											<ul class="txtListst04">
												<li>개인정보 취급 관련 안정성 확보를 위해 정기적으로 자체 감사를 실시하고 있습니다.</li>
											</ul>
											<p class="txtPoint">나. 개인정보 취급 직원의 최소화 및 교육</p>
											<ul class="txtListst04">
												<li>개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.</li>
											</ul>
											<p class="txtPoint">다. 내부관리계획의 수립 및 시행</p>
											<ul class="txtListst04">
												<li>개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</li>
											</ul>
											<p class="txtPoint">라. 해킹 등에 대비한 기술적 대책</p>
											<ul class="txtListst04">
												<li>공제조합은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</li>
											</ul>
											<p class="txtPoint">마. 개인정보의 암호화</p>
											<ul class="txtListst04">
												<li>이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</li>
											</ul>
											<p class="txtPoint">바. 접속기록의 보관 및 위변조 방지</p>
											<ul class="txtListst04">
												<li>개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.</li>
											</ul>
											<p class="txtPoint">사. 개인정보에 대한 접근 제한</p>
											<ul class="txtListst04">
												<li>개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</li>
											</ul>
											<p class="txtPoint">아. 문서보안을 위한 잠금장치 사용</p>
											<ul class="txtListst04">
												<li>개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.</li>
											</ul>
											<p class="txtPoint">자. 비인가자에 대한 출입 통제</p>
											<ul class="txtListst04">
												<li>개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</li>
											</ul>
											<p class="txtPoint">차. 권익침해 구제방법</p>
											<ul class="txtListst04">
												<li>개인정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다.</li>
											</ul>
											<p class="txtPoint">이 밖에 기타 개인정보침해의 신고 및 상담에 대하여는 아래의 기관에 문의하시기를 바랍니다.</p>
											<table class="tbDetail_st04" summary="복지사업 및 교통사고예방활동, 홍보를 위한 개인 정보제공 테이블 입니다.">
												<caption>복지사업 및 교통사고예방활동, 홍보를 위한 개인 정보제공</caption>
												<colgroup>
													<col style="width:45%;" />
													<col style="width:55%;" />
												</colgroup>
												<tbody>
													<tr>
														<td>개인정보침해신고센터</td>
														<td>- 전화 : 118<br/> 
															- URL : <a href ="http://privacy.kisa.or.kr" target="_blank">http://privacy.kisa.or.kr</a></td>
													</tr>
													<tr>
														<td>정보보호마크 인증위원회</td>
														<td>- 전화 : 02-550-9531<br/> 
															- URL : <a href ="http://www.eprivacy.or.kr" target="_blank">http://www.eprivacy.or.kr</a></td>
													</tr>
													<tr>
														<td>대검찰청 인터넷범죄수사센터</td>
														<td>- 전화 : 02-3480-2000 <br/> 
															- URL : <a href ="http://www.spo.go.kr" target="_blank">http://www.spo.go.kr</a></td>
													</tr>
													<tr class="bB2">
														<td>경찰청 사이버범죄수사대</td>
														<td>- 전화 : 1566-0112 <br/> 
															- URL : <a href ="http://www.ctrc.go.kr" target="_blank">http://www.ctrc.go.kr</a></td>
													</tr>
												</tbody>
											</table><!--// 복지사업 및 교통사고예방활동, 홍보를 위한 개인 정보제공에 관한 표 e -->
										</div>
											
										<!-- 9 -->
										<div class="txtContent">
											<h3 class="etch4Tit">제9조 개인정보보호 책임자</h3>
											<p class="txtPoint">가. 공제조합은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p>
											<p class="txtPoint">개인정보 보호책임자</p>
											<ul class="txtListst04">
												<li>직책 :  상무이사 </li>
												<li>연락처 : 02-3483-3700 </li>
												<li>팩스 : 02-3483-3900 </li>
											</ul>	
											
											<p class="txtPoint">개인정보보호 관리자(본부 부서장)</p>
											<table class="tbDetail_st04" summary="개인정보보호 관리자 정보제공 테이블 입니다.">
												<caption>개인정보보호 관리자 정보제공</caption>
												<colgroup>
													<col style="width:15%;" />
													<col style="width:25%;" />
													<col style="width:15%;" />
													<col style="width:25%;" />
													<col style="width:20%;" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col">부서명</th>
														<th scope="col">관리자</th>
														<th scope="col">연락처</th>
														<th scope="col">이메일</th>
														<th scope="col">관련업무</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>총무부</td>
														<td>김흥근 총무부장</td>
														<td>02-3483-3711</td>
														<td>korboy7@truck.or.kr</td>
														<td>총무/인사/재무</td>
													</tr>
													<tr>
														<td>기획부</td>
														<td>김철동 기획부장</td>
														<td>02-3483-3731</td>
														<td>kcdong@truck.or.kr </td>
														<td>계약/장학</td>
													</tr>
													<tr>
														<td>보상지도부</td>
														<td>오세현 보상지도부장</td>
														<td>02-3483-3761</td>
														<td>rioleeosh@truck.or.kr </td>
														<td>보상/소송/구상</td>
													</tr>
													<tr>
														<td>감사</td>
														<td>신기남 감사실장</td>
														<td>02-3483-3781</td>
														<td>skn3235@truck.or.kr </td>
														<td>감사</td>
													</tr>
													<tr class="bB2">
														<td>전산정보실</td>
														<td>김종원 전산정보실장</td>
														<td>02-3483-3801</td>
														<td>kim8457@truck.or.kr</td>
														<td>전산</td>
													</tr>
												</tbody>
											</table><!--// 복지사업 및 교통사고예방활동, 홍보를 위한 개인 정보제공에 관한 표 e -->
											<p class="txtPoint">나. 정보주체께서는 공제조합의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 공제조합은 정보주체의 문의에 대해 지체 없이 답변 및 처리해 드릴 것입니다.</p>
										</div>	
										<!-- 10 -->
										<div class="txtContent">
											<h3 class="etch4Tit">제10조 개인정보 처리방침 변경 </h3>
											<p class="txtPoint">이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
											<ul class="txtListst04">
												<li>개인정보 처리방침 버전번호 : V1.1</li>
												<li>개인정보 처리방침 시행일자 : 2016. 12. 1</li>
												<li>개인정보 처리방침 최종변경일자 : 2016. 12. 1</li>
											</ul>
										</div>
										
										<div class="btnboxL2"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/error/privacy_20160501.pdf" target="_blank">개인정보 처리방침 이전버전 확인(V0.5, 2016.05.01)</a></span></div>
											
										<div class="txtContent pB0">
											<div class="btnboxL"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/error/01lawyer.pdf" target="_blank">별첨 1. 변호사</a></span></div>
											<div class="btnboxL"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/error/02sonhe.pdf" target="_blank">별첨 2. 손해사정사 등</a></span></div>
											<div class="btnboxL2"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/error/03edu.pdf" target="_blank">별첨 3. 교육업체</a></span></div>
										</div>
									</div>
								</div>
								
								<!-- 공지사항 -->
								<div id="tab2" class="tabCont">
									<div class="roundBox mB30">
										<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
										<div class="privacyDesc">
											<p>전국화물자동차운송사업연합회공제조합(이하 “조합”이라 함)은 영상정보처리기기 운영․관리 방침을 통해 조합에서 처리하는 영상정보가</p>
											<p>어떠한 용도와 방식으로 이용․관리되고 있는지 알려드립니다.&#46;</p>
										</div>
										<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
									</div>
									<h3 class="hide">안내사항</h3>
									<div class="txtContent ">
										<h3 class="etch3Tit">1&#46; 영상정보처리기기 설치 근거 및 설치 목적</h3>
										<p class="txtPoint">조합은 개인정보보호법 제25조 제1항에 따라 다음과 같은 목적으로 영상정보처리기기를 설치․운영합니다.</p>
										<ul class="txtListst01">
											<li>시설안전 및 화재 예방, 고객의 안전을 위한 범죄 예방, 차량도난 및 파손방지(주차장)</li>
											<li>※ 주차대수 30대를 초과하는 규모의 경우 「주차장법 시행규칙」 제6조 제1항을 근거로 설치․운영 가능</li>
										</ul>
									</div>
									<div class="txtContent pB0">
										<h3 class="etch3Tit">2&#46; 설치 대수, 설치 위치 및 촬영범위</h3>
										<table class="tbDetail_st01" summary="분담금 적용상의 차종 구분 상세정보 테이블 입니다.">
											<caption>설치대수 및 위치에 관한 표</caption>
											<colgroup>
												<col style="width:30%;" />
												<col style="width:70%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">설치 대수</th>
													<th scope="col">설치 위치 및 촬영 범위</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>26대</td>
													<td>건물 각 층 로비 및 주차장, 건물 외부</td>
												</tr>
											</tbody>
										</table><!--// 설치대수 및 위치에 관한 표 e -->
									</div>
									<div class="txtContent pB0">
										<h3 class="etch3Tit">3&#46; 관리책임자 및 접근권한자</h3>
										<p class="txtPoint">귀하의 영상정보를 보호하고 개인영상정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인영상정보 보호책임자를 두고 있습니다.</p>
										<table class="tbDetail_st01" summary="관리책임자 및 접근권한자에 관한 표 입니다.">
											<caption>설치대수 및 위치에 관한 표</caption>
											<colgroup>
												<col style="width:15%;" />
												<col style="width:30%;" />
												<col style="width:15%;" />
												<col style="width:30%;" />
												<col style="width:10%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">구 분</th>
													<th scope="col">소 속</th>
													<th scope="col">직 위</th>
													<th scope="col">연 락 처</th>
													<th scope="col">비 고</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>관리책임자</td>
													<td>총무부</td>
													<td>부 장</td>
													<td>02-3483-3711</td>
													<td></td>
												</tr>
												<tr>
													<td rowspan="2">관리책임자</td>
													<td>총무과</td>
													<td>과 장</td>
													<td>02-3483-3713</td>
													<td></td>
												</tr>
												<tr>
													<td>총무과</td>
													<td>대리(사원)</td>
													<td>02-3483-3714</td>
													<td></td>
												</tr>
												<tr>
													<td rowspan="2" class="bB2">접근권한자</td>
													<td>㈜고암 화련회관(사)</td>
													<td>소 장</td>
													<td>02-3483-3842</td>
													<td></td>
												</tr>
												<tr>
													<td>㈜고암 화련회관(사)</td>
													<td>주임(기사)</td>
													<td>02-3483-3843</td>
													<td></td>
												</tr>
											</tbody>
										</table><!--// 설치대수 및 위치에 관한 표 e -->
									</div>
									<div class="txtContent pB0">
										<h3 class="etch3Tit">4&#46; 영상정보 촬영시간, 보관기간, 보관장소 및 처리방법</h3>
										<table class="tbDetail_st01" summary="영상정보 촬영시간, 보관기관, 보관장소에 관한 표입니다.">
											<caption>설치대수 및 위치에 관한 표</caption>
											<colgroup>
												<col style="width:30%;" />
												<col style="width:30%;" />
												<col style="width:40%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">촬영시간</th>
													<th scope="col">보관기간</th>
													<th scope="col">보관장소</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>24시간</td>
													<td>촬영일로부터 30일</td>
													<td>화련회관 방재실(B1층)</td>
												</tr>
											</tbody>
										</table><!--// 설치대수 및 위치에 관한 표 e -->
										<ul class="txtListst01">
											<li>처리방법 : 개인영상정보의 목적 외 이용, 제3자 제공, 파기, 열람 등 요구에 관한 사항을 기록․관리하고, 보관기간 만료시 복원이 불가능한 방법으로 영구 삭제(출력물의 경우 파쇄 또는 소각)합니다.</li>
										</ul>
									</div>
									<div class="txtContent pB0">
										<h3 class="etch3Tit">5&#46; 개인영상정보 확인 방법 및 장소에 관한 사항</h3>
										<ul class="txtListst01">
											<li>확인 방법 : 영상정보 관리책임자에게 미리 연락하고 조합에 방문하시면 확인 가능합니다.</li>
											<li>확인 장소 : 화련회관 방재실(B1층)</li>
										</ul>
									</div>
									<div class="txtContent pB0">
										<h3 class="etch3Tit">6&#46; 정보주체의 영상정보 열람 등 요구에 대한 조치</h3>
										<ul class="txtListst01">
											<li>귀하는 개인영상정보에 관하여 열람 또는 존재확인, 삭제를 원하는 경우 언제든지 영상정보처리기기 운영자에게 요구하실 수 있습니다. 단, 귀하가 촬영된 개인영상정보 및 명백히 정보주체의 급박한 생명, 신체, 재산의 이익을 위하여 필요한 개인영상정보에 한정됩니다.
   우리 조합은 개인영상정보에 관하여 열람 또는 존재확인, 삭제를 요구한 경우 지체 없이 필요한 조치를 취하겠습니다.</li>
										</ul>
									</div>
									<div class="txtContent pB0">
										<h3 class="etch3Tit">7&#46; 영상정보의 안전성 확보조치</h3>
										<ul class="txtListst01">
											<li>조합에서 처리하는 영상정보는 암호화 조치 등을 통하여 안전하게 관리되고 있습니다. 또한 조합은 개인영상정보보호를 위한 관리적 대책으로서 개인정보에 대한 접근 권한을 차등부여하고 있고, 개인영상정보의 위․변조 방지를 위하여 개인영상정보의 생성 일시, 열람시 열람 목적․열람자․열람 일시 등을 기록하여 관리하고 있습니다. 이 외에도 개인영상정보의 안전한 물리적 보관을 위하여 잠금장치를 설치하고 있습니다.</li>
										</ul>
									</div>
									<div class="txtContent pB0">
										<h3 class="etch3Tit">8&#46; 영상정보 처리기기 운영 관리방침 변경에 관한사항</h3>
										<ul class="txtListst01">
											<li>이 영상정보처리기기 운영․관리방침은 2016년 1월 1일에 제정되었으며 법령ㆍ정책 또는 보안기술의 변경에 따라 내용의 추가ㆍ삭제 및 수정이 있을 시에는 시행하기 최소 7일전에 당 기관 홈페이지를 통해 변경사유 및 내용 등을 공지하도록 하겠습니다.</li>
											<li>공고일자 : 2016년 1월 1일 / 시행일자 : 2016년 1월 1일</li>
										</ul>
									</div>
									<div class="txtContent pB0">
										<div class="btnboxL"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/error/person01.hwp">개인영상정보 관리대장</a></span></div>
										<div class="btnboxL"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/error/doc_dispose.hwp">문서 폐기처분철</a></span></div>
									</div>
									
									<div class="deduH5">2016. 1</div>
									<div class="deduH6">전국화물자동차공제조합</div>
								</div>
							</div><!--// tabContainer e -->
						</div><!--// tabs e -->
					</div> --%><!--// conSection e -->
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













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
<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function(){
	var hash = location.hash;
	

	if(hash == '#tab1'){
		$("a[name='tab1']").trigger('click');	
	}else if(hash == '#tab2'){
		$("a[name='tab2']").trigger('click');		
	}else if(hash == '#tab3'){
		$("a[name='tab3']").trigger('click');		
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
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
						<h2><img src="/images/truck/info/enco_tit.gif" alt="장학사업" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/infoLounge/infoLoungeIndex.do" >정보마당</a>
						<a href="/infoLounge/encourIndex.do" >장학사업</a>
						<span>장학사업안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/info/enco_con_tit.gif" alt="화물공제조합은 장학사업을 통해 따뜻한 나눔과 사랑을 실천하고 있습니다." /></p>				
					<div class="conSection">
					<!-- 장학사업 접수 일자 안내 -->
						<div class="supportQus2">
							<p>2016년 하반기 접수일정 : 8&#46;1&#40;월&#41; ~ 8&#46;26&#40;금&#41;</p>
						</div>
						<!-- tabs s -->
						<div class="tabs">
							<ul class="tabMenu">
								<li><a href="#tab1" name="tab1">지원자격 및 선발방법</a></li>
								<li><a href="#tab2" name="tab2">응모방법 및 유의사항</a></li>
								<li><a href="#tab3" name="tab3">제출서류안내</a></li>
							</ul><!--// tabMenu e -->
							
							<div class="tabContainer">
								<!-- 지원자격 및 선발방법 -->
								<div id="tab1" class="tabCont">
									<h3 class="hide">지원자격 및 선발방법</h3>
									<div class="txtContent">
										<h4 class="h4Tit">지원자격</h4>
										<p class="txtPoint">신청자</p>
										<ul class="txtListst01">
											<li>우리조합에 자동차공제 계약을 1년이상 유지하고 있는 차주&#44; 운전자&#44; 조합원사 직원 또는 자녀&#40;고등학생&#44; 대학생&#41;</li>
										</ul>
										<p class="txtPoint">장학금 지원대상자</p>
										<ul class="txtListst01">
											<li>고등학교 및 대학교에 재학 중인 화물자동차운전자&#44; 차주&#44; 조합원사 직원 또는 그 자녀</li>
											<!-- 교통사고로 사망 또는 후유장애를 입은 화물자동차운전자&#40;차주포함&#41;의 자녀 &#40;사고당시 우리조합에 자동차공제 계약을 유지하고 있었던 경우&#41; -->
											<li>공제계약 자동차 사고로 사망 또는 후유장애를 입어 더 이상 운전을 할 수 없는 화물공제 계약차량의 운전자 및 차주의 자녀<p>
											&#40;사고당시 우리조합에 공제계약을 유지하고 있었던경우&#41;
											</li>
										</ul>
									</div>
									<div class="txtContent pB0">
										<h4 class="h4Tit">선발방법</h4>
										<p class="txtPoint">일반전형</p>
										<ul class="txtListst01">
											<li>경제상황&#40;신청자의 부부합산&#41; &#58; 70&#37;</li>
											<li>학교성적&#40;수혜자&#41; &#58; 30&#37;</li>
										</ul>
										<p class="txtPoint">특별전형</p>
										<ul class="txtListst01">
											<li>국민기초생활수급자&#44; 차상위계층 복지급여 수급자는 우선 선발</li>
											<li>공제계약 중 자동차 사고로 운전자 사망 또는 후유장애로 운전을 할 수 없는 자의 자녀</li>
										</ul>
									</div>
								</div>
								<!-- 응모방법 및 유의사항 -->
								<div id="tab2" class="tabCont">
									<h3 class="hide">응모방법 및 유의사항</h3>
									<div class="txtContent ">
										<h4 class="h4Tit">응모방법</h4>
										<p class="txtPoint">장학금신청자는 자동차공제가 계약된 공제조합 지부에 신청서와 구비서류를 접수</p>
										<p class="txtPoint">방문 또는 우편을 통해 응모</p>
										<p class="txtPoint">우편접수는 접수마감일 도착분에 한함</p>
									</div>
									<div class="txtContent pB0">
										<h4 class="h4Tit">응모제한 및  유의사항</h4>
										<p class="txtPoint">화물공제조합 장학생으로 선발 된 후 2년이 경과하지 않은 자와 그 형제&#44; 자매</p>
										<ul class="txtListst01">
											<li>신청자가 수혜자인 경우 &#47; 수혜 후 1년이 경과하지 않은 수혜자의 자녀</li>
											<li>신청자 자녀가 수혜자인 경우 &#47; 수혜 후 1년이 경과하지 않은 수혜자의 형제자매</li>
										</ul>
										<p class="txtPoint">화물운전자 복지재단 장학생으로 선발된 후 2년이 경과하지 않는 자</p>
										<p class="txtPoint">신청일 현재 학생 신분을 유지하고 있지 아니한 자&#40;휴학자 포함&#41;</p>
										<p class="txtPoint">조합원사 대표 및 임원</p>
										<ul class="txtListst01">
											<li>개인사업자&#40;조합원사 대표&#41;가 실제 운전을 하고 있더라도 2대 이상 화물자동차를  소유하고 있는 경우는 조합원사 직원이 아니라 등기 임원으로 간주</li>
										</ul>
										<p class="txtPoint">직업전문학교, 평생학습기관&#40;학점은행제 등&#41;, 사관학교(학비 국비지원) 학생</p>
										<ul class="txtListst01">
											<li>초 &middot; 중등 교육법&#44; 고등교육법 제2조&#40;학교의 분류&#41; 상의 각 호의 학교만 인정</li>
											<li>국외소재 학교 학생</li>
										</ul>
									</div>
									
									<div class="txtContent">
										<h4 class="h4Tit"></h4>
										<h4 class="h4Tit">지부별 연락처 안내</h4>
										<table class="tbDetail_st01 mB0" summary="특별전형 추가서류 상세정보 테이블 입니다.">
											<caption>각 지부 담당부서 연락처 표</caption>
											<colgroup>
												<col style="width:12%;" />
												<col style="width:21%;" />
												<col style="width:12%;" />
												<col style="width:21%;" />
												<col style="width:12%;" />
												<col style="width:22%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">지부</th>
													<th scope="col">연락처</th>
													<th scope="col">지부</th>
													<th scope="col">연락처</th>
													<th scope="col">지부</th>
													<th scope="col">연락처</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>서울</td>
													<td>02)3433-8000</td>
													<td>부산</td>
													<td>051)464-3901</td>
													<td>대구</td>
													<td>053)585-2300</td>
												</tr>
												<tr>
													<td>인천</td>
													<td>032)890-9000</td>
													<td>대전</td>
													<td>042)867-3888</td>
													<td>울산</td>
													<td>052)257-9401</td>
												</tr>
												<tr>
													<td>경기</td>
													<td>031)242-3355</td>
													<td>강원</td>
													<td>033)253-3777</td>
													<td>충북</td>
													<td>043)220-0100</td>
												</tr>
												<tr>
													<td>충남</td>
													<td>041)630-2600</td>
													<td>전북</td>
													<td>063)250-3355</td>
													<td>전남</td>
													<td>062)526-3355</td>
												</tr>
												<tr>
													<td>경북</td>
													<td>053)751-9171</td>
													<td>경남</td>
													<td>055)239-6000</td>
													<td>직할</td>
													<td>02)774-9634</td>
												</tr>
												<tr>
													<td>제주</td>
													<td>064)753-8310</td>
													<td>경남 광주(사)</td>
													<td>062)268-3355</td>
													<td>본부</td>
													<td>02)3483-3755</td>
												</tr>
											</tbody>
										</table><!--// 특별전형 추가서류 e -->
										<p class="txtPoint02">신청자격 및 구비서류 등 궁금하신 사항은 각 지부로 문의하시기 바랍니다.</p>
									</div>
								</div>
								<!-- 제출서류안내 -->
								<div id="tab3" class="tabCont">
									<h3 class="hide">제출서류안내</h3>
									<div class="txtContent">
										<h4 class="h4Tit">일반전형&#44;특별전형 공통서류</h4>
										<table class="tbDetail_st01" summary="일반전형․특별전형 공통서류 상세정보 테이블 입니다.">
											<caption>일반전형․특별전형 공통서류안내에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:8%;" />
												<col style="width:19%;" />
												<col style="width:12%;" />
												<col style="width:20%;" />
												<col style="width:24%;" />
												<col style="width:17%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col">구분</th>
													<th scope="col" colspan="2">제출서류</th>
													<th scope="col">발급처</th>
													<th scope="col">명의</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td rowspan="10" class="bB2">공통</td>
													<td colspan="2">장학생 신청서</td>
													<td>&nbsp;</td>
													<td>신청인</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2">화물운송종사자격증명</td>
													<td>화물협회 or 교통안전공단</td>
													<td>신청인</td>
													<td>조합원사 직원제외</td>
												</tr>
												<tr>
													<td colspan="2">위 &middot; 수탁관리계약서</td>
													<td>소속회사</td>
													<td>신청인&#40;차주&#41;</td>
													<td>회사 원본 대조필</td>
												</tr>
												<tr>
													<td colspan="2">사업자등록증</td>
													<td>세무서</td>
													<td>신청인&#40;차주&#41;</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2">재직증명서</td>
													<td>소속회사</td>
													<td>신청인&#40;운전자&#44; 조합원사 직원&#41;</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td class="alL">가족관계증명서</td>
													<td rowspan="2">택1</td>
													<td rowspan="2">주민자차센터</td>
													<td rowspan="2">신청인</td>
													<td rowspan="2">신청인&#44;<br />학생관계확인서류</td>
												</tr>
												<tr>
													<td class="alL">주민등록등본</td>
												</tr>
												<tr>
													<td colspan="2">재학증명서</td>
													<td>소속학교</td>
													<td>학생</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2">예금통장사본</td>
													<td>은행</td>
													<td>신청인 or 학생</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2">개인&#40;신용&#41;정보 수집&#44; 이용&#44; 제공동의서</td>
													<td></td>
													<td>신청인, 학생</td>
													<td>&nbsp;</td>
												</tr>
											</tbody>
										</table><!--// 일반전형,특별전형 공통서류 e -->
									</div>
									<div class="txtContent">
										<h4 class="h4Tit">일반전형 추가서류</h4>
										<table class="tbDetail_st01" summary="일반전형 추가서류 상세정보 테이블 입니다.">
											<caption>일반전형 추가서류 안내에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:8%;" />
												<col style="width:7%;" />
												<col style="width:*%;" />
												<col style="width:7%;" />
												<col style="width:15%;" />
												<col style="width:15%;" />
												<col style="width:17%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" colspan="2">구분</th>
													<th scope="col" colspan="2">제출서류</th>
													<th scope="col">발급처</th>
													<th scope="col">명의</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="2">공통</td>
													<td colspan="2">전&#40;前&#41;학기 성적증명서</td>
													<td>&#40;前&#41;소속학교</td>
													<td>학생</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td rowspan="4">차주</td>
													<td>선택1</td>
													<td colspan="2">건강보험료 확인내역서</td>
													<td>국민건강보험공단</td>
													<td>차주&#44; 배우자</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td rowspan="3">선택2</td>
													<td colspan="2">소득금액증명원</td>
													<td>세무서</td>
													<td>차주&#44; 배우자</td>
													<td rowspan="3">건강보험료 부과내역서<br /> 미제출시</td>
												</tr>
												<tr>
													<td class="alL">재산세비과세증명서</td>
													<td rowspan="2">택1</td>
													<td>주민자치센터</td>
													<td>&#34;</td>
												</tr>
												<tr>
													<td class="alL">지방세 세목별 과세증명서</td>
													<td>&#34;</td>
													<td>&#34;</td>
												</tr>
												<tr>
													<td rowspan="3" colspan="2"  class="bB2">운전자&#44; 조합원사직원</td>
													<td colspan="2">근로소득원천징수영수증</td>
													<td>세무서</td>
													<td>운전자&#44; 직원&#44; 배우자</td>
													<td rowspan="3" class="bB2">&nbsp;</td>
												</tr>
												<tr>
													<td class="alL">재산세비과세증명서</td>
													<td rowspan="2" class="bB2">택1</td>
													<td>주민자치센터</td>
													<td>&#34;</td>
												</tr>
												<tr>
													<td class="alL"> 지방세 세목별 과세증명서</td>
													<td>&#34;</td>
													<td>&#34;</td>
												</tr>
											</tbody>
										</table><!--// 일반전형 추가서류 e -->
									</div>
									<div class="txtContent">
										<h4 class="h4Tit">특별전형 추가서류</h4>
										<table class="tbDetail_st01 mB0" summary="특별전형 추가서류 상세정보 테이블 입니다.">
											<caption>특별전형 추가서류 안내에 대해서 나타낸 표</caption>
											<colgroup>
												<col style="width:8%;" />
												<col style="width:38%;" />
												<col style="width:7%;" />
												<col style="width:15%;" />
												<col style="width:15%;" />
												<col style="width:17%;" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" >구분</th>
													<th scope="col" colspan="2">제출서류</th>
													<th scope="col">발급처</th>
													<th scope="col">명의</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td rowspan="8">특별전형 1</td>
													<td>국민기초생활수급자증명서</td>
													<td rowspan="8">택1</td>
													<td>주민자치센터</td>
													<td>부모&#44; 학생</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>아래 차상위계층 증명서류</td>
													<td>&#34;</td>
													<td>부모&#44; 학생</td>
													<td rowspan="2">만18세 미만 발급</td>
												</tr>
												<tr>
													<td>한부모가족증명서</td>
													<td>&#34;</td>
													<td>부모&#44; 학생</td>
												</tr>
												<tr>
													<td>장애인수당 대상자확인서</td>
													<td>&#34;</td>
													<td>부모&#44; 학생</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>자활근로자확인서</td>
													<td>&#34;</td>
													<td>부모&#44; 학생</td>
													<td>자활에 필요한 사업에<br />참가한 자</td>
												</tr>
												<tr>
													<td>요금감면 이동전화서비스신청용<br />감면대상증명서 또는 이동전화요금 감면<br />소득인정증명서</td>
													<td>&#34;</td>
													<td>부모&#44; 학생</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>복지대상자 급여&#40;변경&#41; 신청 결과통보서</td>
													<td>&#34;</td>
													<td>부모&#44; 학생</td>
													<td>결정내용이 &#34;보장적합&#34;인 경우만 인정</td>
												</tr>
												<tr>
													<td>차상위 본인부담 경감대상자증명서</td>
													<td>국민건강보험공단</td>
													<td>부모&#44; 학생</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td rowspan="3" class="bB2">특별전형 2<br>(운전자 사망, 후유장해)</br></td>
													<td colspan="2">자동차 공제계약 조회문</td>
													<td>공제조합</td>
													<td rowspan="3" class="bB2">신청인</td>
													<td rowspan="3" class="bB2">&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2">교통사고 사실 확인원</td>
													<td>지구대&#44; 경찰서</td>
												</tr>
												<tr>
													<td colspan="2">후유장해진단서&#44; 폐업사실 관계증명</td>
													<td>관련처</td>
												</tr>
											</tbody>
										</table><!--// 특별전형 추가서류 e -->
										<p class="txtPoint02">응모자는 공통 제출서류와 함께 일반&#44; 특별전형 중 한 분야 서류만 제출</p>
										<p class="txtPoint02">구비서류는 각 시&middot;도 지부에 문의</p>
									</div>
									<div class="txtContent pB0">
										<h4 class="h4Tit">입증 서류 제출 시 유의사항</h4>
										<p class="txtPoint">모든 서류은 원본 또는 원본대조필 한 서류 접수&#40;특히 위수탁관리계약서 사본은 조합원사 원본대조필을 필한 서류 접수&#41;</p>
										<p class="txtPoint">화물운송종사자격 증명</p>
										<ul class="txtListst01">
											<li>협회 발급본 필히 징구&#44; 불가피한 경우 교통안전공단 발급본 사본 징구</li>
										</ul>
										<p class="txtPoint">가족관계증명서</p>
										<ul class="txtListst01 pB0">
											<li>차주&#44; 운전자와 학생의 직계존비속관계 확인을 위해 차주&#44; 운전자&#44; 학생 기준의 가족관계증명서 징구&#44; 불가피한 경우 운전자&#44; 학생 주민등록등본&#40;주소이력 포함&#41; 징구</li>
										</ul>
										<p class="txtPoint02 pB20">주민등록등본의 경우 세대주가 신청인이 아닌 경우 신청인과 학생의 관계를 확인  하기 곤란함</p>
										<p class="txtPoint">개인&#40;신용&#41;정보 수집&middot;이용&middot;제공동의서</p>
										<ul class="txtListst01">
											<li>신청자가 자필 서명한 개인&#40;신용&#41;정보 수집&middot;이용&middot;제공동의서&#40;첨부서식&#41; 징구</li>
										</ul>
										<p class="txtPoint">전&#40;前&#41;학기 성적 증명서</p>
										<ul class="txtListst01">
											<li>前학기성적증명서는 상반기에는 전년도 2학기 성적증명서를&#44; 하반기에는 해당년도 1학기 성적증명서를 의미함</li>
										</ul>
										<p class="txtPoint">국민건강보험공단 보험료 확인내역서&#40;재산, 소득관련 증빙&#41;</p>
										<ul class="txtListst01">
											<li>재산&#44; 소득관련 증빙자료는 국민건강보험공단 보험료 확인내역서를 우선 징구</li>
											<li>불가피 한 경우 재산사항은 재산세비과세증명서&#44; 지방세 세목별 과세증명서 중 택일&#44; 소득사항은 소득금액증명원&#44; 근로소득원천징수영수증 중 택일 하여 제출</li>
										</ul>
									</div>
									<div class="txtContent pB0">
										<h4 class="h4Tit">제출서류 다운로드</h4>
										<div class="btnboxL"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/error/01request.hwp">장학생 신청서</a></span></div>
										<div class="btnboxL"><span class="btn_pack btn_type06 icon"><span class="han"></span><a href="/error/02agree.hwp">개인&#40;신용&#41;정보 수집&middot;이용&middot;제공 동의서</a></span></div>
									</div>
								</div>
							</div><!--// tabContainer e -->
						</div><!--// tabs e -->
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
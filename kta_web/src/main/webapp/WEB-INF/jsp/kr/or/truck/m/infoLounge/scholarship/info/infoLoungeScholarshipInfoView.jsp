<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path04">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/infoLounge/index.do">정보마당</a></li>
			<li><a href="/m/infoLounge/scholarship/info/view.do">장학사업</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i04"><img alt="장학사업" src="/images/m_truck/subtop/04top_2.png" /></li>
				<li class="txt01">화물공제조합은 장학사업을 통해 따뜻한 나눔과 사랑을 실천하고 있습니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="tabWrap">
			<!-- tab -->
			<div class="tabBox">
				<ul >
					<li class="on"><a href="/m/infoLounge/scholarship/info/view.do">장학사업안내</a></li>
					<li><a href="/m/infoLounge/scholarship/notice/list.do">장학사업공지</a></li>
					<li><a href="/m/infoLounge/scholarship/result/view.do">장학금지원내역</a></li>
				</ul>
			</div>
			<!-- tab contents -->
			<div class="tabCont">
				<h2 class="txtTit01">지원자격 및 선발방법</h2>
				<!-- 지원자격  -->
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>지원자격</h3>
					<ul>
						<li class="line"><em>신청자</em><span class="bulSt01">우리조합에 자동차공제 계약을 유지하고 있는 차주, 운전자, 조합원사 직원</span></li>
						<li><em>장학금 지원대상자</em><span class="bulSt01">고등학교 및 대학교에 재학 중인 화물자동차운전자, 차주, 조합원사 직원 및 그 자녀</span></li>
						<li><span class="bulSt01">교통사고로 사망 또는 후유장애를 입은 화물자동차운전자(차주포함)의 자녀 (사고당시 우리조합에 자동차공제 계약을 유지하고 있었던 경우)</span></li>
					</ul>
				</div><!--// 라운드 박스 컨텐츠 -->
				<!-- 선발방법 -->
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>선발방법</h3>
					<ul>
						<li><em>일반전형</em><span class="bulSt01">경제상황(신청자 / 부부합산) : 70%</span></li>
						<li class="line"><span class="bulSt01">학교성적(수혜자) : 30%</span></li>
						<li><em>특별전형</em><span class="bulSt01">국민기초생활수급자, 차상위계층 복지급여수급자는 우선 선발</span></li>
					</ul>
				</div><!--// 라운드 박스 컨텐츠 -->
				<h2 class="txtTit01">응모방법 및 유의사항</h2>
				<!-- 응모방법 -->
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>응모방법</h3>
					<ul class="pt14">
						<li><span class="bulSt01">장학금신청자는 자동차공제가 계약된 공제조합 지부에 신청서와 구비서류를 접수</span></li>
						<li><span class="bulSt01">방문 또는 우편을 통해 응모</span></li>
						<li><span class="bulSt01">우편접수는 접수마감일 도착분에 한함</span></li>
					</ul>
				</div><!--// 라운드 박스 컨텐츠 -->
				<!-- 응모제한 및  유의사항 -->
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>응모제한 및  유의사항</h3>
					<ul>
						<li><em>화물공제조합 장학생으로 선발 된 후 2년이 경과하지 않은 자와 그 형제, 자매</em><span class="bulSt01">신청자가 수혜자인 경우 : 수혜 후 1년이 경과하지 않은 수혜자의 자녀</span></li>
						<li class="line"><span class="bulSt01">신청자 자녀가 수혜자인 경우 : 수혜 후 1년이 경과하지 않은 수혜자의 형제자매</span></li>
						<li class="line"><em class="pb0">화물운전자 복지재단 장학생으로 선발된 후 2년이 경과하지 않는 자</em></li>
						<li class="line"><em class="pb0">신청일 현재 학생 신분을 유지하고 있지 아니한 자(휴학자 포함)</em></li>
						<li class="line"><em>조합원사 대표 및 임원 제외</em><span class="bulSt01">개인사업자(조합원사 대표)가 실제 운전을 하고 있더라도 2대 이상 화물자동차를  소유하고 있는 경우는 조합원사 직원이 아니라 등기 임원으로 간주 제외</span></li>
						<li><em>직업전문학교, 평생학습기관(학점은행제 등) 학생 제외</em><span class="bulSt01">초․중등 교육법, 고등교육법 제2조(학교의 분류) 상의 각 호의 학교만 인정</span></li>
						<li><span class="bulSt01">국외소재 학교 학생 제외</span></li>
					</ul>
				</div><!--// 라운드 박스 컨텐츠 -->
				<h2 class="txtTit01">제출서류안내</h2>
				<!-- 일반전형 특별전형 공통서류 -->
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>일반전형 특별전형 공통서류</h3>
					<div class="tableBox">
						<table class="tbSt01" summary="일반전형 특별전형 공통서류">
							<caption>일반전형 특별전형 공통서류</caption>
							<colgroup>
								<col style="width:50%;" />
								<col style="width:40%;" />
								<col style="width:10%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" colspan="3" class="lineNo">제출서류</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="lineNo">장학생 신청서</td>
									<td>가족관계증명서</td>
									<td rowspan="2">택1</td>
								</tr>
								<tr>
									<td class="lineNo">화물운송종사자격증</td>
									<td>주민등록등본</td>
								</tr>
								<tr>
									<td class="lineNo">위·수탁관리계약서</td>
									<td colspan="2">재학증명서</td>
								</tr>
								<tr>
									<td class="lineNo">사업자등록증</td>
									<td colspan="2">예금통장사본</td>
								</tr>
								<tr>
									<td class="lineNo">재직증명서</td>
									<td colspan="2">개인(신용)정보수집, 이용, 제공동의서</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div><!--// 라운드 박스 컨텐츠 -->
				<!-- 일반전형  제출서류 -->
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>일반전형 제출서류</h3>
					<div class="tableBox">
						<table class="tbSt01" summary="일반전형  제출서류">
							<caption>일반전형 제출서류</caption>
							<colgroup>
								<col style="width:15%;" />
								<col style="width:15%;" />
								<col style="width:60%;" />
								<col style="width:10%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" colspan="2" class="lineNo">구분</th>
									<th scope="col" colspan="2" >제출서류</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2" class="lineNo">공통</td>
									<td colspan="2" >전(前)학기 성적증명서</td>
								</tr>
								<tr>
									<td rowspan="4" class="lineNo">차주</td>
									<td>선택1</td>
									<td colspan="2" >건강보험료 부과내역서</td>
								</tr>
								<tr>
									<td rowspan="3" class="lineNo">선택2</td>
									<td colspan="2" >소득금액증명원</td>
								</tr>
								<tr>
									<td class="lineNo">재산세비과세증명서</td>
									<td rowspan="2" >택1</td>
								</tr>
								<tr>
									<td class="lineNo">지방세 세목별 과세증명서</td>
								</tr>
								<tr>
									<td colspan="2" rowspan="3" class="lineNo">운전자,<br/>조합원사직원</td>
									<td colspan="2" >근로소득원천징수증명원</td>
								</tr>
								<tr>
									<td class="lineNo">재산세비과세증명서</td>
									<td rowspan="2" >택1</td>
								</tr>
								<tr>
									<td class="lineNo">지방세 세목별 과세증명서</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div><!--// 라운드 박스 컨텐츠 -->
				<!-- 특별전형  제출서류 -->
				<div class="txtGrabox">
					<h3 class="txtTit02"><i class="icon-chevron-right"></i>특별전형  제출서류</h3>
					<div class="tableBox">
						<table class="tbSt01" summary="특별전형  제출서류">
							<caption>특별전형  제출서류</caption>
							<colgroup>
								<col style="width:20%;" />
								<col style="width:70%;" />
								<col style="width:10%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="lineNo">구분</th>
									<th scope="col" colspan="2" >제출서류</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td rowspan="8" class="lineNo">특별전형</td>
									<td>국민기초생활수급자증명서</td>
									<td rowspan="8">택1</td>
								</tr>
								<tr>
									<td>아래 차상위계층 증명서류</td>
								</tr>
								<tr>
									<td>한부모가족증명서</td>
								</tr>
								<tr>
									<td>장애인수당 대상자확인서</td>
								</tr>
								<tr>
									<td>자활근로자확인서</td>
								</tr>
								<tr>
									<td>요금감면 이동전화서비스신청용 감면대상증명서 또는 이동전화요금 감면 소득인정증명서</td>
								</tr>
								<tr>
									<td>복지대상자 급여(변경) 신청 결과통보서</td>
								</tr>
								<tr>
									<td>차상위 본인부담 경감대상자증명서</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div><!--// 라운드 박스 컨텐츠 -->
			</div>
		</article><!--// tabWrap -->
		<article class="contentFoot">
			<p class="bulSt02">장학금을 신청하셨나요?</p>
			<ul class="questBox liSt01">
				<li><a href="/m/customer/inquiry/mtm/regist.do"><strong>장학사업</strong>문의</a></li>
				<li><a href="/m/infoLounge/scholarship/result/view.do"><strong>지원내역</strong>확인</a></li>
			</ul>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>







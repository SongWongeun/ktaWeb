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
	<section id="location" class="path05">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/compensationInfo/index.do">보상안내</a></li>
			<li><a href="/m/compensationInfo/accidentProcess/manObject/view.do">사고처리절차</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i05"><img alt="보상안내" src="/images/m_truck/subtop/05top_1.png" /></li>
				<li class="txt01">사고 발생 시 신속히 보상 받을 수 있는 절차 등 상세한 내용을 제공해 드립니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="tabWrap">
			<!-- tab -->
			<div class="tabBox02">
				<ul >
					<li><a href="/m/compensationInfo/accidentProcess/manObject/view.do">대인 &#183; 대물사고 처리절차</a></li>
					<li class="on"><a href="/m/compensationInfo/accidentProcess/carry/view.do">적재물 사고처리 절차</a></li>
				</ul>
			</div>
			<!-- tab contents -->
			<div class="tabCont">
				<ul class="stepLine">
					<li><div class="noLine"><p class="no">1</p><p class="noTxt">사고발생</p></div></li>
					<li>
						<div class="noLine"><p class="no">2</p><p class="noTxt">사고접수</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">우리조합에 직접접수<br/>(조합원사 또는 운전자)</li>
								<li class="bulSt01">24시간 사고접수 및 현장출동 서비스 활용<br/>1577-8278<a href="tel:1577-8278" class="btn_call"><img src="/images/m_truck/com/btn_call.png" alt-="전화연결" /></a></li>
							</ul>
						</div>
					</li>
					<li>
						<div class="noLine"><p class="no">3</p><p class="noTxt">사고조사</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">경찰신고 유무 확인
									<ul>
										<li>경찰 신고 건은 관할 경찰서 방문 사고기록 열람</li>
									</ul>
								</li>
								<li class="bulSt01">현장조사</li>
								<li class="bulSt01">가&#183;피해자 면담 및 사고 진술서 징구</li>
								<li class="bulSt01">면부책 검토</li>
								<li class="bulSt01">과실비율 책정
									<ul>
										<li>별도로 정한 자동차 사고 과실비율의 인정기준에 따라 적용하며 사고유형이 동 기준에 없거나 동기준에 의한 과실비율의 적용이 곤란할 때에는 판결 사례를 참작하여 적용함.
										(소송이 제기되었을 경우에는 확정 판결에 의한 과실비율을 적용)</li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="noLine"><p class="no">4</p><p class="noTxt">피해물<br/>(적재물)<br/>조사</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">피해물(적재물) 조사
									<ul>
										<li>- 피해물(적재물) 소유자 및 관리주체 인적사항 파악</li>
										<li>- 피해물(적재물) 파손 정도 확인</li>
									</ul>
								</li>
								<li class="bulSt01">구상권등 종합적 검토</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="noLine"><p class="no">5</p><p class="noTxt">피해물<br/>(적재물)<br/>관리</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">보상절차 및 구비서류 안내</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="noLine"><p class="no">6</p><p class="noTxt">손해사정</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">구비서류 완비</li>
								<li class="bulSt01">손해액 산정</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="noLine"><p class="no">7</p><p class="noTxt">공제금<br/>지급</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">조합원 및 화주에게 안내</li>
								<li class="bulSt01">공제금 지급 통보</li>
								<li class="bulSt01">재보험 처리 및 구상발생건 등 조치</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</article><!--// tabWrap -->
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>










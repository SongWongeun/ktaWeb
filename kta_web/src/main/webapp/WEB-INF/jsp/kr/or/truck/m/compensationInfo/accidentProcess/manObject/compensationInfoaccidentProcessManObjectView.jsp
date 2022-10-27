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
					<li class="on"><a href="/m/compensationInfo/accidentProcess/manObject/view.do">대인 &#183; 대물사고 처리절차</a></li>
					<li><a href="/m/compensationInfo/accidentProcess/carry/view.do">적재물 사고처리 절차</a></li>
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
								<li class="bulSt01">현장조사
									<ul>
										<li>- 도로형태 및 사고 상황 조사</li>
										<li>- 목격자 조사</li>
									</ul>
								</li>
								<li class="bulSt01">가&#183;피해자 면담 및 사고 진술서 징구</li>
								<li class="bulSt01">과실비율 책정
									<ul>
										<li>별도로 정한 자동차사고 과실비율의 인정기준에 따라 적용하며 사고유형이동 기준에 없거나 동 기준에 의한 과실비율의 적용이 곤란할 때에는 판결례를 참작하여 적용함.
										(소송이 제기되었을 경우에는 확정 판결에 의한 과실비율을 적용)</li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="noLine"><p class="no">4</p><p class="noTxt">피해자(물)<br/>조사</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">피해자 조사
									<ul>
										<li>- 인적사항 파악</li>
										<li>- 부상정도 및 치료병원 확인</li>
										<li>- 소득관련 내용 파악</li>
									</ul>
								</li>
								<li class="bulSt01">피해물(차량) 조사
									<ul>
										<li>- 피해물(차량) 소유자 및 운전자 인적 사항 파악</li>
										<li>- 피해물(차량) 파손 정도 및 수리공장 확인</li>
									</ul>
								</li>
								<li class="bulSt01">차량 이외 피해물 조사
									<ul>
										<li>- 소유자 및 관리주체 인적사항 파악</li>
										<li>- 피해물 파손 정도 확인</li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="noLine"><p class="no">5</p><p class="noTxt">피해자(물)<br/>관리</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">피해자
									<ul>
										<li>치료병원에 치료비 지불보증 및 피해자에 대한 관리</li>
									</ul>
								</li>
								<li class="bulSt01">피해물(차량)
									<ul>
										<li>- 수리공장에 수리비 지불 보증 및 수리완료 여부 관리</li>
										<li>- 렌트 사용시 대차료 지불 보증</li>
									</ul>
								</li>
								<li class="bulSt01">차량 이외 피해물
									<ul>
										<li>원상복구 업체에 공제금 지불보증 및 복구완료 여부 관리</li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="noLine"><p class="no">6</p><p class="noTxt">진료비<br/>심사 및<br/>청구비용<br/>손해사정</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">진료비
									<ul>
										<li>청구진료비에 대한 심사<br/>(의료심사 담당 직원 및 대인보상 직원)<br/>(진료비 분쟁시 자동차보험료수가 분쟁 심의회 조정)</li>
									</ul>
								</li>
								<li class="bulSt01">차량 및 차량이외 피해물
									<ul>
										<li>청구비용에 대한 손해사정<br/>(손해사정사 위탁 처리 및 대물보상 직원)</li>
									</ul>
								</li>
								<li class="bulSt01">차량 이외 피해물
									<ul>
										<li>원상복구 업체에 공제금 지불보증 및 복구완료 여부 관리</li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<div class="noLine"><p class="no">7</p><p class="noTxt">공제금<br/>산출</p></div>
						<div class="subject">
							<ul>
								<li class="bulSt01">자동차공제약관 지급기준 및 보상실무지침에 의거 공제금 산출(보상담당자 산출)</li>
							</ul>
						</div>
					</li>
					<li><div class="noLine"><p class="no">8</p><p class="noTxt">공제금<br/>지급</p></div></li>
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










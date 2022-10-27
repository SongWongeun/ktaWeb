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
						<h2><img src="/images/truck/dedu/acciinfo_tit.gif" alt="교통사고 처리요령 안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/compenInfo/amountCharge.do" >보상안내</a>
						<span>교통사고 처리요령 안내</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/acciinfo_con_tit.gif" alt="교통사고 처리요령 안내 입니다." /></p>				
					<div class="conSection">
						<!-- 대인배상 I -->
						<h3 class="deduh3Tit prodBg">교통사고 처리요령 안내</h3>
						<!--  보장 금액 -->
						<div class="txtContent2">
							</br>
							<h4 class="decuh4Tit">1. 불의의 사고를 내거나 당하게 되더라도 당황하지 말고 침착해야 합니다.</h4>
							<p class="txtPoint">사고는 예기치 않는 순간에 발생하기 때문에 노련한 운전자라도 순간 당황하는 것은 마찬가지입니다.</p>
							</br></br>
							<h4 class="decuh4Tit">2. 사고 차량을 즉시 정차시키고 사상자의 구호 등 적절한 조치를 하십시오.</h4>
							<p class="txtPoint">사고 발생 시 가능한 그 자리에 (교차로 등 교통이 혼잡한 곳이면 인접한 안전 장소로 이동하십시오) 사고 차량을 정차시킨 후 사상자의 지혈, 응급조치와 병원 후송 등 적절한 구호 조치를 해야 합니다. 만약 당황하여 현장을 이탈할 경우 뺑소니 등의 오해 소지가 있으므로 즉시 정차하는 것이 좋습니다.</p>
							</br></br>
							<h4 class="decuh4Tit">3. 후속 사고의 발생방지와 교통 소통에 지장이 없도록 필요한 조치를 해야 합니다.</h4>
							<p class="txtPoint">사고 차량을 움직일 수 있을 때는 후행 차량의 소통에 방해가 되지 않도록 신속히 갓길로 이동하고, 움직일 수 없는 경우에는 안전표지판 등을 설치하여 추가 교통사고가 발생하지 않도록 조치하여야 합니다.</p>
							</br></br>
							<h4 class="decuh4Tit">4. 사고 사상자 구호, 사상자 구호에 어려움이 있을 때는 경찰서에 바로 신고하십시오.</h4>
							<p class="txtPoint">이때 신고 내용은 사고장소, 사상자수, 부상의 정도, 손상된 물건, 손상의 정도 등 사고와 관련된 조치사항입니다.</p>
							</br></br>
							<h4 class="decuh4Tit">5. 사고 차량의 네 바퀴 밑과 노면 흔적 등에 스프레이로 현장 상황을 표시해 둡니다.</h4>
							<p class="txtPoint">사고 차량의 최종 위치와 노면 흔적, 유류품의 위치는 사고조사 과정에서 본인의 주장을 입증하는 증거자료가 됩니다.</p>
							</br></br>
							<h4 class="decuh4Tit">6. 사고장면을 목격한 목격자를 확보해야 합니다.</h4>
							<p class="txtPoint">직접 목격자의 확보가 어려운 상황이면 사고 주변 상황, 즉 주위 다른 차량의 차량번호 등을 파악하여 사고조사 시 활용합니다.</p>
							</br></br>
							<h4 class="decuh4Tit">7. 상대 차량번호 등 관련 사항을 메모하십시오.</h4>
							<p class="txtPoint">교통사고는 순간적으로 발생하므로, 사고차가 도주(뺑소니)해 버리면 사고처리는 매우 어렵게 됩니다. 그러므로 사고를 내거나 당하게 된 경우, 상대방의 차량번호, 연락처 등 관련 사항을 정확하게 메모해서, 사후에라도 원활한 사고처리가 이루어질 수 있도록 해야 합니다.</p>
							</br></br>
							<h4 class="decuh4Tit">8. 공제조합에 사고 접수하여 적절하게 처리되도록 합니다.</h4>
							<p class="txtPoint">교통사고가 발생하면 차주나 운전자는 손해를 입은 사람에게 그 손해를 배상해야 할 법적인 책임을 지게 되므로 피해자에게 신속하고 적절한 수준의 피해보상을 받을 수 있도록 공제조합에 사고접수를 해야 합니다.</p>
							</br></br>
							<h4 class="decuh4Tit">9. 일방적으로 과실을 인정하는 것은 피해야 하며 손해배상을 약속해서는 안 됩니다.</h4>
							<p class="txtPoint">공제조합에 신고하여 처리해 주겠다고 답변하는 것이 바람직한 조치입니다.</p>
						</div><!--// 대인배상 I e -->						

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
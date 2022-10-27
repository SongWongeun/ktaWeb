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
						<h2><img src="/images/truck/dedu/prodinfo_tit.gif" alt="상품안내" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/deductProductIndex.do" >공제상품</a>					
						<a href="/deductProduct/deductProductIndex.do" >상품안내</a>
						<span>자기차량 손해</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/mycarinfo_con_tit.gif" alt="공제계약 자기차량 손해 상품안내 입니다." /></p>				
					<div class="conSection">
						<!-- 자기차량 손해 -->
						<h3 class="deduh3Tit prodBg">자기차량 손해</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea mycarBg mB0">
								<p class="lossTxt1">보상하는 손해</p>
								<p class="lossTxt2">자기차량손해에서 조합은 조합원이 공제계약자동차를 소유 &#183; 사용 &#183; 관리하는 동안에 발생한 다음과 같은 사고로 인하여<br/>공제계약자동차에 직접적으로 생긴 손해를 공제계약청약서에 기재된 공제계약금액을 한도로 보상합니다&#46;<br/>다만&#44; 공제계약금액이 공제가액보다 많은 경우에는 공제가액을 한도로 보상합니다&#46;<br/>이 경우 공제계약자동차에 통상 붙어 있거나 장치되어 있는 것이 아닌 것은 공제계약청약서에 기재한 것에 한합니다&#46;</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossSide">
								<ul class="lossListst01">
									<li>타차 또는 타 물체와의 충돌&#44; 접촉&#44; 추락&#44; 전복 또는 차량의 침수로 인한 손해</li>
									<li>화재&#44; 폭발&#44; 낙뢰&#44; 날아온 물체&#44; 떨어지는 물체에 의한 손해 또는 풍력에 의해 차체에 생긴 손해</li>
									<li>공제계약자동차 전부의 도난으로 인한 손해&#46;<br/>그러나&#44; 공제계약자동차에 정착 또는 장치되어 있는 일부 부분품&#44; 부속품&#44; 부속기계장치만의 도난에 대해서는 보상하지 않습니다&#46;</li>
									<li>공제계약자동차의 단독사고(가해자 불명사고를 포함합니다) 또는 일방 과실사고의 경우에는 실제수리를 원칙으로 합니다&#46;</li>
									<li>경미한 손상(*4)의 경우 보험개발원이 정한 경미손상 수리기준에 따라 복원수리하는데 소요되는 비용을 한도로 보상합니다&#46;</li>
								</ul>
								<div class="lossBox">
									<p><span class="txtBlue">&#39;공제가액&#39;이라 함은&#44;</span><br/>보험개발원이 정한 차량기준가액표에 따라 공제계약을 맺을 때에는 사고발생 당시 보험개발원이 정한 최근의 차량기준가액을 말합니다&#46;<br/>그러나 위 차량기준가액이 없거나 이와 다른 가액으로 공제계약을 맺었을 경우<br/>공제계약청약서에 기재된 가액이 손해가 생긴 곳과 때의 가액을 현저하게 초과할 때에는 그 손해가 생긴 곳과 때의 가액을 공제가액으로 합니다&#46;</p>
									<ul>
										<li><span class="txtBlue">&#39;물체&#39;라 함은</span> 구체적인 형태를 지니고 있어 충돌이나 접촉에 의해 자동차 외부에 직접적인 손상을 줄 수 있는 것을 말하며&#44;<br/>엔진내부나 연료탱크 등에 이물질을 삽입하는 경우 물체로 보지 않습니다&#46;</li>
										<li><span class="txtBlue">&#39;침수&#39;라 함은</span> 흐르거나 고인 물&#44; 역류하는 물&#44; 범람하는 물&#44; 해수 등에 공제계약자동차가 빠지거나 잠기는 것을 말하며&#44;<br/>차량 도어나 선루프 등을 개방해 놓았을 때 빗물이 들어간 것은 침수로 보지 않습니다&#46;</li>
										<li><span class="txtBlue">&#39;경미한 손상&#39;이라 함은</span> 외장부품 중 자동차의 기능과 안전성을 고려할 때 부품교체 없이 복원이 가능한 손상을 말합니다&#46;</li>
									</ul>
								</div>
							</div>							
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">보장 금액</h4>
							<p class="txtPoint">공제계약자동차에 직접적으로 생긴 손해를 공제계약청약서에 기재된 공제계약금액을 한도로 보상합니다&#46;</p>
							<ul class="txtListst01">
								<li>자기부담금 손해액의 20%(최소 20만원, 최대 50만원)</li>
							</ul>								
						</div><!--// 자기차량 손해 e -->
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
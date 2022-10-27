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
	<section id="location" class="path03">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/joinInfo/index.do">가입안내</a></li>
			<li><a href="/m/joinInfo/productInfo/main.do">상품안내</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<!-- 자기차량 손해 -->
		<article class="basicCont04">
			<h2 class="productTit ico05">자기차량손해</h2>
			<!-- 보상하는 손해  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보상하는 손해</h3>
				<ul class="pt14">
					<li class="line"><span class="bulSt01">자기차량손해에서 조합은 조합원이 공제계약자동차를 소유 &#183; 사용 &#183; 관리하는 동안에 발생한 다음과 같은 사고로 인하여 공제계약자동차에 직접적으로 생긴 손해를 공제계약청약서에 기재된 공제계약금액을 한도로 보상합니다&#46;<br/>
					다만&#44; 공제계약금액이 공제가액보다 많은 경우에는 공제가액을 한도로 보상합니다&#46;이 경우 공제계약자동차에 통상 붙어 있거나 장치되어 있는 것이 아닌 것은 공제계약청약서에 기재한 것에 한합니다&#46;</span></li>
					<li class="space"><span class="bulSt06">타차 또는 타 물체와의 충돌&#44; 접촉&#44; 추락&#44; 전복 또는 차량의 침수로 인한 손해</span></li>
					<li><span class="bulSt06">화재&#44; 폭발&#44; 낙뢰&#44; 날아온 물체&#44; 떨어지는 물체에 의한 손해 또는 풍력에 의해 차체에 생긴 손해</span></li>
					<li><span class="bulSt06">공제계약자동차 전부의 도난으로 인한 손해&#46; 그러나&#44; 공제계약자동차에 정착 또는 장치되어 있는 일부 부분품&#44; 부속품&#44; 부속기계장치만의 도난에 대해서는 보상하지 않습니다&#46;</span></li>
					<li>
						<div class="liBox">
							<h4 class="txtTit04">공제가액이란?</h4>
							<p class="txt01">보험개발원이 정한 차량기준가액표에 따라 공제계약을 맺을 때에는 사고발생 당시 보험개발원이 정한 최근의 차량기준가액을 말합니다. 그러나 위 차량기준가액이 없거나 이와 다른 가액으로 공제계약을 맺었을 경우 공제계약청약서에 기재된 가액이 손해가 생긴 곳과 때의 가액을 현저하게 초과할 때에는 그 손해가 생긴 곳과 때의 가액을 공제가액으로 합니다.</p>
							<p class="txt01"><strong>‘물체’</strong>라 함은 구체적인 형태를 지니고 있어 충돌이나 접촉에 의해 자동차 외부에 직접적인 손상을 줄 수 있는 것을 말하며, 엔진내부나 연료탱크 등에 이물질을 삽입하는 경우 물체로 보지 않습니다.</p>
							<p class="txt01 pb0"><strong>‘침수’</strong>라 함은 흐르거나 고인 물, 역류하는 물, 범람하는 물, 해수 등에 공제계약자동차가 빠지거나 잠기는 것을 말하며, 차량 도어나 선루프 등을 개방해 놓았을 때 빗물이 들어간 것은 침수로 보지 않습니다.</p>
						</div>
					</li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 보장 금액  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보장 금액</h3>
				<ul class="pt14">
					<li><span class="bulSt01">공제계약자동차에 직접적으로 생긴 손해를 공제계약청약서에 기재된 공제계약금액을 한 도로 보상합니다.<br/>- 자기부담금 : 손해액의 20%(최소 20만원, 최대 50만원)</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article>
		<ul class="productBox mb50">
			<li><a href="/m/joinInfo/productInfo/man/view.do">대인배상</a></li>
			<li><a href="/m/joinInfo/productInfo/obejct/view.do">대물배상</a></li>
			<li><a href="/m/joinInfo/productInfo/body/view.do">자기신체사고</a></li>
			<li><a href="/m/joinInfo/productInfo/acc/view.do">종사자재해</a></li>
			<li><a href="/m/joinInfo/productInfo/carry/view.do">적재물 배상</a></li>
			<li><a href="/m/joinInfo/productInfo/law/view.do">법률비용 지원특약</a></li>
		</ul>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>
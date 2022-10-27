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
		<!-- 적재물 -->
		<article class="basicCont04">
			<h2 class="productTit ico06">적재물(운송위험 담보)</h2>
			<!-- 보상하는 손해 -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보상하는 손해</h3>
				<ul class="pt14">
					<li><span class="bulSt01">조합은 조합원이 공제증권상의 대한민국 내에서 공제기간 중에 운송의 목적으로 수탁 받은 화물&#40;이하 &#39;수탁화물&#39;이라 합니다&#41;을 공제증권에 기재된 화물자동차로 운송하는 기간&#40;이하 &#39;운송기간&#39;이라 합니다&#41; 동안에 생긴 우연한 사고로 인하여 수탁화물에 대한 법률상의 배상책임을 부담함으로써 입은 손해를 이 약관에 따라 보상하여 드립니다&#46;</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 보장 금액 -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보장 금액</h3>
				<ul class="pt14">
					<li><span class="bulSt01">2천, 3천, 5천, 1억원 중 선택적으로 조합원이 가입한 금액 한도내에서 보상해 드립니다&#46;<br/>- 자기부담금 : 20만원, 30만원, 50만원, 100만원 중 선택적 가입</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<h2 class="productTit ico06">적재물(주선위험 담보)</h2>
			<!-- 보상하는 손해 -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보상하는 손해</h3>
				<ul class="pt14">
					<li><span class="bulSt01">조합은 조합원이 대한민국 내에서 공제기간 중에 자기의 명의로 운송계약을 체결하거나 중개 또는 대리를 의뢰 받은 수탁화물에 대하여 화주로부터 수탁 받은 시점으로부터 수하인에게 인도하기까지의 운송과정&#40;차량운송 및 화물운송부수업무&#41;중에 생긴 우연한 사고로 인하여 수탁화물에 대한 법률상의 배상책임을 부담함으로써 입은 손해를 약관에 따라 보상해 드립니다&#46;</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 보장 금액 -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>보장 금액</h3>
				<ul class="pt14">
					<li><span class="bulSt01">2천만원, 3천만원, 5천만원, 1억원, 2억원, 3억원, 5억원, 7억5천만원, 10억원, 15억원, 20억원, 30억원 중 조합이 책임지는 한도내에서 보상해 드립니다.<br/>- 자기부담금을 20만원으로 기본 설정하고 추가 설정 시 할인율을 적용함</span></li>
					<li>	
						<div class="tableBox pa0">
							<table class="tbSt01" summary="적재물(주선위험 담보) 보장 금액">
								<caption>적재물(주선위험 담보) 보장 금액</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:70%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="lineNo">1사고당</th>
										<th scope="col" >할인율</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="lineNo">20</td>
										<td>-</td>
									</tr>
									<tr>
										<td class="lineNo">30</td>
										<td>5%</td>
									</tr>
									<tr>
										<td class="lineNo">50</td>
										<td>10%</td>
									</tr>
									<tr>
										<td class="lineNo">100</td>
										<td>20%</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 특별약관 -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>특별약관</h3>
				<ul>
					<li class="line"><em>1&#41; 구간운송특별약관</em><span class="bulSt01">수탁화물을 발송장소에서 도착장소까지 사전에 정한 구간과 기간중 운송하는 동안의 위험을 1회 운송에 한하여 담보</span></li>
					<li class="line"><em>2&#41; 화물운송부수업무</em><span class="bulSt01">공제계약자가 공제기간 중에 화물을 수탁 받아 수하인에게 인도하기까지 화물운송에 관한 부수 업무를 수행하는 동안 발생한 사고에 대한 법률상배상책임을 담보</span></li>
					<li class="line"><em>3&#41; 수탁화물확장담보</em><span class="bulSt01">보통약관의 제외수탁하물 규정에도 불구하고 특정 수탁화물들에 대하여 추가로 확장하여 담보</span></li>
					<li class="line"><em>4&#41; 냉동 &#183; 냉장장치담보</em><span class="bulSt01">보통약관에서 담보하지 아니하는 냉동&#8901;냉장장치 또는 설비의 고장이나 전기공급 중단에 의한 온도변화로 수탁화물에 생긴 손해에 대한 배상책임을 담보</span></li>
					<li class="line"><em>5&#41; 안심운송특별약관</em><span class="bulSt01">보통약관 담보내용에도 불구하고 비례보상사고&#8901;포장불완전사고&#8901;피해물수습비용에 대하여 특별약관에 정하여 진 바에 따라 담보&#40;2009&#46;03&#46;25 일자로 시행&#41;</span></li>
					<li><em>6&#41; 대위권 포기</em><span class="bulSt01">특별약관 보통약관 규정에 의거 공제조합이 지급공제금 범위 내에서 취득하는 대위권을 이 특약을 맺음으로서 포기함</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article>
		<ul class="productBox mb50">
			<li><a href="/m/joinInfo/productInfo/man/view.do">대인배상</a></li>
			<li><a href="/m/joinInfo/productInfo/obejct/view.do">대물배상</a></li>
			<li><a href="/m/joinInfo/productInfo/body/view.do">자기신체사고</a></li>
			<li><a href="/m/joinInfo/productInfo/acc/view.do">종사자재해</a></li>
			<li><a href="/m/joinInfo/productInfo/myCar/view.do">자기차량손해</a></li>
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
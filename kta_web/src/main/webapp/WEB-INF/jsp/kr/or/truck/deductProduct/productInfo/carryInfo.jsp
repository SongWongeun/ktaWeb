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
						<span>적재물 배상</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/carryinfo_con_tit.gif" alt="공제계약 적재물 상품안내 입니다." /></p>				
					<div class="conSection">
						<!-- 적재물 (운송위험 담보) -->
						<h3 class="deduh3Tit prodBg">적재물 &#40;운송위험 담보&#41;</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea carryBg">
								<p class="lossTxt1">보상하는 손해</p>
								<p class="lossTxt2">
									조합은 조합원이 공제증권상의 대한민국 내에서 공제기간 중에 운송의 목적으로 수탁 받은 화물&#40;이하 &#39;수탁화물&#39;이라 합니다&#41;<br/>을 공제증권에 기재된 화물자동차로 운송하는 기간&#40;이하 &#39;운송기간&#39;이라 합니다&#41; 동안에 생긴 우연한 사고로 인하여<br/>수탁화물에 대한 법률상의 배상책임을 부담함으로써 입은 손해를 이 약관에 따라 보상하여 드립니다&#46;
								</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">보장 금액</h4>
							<p class="txtPoint">5백&#44; 1천&#44; 2천&#44; 3천&#44; 5천&#44; 7천&#44; 1억원&#44; 2억원&#44; 3억원&#44; 5억원&#44; 7억원&#44; 10억원 중 선택적으로 조합원이 가입한 금액 한 도내에서 보상해 드립니다&#46;</p>
							<ul class="txtListst01">
								<li>자기부담금 20만원&#44; 30만원&#44; 50만원&#44; 100만원 중 선택적 가입</li>
							</ul>							
						</div><!--// 적재물 (운송위험 담보) e -->
						<!-- 적재물 (주선위험 담보) -->
						<h3 class="deduh3Tit prodBg">적재물 &#40;주선위험 담보&#41;</h3>
						<!-- 보상하는 손해 -->
						<div class="roundBox02">
							<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
							<!-- 내용 -->
							<div class="lossArea carryBg2">
								<p class="lossTxt1">보상하는 손해</p>
								<p class="lossTxt2">
									조합은 조합원이 대한민국 내에서 공제기간 중에 자기의 명의로 운송계약을 체결하거나<br/>중개 또는 대리를 의뢰 받은 수탁화물에 대하여 화주로부터 수탁 받은 시점으로부터<br/>수하인에게 인도하기까지의 운송과정&#40;차량운송 및 화물운송부수업무&#41;중에 생긴 우연한 사고로 인하여<br/>수탁화물에 대한 법률상의 배상책임을 부담함으로써 입은 손해를 약관에 따라 보상해 드립니다&#46;
								</p>
							</div>
							<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
						</div>
						<!--  보장 금액 -->
						<div class="txtContent2">
							<h4 class="decuh4Tit">보장 금액</h4>
							<p class="txtPoint">2천만원&#44; 3천만원&#44; 5천만원&#44; 1억원 중 조합이 책임지는 한도내에서 보상해 드립니다&#46;</p>
							<ul class="txtListst01">
								<li>자기부담금을 20만원으로 기본 설정하고 추가 설정 시 할인율을 적용함</li>
							</ul>
							<p class="txtPoint03 alR">&#40;단위 &#58; 만원&#41;</p>
							<table class="tbDetail_st01 mB30" summary="적재물 (주선위험 담보) 보장 금액 상세정보 테이블 입니다.">
								<caption>적재물 &#40;주선위험 담보&#41; 보장 금액에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:30%;" />
									<col style="width:70%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">1 사고당</th>
										<th scope="col">할인율</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>20</td>
										<td>&#45;</td>
									</tr>
									<tr>
										<td>30</td>
										<td>5&#37;</td>
									</tr>
									<tr>
										<td>50</td>
										<td>10&#37;</td>
									</tr>
									<tr>
										<td>100</td>
										<td>20&#37;</td>
									</tr>
								</tbody>
							</table><!--// 적재물 (주선위험 담보) 보장 금액표 e -->				
							<div class="txtContent">
								<h4 class="decuh4Tit">특별약관</h4>
								<p class="txtPoint">1&#41; 구간운송특별약관</p>
								<ul class="txtListst01">
									<li>수탁화물을 발송장소에서 도착장소까지 사전에 정한 구간과 기간중 운송하는 동안의 위험을 1회 운송에 한하여 담보</li>
								</ul>
								<p class="txtPoint">2&#41; 화물운송부수업무</p>
								<ul class="txtListst01">
									<li>공제계약자가 공제기간 중에 화물을 수탁 받아 수하인에게 인도하기까지 화물운송에 관한 부수 업무를 수행하는 동안 사고로 발생된 수탁화물의 재산손해에 대하여 법률상배상책임을 담보</li>
								</ul>
								<p class="txtPoint">3&#41; 수탁화물확장담보</p>
								<ul class="txtListst01">
									<li>보통약관의 제외수탁하물 규정에도 불구하고 특정 수탁화물들에 대하여 추가로 확장하여 담보</li>
								</ul>
								<p class="txtPoint">4&#41; 온도조절장치담보</p>
								<ul class="txtListst01">
									<li>보통약관에서 담보하지 아니하는 온도조절장치(냉동&#8901;냉장&#8901;보온&#8901;항온&#8901;항습 등) 또는 설비의 고장이나 전기공급 중단에 의한 온도변화로 수탁화물에 생긴 손해에 대한 배상책임을 담보</li>
								</ul>
								<p class="txtPoint">5&#41; 안심운송특별약관</p>
								<ul class="txtListst01">
									<li>보통약관 담보내용에도 불구하고 비례보상사고&#8901;포장불완전사고&#8901;피해물수습비용에 대하여 특별약관에 정하여 진 바에 따라 담보&#40;2009&#46;03&#46;25 일자로 시행&#41;</li>
								</ul>
								<p class="txtPoint">6&#41; 대위권 포기</p>
								<ul class="txtListst01">
									<li>특별약관 보통약관 규정에 의거 공제조합이 지급공제금 범위 내에서 취득하는 대위권을 이 특약을 맺음으로서 포기함</li>
								</ul>
							</div>
						</div><!--// 적재물 (주선위험 담보) e -->
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